<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="#" class="brand-link">
        <img src="asset/img/logo/diamond.png" alt="SIAKAD" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-dark">SIAKAD</span>
    </a>
    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="asset/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><?= $session_user->name ?></a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <?= $sidebar ?>
                <br />
                <li class="nav-item" id="logout1"><a href="logout" class="nav-link" id="logout"><i class="nav-icon fas fa-sign-out-alt"></i>
                        <p>Logout</p>
                    </a></li>
            </ul>
        </nav>
    </div>
</aside>
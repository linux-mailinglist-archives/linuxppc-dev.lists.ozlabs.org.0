Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6921A7BA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:03:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491lzv2NwFzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:03:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LExj4iKk; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lXq0lHLzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:43:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/EAkJa3PCTCg9cZch9XiCXuGIAdU1li//UfqmnYJ2A=;
 b=LExj4iKkBrs66gX2y9VCTmQNLrw/EtCgfb4fHoYx527Qu5BBCBrWB+J14qNpC+q8vVU7s3
 xdeUdVnwFPnhp4DwDFwTUHRzu4nKb44pt9edqA1KC07gTVNWeHRjIo8gX+tvJdtl9u5mhg
 zqBNW7rc7ScAdtscG3R94f+dsilFejw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-bH84oUArOD-jAbcIryYg3g-1; Tue, 14 Apr 2020 08:43:47 -0400
X-MC-Unique: bH84oUArOD-jAbcIryYg3g-1
Received: by mail-wr1-f72.google.com with SMTP id v14so8622801wrq.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mpH0i9D4CKdkaA94rTuJ9ZLibjvc0u/wsmELw+W2YRE=;
 b=plzlj8nshBQ6qrPdA/KyQCysgJrJMpKk6a/oDhn5w3ONePiKzCdDWiSSADMkHHQ/hv
 OxGTMvQ3Jrab0wNtvVOMcRtQXJvoi/JGjaOqloWC7URWhvGTEF6vceTpSZfg46dRQm7i
 bKESKR/4YmzTgQmzr3Yy4/krZgU/2Yrv7G1zXtdFbuOQu7XitbreLZnDQWIhV8jbLN4C
 h510SsJpwEAC/PKegJRJXDHHOGoNLXfZfrnH02EV0PR36KU8xz5A1kH/tth2bw4Tju7c
 8gcSx0JyJaHcYiqlyyvJsFoacf+YpKnzNWHWCOQZSyTn/G5jb6pRuPq6NGHzKrqOqf+D
 x+xQ==
X-Gm-Message-State: AGi0PuYCUlUGBbXqmyj4v3inRFWVjJcpvDpm4Pe34D/h80p6GPR49bq4
 H7omJPvZX9/dZsbn2y70h1PFi2hvVQ8qlTV58q7N34bmiqTSberBoTwP+5ihcqNUQZ+Es8n8lWC
 7h4WZ4cwbALONYpyAdazke6i8FQ==
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr22955736wra.49.1586868225602; 
 Tue, 14 Apr 2020 05:43:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKrr6l40rwg6gvnqEERTdItJB1re/eEs/hrCesLG4TYaZ1yTmp5eu/qtdPBP1+X7lPvfKXptw==
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr22955631wra.49.1586868225144; 
 Tue, 14 Apr 2020 05:43:45 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:44 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 2/8] fs: extract simple_pin/release_fs to separate files
Date: Tue, 14 Apr 2020 14:42:56 +0200
Message-Id: <20200414124304.4470-3-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:49 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, oprofile-list@lists.sf.net,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Maxime Ripard <mripard@kernel.org>,
 linux-fsdevel@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We will augment this family of functions with inode management.  To avoid
littering include/linux/fs.h and fs/libfs.c, move them to a separate header=
,
with a Kconfig symbol to enable them.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/Kconfig         |  1 +
 drivers/gpu/drm/drm_drv.c       |  2 +-
 drivers/misc/cxl/Kconfig        |  1 +
 drivers/misc/cxl/api.c          |  1 +
 drivers/misc/ocxl/Kconfig       |  1 +
 drivers/scsi/cxlflash/ocxl_hw.c |  1 +
 fs/Kconfig                      |  3 +++
 fs/Kconfig.binfmt               |  1 +
 fs/Makefile                     |  1 +
 fs/binfmt_misc.c                |  2 +-
 fs/configfs/Kconfig             |  1 +
 fs/configfs/mount.c             |  2 +-
 fs/debugfs/inode.c              |  2 +-
 fs/libfs.c                      | 36 +------------------------------
 fs/simplefs.c                   | 38 +++++++++++++++++++++++++++++++++
 fs/tracefs/inode.c              |  2 +-
 include/linux/fs.h              |  2 --
 include/linux/simplefs.h        | 10 +++++++++
 lib/Kconfig.debug               | 16 ++++++++------
 security/Kconfig                |  1 +
 security/apparmor/apparmorfs.c  |  3 ++-
 security/inode.c                |  2 +-
 22 files changed, 79 insertions(+), 50 deletions(-)
 create mode 100644 fs/simplefs.c
 create mode 100644 include/linux/simplefs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 43594978958e..a6fe933de9da 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -14,6 +14,7 @@ menuconfig DRM
 =09select I2C
 =09select I2C_ALGOBIT
 =09select DMA_SHARED_BUFFER
+=09select SIMPLEFS
 =09select SYNC_FILE
 =09help
 =09  Kernel-level support for the Direct Rendering Infrastructure (DRI)
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7b1a628d1f6e..187a61091b5c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -27,7 +27,7 @@
  */
=20
 #include <linux/debugfs.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/mount.h>
diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
index 39eec9031487..a62795079d9c 100644
--- a/drivers/misc/cxl/Kconfig
+++ b/drivers/misc/cxl/Kconfig
@@ -19,6 +19,7 @@ config CXL
 =09select CXL_BASE
 =09select CXL_AFU_DRIVER_OPS
 =09select CXL_LIB
+=09select SIMPLEFS
 =09default m
 =09help
 =09  Select this option to enable driver support for IBM Coherent
diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index b493de962153..0b8f8de7475a 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -9,6 +9,7 @@
 #include <misc/cxl.h>
 #include <linux/module.h>
 #include <linux/mount.h>
+#include <linux/simplefs.h>
 #include <linux/pseudo_fs.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_context.h>
diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
index 2d2266c1439e..ddd9245fff3d 100644
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@ -12,6 +12,7 @@ config OCXL
 =09depends on PPC_POWERNV && PCI && EEH
 =09select OCXL_BASE
 =09select HOTPLUG_PCI_POWERNV
+=09select SIMPLEFS
 =09default m
 =09help
 =09  Select this option to enable the ocxl driver for Open
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_h=
w.c
index 7018cd802569..429f55651090 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -12,6 +12,7 @@
 #include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/mount.h>
+#include <linux/simplefs.h>
 #include <linux/pseudo_fs.h>
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
diff --git a/fs/Kconfig b/fs/Kconfig
index f08fbbfafd9a..a6795ae312a2 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -218,6 +218,9 @@ config HUGETLB_PAGE
 config MEMFD_CREATE
 =09def_bool TMPFS || HUGETLBFS
=20
+config SIMPLEFS
+=09bool
+
 config ARCH_HAS_GIGANTIC_PAGE
 =09bool
=20
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 62dc4f577ba1..af7b765de4d3 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -176,6 +176,7 @@ config BINFMT_EM86
=20
 config BINFMT_MISC
 =09tristate "Kernel support for MISC binaries"
+=09select SIMPLEFS
 =09---help---
 =09  If you say Y here, it will be possible to plug wrapper-driven binary
 =09  formats into the kernel. You will like this especially when you use
diff --git a/fs/Makefile b/fs/Makefile
index 2ce5112b02c8..c5c665984b9e 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_PROC_FS) +=3D proc_namespace.o
 obj-y=09=09=09=09+=3D notify/
 obj-$(CONFIG_EPOLL)=09=09+=3D eventpoll.o
 obj-y=09=09=09=09+=3D anon_inodes.o
+obj-$(CONFIG_SIMPLEFS)=09=09+=3D simplefs.o
 obj-$(CONFIG_SIGNALFD)=09=09+=3D signalfd.o
 obj-$(CONFIG_TIMERFD)=09=09+=3D timerfd.o
 obj-$(CONFIG_EVENTFD)=09=09+=3D eventfd.o
diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index cdb45829354d..c764110f5f0b 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -25,7 +25,7 @@
 #include <linux/mount.h>
 #include <linux/fs_context.h>
 #include <linux/syscalls.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/uaccess.h>
=20
 #include "internal.h"
diff --git a/fs/configfs/Kconfig b/fs/configfs/Kconfig
index 272b64456999..3b461e4e3989 100644
--- a/fs/configfs/Kconfig
+++ b/fs/configfs/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CONFIGFS_FS
 =09tristate "Userspace-driven configuration filesystem"
+=09select SIMPLEFS
 =09select SYSFS
 =09help
 =09  configfs is a RAM-based filesystem that provides the converse
diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index 0c6e8cf61953..331c2f064f02 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -10,7 +10,7 @@
  * configfs Copyright (C) 2005 Oracle.  All rights reserved.
  */
=20
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/module.h>
 #include <linux/mount.h>
 #include <linux/fs_context.h>
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index b7f2e971ecbc..7b9fddced48f 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -13,7 +13,7 @@
 #define pr_fmt(fmt)=09"debugfs: " fmt
=20
 #include <linux/module.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/mount.h>
 #include <linux/pagemap.h>
 #include <linux/init.h>
diff --git a/fs/libfs.c b/fs/libfs.c
index 3759fbacf522..26ec729f7bcd 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -11,6 +11,7 @@
 #include <linux/cred.h>
 #include <linux/mount.h>
 #include <linux/vfs.h>
+#include <linux/simplefs.h>
 #include <linux/quotaops.h>
 #include <linux/mutex.h>
 #include <linux/namei.h>
@@ -663,41 +664,6 @@ int simple_fill_super(struct super_block *s, unsigned =
long magic,
 }
 EXPORT_SYMBOL(simple_fill_super);
=20
-static DEFINE_SPINLOCK(pin_fs_lock);
-
-int simple_pin_fs(struct file_system_type *type, struct vfsmount **mount, =
int *count)
-{
-=09struct vfsmount *mnt =3D NULL;
-=09spin_lock(&pin_fs_lock);
-=09if (unlikely(!*mount)) {
-=09=09spin_unlock(&pin_fs_lock);
-=09=09mnt =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
-=09=09if (IS_ERR(mnt))
-=09=09=09return PTR_ERR(mnt);
-=09=09spin_lock(&pin_fs_lock);
-=09=09if (!*mount)
-=09=09=09*mount =3D mnt;
-=09}
-=09mntget(*mount);
-=09++*count;
-=09spin_unlock(&pin_fs_lock);
-=09mntput(mnt);
-=09return 0;
-}
-EXPORT_SYMBOL(simple_pin_fs);
-
-void simple_release_fs(struct vfsmount **mount, int *count)
-{
-=09struct vfsmount *mnt;
-=09spin_lock(&pin_fs_lock);
-=09mnt =3D *mount;
-=09if (!--*count)
-=09=09*mount =3D NULL;
-=09spin_unlock(&pin_fs_lock);
-=09mntput(mnt);
-}
-EXPORT_SYMBOL(simple_release_fs);
-
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
  * @to: the user space buffer to read to
diff --git a/fs/simplefs.c b/fs/simplefs.c
new file mode 100644
index 000000000000..226d18963801
--- /dev/null
+++ b/fs/simplefs.c
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/simplefs.h>
+#include <linux/mount.h>
+
+static DEFINE_SPINLOCK(pin_fs_lock);
+
+int simple_pin_fs(struct file_system_type *type, struct vfsmount **mount, =
int *count)
+{
+=09struct vfsmount *mnt =3D NULL;
+=09spin_lock(&pin_fs_lock);
+=09if (unlikely(!*mount)) {
+=09=09spin_unlock(&pin_fs_lock);
+=09=09mnt =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
+=09=09if (IS_ERR(mnt))
+=09=09=09return PTR_ERR(mnt);
+=09=09spin_lock(&pin_fs_lock);
+=09=09if (!*mount)
+=09=09=09*mount =3D mnt;
+=09}
+=09mntget(*mount);
+=09++*count;
+=09spin_unlock(&pin_fs_lock);
+=09mntput(mnt);
+=09return 0;
+}
+EXPORT_SYMBOL(simple_pin_fs);
+
+void simple_release_fs(struct vfsmount **mount, int *count)
+{
+=09struct vfsmount *mnt;
+=09spin_lock(&pin_fs_lock);
+=09mnt =3D *mount;
+=09if (!--*count)
+=09=09*mount =3D NULL;
+=09spin_unlock(&pin_fs_lock);
+=09mntput(mnt);
+}
+EXPORT_SYMBOL(simple_release_fs);
diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 0ee8c6dfb036..4353ca81e1d7 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -10,7 +10,7 @@
  */
=20
 #include <linux/module.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/mount.h>
 #include <linux/kobject.h>
 #include <linux/namei.h>
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4f6f59b4f22a..55b679b89c8a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3363,8 +3363,6 @@ struct tree_descr { const char *name; const struct fi=
le_operations *ops; int mod
 struct dentry *d_alloc_name(struct dentry *, const char *);
 extern int simple_fill_super(struct super_block *, unsigned long,
 =09=09=09     const struct tree_descr *);
-extern int simple_pin_fs(struct file_system_type *, struct vfsmount **moun=
t, int *count);
-extern void simple_release_fs(struct vfsmount **mount, int *count);
=20
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 =09=09=09loff_t *ppos, const void *from, size_t available);
diff --git a/include/linux/simplefs.h b/include/linux/simplefs.h
new file mode 100644
index 000000000000..1076a44db308
--- /dev/null
+++ b/include/linux/simplefs.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SIMPLEFS_H
+#define _LINUX_SIMPLEFS_H
+
+#include <linux/fs.h>
+
+extern int simple_pin_fs(struct file_system_type *, struct vfsmount **moun=
t, int *count);
+extern void simple_release_fs(struct vfsmount **mount, int *count);
+
+#endif
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d1398cef3b18..fc38a6f0fc11 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -288,12 +288,16 @@ config STRIP_ASM_SYMS
=20
 config READABLE_ASM
 =09bool "Generate readable assembler code"
-=09depends on DEBUG_KERNEL
-=09help
-=09  Disable some compiler optimizations that tend to generate human unrea=
dable
-=09  assembler output. This may make the kernel slightly slower, but it he=
lps
-=09  to keep kernel developers who have to stare a lot at assembler listin=
gs
-=09  sane.
+    depends on DEBUG_KERNEL
+    help
+      Disable some compiler optimizations that tend to generate human unre=
adable
+      assembler output. This may make the kernel slightly slower, but it h=
elps
+      to keep kernel developers who have to stare a lot at assembler listi=
ngs
+      sane.
+=09 =20
+config DEBUG_FS
+=09bool "Debug Filesystem"
+=09select SIMPLEFS
=20
 config HEADERS_INSTALL
 =09bool "Install uapi headers to usr/include"
diff --git a/security/Kconfig b/security/Kconfig
index cd3cc7da3a55..2c6713aa8b4f 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -39,6 +39,7 @@ config SECURITY_WRITABLE_HOOKS
=20
 config SECURITYFS
 =09bool "Enable the securityfs filesystem"
+=09select SIMPLEFS
 =09help
 =09  This will build the securityfs filesystem.  It is currently used by
 =09  various security modules (AppArmor, IMA, SafeSetID, TOMOYO, TPM).
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index 828bb1eb77ea..d62d3fca47f2 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -18,7 +18,7 @@
 #include <linux/namei.h>
 #include <linux/capability.h>
 #include <linux/rcupdate.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/fs_context.h>
 #include <linux/poll.h>
 #include <linux/zlib.h>
@@ -2529,6 +2529,7 @@ static int aa_mk_null_file(struct dentry *parent)
 =09struct vfsmount *mount;
 =09struct dentry *dentry;
 =09struct inode *inode;
+=09int error;
=20
 =09mount =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
 =09if (IS_ERR(mount))
diff --git a/security/inode.c b/security/inode.c
index 6c326939750d..a9a9ee4de21d 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -12,7 +12,7 @@
 /* #define DEBUG */
 #include <linux/sysfs.h>
 #include <linux/kobject.h>
-#include <linux/fs.h>
+#include <linux/simplefs.h>
 #include <linux/fs_context.h>
 #include <linux/mount.h>
 #include <linux/pagemap.h>
--=20
2.25.2


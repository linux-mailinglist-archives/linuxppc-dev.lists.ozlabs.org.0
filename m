Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF01A7C03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:12:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491m9n5hnfzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:12:29 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=BTdtUjAq; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lYC6mm6zDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:44:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9wIrHVinFRSeVONZeGXFdqOI8q2utXHS+EEeF0TTJI=;
 b=BTdtUjAqy1FRBBPspP63M7cIavPpa6piwwPUl4PqEclulNV7OEtzZo3tXvqp8yzOiH+KIe
 sPedXn0uzGKNrMZeNh7bgw1qi3ACSnGLMx8NlmdW2VIyUcbZrdmOAdlRcErWqS9YrAA468
 qgh1fSvsFmRZFSnLk0J1QAOHa3ivA68=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-RqwocSO-M0WNMUv-IxiDcQ-1; Tue, 14 Apr 2020 08:44:10 -0400
X-MC-Unique: RqwocSO-M0WNMUv-IxiDcQ-1
Received: by mail-wm1-f71.google.com with SMTP id c129so3705886wme.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mAvbLYZ1WspWPQXapCuzllPQbpAxrl5aHgH6Qcvv5U=;
 b=ktdrbBUXdfiMZ88NP2/P6PgNo6E+kjKg434Rq1ntX/9Zq0QPK5WWfrX4d3S2rXaxLw
 z1YqXfS6Mgd5XRedSpLvNwN50Omi6+3kTyV4RqRP3Xen3PQjxJW4BjFHq4px40YyPRKE
 6t7vAureQ/XLcJg5PwaAlJ0QfNXlXzYCbOnTS4cxQYG+6oHM5ExZzTMIqRFuhE3SBe9+
 ITpcWiNYq+tRJ3kpFOMQ6C4Pj4kspPUZTQqA9S264gzkmRjqBd6A+cvovKXbfCMXbT5+
 iTUzu4osmpqrtl0nlXVNWjxGAtmOnTJz3jsZJz6KN14o469hZVMIJPtc96osaeCcfFr5
 em2g==
X-Gm-Message-State: AGi0PuYVgTf5Intw0I9UJVUNsgcTmObHYIwDTb32RfuAfDhc2Aw5Fu6B
 0gF2rrOTx3E+JJ5KDMcC4CTkwQNdAtlt63+G1Uxmn95bTgm7IJwxbEJPlD6VEr1EAFYZ8oe9yPd
 WyXn4AOORKbxi3gDK9zXwobfyXg==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr23619943wrp.227.1586868249739; 
 Tue, 14 Apr 2020 05:44:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmn+iVub//R53RRjXLyRt+ACg08A2ZCc/3baWUs4xE6lZVfbX64aNN39fLKTr4PRsrHS5+Eg==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr23619862wrp.227.1586868249542; 
 Tue, 14 Apr 2020 05:44:09 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:08 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 5/8] simplefs: add alloc_anon_inode wrapper
Date: Tue, 14 Apr 2020 14:42:59 +0200
Message-Id: <20200414124304.4470-6-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:50 +1000
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

Start adding file creation wrappers, the simplest returns an anonymous
inode.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/drm_drv.c       | 2 +-
 drivers/misc/cxl/api.c          | 2 +-
 drivers/scsi/cxlflash/ocxl_hw.c | 2 +-
 fs/simplefs.c                   | 6 ++++++
 include/linux/simplefs.h        | 2 ++
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index b4b357725be2..4e4ea1bf312c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -539,7 +539,7 @@ static struct inode *drm_fs_inode_new(void)
 =09=09return ERR_PTR(r);
 =09}
=20
-=09inode =3D alloc_anon_inode(drm_fs.mount->mnt_sb);
+=09inode =3D simple_alloc_anon_inode(&drm_fs);
 =09if (IS_ERR(inode))
 =09=09simple_release_fs(&drm_fs);
=20
diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index 6c6566d8bc17..a3d2682eb3a7 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -73,7 +73,7 @@ static struct file *cxl_getfile(const char *name,
 =09=09goto err_module;
 =09}
=20
-=09inode =3D alloc_anon_inode(cxl_fs.mount->mnt_sb);
+=09inode =3D simple_alloc_anon_inode(&cxl_fs);
 =09if (IS_ERR(inode)) {
 =09=09file =3D ERR_CAST(inode);
 =09=09goto err_fs;
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_h=
w.c
index 23afde0c6c0e..770fdf186028 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -86,7 +86,7 @@ static struct file *ocxlflash_getfile(struct device *dev,=
 const char *name,
 =09=09goto err2;
 =09}
=20
-=09inode =3D alloc_anon_inode(ocxlflash_fs.mount->mnt_sb);
+=09inode =3D simple_alloc_anon_inode(&ocxlflash_fs);
 =09if (IS_ERR(inode)) {
 =09=09rc =3D PTR_ERR(inode);
 =09=09dev_err(dev, "%s: alloc_anon_inode failed rc=3D%d\n",
diff --git a/fs/simplefs.c b/fs/simplefs.c
index 790d8beb9cc3..c59eb8d996be 100644
--- a/fs/simplefs.c
+++ b/fs/simplefs.c
@@ -36,3 +36,9 @@ void simple_release_fs(struct simple_fs *fs)
 =09mntput(mnt);
 }
 EXPORT_SYMBOL(simple_release_fs);
+
+struct inode *simple_alloc_anon_inode(struct simple_fs *fs)
+{
+=09return alloc_anon_inode(fs->mount->mnt_sb);
+}
+EXPORT_SYMBOL(simple_alloc_anon_inode);
diff --git a/include/linux/simplefs.h b/include/linux/simplefs.h
index 18010414a16f..c62ab526414e 100644
--- a/include/linux/simplefs.h
+++ b/include/linux/simplefs.h
@@ -12,4 +12,6 @@ struct simple_fs {
 extern int simple_pin_fs(struct simple_fs *, struct file_system_type *);
 extern void simple_release_fs(struct simple_fs *);
=20
+extern struct inode *simple_alloc_anon_inode(struct simple_fs *fs);
+
 #endif
--=20
2.25.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BB1A7DE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:27:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491mVj4FZMzDqFv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:27:09 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=afMS7G7p; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lYd1NLKzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:44:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4V8mrlSuDSVlkahuOUJ4Ixvzo/y3rjT0a9yuAvHerg=;
 b=afMS7G7pJrStxDVBsjqfIIdyUri5R299a1L4L52AKFaJEM24XoHlMqqG8vRqgeKYUIsWIm
 +TACeeQ9VahsZLmYGayX4EznzV9AXcOJFqh9hISguE1ySvaPbrBOTbtFnoUF7MjIup5qCZ
 P239gwimgRsdvzfOLWpyzPRTKD4P48k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-xB06QZ53PEWg8WojwQqjdQ-1; Tue, 14 Apr 2020 08:44:33 -0400
X-MC-Unique: xB06QZ53PEWg8WojwQqjdQ-1
Received: by mail-wm1-f70.google.com with SMTP id f81so3719195wmf.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGjNYMWp/8KA/6LkWNSHGIBdRN4UVqzppNqwn3DGPcg=;
 b=fjGUoOnNlCHRoOtub7kbsk6i8Y8vCALlFmu8rip8nLd7XRIg2IMkaNopqdqmTBoSiO
 1pk6GyhYqDHNUJZixMXopGtjbKNDb98Bcl8rIbmbakj5GR4P0bQ5v2f6PmSeb0Wnmh1b
 Jacq5T8scN0WSALul9tYDp4nK+3wdvFQf8XcV7/nHS2pqAD/Rbxzbb/J0eggf2zKsZ+Z
 BGIWpmipgwzcI2JdGGMHKSoMLzBBMkvkptFIZuphHUtCkCYsXpJ6AArIalvp1gj9Rbt6
 fBTK7lz6AMMaJel2+DS21rvsP1SIktFiT5s7w/I1rcmGe+nAEobsrZkP0GueBJ2xROaS
 Qucw==
X-Gm-Message-State: AGi0PuanlazSa7nvJWTe1PdEH691GsCZ60nmdKJNG/BDTJJjZd/yJ7rV
 pAoP1OsyNckp65bAGxRYE+XW/QqQJXziu9jUvt70Rm08+wuxS+2/zZjt7w9y2TyPk9lsGnI5919
 begie2jCIEM5Xcx8bU00Loq9wUw==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr5979569wmh.29.1586868271934; 
 Tue, 14 Apr 2020 05:44:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypLjQPNPxnNdGqVcxE01hghohpD72CtCG/q4zNp6kiItsyrK+g3gnJAFWjc1kxEekSVDXAwDXg==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr5979510wmh.29.1586868271614; 
 Tue, 14 Apr 2020 05:44:31 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:31 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 8/8] tracefs: switch to simplefs inode creation API
Date: Tue, 14 Apr 2020 14:43:02 +0200
Message-Id: <20200414124304.4470-9-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:51 +1000
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

There is no semantic change intended; the code in the simplefs.c functions =
in
fact was derived from debugfs and tracefs code.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/tracefs/inode.c | 86 ++++------------------------------------------
 1 file changed, 7 insertions(+), 79 deletions(-)

diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index a30837a8e1d4..69e2215c797b 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -298,57 +298,6 @@ static struct file_system_type trace_fs_type =3D {
 };
 MODULE_ALIAS_FS("tracefs");
=20
-static struct dentry *start_creating(const char *name, struct dentry *pare=
nt)
-{
-=09struct dentry *dentry;
-=09int error;
-
-=09pr_debug("tracefs: creating file '%s'\n",name);
-
-=09error =3D simple_pin_fs(&tracefs, &trace_fs_type);
-=09if (error)
-=09=09return ERR_PTR(error);
-
-=09/* If the parent is not specified, we create it in the root.
-=09 * We need the root dentry to do this, which is in the super
-=09 * block. A pointer to that is in the struct vfsmount that we
-=09 * have around.
-=09 */
-=09if (!parent)
-=09=09parent =3D tracefs.mount->mnt_root;
-
-=09inode_lock(parent->d_inode);
-=09if (unlikely(IS_DEADDIR(parent->d_inode)))
-=09=09dentry =3D ERR_PTR(-ENOENT);
-=09else
-=09=09dentry =3D lookup_one_len(name, parent, strlen(name));
-=09if (!IS_ERR(dentry) && dentry->d_inode) {
-=09=09dput(dentry);
-=09=09dentry =3D ERR_PTR(-EEXIST);
-=09}
-
-=09if (IS_ERR(dentry)) {
-=09=09inode_unlock(parent->d_inode);
-=09=09simple_release_fs(&tracefs);
-=09}
-
-=09return dentry;
-}
-
-static struct dentry *failed_creating(struct dentry *dentry)
-{
-=09inode_unlock(dentry->d_parent->d_inode);
-=09dput(dentry);
-=09simple_release_fs(&tracefs);
-=09return NULL;
-}
-
-static struct dentry *end_creating(struct dentry *dentry)
-{
-=09inode_unlock(dentry->d_parent->d_inode);
-=09return dentry;
-}
-
 /**
  * tracefs_create_file - create a file in the tracefs filesystem
  * @name: a pointer to a string containing the name of the file to create.
@@ -385,49 +334,28 @@ struct dentry *tracefs_create_file(const char *name, =
umode_t mode,
 =09if (security_locked_down(LOCKDOWN_TRACEFS))
 =09=09return NULL;
=20
-=09if (!(mode & S_IFMT))
-=09=09mode |=3D S_IFREG;
-=09BUG_ON(!S_ISREG(mode));
-=09dentry =3D start_creating(name, parent);
-
+=09dentry =3D simplefs_create_file(&tracefs, &trace_fs_type,
+=09=09=09=09      name, mode, parent, data, &inode);
 =09if (IS_ERR(dentry))
 =09=09return NULL;
=20
-=09inode =3D simple_new_inode(dentry->d_sb);
-=09if (unlikely(!inode))
-=09=09return failed_creating(dentry);
-
-=09inode->i_mode =3D mode;
 =09inode->i_fop =3D fops ? fops : &tracefs_file_operations;
-=09inode->i_private =3D data;
-=09d_instantiate(dentry, inode);
-=09fsnotify_create(dentry->d_parent->d_inode, dentry);
-=09return end_creating(dentry);
+=09return simplefs_finish_dentry(dentry, inode);
 }
=20
 static struct dentry *__create_dir(const char *name, struct dentry *parent=
,
 =09=09=09=09   const struct inode_operations *ops)
 {
-=09struct dentry *dentry =3D start_creating(name, parent);
+=09struct dentry *dentry;
 =09struct inode *inode;
=20
+=09dentry =3D simplefs_create_dir(&tracefs, &trace_fs_type,
+=09=09=09=09     name, 0755, parent, &inode);
 =09if (IS_ERR(dentry))
 =09=09return NULL;
=20
-=09inode =3D simple_new_inode(dentry->d_sb);
-=09if (unlikely(!inode))
-=09=09return failed_creating(dentry);
-
-=09inode->i_mode =3D S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
 =09inode->i_op =3D ops;
-=09inode->i_fop =3D &simple_dir_operations;
-
-=09/* directory inodes start off with i_nlink =3D=3D 2 (for "." entry) */
-=09inc_nlink(inode);
-=09d_instantiate(dentry, inode);
-=09inc_nlink(dentry->d_parent->d_inode);
-=09fsnotify_mkdir(dentry->d_parent->d_inode, dentry);
-=09return end_creating(dentry);
+=09return simplefs_finish_dentry(dentry, inode);
 }
=20
 /**
--=20
2.25.2


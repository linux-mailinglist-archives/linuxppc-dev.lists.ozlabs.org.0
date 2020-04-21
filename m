Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F61B28E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:01:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4964wk6PYWzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:01:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EmGJwvfN; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EmGJwvfN; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964k04lqdzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99/DqDTe+hR/W8XuUdq0eHElZlf6CH/+a6BKUqv6kfA=;
 b=EmGJwvfNf46Rm6Lf4+A6OeSLTLiaJVW+u9IWrL3cUNfHhTb4OJKz1+ExMeEHWllIJgx4E1
 eRhddAxgcYr/EEEqbbKDLu9ahkdJLaZLpSeF0+uTlH5lcxySVPh129/nM5TVZ5YEoJ3Q1+
 KzkiowGvgQEakDqs2Bo6RXAFnA9889Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99/DqDTe+hR/W8XuUdq0eHElZlf6CH/+a6BKUqv6kfA=;
 b=EmGJwvfNf46Rm6Lf4+A6OeSLTLiaJVW+u9IWrL3cUNfHhTb4OJKz1+ExMeEHWllIJgx4E1
 eRhddAxgcYr/EEEqbbKDLu9ahkdJLaZLpSeF0+uTlH5lcxySVPh129/nM5TVZ5YEoJ3Q1+
 KzkiowGvgQEakDqs2Bo6RXAFnA9889Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-KoVXV7XiPpaY7BrcAiBs3g-1; Tue, 21 Apr 2020 09:51:45 -0400
X-MC-Unique: KoVXV7XiPpaY7BrcAiBs3g-1
Received: by mail-wm1-f69.google.com with SMTP id n127so1400405wme.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctzOqm9dtwbhRf44FvKp72RdNODJeokpu4mABLVWWLc=;
 b=rRzzCmR0tVf6h4KBzq62c0CYR8niscy62CKClslnyifIryBLSoMc6Wu3HpNvrGJvcv
 XZFOYZB5dt78sCcrMXHDx8apzpFmNfrnEn+NxI0L88/tU4sIYNKC9wN80Tl04CeOd9SY
 iaNc8bH5+6dWZhwCoZYj4EKTYE7lHbVyYsm6B+/xk8WVCrkhlPa56L/urQAvEhIVIzw5
 cuVZ+fl127JZBNgmIJVf4zvYnS/MshYrCSvRR0AnCoMtOZ0VJAlvWkxtbxYtc/bQpH0n
 5hEy5rSgjEvdQz0bAAMFYMYpD7unXncwJEgzBeYwJbvWe9bEhmgTXfOQZb0LT2gXISnH
 ATMA==
X-Gm-Message-State: AGi0Pub+BQp/0gJ7ZFsA4OyFEryuTRBddjS7JoGSpuBtErfAbrpbiIAA
 +8W8b+hePyvHPoudNtM11CANlGvj8RtLLkR5mwZCYbadd/D8/uYJBopL2WHb+VXQ6jWLhApLh86
 kgM5CIgS9T772UVzvq7FfhToqng==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr23759650wrr.160.1587477102569; 
 Tue, 21 Apr 2020 06:51:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypKYYb14rVpuN5IdJGjcztA4u7H/3dUDNtMGXdL7LsdIhh9n0qcoiv0NvYygrC3tIbBHwPH97A==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr23759618wrr.160.1587477102414; 
 Tue, 21 Apr 2020 06:51:42 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id a187sm3565830wmh.40.2020.04.21.06.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:51:41 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 1/7] apparmor: just use vfs_kern_mount to make .null
Date: Tue, 21 Apr 2020 15:51:13 +0200
Message-Id: <20200421135119.30007-2-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421135119.30007-1-eesposit@redhat.com>
References: <20200421135119.30007-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

aa_mk_null_file is using simple_pin_fs/simple_release_fs with local
variables as arguments, for what would amount to a simple
vfs_kern_mount/mntput pair if everything was inlined.  Just use
the normal filesystem API since the reference counting is not needed
here (it is a local variable and always 0 on entry and on exit).

There is no functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 security/apparmor/apparmorfs.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index 280741fc0f5f..36f848734902 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -2525,14 +2525,15 @@ struct path aa_null;
=20
 static int aa_mk_null_file(struct dentry *parent)
 {
-=09struct vfsmount *mount =3D NULL;
+=09struct file_system_type *type =3D parent->d_sb->s_type;
+=09struct vfsmount *mount;
 =09struct dentry *dentry;
 =09struct inode *inode;
-=09int count =3D 0;
-=09int error =3D simple_pin_fs(parent->d_sb->s_type, &mount, &count);
+=09int error;
=20
-=09if (error)
-=09=09return error;
+=09mount =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
+=09if (IS_ERR(mount))
+=09=09return PTR_ERR(mount);
=20
 =09inode_lock(d_inode(parent));
 =09dentry =3D lookup_one_len(NULL_FILE_NAME, parent, strlen(NULL_FILE_NAME=
));
@@ -2561,7 +2562,7 @@ static int aa_mk_null_file(struct dentry *parent)
 =09dput(dentry);
 out:
 =09inode_unlock(d_inode(parent));
-=09simple_release_fs(&mount, &count);
+=09mntput(mount);
 =09return error;
 }
=20
--=20
2.25.2


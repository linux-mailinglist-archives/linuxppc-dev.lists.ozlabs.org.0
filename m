Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6641B2967
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:25:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4965SQ1GBgzDqhT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:25:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iEP29Yza; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEP29Yza; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964s02MqPzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:57:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bvf7KQ6tUFJUANfUoAg/qy6nJTS9a9pVqKzaSQlys8=;
 b=iEP29YzacpsJPoiwAB/kahfvRZGYMYfCUFePC1/wqJmKYRrhXzMyybIlJblIN7aJ4zPi+k
 giC0aaiG8A9kN7Ftg51pq8Aqqz57rJPj1m5zIS/vMgzGZaXBSmoa5mNJiNJeanVQcfgaFp
 99xpUAvO/Mb+HiOT44Ln5DhxzMYF4rs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bvf7KQ6tUFJUANfUoAg/qy6nJTS9a9pVqKzaSQlys8=;
 b=iEP29YzacpsJPoiwAB/kahfvRZGYMYfCUFePC1/wqJmKYRrhXzMyybIlJblIN7aJ4zPi+k
 giC0aaiG8A9kN7Ftg51pq8Aqqz57rJPj1m5zIS/vMgzGZaXBSmoa5mNJiNJeanVQcfgaFp
 99xpUAvO/Mb+HiOT44Ln5DhxzMYF4rs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-X9ldjJlmMsCuK77ijPGywQ-1; Tue, 21 Apr 2020 09:57:49 -0400
X-MC-Unique: X9ldjJlmMsCuK77ijPGywQ-1
Received: by mail-wm1-f70.google.com with SMTP id o5so1478530wmo.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GipQquvXdS60T0xD4t06gmL9kKohzWhQBgW2pGftGs=;
 b=dlGZLprshENG1LUJ3t4EGFu2twc8bUUkGPd+ysHuRVFEv2HpLgNLoWiM/e93/qfpnI
 a1d34Vd4YC3Yww7BTpdg6LlnV5UE5/CMZQrrjTVwCIym17ci8tq3ooR3qck5cfRSOtsm
 yO61ndTRX4nnoHC8fg8WnWUjNd4KBblltVuI04IasKlslW6gTYl+LhwZUbQ/6JSIFxLF
 /WAhF61QTGuqEIYmHOjCsZkZ4QUq7RZMfZ8XVq2Dy0BJi/rsb2j/TMuCl2zt4kL1/Dgm
 10ZYwSGFWY85suVGFLw9qkkeSxzjxPU4RGE7V8yvj05H9sqArcomm5W2R1po1oM9rFty
 6pEA==
X-Gm-Message-State: AGi0PuaqR6zikSJohLMREVjP3zpxoJKrwUiWDcG5RnMH/RgX5FFLnbv5
 WloJU++2nR534DnnQrwWIC2Ou+ajg399JNzDbwjc8ZlDDmpc85UUdBojzsnrUY1zT//R1yb0IKT
 LoiSFeVHlqUdd31POnKDD20nLFQ==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr3548558wrx.203.1587477468498; 
 Tue, 21 Apr 2020 06:57:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypIF3TEMFKgVlkqjV5D8Ac9x2gOX23CIH+SaywYNkeLA37qXXTG9GqXHBVuGZrEE7VAAb2MwEw==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr3548522wrx.203.1587477468324; 
 Tue, 21 Apr 2020 06:57:48 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id f23sm3562989wml.4.2020.04.21.06.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:57:47 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 4/7] libfs: add alloc_anon_inode wrapper
Date: Tue, 21 Apr 2020 15:57:38 +0200
Message-Id: <20200421135741.30657-2-eesposit@redhat.com>
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

libfs.c has many functions that are useful to implement dentry and inode
operations, but not many at the filesystem level. Start adding file
creation wrappers, the simplest returns an anonymous inode.

There is no functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/drm_drv.c       |  2 +-
 drivers/misc/cxl/api.c          |  2 +-
 drivers/scsi/cxlflash/ocxl_hw.c |  2 +-
 fs/libfs.c                      | 10 +++++++++-
 include/linux/fs.h              |  2 ++
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index e29424d64874..1854f760ad39 100644
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
index 67e4808bce49..57672abb6223 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -72,7 +72,7 @@ static struct file *cxl_getfile(const char *name,
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
index 7fa98dd4fa28..0e9f2ae7eebf 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -85,7 +85,7 @@ static struct file *ocxlflash_getfile(struct device *dev,=
 const char *name,
 =09=09goto err2;
 =09}
=20
-=09inode =3D alloc_anon_inode(ocxlflash_fs.mount->mnt_sb);
+=09inode =3D simple_alloc_anon_inode(&ocxlflash_fs);
 =09if (IS_ERR(inode)) {
 =09=09rc =3D PTR_ERR(inode);
 =09=09dev_err(dev, "%s: alloc_anon_inode failed rc=3D%d\n",
diff --git a/fs/libfs.c b/fs/libfs.c
index 3fa0cd27ab06..5c76e4c648dc 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -741,7 +741,15 @@ void simple_release_fs(struct simple_fs *fs)
 }
 EXPORT_SYMBOL(simple_release_fs);
=20
-
+/**
+ * simple_alloc_anon_inode - wrapper for alloc_anon_inode
+ * @fs: a pointer to a struct simple_fs containing a valid vfs_mount point=
er
+ **/
+struct inode *simple_alloc_anon_inode(struct simple_fs *fs)
+{
+=09return alloc_anon_inode(fs->mount->mnt_sb);
+}
+EXPORT_SYMBOL(simple_alloc_anon_inode);
=20
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
diff --git a/include/linux/fs.h b/include/linux/fs.h
index de2577df30ae..5e93de72118b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3373,6 +3373,8 @@ struct simple_fs {
 extern int simple_pin_fs(struct simple_fs *, struct file_system_type *);
 extern void simple_release_fs(struct simple_fs *);
=20
+extern struct inode *simple_alloc_anon_inode(struct simple_fs *fs);
+
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 =09=09=09loff_t *ppos, const void *from, size_t available);
 extern ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *=
ppos,
--=20
2.25.2


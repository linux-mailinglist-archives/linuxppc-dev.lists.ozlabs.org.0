Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 728851B2954
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:21:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4965NZ08tqzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:21:50 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=KR66Rt/t; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KR66Rt/t; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964ry3VxQzDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:57:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKUiLQ5ZuIL+bTIy/EMQv4vQmlAvPOSAZZePSFtw9GI=;
 b=KR66Rt/t7U6yoA7tkgtD9q54H5bh4pGjE+hd/Yye7mRbGiEvXmnjKHtvzgB/GEt2XEnwkl
 qra/P3GFh6hiPBse5aX1AlzvbKskcvKq+v+A22ONWvCvFYBrBfwfKl/0KQKNbnm1nMonyH
 wgFk/a5gU8if61Vm1wrQ0Add1Zb11sM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKUiLQ5ZuIL+bTIy/EMQv4vQmlAvPOSAZZePSFtw9GI=;
 b=KR66Rt/t7U6yoA7tkgtD9q54H5bh4pGjE+hd/Yye7mRbGiEvXmnjKHtvzgB/GEt2XEnwkl
 qra/P3GFh6hiPBse5aX1AlzvbKskcvKq+v+A22ONWvCvFYBrBfwfKl/0KQKNbnm1nMonyH
 wgFk/a5gU8if61Vm1wrQ0Add1Zb11sM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-IKJz4ZgEM_KlJVYkqM37cA-1; Tue, 21 Apr 2020 09:57:47 -0400
X-MC-Unique: IKJz4ZgEM_KlJVYkqM37cA-1
Received: by mail-wr1-f71.google.com with SMTP id u4so7538446wrm.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wRD9FPTWKMzxCyWJGhqpm27rg8NjVNjjKx55UL7gOU=;
 b=evcf2IT2wGDdKf2qHxE+sPwHyc+m0HdoujE30odRtw0272P88W92HZQMYxHksUjj+G
 bUVa7rmWdeVzKi2oWyM2XzDisd7ZyQhQKGfpm6BeV3JNpTFfuaHRDq3kvTclpNS18OAZ
 YTb7jNPx3WKSGXQYTYbOAW0ENgjaKeZgN1eKhNz57Iss3lHBNPzHo57kgN6ENeccjEtb
 /+NTwXqb3yT8oaDgR4Yyf4ej+22sGWXceeokb2ywUDf+aSTEL2vyp2SWmZNFaO98gjwW
 5De9USiyj5SA1W2d7NOCVTZGPJUD6xCPOxJcfjI0zJ0hAMgCUO6LApjNn7vvOC7+kZjB
 GLjA==
X-Gm-Message-State: AGi0PuYvZeiBSRf3lUQB4hH9ab0esLG76JFSAhMEQqZQosLr2t6PHd5b
 dgi3PtUst8jq8aE0HkdrPucEMJeIYIuuM31dfrxjTUAAIwze8s8Am0FV0cX4Q3yTqhGmfIuQmeT
 cdWGNsR2whuhZbHyULV2Gp1E9Aw==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr4993965wmj.130.1587477466572; 
 Tue, 21 Apr 2020 06:57:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypIdMbj9yLvuLA4LwwjCRX8ejEQ6n8RjZ/wI7HQOlXPSbSe/l8j+NErdfsIjBeaz5nCZl4whdg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr4993944wmj.130.1587477466378; 
 Tue, 21 Apr 2020 06:57:46 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id f23sm3562989wml.4.2020.04.21.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:57:45 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 3/7] libfs: introduce new_inode_current_time
Date: Tue, 21 Apr 2020 15:57:37 +0200
Message-Id: <20200421135741.30657-1-eesposit@redhat.com>
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

It is a common special case for new_inode to initialize the
time to the current time and the inode to get_next_ino().
Introduce a core function that does it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/libfs.c         | 20 ++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 54e07ae986ca..3fa0cd27ab06 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -594,6 +594,26 @@ int simple_write_end(struct file *file, struct address=
_space *mapping,
 }
 EXPORT_SYMBOL(simple_write_end);
=20
+/**
+ * new_inode_current_time - create new inode by initializing the
+ * time to the current time and the inode to get_next_ino()
+ * @sb: pointer to super block of the file system
+ *
+ * Returns an inode pointer on success, NULL on failure.
+ */
+struct inode *new_inode_current_time(struct super_block *sb)
+{
+=09struct inode *inode =3D new_inode(sb);
+
+=09if (inode) {
+=09=09inode->i_ino =3D get_next_ino();
+=09=09inode->i_atime =3D inode->i_mtime =3D
+=09=09=09inode->i_ctime =3D current_time(inode);
+=09}
+=09return inode;
+}
+EXPORT_SYMBOL(new_inode_current_time);
+
 /*
  * the inodes created here are not hashed. If you use iunique to generate
  * unique inode values later for this filesystem, then you must take care
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a3691c132b3a..de2577df30ae 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3088,6 +3088,7 @@ extern void clear_inode(struct inode *);
 extern void __destroy_inode(struct inode *);
 extern struct inode *new_inode_pseudo(struct super_block *sb);
 extern struct inode *new_inode(struct super_block *sb);
+extern struct inode *new_inode_current_time(struct super_block *sb);
 extern void free_inode_nonrcu(struct inode *inode);
 extern int should_remove_suid(struct dentry *);
 extern int file_remove_privs(struct file *);
--=20
2.25.2


Return-Path: <linuxppc-dev+bounces-12480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406DB8C360
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1q1V1Qz3fR2;
	Sat, 20 Sep 2025 17:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354511;
	cv=none; b=ejLQcvumuFfyUgUjWPaVgkfVfhDzR+RjsIbwnZ53YiLTfJud5YEqgjGSU8T3v6SOpzYoeGIXo4x02HBPXVzuSmsArkKx/syhkw2jI8WV0RajOmF6f4OUVyLSB2sZSFR5nbiCn+gI6SpJQ5a9vkKaH+dPquEV5SfOpOgRWoLsj9p7GB6Gcvfkrji6VLBiEv0JZz7dzMfEzdbSfPaZ9HvIrao5OvO5VoKZR+W3Uq37zfgh+mrRTnrkyFTSUc4gg6rpdBlRJybnOAxuEBpbWLymcp3BRj56u98A+y2CjEFrlYDMdj/j8Nw9IdVHzZOlc2BEb+Pi2Ku8kmK0Q/xll8dlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354511; c=relaxed/relaxed;
	bh=NrCfZqIGx2QtH4dFK91zKO0X/du0eTzDDHu7mpHeJ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9YMhal+PTsj5RvzANylM0Z+2bobQGWTssVqakWdBp6pwlAW4nJGwBJkFnqEQIJwhtuD4GBWOrI5+Ja7H5l92oQ+P5Hfybhtah0HLMvLHB/7yXyHUdRRHmGRRGvB0CsXFVFmL8TOQBaNGZSM19mSosYGR0pnQUHUsWUooFzze8qJ44w5jTkK8z73QPAl3gNCkfjvJk1wXF+HiW9huRd/t/pb3J2wfYSQPuJi0DpaQYuMqk20kWC0cDWclDVDRfPOBqtG7D6JXVPlF6JO5QtakSgPzOcYhn4fXCukrqbB/27yKwEDQvDji264bydm7P8oyo3jiuWO1QVvkvyjNn8+Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=K4/e3Rie; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=K4/e3Rie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1Z4sTcz3dBj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NrCfZqIGx2QtH4dFK91zKO0X/du0eTzDDHu7mpHeJ3A=; b=K4/e3RieUOijjjl/ehkEvHcQ4Z
	QBK1iY+AOPVRofXOu8+4mdeNcLH4uPJC3gWxWin8DVhGiQ/Mh1Xc8Y+gjCxG2Z4j9osEOGr8cbX3w
	KbrPFmdelDdm+qPmBqPLxdXCucPd78tb8EP+clrbWeNVzNKeGNsD7fLfqX9in/P6X+oiuHGNOLS/P
	ue3YPE2fdcGHviQKX+a6c4NsUbT0eAp0uppImgmQEhuXE7ZvK7x4GwofAE5JTMhW3fSytOSnCTKYm
	l3IswgfSvtxEffSKr6izyp6D9vQE3mvuustvWOj2DDGGWg1Dv/G0DlzJ8W+tnLxN7cJgHMkJ7r3Oq
	jS0fXF2A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKI-0000000ExNS-04OY;
	Sat, 20 Sep 2025 07:48:10 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz,
	raven@themaw.net,
	miklos@szeredi.hu,
	a.hindborg@kernel.org,
	linux-mm@kvack.org,
	linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	kees@kernel.org,
	rostedt@goodmis.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	paul@paul-moore.com,
	casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org,
	borntraeger@linux.ibm.com
Subject: [PATCH 37/39] hypfs: switch hypfs_create_str() to returning int
Date: Sat, 20 Sep 2025 08:47:56 +0100
Message-ID: <20250920074759.3564072-37-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Every single caller only cares about PTR_ERR_OR_ZERO() of return value...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/s390/hypfs/hypfs.h         |  3 +--
 arch/s390/hypfs/hypfs_diag_fs.c | 40 +++++++++------------------------
 arch/s390/hypfs/hypfs_vm_fs.c   |  6 ++---
 arch/s390/hypfs/inode.c         |  9 ++++----
 4 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/arch/s390/hypfs/hypfs.h b/arch/s390/hypfs/hypfs.h
index 4dc2e068e0ff..0d109d956015 100644
--- a/arch/s390/hypfs/hypfs.h
+++ b/arch/s390/hypfs/hypfs.h
@@ -25,8 +25,7 @@ extern struct dentry *hypfs_mkdir(struct dentry *parent, const char *name);
 extern struct dentry *hypfs_create_u64(struct dentry *dir, const char *name,
 				       __u64 value);
 
-extern struct dentry *hypfs_create_str(struct dentry *dir, const char *name,
-				       char *string);
+extern int hypfs_create_str(struct dentry *dir, const char *name, char *string);
 
 /* LPAR Hypervisor */
 extern int hypfs_diag_init(void);
diff --git a/arch/s390/hypfs/hypfs_diag_fs.c b/arch/s390/hypfs/hypfs_diag_fs.c
index ede951dc0085..2178e6060a5d 100644
--- a/arch/s390/hypfs/hypfs_diag_fs.c
+++ b/arch/s390/hypfs/hypfs_diag_fs.c
@@ -228,8 +228,7 @@ static int hypfs_create_cpu_files(struct dentry *cpus_dir, void *cpu_info)
 			return PTR_ERR(rc);
 	}
 	diag224_idx2name(cpu_info__ctidx(diag204_get_info_type(), cpu_info), buffer);
-	rc = hypfs_create_str(cpu_dir, "type", buffer);
-	return PTR_ERR_OR_ZERO(rc);
+	return hypfs_create_str(cpu_dir, "type", buffer);
 }
 
 static void *hypfs_create_lpar_files(struct dentry *systems_dir, void *part_hdr)
@@ -276,8 +275,7 @@ static int hypfs_create_phys_cpu_files(struct dentry *cpus_dir, void *cpu_info)
 	if (IS_ERR(rc))
 		return PTR_ERR(rc);
 	diag224_idx2name(phys_cpu__ctidx(diag204_get_info_type(), cpu_info), buffer);
-	rc = hypfs_create_str(cpu_dir, "type", buffer);
-	return PTR_ERR_OR_ZERO(rc);
+	return hypfs_create_str(cpu_dir, "type", buffer);
 }
 
 static void *hypfs_create_phys_files(struct dentry *parent_dir, void *phys_hdr)
@@ -316,41 +314,25 @@ int hypfs_diag_create_files(struct dentry *root)
 		return rc;
 
 	systems_dir = hypfs_mkdir(root, "systems");
-	if (IS_ERR(systems_dir)) {
-		rc = PTR_ERR(systems_dir);
-		goto err_out;
-	}
+	if (IS_ERR(systems_dir))
+		return PTR_ERR(systems_dir);
 	time_hdr = (struct x_info_blk_hdr *)buffer;
 	part_hdr = time_hdr + info_blk_hdr__size(diag204_get_info_type());
 	for (i = 0; i < info_blk_hdr__npar(diag204_get_info_type(), time_hdr); i++) {
 		part_hdr = hypfs_create_lpar_files(systems_dir, part_hdr);
-		if (IS_ERR(part_hdr)) {
-			rc = PTR_ERR(part_hdr);
-			goto err_out;
-		}
+		if (IS_ERR(part_hdr))
+			return PTR_ERR(part_hdr);
 	}
 	if (info_blk_hdr__flags(diag204_get_info_type(), time_hdr) &
 	    DIAG204_LPAR_PHYS_FLG) {
 		ptr = hypfs_create_phys_files(root, part_hdr);
-		if (IS_ERR(ptr)) {
-			rc = PTR_ERR(ptr);
-			goto err_out;
-		}
+		if (IS_ERR(ptr))
+			return PTR_ERR(ptr);
 	}
 	hyp_dir = hypfs_mkdir(root, "hyp");
-	if (IS_ERR(hyp_dir)) {
-		rc = PTR_ERR(hyp_dir);
-		goto err_out;
-	}
-	ptr = hypfs_create_str(hyp_dir, "type", "LPAR Hypervisor");
-	if (IS_ERR(ptr)) {
-		rc = PTR_ERR(ptr);
-		goto err_out;
-	}
-	rc = 0;
-
-err_out:
-	return rc;
+	if (IS_ERR(hyp_dir))
+		return PTR_ERR(hyp_dir);
+	return hypfs_create_str(hyp_dir, "type", "LPAR Hypervisor");
 }
 
 /* Diagnose 224 functions */
diff --git a/arch/s390/hypfs/hypfs_vm_fs.c b/arch/s390/hypfs/hypfs_vm_fs.c
index 6011289afa8c..e8a32d66062b 100644
--- a/arch/s390/hypfs/hypfs_vm_fs.c
+++ b/arch/s390/hypfs/hypfs_vm_fs.c
@@ -100,11 +100,9 @@ int hypfs_vm_create_files(struct dentry *root)
 		rc = PTR_ERR(dir);
 		goto failed;
 	}
-	file = hypfs_create_str(dir, "type", "z/VM Hypervisor");
-	if (IS_ERR(file)) {
-		rc = PTR_ERR(file);
+	rc = hypfs_create_str(dir, "type", "z/VM Hypervisor");
+	if (rc)
 		goto failed;
-	}
 
 	/* physical cpus */
 	dir = hypfs_mkdir(root, "cpus");
diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
index a4dc8e13d999..c5e2d8932b88 100644
--- a/arch/s390/hypfs/inode.c
+++ b/arch/s390/hypfs/inode.c
@@ -398,24 +398,23 @@ struct dentry *hypfs_create_u64(struct dentry *dir,
 	return dentry;
 }
 
-struct dentry *hypfs_create_str(struct dentry *dir,
-				const char *name, char *string)
+int hypfs_create_str(struct dentry *dir, const char *name, char *string)
 {
 	char *buffer;
 	struct dentry *dentry;
 
 	buffer = kmalloc(strlen(string) + 2, GFP_KERNEL);
 	if (!buffer)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	sprintf(buffer, "%s\n", string);
 	dentry =
 	    hypfs_create_file(dir, name, buffer, S_IFREG | REG_FILE_MODE);
 	if (IS_ERR(dentry)) {
 		kfree(buffer);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 	hypfs_add_dentry(dentry);
-	return dentry;
+	return 0;
 }
 
 static const struct file_operations hypfs_file_ops = {
-- 
2.47.3



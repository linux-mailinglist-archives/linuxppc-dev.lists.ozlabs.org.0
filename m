Return-Path: <linuxppc-dev+bounces-14043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3542C4BC92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:57:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HP204m7z3dXD;
	Tue, 11 Nov 2025 17:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844149;
	cv=none; b=fTUKmQLIv3NYvUWs7ssv0QVACR/GwqbWUsoszk5OKwG1/5+E4lAOfJvrmpD/wPs00RCZiWh7oh9EsNtAdbykRYRRNQdijZiMBQt+Mtlldhr/TMqsJr3/PVzuwQQE1LNz9bhs/QdQsD6PC1P1Fx80DXdc/cUJUSiiYnQVX+WtSME6an7uKA+n5PNEQ98chenFKtOlwyHsgkHPJpdz256WEw14hdhTW2CNKYAwjCjo7YwRtJl0xN4b0Bqr4VlEsEH6C5jZ2FaefG9oyd2dXRTbzEPAkHS3DXzO47PCvQ6EFPL/bB8sPNHskagQy7qq66svOiLuYIR0jRXcFs/S8MW39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844149; c=relaxed/relaxed;
	bh=cNupE5WP11QDcgvbWMAmFaE1TAZeWcI3mGTR58jAFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAI5Bjr0M8NOiJoqBhoe7NRewZ0C3S+1FMP5CS6ZwNzLvU1V6RuIqyNVADxFEMRJXtZ/K9sw5+89fX4aT1CHiD1P0Ps4Uw+lMhQpxYTwrpYVdntsrXtXfmIYbMc/A5X2lDQ5qA3MS4pPK1BB2z/Ie8UNsqP4X38DK4t3K87+T5LpwBGB4qaOz97jkDSmTO++OO5ruV1+YLLzgRgc+AHmYqn9ZQI8S7mO6K1DO9Ie3fpg9srU1aPaI16ol3HGu63GxXXdFtTu4QKVvv0Tbfa553I+3kmLhyRdRQtr30DW0n2OH6IX+XQx530RE1gRJmjrPsXIcqHWOY7/ocsxRgu8kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=RQCOMeHD; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=RQCOMeHD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HNv61HBz309p
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cNupE5WP11QDcgvbWMAmFaE1TAZeWcI3mGTR58jAFHY=; b=RQCOMeHDTMsMilhxlrv0z4v2K7
	Uax1Ub263Rf604bstsm5tixvcaZtT4WVJ1iaUIE8BEHoZknV4vdRUMVILyZhiqThaCURM15QSbzNU
	XDbRDWKE5nnVHmhBAZ/LMjfgS6zWKcBwQCsbXTRyEt2lUStEdf8a+zEKSkMDyoCkNrQXHNR53Qqgz
	lgkQoE2tU3nqJHkM94bqdzPnp3ljtAC0tMDWbxR+uPLfN01RjB5NqhEIVcgrTJJ3/Q3fsnp83xhzE
	2sih+Jp16DJAkGsHt8obPqINFFoiq0zPSf4+w9PbSTfWDnw4tal2yXVwLn6Sys3f9Azg4i7IoS43+
	uF5YJCng==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHq-0000000BxEp-1TZh;
	Tue, 11 Nov 2025 06:55:30 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz,
	raven@themaw.net,
	miklos@szeredi.hu,
	neil@brown.name,
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
	john.johansen@canonical.com,
	selinux@vger.kernel.org,
	borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: [PATCH v3 42/50] hypfs: swich hypfs_create_u64() to returning int
Date: Tue, 11 Nov 2025 06:55:11 +0000
Message-ID: <20251111065520.2847791-43-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
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

same story as for hypfs_create_str()

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/s390/hypfs/hypfs.h         |  3 +--
 arch/s390/hypfs/hypfs_diag_fs.c | 20 ++++++++++----------
 arch/s390/hypfs/hypfs_vm_fs.c   | 15 ++++++---------
 arch/s390/hypfs/inode.c         |  9 ++++-----
 4 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/s390/hypfs/hypfs.h b/arch/s390/hypfs/hypfs.h
index 0d109d956015..2bb7104124ca 100644
--- a/arch/s390/hypfs/hypfs.h
+++ b/arch/s390/hypfs/hypfs.h
@@ -22,8 +22,7 @@
 
 extern struct dentry *hypfs_mkdir(struct dentry *parent, const char *name);
 
-extern struct dentry *hypfs_create_u64(struct dentry *dir, const char *name,
-				       __u64 value);
+extern int hypfs_create_u64(struct dentry *dir, const char *name, __u64 value);
 
 extern int hypfs_create_str(struct dentry *dir, const char *name, char *string);
 
diff --git a/arch/s390/hypfs/hypfs_diag_fs.c b/arch/s390/hypfs/hypfs_diag_fs.c
index 2178e6060a5d..83c9426df08e 100644
--- a/arch/s390/hypfs/hypfs_diag_fs.c
+++ b/arch/s390/hypfs/hypfs_diag_fs.c
@@ -204,7 +204,7 @@ static int hypfs_create_cpu_files(struct dentry *cpus_dir, void *cpu_info)
 {
 	struct dentry *cpu_dir;
 	char buffer[TMP_SIZE];
-	void *rc;
+	int rc;
 
 	snprintf(buffer, TMP_SIZE, "%d", cpu_info__cpu_addr(diag204_get_info_type(),
 							    cpu_info));
@@ -214,18 +214,18 @@ static int hypfs_create_cpu_files(struct dentry *cpus_dir, void *cpu_info)
 	rc = hypfs_create_u64(cpu_dir, "mgmtime",
 			      cpu_info__acc_time(diag204_get_info_type(), cpu_info) -
 			      cpu_info__lp_time(diag204_get_info_type(), cpu_info));
-	if (IS_ERR(rc))
-		return PTR_ERR(rc);
+	if (rc)
+		return rc;
 	rc = hypfs_create_u64(cpu_dir, "cputime",
 			      cpu_info__lp_time(diag204_get_info_type(), cpu_info));
-	if (IS_ERR(rc))
-		return PTR_ERR(rc);
+	if (rc)
+		return rc;
 	if (diag204_get_info_type() == DIAG204_INFO_EXT) {
 		rc = hypfs_create_u64(cpu_dir, "onlinetime",
 				      cpu_info__online_time(diag204_get_info_type(),
 							    cpu_info));
-		if (IS_ERR(rc))
-			return PTR_ERR(rc);
+		if (rc)
+			return rc;
 	}
 	diag224_idx2name(cpu_info__ctidx(diag204_get_info_type(), cpu_info), buffer);
 	return hypfs_create_str(cpu_dir, "type", buffer);
@@ -263,7 +263,7 @@ static int hypfs_create_phys_cpu_files(struct dentry *cpus_dir, void *cpu_info)
 {
 	struct dentry *cpu_dir;
 	char buffer[TMP_SIZE];
-	void *rc;
+	int rc;
 
 	snprintf(buffer, TMP_SIZE, "%i", phys_cpu__cpu_addr(diag204_get_info_type(),
 							    cpu_info));
@@ -272,8 +272,8 @@ static int hypfs_create_phys_cpu_files(struct dentry *cpus_dir, void *cpu_info)
 		return PTR_ERR(cpu_dir);
 	rc = hypfs_create_u64(cpu_dir, "mgmtime",
 			      phys_cpu__mgm_time(diag204_get_info_type(), cpu_info));
-	if (IS_ERR(rc))
-		return PTR_ERR(rc);
+	if (rc)
+		return rc;
 	diag224_idx2name(phys_cpu__ctidx(diag204_get_info_type(), cpu_info), buffer);
 	return hypfs_create_str(cpu_dir, "type", buffer);
 }
diff --git a/arch/s390/hypfs/hypfs_vm_fs.c b/arch/s390/hypfs/hypfs_vm_fs.c
index e8a32d66062b..a149a9f92e40 100644
--- a/arch/s390/hypfs/hypfs_vm_fs.c
+++ b/arch/s390/hypfs/hypfs_vm_fs.c
@@ -19,10 +19,9 @@
 
 #define ATTRIBUTE(dir, name, member) \
 do { \
-	void *rc; \
-	rc = hypfs_create_u64(dir, name, member); \
-	if (IS_ERR(rc)) \
-		return PTR_ERR(rc); \
+	int rc = hypfs_create_u64(dir, name, member); \
+	if (rc) \
+		return rc; \
 } while (0)
 
 static int hypfs_vm_create_guest(struct dentry *systems_dir,
@@ -85,7 +84,7 @@ static int hypfs_vm_create_guest(struct dentry *systems_dir,
 
 int hypfs_vm_create_files(struct dentry *root)
 {
-	struct dentry *dir, *file;
+	struct dentry *dir;
 	struct diag2fc_data *data;
 	unsigned int count = 0;
 	int rc, i;
@@ -110,11 +109,9 @@ int hypfs_vm_create_files(struct dentry *root)
 		rc = PTR_ERR(dir);
 		goto failed;
 	}
-	file = hypfs_create_u64(dir, "count", data->lcpus);
-	if (IS_ERR(file)) {
-		rc = PTR_ERR(file);
+	rc = hypfs_create_u64(dir, "count", data->lcpus);
+	if (rc)
 		goto failed;
-	}
 
 	/* guests */
 	dir = hypfs_mkdir(root, "systems");
diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
index c5e2d8932b88..6a80ab2692be 100644
--- a/arch/s390/hypfs/inode.c
+++ b/arch/s390/hypfs/inode.c
@@ -377,8 +377,7 @@ static struct dentry *hypfs_create_update_file(struct dentry *dir)
 	return dentry;
 }
 
-struct dentry *hypfs_create_u64(struct dentry *dir,
-				const char *name, __u64 value)
+int hypfs_create_u64(struct dentry *dir, const char *name, __u64 value)
 {
 	char *buffer;
 	char tmp[TMP_SIZE];
@@ -387,15 +386,15 @@ struct dentry *hypfs_create_u64(struct dentry *dir,
 	snprintf(tmp, TMP_SIZE, "%llu\n", (unsigned long long int)value);
 	buffer = kstrdup(tmp, GFP_KERNEL);
 	if (!buffer)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
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
 
 int hypfs_create_str(struct dentry *dir, const char *name, char *string)
-- 
2.47.3



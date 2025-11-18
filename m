Return-Path: <linuxppc-dev+bounces-14241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69500C675DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xs83xhqz308g;
	Tue, 18 Nov 2025 16:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442986;
	cv=none; b=nYYhdmdk08wdFxQ9daxXEtWbY4MAXjhelv6J8M5OzDT1SHrzkuAD0Sze5CuOLV9HjNBaQbyp+N9TEZx77sKKKMb10XSDyXPKZ/0apBFRAkWJqXQrx4LYjF5WRS2JQKQmyRfCpxXnFLK+oVVkN0TQNsI1VUWqUBpgOe/VbesJA89ZCcdbR1E0zUavZvyhO40jOqLo92loggGv8ExPYwcN+Ia+pQ34XEIx5o4LCAyFR0WN/xeMWTuLkPHI+V2TJ6SlfAS/gD49Mjp1UOltAsGCP+OvHwnOEhSGhfOMzji0oMgCOdJBOeXvOpGyg6GeBzG5lpZ2n15TLUirY9esbsAprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442986; c=relaxed/relaxed;
	bh=cNupE5WP11QDcgvbWMAmFaE1TAZeWcI3mGTR58jAFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOzAhwd+OXObm/qKNDjt0ns3AL+cs4MJSBc5eObYosL8hPbs/4iSutL/+jaZnLyqIGoVwVzZHpmqJYhsjWzwUfa25+kNaNweo+yQBTrvHAJ0Gy50ap3tjxj534KK5JL+MKOK9NvpYY9ddUXv+eSrFQkAXPwbd8/xCKuJVx3Yv5sNhy2v8nVuCEctYbbfO1QJV2psU35OfdhMQiiQDNnrurcr4oDzLksISBMPLNgu1euOyKZmmEJ9vt7eOUf5uiHVljaWEDoeuEJhNIiAiIeUcjfIVTMKt0VwB6yWWz9SytIdos4oWV2wpltJFOqL++nQmjDyx+oXyWoqlZ/Rxkh/wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=RvpCBH5V; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=RvpCBH5V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xry2KRTz30V0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cNupE5WP11QDcgvbWMAmFaE1TAZeWcI3mGTR58jAFHY=; b=RvpCBH5V8xAtvybZWVGuR1nmVo
	MjRxIRyzua4TPQCJjSZVgGMaEW6AwdPEurVjVteGpPWVh1hNGGyLPlT2P+Lll3CBKEX8DagW8UDsl
	k2gcSs3nFAUQ9DuhYjRrsZ8QbqS/P8H65JmcaQH2lmbFSTlt5ZSGl1vBv0mWxeBA0Wga4qge4cdUZ
	w2Bi2HsyUPG/J5vTvjAnNDfTiD/8AmWyW50Z64g4bTj2qPKA0KZ7d3DDdQnAC+RTIcU0dqLzPefS4
	x/KshpPVS1b8B0elsqHv0AQf/7gj6sW9jsquD3KpvvOLIyWYAvJ3hp2ScabcEO2jn5Pa7nuL2MCp7
	4QZFNFbw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4Z-0000000GEZo-00JA;
	Tue, 18 Nov 2025 05:16:11 +0000
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
	bpf@vger.kernel.org,
	clm@meta.com
Subject: [PATCH v4 46/54] hypfs: swich hypfs_create_u64() to returning int
Date: Tue, 18 Nov 2025 05:15:55 +0000
Message-ID: <20251118051604.3868588-47-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
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



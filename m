Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65542B84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 17:59:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PBPb3J0xzDqvw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 01:58:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="vyvN4Ii1"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PBJJ1stqzDqsR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 01:54:22 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFE6F21019;
 Wed, 12 Jun 2019 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560354860;
 bh=Ylf4myVpb37G92EUNj9SQasRRSsSrpHJZa1HHtbiVTo=;
 h=Date:From:To:Cc:Subject:From;
 b=vyvN4Ii1GCnfzeme4QPECcll0rbTDirdm9qxgklaP48lOgWiYQMsE9rdq8Fz8RTbF
 4hEwog0pvRtdPrZzvMBExSZrmS4rBVBV/NiL0JF17Ai/jR4dVrGo+6Wo5ybC+O5dbw
 uS6HjBCPn7Ecuzyv5EeogDqFYy7M+49cSbCohv60=
Date: Wed, 12 Jun 2019 17:54:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v2] cxl: no need to check return value of debugfs_create
 functions
Message-ID: <20190612155418.GB22739@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Because there's no need to check, also make the return value of the
local debugfs_create_io_x64() call void, as no one ever did anything
with the return value (as they did not need to.)

And make the cxl_debugfs_* calls return void as no one was even checking
their return value at all.

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: make the return value of all of the cxl_debugfs_* calls void as no
    one was checking the return values of them.

 drivers/misc/cxl/cxl.h     | 15 ++++++---------
 drivers/misc/cxl/debugfs.c | 36 +++++++++++-------------------------
 2 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
index a73c9e669d78..5dc0f6093f9d 100644
--- a/drivers/misc/cxl/cxl.h
+++ b/drivers/misc/cxl/cxl.h
@@ -908,11 +908,11 @@ void cxl_update_dedicated_ivtes_psl8(struct cxl_context *ctx);
 
 #ifdef CONFIG_DEBUG_FS
 
-int cxl_debugfs_init(void);
+void cxl_debugfs_init(void);
 void cxl_debugfs_exit(void);
-int cxl_debugfs_adapter_add(struct cxl *adapter);
+void cxl_debugfs_adapter_add(struct cxl *adapter);
 void cxl_debugfs_adapter_remove(struct cxl *adapter);
-int cxl_debugfs_afu_add(struct cxl_afu *afu);
+void cxl_debugfs_afu_add(struct cxl_afu *afu);
 void cxl_debugfs_afu_remove(struct cxl_afu *afu);
 void cxl_debugfs_add_adapter_regs_psl9(struct cxl *adapter, struct dentry *dir);
 void cxl_debugfs_add_adapter_regs_psl8(struct cxl *adapter, struct dentry *dir);
@@ -921,27 +921,24 @@ void cxl_debugfs_add_afu_regs_psl8(struct cxl_afu *afu, struct dentry *dir);
 
 #else /* CONFIG_DEBUG_FS */
 
-static inline int __init cxl_debugfs_init(void)
+static inline void __init cxl_debugfs_init(void)
 {
-	return 0;
 }
 
 static inline void cxl_debugfs_exit(void)
 {
 }
 
-static inline int cxl_debugfs_adapter_add(struct cxl *adapter)
+static inline void cxl_debugfs_adapter_add(struct cxl *adapter)
 {
-	return 0;
 }
 
 static inline void cxl_debugfs_adapter_remove(struct cxl *adapter)
 {
 }
 
-static inline int cxl_debugfs_afu_add(struct cxl_afu *afu)
+static inline void cxl_debugfs_afu_add(struct cxl_afu *afu)
 {
-	return 0;
 }
 
 static inline void cxl_debugfs_afu_remove(struct cxl_afu *afu)
diff --git a/drivers/misc/cxl/debugfs.c b/drivers/misc/cxl/debugfs.c
index 1fda22c24c93..7b987bf498b5 100644
--- a/drivers/misc/cxl/debugfs.c
+++ b/drivers/misc/cxl/debugfs.c
@@ -26,11 +26,11 @@ static int debugfs_io_u64_set(void *data, u64 val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_io_x64, debugfs_io_u64_get, debugfs_io_u64_set,
 			 "0x%016llx\n");
 
-static struct dentry *debugfs_create_io_x64(const char *name, umode_t mode,
-					    struct dentry *parent, u64 __iomem *value)
+static void debugfs_create_io_x64(const char *name, umode_t mode,
+				  struct dentry *parent, u64 __iomem *value)
 {
-	return debugfs_create_file_unsafe(name, mode, parent,
-					  (void __force *)value, &fops_io_x64);
+	debugfs_create_file_unsafe(name, mode, parent, (void __force *)value,
+				   &fops_io_x64);
 }
 
 void cxl_debugfs_add_adapter_regs_psl9(struct cxl *adapter, struct dentry *dir)
@@ -54,25 +54,22 @@ void cxl_debugfs_add_adapter_regs_psl8(struct cxl *adapter, struct dentry *dir)
 	debugfs_create_io_x64("trace", S_IRUSR | S_IWUSR, dir, _cxl_p1_addr(adapter, CXL_PSL_TRACE));
 }
 
-int cxl_debugfs_adapter_add(struct cxl *adapter)
+void cxl_debugfs_adapter_add(struct cxl *adapter)
 {
 	struct dentry *dir;
 	char buf[32];
 
 	if (!cxl_debugfs)
-		return -ENODEV;
+		return;
 
 	snprintf(buf, 32, "card%i", adapter->adapter_num);
 	dir = debugfs_create_dir(buf, cxl_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 	adapter->debugfs = dir;
 
 	debugfs_create_io_x64("err_ivte", S_IRUSR, dir, _cxl_p1_addr(adapter, CXL_PSL_ErrIVTE));
 
 	if (adapter->native->sl_ops->debugfs_add_adapter_regs)
 		adapter->native->sl_ops->debugfs_add_adapter_regs(adapter, dir);
-	return 0;
 }
 
 void cxl_debugfs_adapter_remove(struct cxl *adapter)
@@ -96,18 +93,16 @@ void cxl_debugfs_add_afu_regs_psl8(struct cxl_afu *afu, struct dentry *dir)
 	debugfs_create_io_x64("trace", S_IRUSR | S_IWUSR, dir, _cxl_p1n_addr(afu, CXL_PSL_SLICE_TRACE));
 }
 
-int cxl_debugfs_afu_add(struct cxl_afu *afu)
+void cxl_debugfs_afu_add(struct cxl_afu *afu)
 {
 	struct dentry *dir;
 	char buf[32];
 
 	if (!afu->adapter->debugfs)
-		return -ENODEV;
+		return;
 
 	snprintf(buf, 32, "psl%i.%i", afu->adapter->adapter_num, afu->slice);
 	dir = debugfs_create_dir(buf, afu->adapter->debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 	afu->debugfs = dir;
 
 	debugfs_create_io_x64("sr",         S_IRUSR, dir, _cxl_p1n_addr(afu, CXL_PSL_SR_An));
@@ -118,8 +113,6 @@ int cxl_debugfs_afu_add(struct cxl_afu *afu)
 
 	if (afu->adapter->native->sl_ops->debugfs_add_afu_regs)
 		afu->adapter->native->sl_ops->debugfs_add_afu_regs(afu, dir);
-
-	return 0;
 }
 
 void cxl_debugfs_afu_remove(struct cxl_afu *afu)
@@ -127,19 +120,12 @@ void cxl_debugfs_afu_remove(struct cxl_afu *afu)
 	debugfs_remove_recursive(afu->debugfs);
 }
 
-int __init cxl_debugfs_init(void)
+void __init cxl_debugfs_init(void)
 {
-	struct dentry *ent;
-
 	if (!cpu_has_feature(CPU_FTR_HVMODE))
-		return 0;
-
-	ent = debugfs_create_dir("cxl", NULL);
-	if (IS_ERR(ent))
-		return PTR_ERR(ent);
-	cxl_debugfs = ent;
+		return;
 
-	return 0;
+	cxl_debugfs = debugfs_create_dir("cxl", NULL);
 }
 
 void cxl_debugfs_exit(void)
-- 
2.22.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8883D54F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 20:14:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NdSg4r4xzDqty
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 04:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="otj3CitM"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NdQy4FJjzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 04:13:14 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49E7E20896;
 Tue, 11 Jun 2019 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560276791;
 bh=/YdPNR/xj9GzlIeqiyiWVoL/6OxMC/D1j1w2Tnn2LoA=;
 h=Date:From:To:Cc:Subject:From;
 b=otj3CitMIuYrkXVI4cjSz3NUAbb88FV5BP9rbCkpBoIcZ50GXf6jgWF0ZciWoH6t8
 C4PRJiRuI+o7kofHetV8/87l0KOniTIZ/G4Z4RmdIb2hS2VzlYhEZEHy/S0izYCWxL
 qZ/qmU1AxLAtacws/PNUlpO/KqHXkay1L+QyX6nY=
Date: Tue, 11 Jun 2019 20:13:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] cxl: no need to check return value of debugfs_create functions
Message-ID: <20190611181309.GA17098@kroah.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Because there's no need to check, also make the return value of the
local debugfs_create_io_x64() call void, as no one ever did anything
with the return value (as they did not need to.)

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/cxl/debugfs.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/cxl/debugfs.c b/drivers/misc/cxl/debugfs.c
index 1fda22c24c93..27f3bcb7d939 100644
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
@@ -64,8 +64,6 @@ int cxl_debugfs_adapter_add(struct cxl *adapter)
 
 	snprintf(buf, 32, "card%i", adapter->adapter_num);
 	dir = debugfs_create_dir(buf, cxl_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 	adapter->debugfs = dir;
 
 	debugfs_create_io_x64("err_ivte", S_IRUSR, dir, _cxl_p1_addr(adapter, CXL_PSL_ErrIVTE));
@@ -106,8 +104,6 @@ int cxl_debugfs_afu_add(struct cxl_afu *afu)
 
 	snprintf(buf, 32, "psl%i.%i", afu->adapter->adapter_num, afu->slice);
 	dir = debugfs_create_dir(buf, afu->adapter->debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 	afu->debugfs = dir;
 
 	debugfs_create_io_x64("sr",         S_IRUSR, dir, _cxl_p1n_addr(afu, CXL_PSL_SR_An));
@@ -129,15 +125,10 @@ void cxl_debugfs_afu_remove(struct cxl_afu *afu)
 
 int __init cxl_debugfs_init(void)
 {
-	struct dentry *ent;
-
 	if (!cpu_has_feature(CPU_FTR_HVMODE))
 		return 0;
 
-	ent = debugfs_create_dir("cxl", NULL);
-	if (IS_ERR(ent))
-		return PTR_ERR(ent);
-	cxl_debugfs = ent;
+	cxl_debugfs = debugfs_create_dir("cxl", NULL);
 
 	return 0;
 }
-- 
2.22.0


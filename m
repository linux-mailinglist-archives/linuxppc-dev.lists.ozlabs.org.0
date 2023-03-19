Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C348B6C0327
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 17:33:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pfk1t40PVz3fRb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 03:33:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.176; helo=mail-il1-f176.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pfk1H4Bnwz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 03:32:35 +1100 (AEDT)
Received: by mail-il1-f176.google.com with SMTP id j6so5400486ilr.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 09:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679243553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3Su79vC800Qm2PaYyCCtYDxrAxfT8Q3fr1e8LvCXCk=;
        b=m696nIt+0d/RUzhqZcFomQSgxjAaPto8lZDQ5p7xV1vDxbI/ZVDedNb/yWjUTodTE5
         K6TcuK7o/8d9XD22ags/wsV+Br2KQMAf2d8oAJq2y9//T41gcF/qXnDtX0C+Jf1FOp0f
         BS9a1Us+D7VmOCeph2exgpwpHZIapknugaO9Kq9OuhCfasf8AALS11+ZoI+WIZ7448WM
         bH2WRxrjCxjX0RJaPjZr/id3nNPRF+6X7NiMT6N0xl8Jou2LOEU20F95p5kIILI9oJl/
         5bayH3o4+BywP7ZCYaT5sfKatpQENYHdR58keDfg4emweJRp8DRorlr3YUbCMudV2ACX
         MIEw==
X-Gm-Message-State: AO0yUKV9cDfFbxK+KwTH+fDhPBKG22UxEnFEIkSeVn2PBncZAYxvJPu2
	HcqC7H1kPELVmatWk7O6GQ==
X-Google-Smtp-Source: AK7set9Ni1WAv7e3eQE+jB+wY63erDS3RCmdcDmJhsxK41IhPMI4pFWsEJ0U6uFOi8ykGJJqg0jAQg==
X-Received: by 2002:a92:db07:0:b0:315:365d:5358 with SMTP id b7-20020a92db07000000b00315365d5358mr3360747iln.10.1679243553071;
        Sun, 19 Mar 2023 09:32:33 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80c7:2689:137d:d795:47e4:3de1])
        by smtp.gmail.com with ESMTPSA id g13-20020a02270d000000b0040306bfd949sm2582678jaa.21.2023.03.19.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 09:32:32 -0700 (PDT)
Received: (nullmailer pid 226695 invoked by uid 1000);
	Sun, 19 Mar 2023 16:32:30 -0000
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] macintosh: Use of_address_to_resource()
Date: Sun, 19 Mar 2023 11:32:26 -0500
Message-Id: <20230319163226.226583-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace open coded reading of "reg" and of_translate_address() calls with
single call to of_address_to_resource().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/macintosh/via-cuda.c | 16 +++++-----------
 drivers/macintosh/via-pmu.c  | 23 ++++++++---------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index 5071289063f0..f8dd1e831530 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -235,8 +235,7 @@ int __init find_via_cuda(void)
 int __init find_via_cuda(void)
 {
     struct adb_request req;
-    phys_addr_t taddr;
-    const u32 *reg;
+    struct resource res;
     int err;
 
     if (vias)
@@ -245,17 +244,12 @@ int __init find_via_cuda(void)
     if (!vias)
 	return 0;
 
-    reg = of_get_property(vias, "reg", NULL);
-    if (reg == NULL) {
-	    printk(KERN_ERR "via-cuda: No \"reg\" property !\n");
-	    goto fail;
-    }
-    taddr = of_translate_address(vias, reg);
-    if (taddr == 0) {
-	    printk(KERN_ERR "via-cuda: Can't translate address !\n");
+    err = of_address_to_resource(vias, 0, &res);
+    if (err) {
+	    printk(KERN_ERR "via-cuda: Error getting \"reg\" property !\n");
 	    goto fail;
     }
-    via = ioremap(taddr, 0x2000);
+    via = ioremap(res.start, 0x2000);
     if (via == NULL) {
 	    printk(KERN_ERR "via-cuda: Can't map address !\n");
 	    goto fail;
diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index e0cb8daf4f08..9d5703b60937 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -286,8 +286,9 @@ static char *pbook_type[] = {
 int __init find_via_pmu(void)
 {
 #ifdef CONFIG_PPC_PMAC
+	int err;
 	u64 taddr;
-	const u32 *reg;
+	struct resource res;
 
 	if (pmu_state != uninitialized)
 		return 1;
@@ -295,16 +296,12 @@ int __init find_via_pmu(void)
 	if (vias == NULL)
 		return 0;
 
-	reg = of_get_property(vias, "reg", NULL);
-	if (reg == NULL) {
-		printk(KERN_ERR "via-pmu: No \"reg\" property !\n");
-		goto fail;
-	}
-	taddr = of_translate_address(vias, reg);
-	if (taddr == OF_BAD_ADDR) {
-		printk(KERN_ERR "via-pmu: Can't translate address !\n");
+	err = of_address_to_resource(vias, 0, &res);
+	if (err) {
+		printk(KERN_ERR "via-pmu: Error getting \"reg\" property !\n");
 		goto fail;
 	}
+	taddr = res.start;
 
 	pmu_has_adb = 1;
 
@@ -324,7 +321,6 @@ int __init find_via_pmu(void)
 		 || of_device_is_compatible(vias->parent, "K2-Keylargo")) {
 		struct device_node *gpiop;
 		struct device_node *adbp;
-		u64 gaddr = OF_BAD_ADDR;
 
 		pmu_kind = PMU_KEYLARGO_BASED;
 		adbp = of_find_node_by_type(NULL, "adb");
@@ -338,11 +334,8 @@ int __init find_via_pmu(void)
 		
 		gpiop = of_find_node_by_name(NULL, "gpio");
 		if (gpiop) {
-			reg = of_get_property(gpiop, "reg", NULL);
-			if (reg)
-				gaddr = of_translate_address(gpiop, reg);
-			if (gaddr != OF_BAD_ADDR)
-				gpio_reg = ioremap(gaddr, 0x10);
+			if (!of_address_to_resource(gpiop, 0, &res))
+				gpio_reg = ioremap(res.start, 0x10);
 			of_node_put(gpiop);
 		}
 		if (gpio_reg == NULL) {
-- 
2.39.2


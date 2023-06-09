Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F179A72A23A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8mN5YG6z3fCq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.174; helo=mail-il1-f174.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8lq3CGKz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:30:46 +1000 (AEST)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-33d31ab00bdso8738255ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 11:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335443; x=1688927443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQ2Jqgv8w/RCc71k1A2f5S/TBpvSA5M0P4GcW4ni11M=;
        b=d+YKU87v5ycWuGLv/1jGBk+Tnh0fMooyRIVpxuQ64TqCnNFLJpZJQ9NBbfCOWLbP09
         k38+mU9usCsnN00gPsO4hKOY0WdtTDucMxO98gTJgFl+cV4DYFZnBkWwydN8WA17PkuT
         pbTFy1Y/y8sZGaejlxcpe/ADFjtMang7lKrvPZxapaJYRftBb9w4EXIzf4wkWymzJPUY
         x8TKTASz5F6kzfok+i2uh+JJYNJh9ELTg3eqj+JmQiUxPapchAFih8TUAyf7Uvvt6KbJ
         7Sq+mL5eVsjJ1itzsUEGEkNW/BYha8vjp1xDxoLcFO0koMf2RBF7CTfQCl2dd6sLegly
         Xcgg==
X-Gm-Message-State: AC+VfDxkvXXG/ygqGaKPCk/hLrUrv9x59hueGxrrhXDXP51mreaS7hPc
	6fOI+3m4mB+h/BFKwMtL0w==
X-Google-Smtp-Source: ACHHUZ5roDs4+ptpSzNcbF5YA4f3450UuSKLGoLhoYWwoVmK9xKlyZ1RmmQCc/8f7eJATFTdgQSxIg==
X-Received: by 2002:a92:c989:0:b0:33e:6aa1:29cf with SMTP id y9-20020a92c989000000b0033e6aa129cfmr1946355iln.32.1686335442998;
        Fri, 09 Jun 2023 11:30:42 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l5-20020a92d8c5000000b00338a1272ce1sm1243481ilo.52.2023.06.09.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:30:42 -0700 (PDT)
Received: (nullmailer pid 1764888 invoked by uid 1000);
	Fri, 09 Jun 2023 18:30:41 -0000
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] macintosh: Use of_property_read_reg() to parse "reg"
Date: Fri,  9 Jun 2023 12:29:25 -0600
Message-Id: <20230609182926.1763589-1-robh@kernel.org>
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

Use the recently added of_property_read_reg() helper to get the
untranslated "reg" address value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/macintosh/smu.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index b495bfa77896..5183a00529f5 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -33,7 +33,8 @@
 #include <linux/delay.h>
 #include <linux/poll.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
@@ -470,7 +471,7 @@ EXPORT_SYMBOL(smu_present);
 int __init smu_init (void)
 {
 	struct device_node *np;
-	const u32 *data;
+	u64 data;
 	int ret = 0;
 
         np = of_find_node_by_type(NULL, "smu");
@@ -514,8 +515,7 @@ int __init smu_init (void)
 		ret = -ENXIO;
 		goto fail_bootmem;
 	}
-	data = of_get_property(smu->db_node, "reg", NULL);
-	if (data == NULL) {
+	if (of_property_read_reg(smu->db_node, 0, &data, NULL)) {
 		printk(KERN_ERR "SMU: Can't find doorbell GPIO address !\n");
 		ret = -ENXIO;
 		goto fail_db_node;
@@ -525,7 +525,7 @@ int __init smu_init (void)
 	 * and ack. GPIOs are at 0x50, best would be to find that out
 	 * in the device-tree though.
 	 */
-	smu->doorbell = *data;
+	smu->doorbell = data;
 	if (smu->doorbell < 0x50)
 		smu->doorbell += 0x50;
 
@@ -534,13 +534,12 @@ int __init smu_init (void)
 		smu->msg_node = of_find_node_by_name(NULL, "smu-interrupt");
 		if (smu->msg_node == NULL)
 			break;
-		data = of_get_property(smu->msg_node, "reg", NULL);
-		if (data == NULL) {
+		if (of_property_read_reg(smu->msg_node, 0, &data, NULL)) {
 			of_node_put(smu->msg_node);
 			smu->msg_node = NULL;
 			break;
 		}
-		smu->msg = *data;
+		smu->msg = data;
 		if (smu->msg < 0x50)
 			smu->msg += 0x50;
 	} while(0);
-- 
2.39.2


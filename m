Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB236CB1D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:32:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlncG3nM3z3fXW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:31:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.41; helo=mail-oa1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlnbD15HDz3cgT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 09:31:03 +1100 (AEDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17ec8963db8so10895541fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 15:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679956261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf8YALXMAY/oSxpeLp2A058qCfNVm9+JRcuQgM0hLFA=;
        b=VRa9n8yGaKgjgehDExn0IGStEdgyFcwjTfaCcc+RRsBseTtV7WCH1+r+W1PwwwuQTS
         9uA7PpeGNTaNJ1gHxNw5b7Dktve9TN64T3mGS+5jFCcIhZaScn3XLv4Nalw8Mx78Dhks
         yyuKdufi2mxFMhVjQ6nkIBsWkiZnP2F7omh2AUlYSHwaJPivU8Exrp1wl7VYimR9KMji
         LZXjyR7UKgZz1DA72m4vkgqsoqP/Fip7jbFEqzOUgx2++GR4m/F/S4uJmDbNA9YbScwz
         TtbHLBXiKE+QTXtB7Oo7Hw44Ja1WyHRtU6/6E9V9AJID4jFp/C/QdoqCo835OGT/Zgd4
         Ck1w==
X-Gm-Message-State: AAQBX9e2XjDb4KHSIPpxhCuQcQdNNlGg0pt+X/pPHrwH0dxteOEhRpCA
	2LRPuwocMdOoAnvKFnPLeg==
X-Google-Smtp-Source: AKy350bE5sjLYYl4fEl8g5vXHWB5v2Q4qReU1rrJUv820vOzN4tyWD5SBkSrRmB3RCxgQGKUg4B5MA==
X-Received: by 2002:a05:6870:c6a1:b0:17e:b9f6:5d76 with SMTP id cv33-20020a056870c6a100b0017eb9f65d76mr8451553oab.41.1679956261279;
        Mon, 27 Mar 2023 15:31:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v23-20020a056870709700b0017280f7d653sm10250250oae.35.2023.03.27.15.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:31:00 -0700 (PDT)
Received: (nullmailer pid 820175 invoked by uid 1000);
	Mon, 27 Mar 2023 22:30:59 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: xics: Use of_address_count()
Date: Mon, 27 Mar 2023 17:30:56 -0500
Message-Id: <20230327223056.820086-1-robh@kernel.org>
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

icp_native_init_one_node() only needs the number of entries in "reg".
Replace the open coded "reg" parsing with of_address_count() to get the
number of "reg" entries.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/sysdev/xics/icp-native.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/icp-native.c b/arch/powerpc/sysdev/xics/icp-native.c
index edc17b6b1cc2..f6ec6dba92dc 100644
--- a/arch/powerpc/sysdev/xics/icp-native.c
+++ b/arch/powerpc/sysdev/xics/icp-native.c
@@ -259,7 +259,7 @@ static int __init icp_native_init_one_node(struct device_node *np,
 	unsigned int ilen;
 	const __be32 *ireg;
 	int i;
-	int reg_tuple_size;
+	int num_reg;
 	int num_servers = 0;
 
 	/* This code does the theorically broken assumption that the interrupt
@@ -280,21 +280,14 @@ static int __init icp_native_init_one_node(struct device_node *np,
 			num_servers = of_read_number(ireg + 1, 1);
 	}
 
-	ireg = of_get_property(np, "reg", &ilen);
-	if (!ireg) {
-		pr_err("icp_native: Can't find interrupt reg property");
-		return -1;
-	}
-
-	reg_tuple_size = (of_n_addr_cells(np) + of_n_size_cells(np)) * 4;
-	if (((ilen % reg_tuple_size) != 0)
-	    || (num_servers && (num_servers != (ilen / reg_tuple_size)))) {
+	num_reg = of_address_count(np);
+	if (num_servers && (num_servers != num_reg)) {
 		pr_err("icp_native: ICP reg len (%d) != num servers (%d)",
-		       ilen / reg_tuple_size, num_servers);
+		       num_reg, num_servers);
 		return -1;
 	}
 
-	for (i = 0; i < (ilen / reg_tuple_size); i++) {
+	for (i = 0; i < num_reg; i++) {
 		struct resource r;
 		int err;
 
-- 
2.39.2


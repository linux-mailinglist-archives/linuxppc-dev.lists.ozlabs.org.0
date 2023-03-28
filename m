Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A05F36CCB62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmLbq4Dv2z3fp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.174; helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmLYH0SG8z3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 07:16:18 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id bm2so9952655oib.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 13:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpsM8Gyt+E2oU3DAGA2Cy9raNlOEiWzk+fnJGTbZemI=;
        b=Ptx0xEDwa3XYxM7/LtL0NF8XFTlCyMbT8VykkbOTs/QTvTkTy9ONb68FCn1my4Xchc
         SfTb7FiSXcYeh1l2YpQzSzzEkZLqNQ14k2KDKSIf0Eg5xChdKrRBUoXY/uo5wmCMqHPs
         WNDzSr42jcia8hTti8XUIAL1wjcl6XICExuC8xgqQC4lEuXxzJBPSjGyike3RmGIW8TN
         +Lf2XexdD7HBsUGIMIoe6mF7avax+k5kckHykI94v3UYpTBYWZb+G1xGmZp7gWbKYIZO
         EOvcQem7JcVaWyC9wdzsKYQYMSJ9z7cm1SlCmCc0LObMAoVQcp3pJhRSy2K8LTqxgBgj
         qWaA==
X-Gm-Message-State: AO0yUKVtnBLnwIrHVrDsZ4Qw7deSuMrbPKkOmq8DwAONA6wHqSdBZD3x
	qth+LpyKaObzO8NdAtiD1g==
X-Google-Smtp-Source: AK7set9zxFcHUmej6FZI0b/r9kzi7HNM/sTT+QF7paaDfTXpKf0/Bz0qzrUkdUNA414JIRwtcEX/5g==
X-Received: by 2002:a05:6808:de6:b0:387:1a46:8317 with SMTP id g38-20020a0568080de600b003871a468317mr7680846oic.13.1680034576781;
        Tue, 28 Mar 2023 13:16:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v7-20020a4aaec7000000b00529cc3986c8sm2696062oon.40.2023.03.28.13.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:16:16 -0700 (PDT)
Received: (nullmailer pid 3993710 invoked by uid 1000);
	Tue, 28 Mar 2023 20:16:10 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Mar 2023 15:15:56 -0500
Subject: [PATCH 1/5] of: unittest: Add bus address range parsing tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-dt-address-helpers-v1-1-e2456c3e77ab@kernel.org>
References: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
In-Reply-To: <20230328-dt-address-helpers-v1-0-e2456c3e77ab@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While there are tests for "dma-ranges" helpers, "ranges" is missing any
tests. It's the same underlying code, but for completeness add a test
for "ranges" parsing iterators. This is in preparation to add some
additional "ranges" helpers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/unittest.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index b5a7a31d8bd2..1a45df1f354a 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1008,6 +1008,58 @@ static void __init of_unittest_pci_dma_ranges(void)
 	of_node_put(np);
 }
 
+static void __init of_unittest_bus_ranges(void)
+{
+	struct device_node *np;
+	struct of_range range;
+	struct of_range_parser parser;
+	int i = 0;
+
+	np = of_find_node_by_path("/testcase-data/address-tests");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	if (of_range_parser_init(&parser, np)) {
+		pr_err("missing ranges property\n");
+		return;
+	}
+
+	/*
+	 * Get the "ranges" from the device tree
+	 */
+	for_each_of_range(&parser, &range) {
+		unittest(range.flags == IORESOURCE_MEM,
+			"for_each_of_range wrong flags on node %pOF flags=%x (expected %x)\n",
+			np, range.flags, IORESOURCE_MEM);
+		if (!i) {
+			unittest(range.size == 0x40000000,
+				 "for_each_of_range wrong size on node %pOF size=%llx\n",
+				 np, range.size);
+			unittest(range.cpu_addr == 0x70000000,
+				 "for_each_of_range wrong CPU addr (%llx) on node %pOF",
+				 range.cpu_addr, np);
+			unittest(range.bus_addr == 0x70000000,
+				 "for_each_of_range wrong bus addr (%llx) on node %pOF",
+				 range.pci_addr, np);
+		} else {
+			unittest(range.size == 0x20000000,
+				 "for_each_of_range wrong size on node %pOF size=%llx\n",
+				 np, range.size);
+			unittest(range.cpu_addr == 0xd0000000,
+				 "for_each_of_range wrong CPU addr (%llx) on node %pOF",
+				 range.cpu_addr, np);
+			unittest(range.bus_addr == 0x00000000,
+				 "for_each_of_range wrong bus addr (%llx) on node %pOF",
+				 range.pci_addr, np);
+		}
+		i++;
+	}
+
+	of_node_put(np);
+}
+
 static void __init of_unittest_parse_interrupts(void)
 {
 	struct device_node *np;
@@ -3644,6 +3696,7 @@ static int __init of_unittest(void)
 	of_unittest_dma_get_max_cpu_address();
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();
+	of_unittest_bus_ranges();
 	of_unittest_match_node();
 	of_unittest_platform_populate();
 	of_unittest_overlay();

-- 
2.39.2


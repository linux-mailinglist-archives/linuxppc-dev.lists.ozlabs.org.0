Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022696CCB4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:16:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmLYn5V5rz3fWK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:16:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.50; helo=mail-oo1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmLYF48b1z3cLT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 07:16:16 +1100 (AEDT)
Received: by mail-oo1-f50.google.com with SMTP id l7-20020a4abe07000000b0053e1205c84bso1725733oop.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 13:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680034574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wq9MleJbVtyTb3QrV3Xlq0I3I3gqQWPoavFTMvWxBWU=;
        b=NGWlRR8WG7ZgrU81D+/m5BTtO5Ahw23MVCvV3PyVucJ29760Jle9NV8FB/WCnBfJjj
         gyj4j5hUeD/3mHbG0uU8z1u4d1kzsxj2agEMQqfhSKQWyXCtqJ6QerOWfKkdSEjJXgxp
         sxorX9GnPlkqJBH1CJ9VR2Z6m8lPKPsiIKt0P7yjYi3rqobm4DkgYJnVusGTQcyJ4geg
         WZWMwNQ2zDzE9FDnqfaJlzMOfHRqWc001M3I2NJ31ZtVPf7F/18Z7pJQ44JDCqAh2ujx
         UF+7jul7tgF4XAJ6iHk4rvKE9EFdPop4qW12JYhZ8njYuJMHMdt/LHtbKxPmw8tc1DIl
         23Dw==
X-Gm-Message-State: AO0yUKXDFDqWf3QViHGv8FLDt8oNgvvLQ1aVyp5RDAwk3/9ei27g2ybT
	OxSFc8r6ulww5l7aZ6JGlQ==
X-Google-Smtp-Source: AK7set9De6XnycHJIQgLEMSB8BvrDZtnx3/knyjsjlWaCorjvDtfznD+X/H4ZPT08mbWWvY4Eor3wg==
X-Received: by 2002:a4a:4f83:0:b0:53b:4b94:45bf with SMTP id c125-20020a4a4f83000000b0053b4b9445bfmr8745156oob.3.1680034574395;
        Tue, 28 Mar 2023 13:16:14 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c192-20020a4a4fc9000000b0053b88b03e24sm7136185oob.18.2023.03.28.13.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 13:16:13 -0700 (PDT)
Received: (nullmailer pid 3993734 invoked by uid 1000);
	Tue, 28 Mar 2023 20:16:10 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Mar 2023 15:15:59 -0500
Subject: [PATCH 4/5] of/address: Add of_range_count() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-dt-address-helpers-v1-4-e2456c3e77ab@kernel.org>
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

Some users need a count of the number of ranges entries before
iterating over the entries. Typically this is for allocating some data
structure based on the size. Add a helper, of_range_count(), to get the
count. The helper must be called with an struct of_range_parser
initialized by of_range_parser_init().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/unittest.c      |  7 ++++++-
 include/linux/of_address.h | 16 ++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 29066ecbed47..eaeb58065acc 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1014,7 +1014,7 @@ static void __init of_unittest_bus_ranges(void)
 	struct of_range range;
 	struct of_range_parser parser;
 	struct resource res;
-	int ret, i = 0;
+	int ret, count, i = 0;
 
 	np = of_find_node_by_path("/testcase-data/address-tests");
 	if (!np) {
@@ -1040,6 +1040,11 @@ static void __init of_unittest_bus_ranges(void)
 		"of_range_to_resource wrong resource start address on node %pOF res=%pR\n",
 		np, &res);
 
+	count = of_range_count(&parser);
+	unittest(count == 2,
+		"of_range_count wrong size on node %pOF count=%d\n",
+		np, count);
+
 	/*
 	 * Get the "ranges" from the device tree
 	 */
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 1d005439f026..5292f62c1baa 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -35,6 +35,22 @@ struct of_pci_range {
 	for (; of_pci_range_parser_one(parser, range);)
 #define for_each_of_range for_each_of_pci_range
 
+/*
+ * of_range_count - Get the number of "ranges" or "dma-ranges" entries
+ * @parser:	Parser state initialized by of_range_parser_init()
+ *
+ * Returns the number of entries or 0 if none.
+ *
+ * Note that calling this within or after the for_each_of_range() iterator will
+ * be inaccurate giving the number of entries remaining.
+ */
+static inline int of_range_count(const struct of_range_parser *parser)
+{
+	if (!parser || !parser->node || !parser->range || parser->range == parser->end)
+		return 0;
+	return (parser->end - parser->range) / (parser->na + parser->pna + parser->ns);
+}
+
 /* Translate a DMA address from device space to CPU space */
 extern u64 of_translate_dma_address(struct device_node *dev,
 				    const __be32 *in_addr);

-- 
2.39.2


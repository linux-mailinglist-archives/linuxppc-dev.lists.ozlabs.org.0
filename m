Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42E72A252
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8pS5lRwz3ffK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.182; helo=mail-il1-f182.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8p00tQWz3dyc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:32:39 +1000 (AEST)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33d22754450so9081655ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 11:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335558; x=1688927558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zg65H04iGkdu9WHQxXNVtHvgC9Kx1HBt9MiQibRABa0=;
        b=DIiqDf3dF8ot3AvREm1HwioLURWBvYodPFVTJsceQNaddGO3rmzt1va7a3DEBKaJGm
         zPyksRkWOU3jlauNY3FwAgUxPF09KP3qNq6KhZvsV8iY0eHRqrvh34YpiN7Vr854OEPQ
         M1XbjQ0P/qgl5N5mlnMeL3KYLsc3abQ9ySywpvCO1rYCWE6vzSGscT27dKGFv7wkOX+d
         IsfMOyzTgXxu//bcLRafWU85kG6O5sbNN5aei6t97jIoq3oqo2a3utWQ+dnQbA3VA+cF
         mQxhITjhcNeUOlwjDXakJu9U3JOr84O6aZSu4n2EbMHOKKlj9VlATPXoulh96hRFZPcv
         CTIw==
X-Gm-Message-State: AC+VfDwhayrR+DecoLe1D82sna+uRCG5U1AnmjxBH9FjQ/MO0/OJSzkT
	thb9FO78YrE0vd5/4aZRmQ==
X-Google-Smtp-Source: ACHHUZ5kDT3yQU8Qmg/+XcR/h6SF54Crybnbfhrn4VLslc18TBNNRrE0/68Gu6Mp/XjU8TeFesPn6Q==
X-Received: by 2002:a92:d9c5:0:b0:33a:b6ca:c4d3 with SMTP id n5-20020a92d9c5000000b0033ab6cac4d3mr2237604ilq.12.1686335557918;
        Fri, 09 Jun 2023 11:32:37 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id t17-20020a92cc51000000b00325e4c39de8sm1203739ilq.66.2023.06.09.11.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:32:37 -0700 (PDT)
Received: (nullmailer pid 1767148 invoked by uid 1000);
	Fri, 09 Jun 2023 18:32:35 -0000
From: Rob Herring <robh@kernel.org>
To: Anatolij Gustschin <agust@denx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: mpc512x: Remove open coded "ranges" parsing
Date: Fri,  9 Jun 2023 12:32:32 -0600
Message-Id: <20230609183232.1767050-1-robh@kernel.org>
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

"ranges" is a standard property, and we have common helper functions
for parsing it, so let's use the for_each_of_range() iterator.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 46 ++++++-------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 04bf6ecf7d55..1bfb29574caa 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -373,50 +373,32 @@ static int get_cs_ranges(struct device *dev)
 {
 	int ret = -ENODEV;
 	struct device_node *lb_node;
-	const u32 *addr_cells_p;
-	const u32 *size_cells_p;
-	int proplen;
-	size_t i;
+	size_t i = 0;
+	struct of_range_parser parser;
+	struct of_range range;
 
 	lb_node = of_find_compatible_node(NULL, NULL, "fsl,mpc5121-localbus");
 	if (!lb_node)
 		return ret;
 
-	/*
-	 * The node defined as compatible with 'fsl,mpc5121-localbus'
-	 * should have two address cells and one size cell.
-	 * Every item of its ranges property should consist of:
-	 * - the first address cell which is the chipselect number;
-	 * - the second address cell which is the offset in the chipselect,
-	 *    must be zero.
-	 * - CPU address of the beginning of an access window;
-	 * - the only size cell which is the size of an access window.
-	 */
-	addr_cells_p = of_get_property(lb_node, "#address-cells", NULL);
-	size_cells_p = of_get_property(lb_node, "#size-cells", NULL);
-	if (addr_cells_p == NULL || *addr_cells_p != 2 ||
-				size_cells_p == NULL ||	*size_cells_p != 1) {
-		goto end;
-	}
-
-	proplen = of_property_count_u32_elems(lb_node, "ranges");
-	if (proplen <= 0 || proplen % 4 != 0)
-		goto end;
+	of_range_parser_init(&parser, lb_node);
+	lpbfifo.cs_n = of_range_count(&parser);
 
-	lpbfifo.cs_n = proplen / 4;
 	lpbfifo.cs_ranges = devm_kcalloc(dev, lpbfifo.cs_n,
 					sizeof(struct cs_range), GFP_KERNEL);
 	if (!lpbfifo.cs_ranges)
 		goto end;
 
-	if (of_property_read_u32_array(lb_node, "ranges",
-				(u32 *)lpbfifo.cs_ranges, proplen) != 0) {
-		goto end;
-	}
-
-	for (i = 0; i < lpbfifo.cs_n; i++) {
-		if (lpbfifo.cs_ranges[i].base != 0)
+	for_each_of_range(&parser, &range) {
+		u32 base = lower_32_bits(range.bus_addr);
+		if (base)
 			goto end;
+
+		lpbfifo.cs_ranges[i].csnum = upper_32_bits(range.bus_addr);
+		lpbfifo.cs_ranges[i].base = base;
+		lpbfifo.cs_ranges[i].addr = range.cpu_addr;
+		lpbfifo.cs_ranges[i].size = range.size;
+		i++;
 	}
 
 	ret = 0;
-- 
2.39.2


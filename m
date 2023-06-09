Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73572A255
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:33:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8pz3Fh3z3flq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:33:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.48; helo=mail-io1-f48.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8p56J9nz3fhH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:32:45 +1000 (AEST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-77acb944bdfso92225139f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 11:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335563; x=1688927563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnZjmUhUHC5WzRiQVce8eotoya7iaXZahSL1XR1JRyA=;
        b=DMIGNo4IEPSXRMv6JRzQ6lYpxatC9KtZWmelBWLIcc4qiFUOcqM8xif00NNvpqsto1
         AhIOFrIGFIYiQB/wLLj36LtXWom+9zIjwx1D9FuOuP2v5q3F9btENnP5UQyv/SlbbHBw
         9yW+xJpqH8ggWdg3LQ8TWneoyqX31wxslJANSzg4l424cLYslaHTO/8j+Q9Ezv5FkvTX
         xdWJMTs8qK+Bp8VgYzCgomB0DHcbxgL1QjdSoEfJtnFW0EPAN4ZCuUTEs9mm8lcvQpmK
         yR0aJw1tHPV5Ngs+C6rfl0OUJLQJq2GqgNAhRNQIDIjEguE/J7/VTKokIjP8Qz/fJmtD
         hVMQ==
X-Gm-Message-State: AC+VfDwA1J49gNx7kY9HNGRILQRI9zL0MJZPgoCrDi8uY88hOw64FkS3
	tk3g0EL/DbCwjSxGut3/WA==
X-Google-Smtp-Source: ACHHUZ7E+AJAkw1qTBSn1r7TWOknh6JTmYsfRB0r/52+w0ltiXbOtHquEX8LzWfF8UsWHnr8J+ghwQ==
X-Received: by 2002:a5d:9d1a:0:b0:776:bfbe:a72b with SMTP id j26-20020a5d9d1a000000b00776bfbea72bmr2493921ioj.14.1686335563510;
        Fri, 09 Jun 2023 11:32:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id i19-20020a02cc53000000b0041408b79f1esm1096848jaq.111.2023.06.09.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:32:42 -0700 (PDT)
Received: (nullmailer pid 1767271 invoked by uid 1000);
	Fri, 09 Jun 2023 18:32:41 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: fsl_soc: Use of_range_to_resource() for "ranges" parsing
Date: Fri,  9 Jun 2023 12:32:38 -0600
Message-Id: <20230609183238.1767186-1-robh@kernel.org>
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

"ranges" is a standard property with common parsing functions. Users
shouldn't be implementing their own parsing of it. Refactor the FSL RapidIO
"ranges" parsing to use of_range_to_resource() instead.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/sysdev/fsl_soc.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_soc.c b/arch/powerpc/sysdev/fsl_soc.c
index 6ebbbca41065..68709743450e 100644
--- a/arch/powerpc/sysdev/fsl_soc.c
+++ b/arch/powerpc/sysdev/fsl_soc.c
@@ -51,18 +51,10 @@ phys_addr_t get_immrbase(void)
 
 	soc = of_find_node_by_type(NULL, "soc");
 	if (soc) {
-		int size;
-		u32 naddr;
-		const __be32 *prop = of_get_property(soc, "#address-cells", &size);
-
-		if (prop && size == 4)
-			naddr = be32_to_cpup(prop);
-		else
-			naddr = 2;
-
-		prop = of_get_property(soc, "ranges", &size);
-		if (prop)
-			immrbase = of_translate_address(soc, prop + naddr);
+		struct resource res;
+
+		if (!of_range_to_resource(soc, 0, &res))
+			immrbase = res.start;
 
 		of_node_put(soc);
 	}
-- 
2.39.2


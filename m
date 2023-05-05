Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620E6F876F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 19:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCcs22Dqlz3fN5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 03:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCcrT6kQMz3cM6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 03:20:08 +1000 (AEST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6a604259983so1545546a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 10:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683307203; x=1685899203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Qa9OZAQgfgrF0AORp9COWiiNHbXv3g/2zjtQ3FLsEs=;
        b=il5xeR0yAi27cF91KtrDdZVUQhzlbCtdQm6uOKJFo6pNPrzcnwwE0pJ69SIsGGGBzp
         F9mWWWPebbTMeCIgICCY8uq/4YrAeuHJED5aQTYQhOvzDK5o61cxFRyJ2hhEo+YKQlOC
         CTs07m4L5z/Eqs7ECDpy+jM3srIic9v3n+mW3UKuFdxuH52g3p+6NYbMW3zTKWSmcc+J
         X8syB2DKJ1q933k+HgnQt93nnaCLxfl3c8ZZra9E8TTNx8Z0oRaVtpURT2lfGnKZhxJ1
         uZEWpYJtj8kmwg0HuGMIXSxQJoqXxU/EMUZrkvMjZ1rx19v/srT4oyVP5HVWWPXLPlWN
         6Pkw==
X-Gm-Message-State: AC+VfDxFcs7H9m0H1dOGUSgX1HpG0Phq72u6qjSNMaiNfGt/MUcPo8yp
	z1gkvAHf6h8KEIJXNXcNpQ==
X-Google-Smtp-Source: ACHHUZ5pvS/Z3eL7BWB4DTJuNRmLTdwPq58YMXwTrxcSm1Eyh05yc4HP4ULsyM94dkn9IPv5BmWjag==
X-Received: by 2002:a05:6808:5d9:b0:390:7f21:5dd6 with SMTP id d25-20020a05680805d900b003907f215dd6mr898107oij.32.1683307203565;
        Fri, 05 May 2023 10:20:03 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b5-20020aca2205000000b0038c06ae307asm2904706oic.52.2023.05.05.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 10:20:02 -0700 (PDT)
Received: (nullmailer pid 3178151 invoked by uid 1000);
	Fri, 05 May 2023 17:20:02 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: isa-bridge: Fix ISA mmapping when "ranges" is not present
Date: Fri,  5 May 2023 12:18:17 -0500
Message-Id: <20230505171816.3175865-1-robh@kernel.org>
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e4ab08be5b49 ("powerpc/isa-bridge: Remove open coded "ranges"
parsing") broke PASemi Nemo board booting. The issue is the ISA I/O
range was not getting mapped as the logic to handle no "ranges" was
inverted. If phb_io_base_phys is non-zero, then the ISA range defaults
to the first 64K of the PCI I/O space. phb_io_base_phys should only be 0
when looking for a non-PCI ISA region.

Fixes: e4ab08be5b49 ("powerpc/isa-bridge: Remove open coded "ranges" parsing")
Link: https://lore.kernel.org/all/301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de/
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Untested, but I think this should fix the issue.

 arch/powerpc/kernel/isa-bridge.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-bridge.c
index 85bdd7d3652f..48e0eaf1ad61 100644
--- a/arch/powerpc/kernel/isa-bridge.c
+++ b/arch/powerpc/kernel/isa-bridge.c
@@ -93,11 +93,12 @@ static int process_ISA_OF_ranges(struct device_node *isa_node,
 	}
 
 inval_range:
-	if (!phb_io_base_phys) {
+	if (phb_io_base_phys) {
 		pr_err("no ISA IO ranges or unexpected isa range, mapping 64k\n");
 		remap_isa_base(phb_io_base_phys, 0x10000);
+		return 0;
 	}
-	return 0;
+	return -EINVAL;
 }
 
 
-- 
2.39.2


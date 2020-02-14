Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4F15F9F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:48:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7pV1p3ZzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:48:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hK36qfzDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:29 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id p8so10649887oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ST+PLmiGkSAozwHs99VdZ/cPWTCicua8kJ4SQHCu/G0=;
 b=I8F3T4uJP3bG8vyKUSXJtECRiLdTvwproSe6C0+RumuYJmrSG0SE9QH0pDkdEcMIdY
 CshE8x4TEaELBHYUZBc76ruHEFO4MwteMen6NR9+4kInaLuajmKWsnZEp4AkXWctFUCY
 wTvhnORc2I7fh0mIjwJat+dDKiN1sAEOgVZLExTQUtPEDJX5M5q5Mj2hEUDIorrWikqO
 /2aGYFxMrAWhcA9anSk5pIN3WzUAhDRgfhDh81d2YesSiHcsk6FE9Ra1pnqv76d9psR8
 6sB41CW7uGuRzajTUD5P7EJoIhHnT9mLO/FFMCoRlXLr8e/cBTscOwbJfEhrH+BvIQWR
 FKiw==
X-Gm-Message-State: APjAAAVZMH0EbIT6zKNAkhTSu1qfTbvWbl1FnOjPpg6t5kAO5lAg7tI4
 Fwt4e0pfFiMiLrqgsDAwng==
X-Google-Smtp-Source: APXvYqxxmXzYV2nzTRMz/xGJINwf9DGQxAgo8jid+3mqivFaYg1qMgHG0Ks4Cmkv5nA82os7cvfM0Q==
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr4296352otq.17.1581720206590; 
 Fri, 14 Feb 2020 14:43:26 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:26 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 2/7] microblaze: Drop using struct of_pci_range.pci_space field
Date: Fri, 14 Feb 2020 16:43:17 -0600
Message-Id: <20200214224322.20030-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214224322.20030-1-robh@kernel.org>
References: <20200214224322.20030-1-robh@kernel.org>
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
Cc: Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's use the struct of_pci_range.flags field instead so we can remove
the pci_space field.

Just drop the debug prints as there's plenty of debug output in
drivers/of/address.c which can be enabled.

Cc: Michal Simek <monstr@monstr.eu>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/microblaze/pci/pci-common.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/microblaze/pci/pci-common.c b/arch/microblaze/pci/pci-common.c
index 58cc4965bd3e..60a58c0015f2 100644
--- a/arch/microblaze/pci/pci-common.c
+++ b/arch/microblaze/pci/pci-common.c
@@ -433,10 +433,6 @@ void pci_process_bridge_OF_ranges(struct pci_controller *hose,
 	pr_debug("Parsing ranges property...\n");
 	for_each_of_pci_range(&parser, &range) {
 		/* Read next ranges element */
-		pr_debug("pci_space: 0x%08x pci_addr:0x%016llx ",
-				range.pci_space, range.pci_addr);
-		pr_debug("cpu_addr:0x%016llx size:0x%016llx\n",
-					range.cpu_addr, range.size);
 
 		/* If we failed translation or got a zero-sized region
 		 * (some FW try to feed us with non sensical zero sized regions
@@ -486,7 +482,7 @@ void pci_process_bridge_OF_ranges(struct pci_controller *hose,
 			pr_info(" MEM 0x%016llx..0x%016llx -> 0x%016llx %s\n",
 				range.cpu_addr, range.cpu_addr + range.size - 1,
 				range.pci_addr,
-				(range.pci_space & 0x40000000) ?
+				(range.flags & IORESOURCE_PREFETCH) ?
 				"Prefetch" : "");
 
 			/* We support only 3 memory ranges */
@@ -1121,4 +1117,3 @@ int early_find_capability(struct pci_controller *hose, int bus, int devfn,
 {
 	return pci_bus_find_capability(fake_pci_bus(hose, bus), devfn, cap);
 }
-
-- 
2.20.1


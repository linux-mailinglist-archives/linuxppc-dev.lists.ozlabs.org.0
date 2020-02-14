Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C615F9F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:50:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7rm023czDqlw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:50:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hK5FFPzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:29 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id r27so10662250otc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJLT9fE31WzVusqA3+ydaNjT/O63JNBeN6ZDzqnRwwg=;
 b=eNC8y2eKo4NLiZPM6+JjSBiWH7h65vJwZggpBb3Z6jKWwYuhB/urwNmsuvLrQx20UJ
 OcQhrbO8B91FIcPVSRJSvQ2KwPDCmbhvtQIH2Y5ga1PJRz4u9TdQLIixQ5Y1qcAXcXOO
 Dwsjnvz6wwqbIJsvomWuUdOpnCA82+Q0EIIq6RtLZ1cf5hNOSKgbmT/fR3GPcsyiDAZJ
 qRkfi1gkvvxRhukjtDmNLaY/YVvrg5uBLUIr/uO/fCiANwhZyj4Sb7W6oNPygi16+77k
 r+utlja3M3QvpM+Y7dKMJDHNxRYGY3/cehl2Py7h4v0HasSK/ordyy8pywOEGNHd8p2b
 tmLg==
X-Gm-Message-State: APjAAAXfBLhg6mIsDPeQbqjtDYut0uEUBW6g12Eicm0FRkkPk/FDWS9N
 V6YE/7K56NhhDSDGrj5UEg==
X-Google-Smtp-Source: APXvYqx0xFv4NMz1FqL6vpJxFMFKpg/WkEi3ohp0ZGVbhLQlrLVUpFTQ58w87DSciAPwtsQOj7dTEg==
X-Received: by 2002:a9d:4e93:: with SMTP id v19mr2073700otk.200.1581720207829; 
 Fri, 14 Feb 2020 14:43:27 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:27 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 3/7] powerpc: Drop using struct of_pci_range.pci_space field
Date: Fri, 14 Feb 2020 16:43:18 -0600
Message-Id: <20200214224322.20030-4-robh@kernel.org>
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

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/pci-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index c6c03416a151..d0074ad73aa3 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -728,7 +728,7 @@ void pci_process_bridge_OF_ranges(struct pci_controller *hose,
 			       " MEM 0x%016llx..0x%016llx -> 0x%016llx %s\n",
 			       range.cpu_addr, range.cpu_addr + range.size - 1,
 			       range.pci_addr,
-			       (range.pci_space & 0x40000000) ?
+			       (range.flags & IORESOURCE_PREFETCH) ?
 			       "Prefetch" : "");
 
 			/* We support only 3 memory ranges */
-- 
2.20.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489A3AD76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 05:12:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MdTx6zyZzDqFL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 13:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ljBi6YQb"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MdS95FQrzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 13:10:46 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id q15so2034979pgr.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFf+BWwgDQzxh9xKs5KKe72Ok5a/FLymMOijmQfiw+Q=;
 b=ljBi6YQbsCgxfJPtAU+gmvbuo62Lej6tlB24X/LIBeVlTLVKbvL2Ii+b8XlvZ1OZFq
 e/oiI+8EInnfeO/yX93j9DVi49UdULGfvbl9RFr146uyQ/00R82AU87rtzjzxeyY1YVw
 7OGnBbQgxY0scbY4L2SifTM+3POOtgu+d62D+JW1idiXCHPtzK0E7fzSKwv3Q9HtjkRy
 BkvDYibtR0AhWBAYiEQu+tdu0fdTxnqPZP64LndtdeF/N22Lps+Hc/0qoqWGAOz2BXbX
 SBAouUdpVFOGKmQBVJDhgPTjdIum9QdGKGNDMUWiQmlNad1L31+Pn8wBPrCW5V8+LpBj
 k9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFf+BWwgDQzxh9xKs5KKe72Ok5a/FLymMOijmQfiw+Q=;
 b=OlFw2UI+7DJSIXb/iC8iMQR4aEgXhqkz8XtfoHPNpm0CZbgQecaVfcfsSVao5bwqLb
 WFuz1VHAqI75zhwjPWgmR+1EMkEybOIK6q0626DU+bCOeF9OsY7DjIktU47FOSnFL24U
 m9IprDaJSm+TlM2UeIZsNnsndywHOPFeiGcYcCuzl/p9IZ8WG78wQ2qYOLEXjYvc/nlt
 zRWuF6vug/f2u4CU1U1xV0akTpGwmTu5gkznLxNhvFwwPcc0LMOh7nKHqk1YVj6fkU/H
 tLyP3hXZCTASS/0dQOsRbE/VJyfB/BHL1MowfJrAdROnuJDVJTrXcT8jYZrhXxPJd5Br
 26TA==
X-Gm-Message-State: APjAAAV4x30TgvBGBxZEjaof8D7wAtbjnSwVTdnOI0DBK1F2qlpYanoV
 Inb42gNZQXkGdZmVM56Nsca78dLw
X-Google-Smtp-Source: APXvYqwRTmGKDuDCS3A/mg/3WL72EtKvJUNBw8xjltT0FRvxSs+lKpn4WPRfrvfPcfwxsXda0+nvKg==
X-Received: by 2002:a63:6f0b:: with SMTP id k11mr13723373pgc.342.1560136243243; 
 Sun, 09 Jun 2019 20:10:43 -0700 (PDT)
Received: from bobo.local0.net (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id w1sm11118865pfg.51.2019.06.09.20.10.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 20:10:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64: __ioremap_at clean up in the error case
Date: Mon, 10 Jun 2019 13:08:16 +1000
Message-Id: <20190610030818.17965-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__ioremap_at error handling is wonky, it requires caller to clean up
after it. Implement a helper that does the map and error cleanup and
remove the requirement from the caller.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

This series is a different approach to the problem, using the generic
ioremap_page_range directly which reduces added code, and moves
the radix specific code into radix files. Thanks to Christophe for
pointing out various problems with the previous patch.

 arch/powerpc/mm/pgtable_64.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index d2d976ff8a0e..6bd3660388aa 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -108,14 +108,30 @@ unsigned long ioremap_bot;
 unsigned long ioremap_bot = IOREMAP_BASE;
 #endif
 
+static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
+{
+	unsigned long i;
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		int err = map_kernel_page(ea + i, pa + i, prot);
+		if (err) {
+			if (slab_is_available())
+				unmap_kernel_range(ea, size);
+			else
+				WARN_ON_ONCE(1); /* Should clean up */
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * __ioremap_at - Low level function to establish the page tables
  *                for an IO mapping
  */
 void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
 {
-	unsigned long i;
-
 	/* We don't support the 4K PFN hack with ioremap */
 	if (pgprot_val(prot) & H_PAGE_4K_PFN)
 		return NULL;
@@ -129,9 +145,8 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
 	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
 	WARN_ON(size & ~PAGE_MASK);
 
-	for (i = 0; i < size; i += PAGE_SIZE)
-		if (map_kernel_page((unsigned long)ea + i, pa + i, prot))
-			return NULL;
+	if (ioremap_range((unsigned long)ea, pa, size, prot, NUMA_NO_NODE))
+		return NULL;
 
 	return (void __iomem *)ea;
 }
@@ -182,8 +197,6 @@ void __iomem * __ioremap_caller(phys_addr_t addr, unsigned long size,
 
 		area->phys_addr = paligned;
 		ret = __ioremap_at(paligned, area->addr, size, prot);
-		if (!ret)
-			vunmap(area->addr);
 	} else {
 		ret = __ioremap_at(paligned, (void *)ioremap_bot, size, prot);
 		if (ret)
-- 
2.20.1


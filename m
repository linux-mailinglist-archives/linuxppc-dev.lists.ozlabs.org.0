Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4397A2DE508
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:42:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBQq4L24zDqc7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:42:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBGw5TGLzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:19 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5G1V-1k7L7Y3etB-0116tK; Fri, 18 Dec 2020 15:31:50 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/23] arch: ia64: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:04 +0100
Message-Id: <20201218143122.19459-6-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:qnMCRRlYz3iyZZIxed2PdpOh9lZoshxB8GShF8Dv5f884PMzhlA
 rgGET+r1LOZnPvEOElYtWvVtMeqma1PT6MAm+LyDreI+nOr4o8KfnR1Sfy8JSaEoh/faF3N
 mrLr75Iv7ypE9eo+ty0Tfs5nujHLVGldONLbTa7Q1Q55yE3p4fTjay0i5z65zYWsxWyrY8j
 wdxS9QtIcELSO8KinnzKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hEIvj0u6eNU=:Fotl5KfVQ9DkUfRBzyG236
 z/v5oxv76HGlDvlwKxUPTZ+J/aiWp+XWF/kaGHdjv+IJqG/iu5JTRILDf5Pp0Pe6m9rrmBgTa
 BPn3060l3hEUj0pTfRb4kiaMAWT36TdQ0WLNOR0ZvhV5jSOO2SuKAuO/9yDCHul1P56WocZYQ
 m6ozUElHwYzMrzcxMhmoQuIiNyMlmYjhOh3JpzTxU0C1lYVRoaYbJUB3y8SQ1D82iuBockN+X
 rZRUjOoIzpyBbSrmqY8qUbR75erprCtatSW2DOY8E+1PAHqBJLrkVo4+/8p33VW41Yz1GwNGK
 iO4xjTuivZQWUc700sPaIwQbgYC9G9nXOOEowcnoPyrv3Xko+pWDDZ2KXSvjx9QKu46KRvRfZ
 7FnsAYtylPkalUN295WkJKOHMC4I5hj63PTgpeme12O4Qn6Yb/gw3f/VhkYyT
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com,
 linus.walleij@linaro.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org,
 gerg@linux-m68k.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp, jolsa@redhat.com,
 deller@gmx.de, x86@kernel.org, bgolaszewski@baylibre.com, tony@atomide.com,
 geert@linux-m68k.org, catalin.marinas@arm.com, linux-alpha@vger.kernel.org,
 arnd@arndb.de, msalter@redhat.com, jacquiot.aurelien@gmail.com,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de,
 namhyung@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, maz@kernel.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The warning in ack_bad_irq() is misleading in several ways:
* the term "vector" isn't quite correct
* the printing format isn't consistent across the archs: some print decimal,
  some hex, some hex w/o "0x" prefix.
* the printed linux irq isn't meaningful in all cases - we actually would
  want it to print the hw irq.

Since all call sites already print out more detailed and correct information,
we just don't need to duplicate this in each single arch. So just drop it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/ia64/include/asm/hardirq.h | 2 +-
 arch/ia64/kernel/irq.c          | 9 ---------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/ia64/include/asm/hardirq.h b/arch/ia64/include/asm/hardirq.h
index ccde7c2ba00f..dddaafaf84e0 100644
--- a/arch/ia64/include/asm/hardirq.h
+++ b/arch/ia64/include/asm/hardirq.h
@@ -22,6 +22,6 @@
 
 extern void __iomem *ipi_base_addr;
 
-void ack_bad_irq(unsigned int irq);
+#define ack_bad_irq(irq)
 
 #endif /* _ASM_IA64_HARDIRQ_H */
diff --git a/arch/ia64/kernel/irq.c b/arch/ia64/kernel/irq.c
index ecef17c7c35b..1365c7cf2095 100644
--- a/arch/ia64/kernel/irq.c
+++ b/arch/ia64/kernel/irq.c
@@ -28,15 +28,6 @@
 #include <asm/xtp.h>
 
 /*
- * 'what should we do if we get a hw irq event on an illegal vector'.
- * each architecture has to answer this themselves.
- */
-void ack_bad_irq(unsigned int irq)
-{
-	printk(KERN_ERR "Unexpected irq vector 0x%x on CPU %u!\n", irq, smp_processor_id());
-}
-
-/*
  * Interrupt statistics:
  */
 
-- 
2.11.0


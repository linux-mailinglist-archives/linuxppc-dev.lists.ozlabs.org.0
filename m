Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6A2DE50B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:43:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBSh4V0CzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:43:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBGw4VZrzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:19 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MIMXE-1ktVvH3Qeq-00EO5n; Fri, 18 Dec 2020 15:31:52 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/23] arch: mips: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:05 +0100
Message-Id: <20201218143122.19459-7-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:FGKFVpjRm8i7alCduF6w5xVQ9QBhhI+BcbMoR2xYuHsBqi3HW+a
 zuZ/nO0yECgUh91EZuccQMI4v9u0fvgFaaXDlnfpg4pNnW+9YPm0m6vFzoP8y3nI/L80U2q
 tOYG+TtPDtewTmWoSaBjj031Z1xtRhX13X03Cj1R8WbJJ6hRxdjlasrHGXlgq0z0XRCY/7R
 7bMVFVy/AwQ9G65ocohFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5QbacgAAcV8=:SjlVoKIRpMoJbMDin1Wxmv
 r7hX0/Hb1uQQh9DWyGtQ4hJ/O7UuoWSZBLXqv3HLbGuwbraALbYBJaVDC8hOM6Rc34+eN5uUd
 VRtPdFPKbEXn7MPrknDfMOMfZmLIdjknTzIWTnexfB4JFPWnpLPS2uCDscdMklO+Ww0/aBe30
 WK8pshbeLhGqWu+4zq5EeVvhjKHOayfwPjMJnG0vngvQQxPP1BmzSm0fNQLZTEARXdkwu2pqE
 Eear9qZL5q1/abLp+4Wu/OabD7PVErjHqqBocNxuGjo1pGM2bAzuyckbJ44wcZDSvUGHf7l2D
 ou8BxCqHc2Ss6RnvX/JERqSHQ55352dSyIVht/cmKR8eT9fg35ihrPgOO9fzNj7XQUWwawJOh
 HR9IQlONZti0Q4+USJXCQTytoyovM/QCwtkXcmv3mUZpColG/mUlBGm0hTFRX
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
  some hex, some hex w/o 0x prefix.
* the printed linux irq isn't meaningful in all cases - we actually would
  want it to print the hw irq.

Since all call sites already print out more detailed and correct information,
we just don't need to duplicate this in each single arch. So just drop it.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 arch/mips/include/asm/hardirq.h | 3 +--
 arch/mips/kernel/irq.c          | 9 ---------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/hardirq.h b/arch/mips/include/asm/hardirq.h
index c977a86c2c65..75444120e6cb 100644
--- a/arch/mips/include/asm/hardirq.h
+++ b/arch/mips/include/asm/hardirq.h
@@ -10,8 +10,7 @@
 #ifndef _ASM_HARDIRQ_H
 #define _ASM_HARDIRQ_H
 
-extern void ack_bad_irq(unsigned int irq);
-#define ack_bad_irq ack_bad_irq
+#define ack_bad_irq(irq)
 
 #include <asm-generic/hardirq.h>
 
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 85b6c60f285d..c98be305fab6 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -27,15 +27,6 @@
 
 void *irq_stack[NR_CPUS];
 
-/*
- * 'what should we do if we get a hw irq event on an illegal vector'.
- * each architecture has to answer this themselves.
- */
-void ack_bad_irq(unsigned int irq)
-{
-	printk("unexpected IRQ # %d\n", irq);
-}
-
 atomic_t irq_err_count;
 
 int arch_show_interrupts(struct seq_file *p, int prec)
-- 
2.11.0


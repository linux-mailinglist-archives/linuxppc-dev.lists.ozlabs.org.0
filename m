Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D62DE691
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:30:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCVX6ygmzDqfy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:30:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBsN2Y15zDqml
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:43 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MIdNt-1ktuFe2Uib-00EeMY; Fri, 18 Dec 2020 15:58:15 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/23] arch: powerpc: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:57:31 +0100
Message-Id: <20201218145746.24205-9-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:ieOuUKl8ThT454nzt+aV4PfH51j5uenC5RGUqeSvczG2Sqio5dm
 rnj7G5yCvs2qtVCBI9dUALWjHZ3LqLvCeeFb/LHnSWV7wc13TMFFnZOqLjjSE6RKIfRoU03
 9prPmxJYuT4mFYzS0QqQgXSWuHn59YpFcfX8YTLYlZXVKlTffExE6ECEPv527ddz92ShPOi
 DKplTRPkmcwVhVh6rr4BA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BlqCMXzsJL4=:lproxcv+QWWhQxS5wyXHNB
 W7GBf2KYPt+Ey8J9XFT2h7Fa5GCekIAGPikERbyy1o/Y9pAPNwdJiYaq1/e3ZM/DV4fk+S0+I
 zwZHE0M9/XAA8GGvNj7FHuRbNgVlsWmV5ForiWw6uZS91CaqrRXCvBQYv1k/DmRiDwXk3fqG1
 HEXBoPwJ5obvmE1qpF3hOehyWDr9FHv/hAOcSxSDxWuQBoaWoaJgF3kdqCfc8k4M6sWuM0pwp
 Ab57LJaI+Z20J2nCLEwJvdT3XIvw3C1+GySvHbZMi/kNN8/xeCxF46GzFi2PK7WTM5Y7nfXLK
 dDvuPEIi+FX/qlOLy1y5w1QB10S2nTRn13lgx2j3+g/JJ/L6LBO2qZ3egKqPxKwU9upV6Vc1q
 AV/7gfZJy531v3sV1PN/9fo9Kk9B0etcg2yX5Vrrl0WZq570Yg/rY1JpFXJwh1vbCiixcY4g+
 qz3peG6Y3QqKC5tguLBVU52O00pTr3pp5BPE3CM0LQ+ixkfoj/KooSSX4jbBww9t1u0m/h3v8
 ixBmeLvZdnEsTwn3MpZTU0=
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
 arch/powerpc/include/asm/hardirq.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/hardirq.h b/arch/powerpc/include/asm/hardirq.h
index f133b5930ae1..4138193c2367 100644
--- a/arch/powerpc/include/asm/hardirq.h
+++ b/arch/powerpc/include/asm/hardirq.h
@@ -27,10 +27,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
 #define __ARCH_IRQ_STAT
 #define __ARCH_IRQ_EXIT_IRQS_DISABLED
 
-static inline void ack_bad_irq(unsigned int irq)
-{
-	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
-}
+#define ack_bad_irq(irq)
 
 extern u64 arch_irq_stat_cpu(unsigned int cpu);
 #define arch_irq_stat_cpu	arch_irq_stat_cpu
-- 
2.11.0


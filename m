Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36F2DE519
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:48:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBZK0h6vzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBH03VMGzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:23 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MNKuI-1kSfN03xpi-00OoTh; Fri, 18 Dec 2020 15:31:41 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:00 +0100
Message-Id: <20201218143122.19459-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:LV+vlieoH9S7FVeRD54ZyNGq0lXxd7A7eeGG73dV5SKsuNXUfZI
 t5Tc1dALRs2AtPOwYKoApPnoyxW7/Lxyitn6jmEk7odPc1fXKRQf1B17b0Xo7GSaZpMx5dW
 TGMTjUj10cvONDT+2jdjeydrLJOMscAH46e6N0Uv313zK0Un9DMFeG3NocxtaL9uYHwBWUE
 aSQQOOS63nbzmSA0OZCyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+jizveWrAag=:xi1E+afKqBPbuitFr74tH/
 Pqa93R1CfB6VGpKCdCeA3imHCGUzmR1wu1gjA3PGPF+dMp9C4DR3rt99LswhF1TegW/RnTDot
 7d+qHzUK0gNbP/ybW7PGmodvcbOApL7/3hR0HaBIPYze29okX0qVKNaN0uUOc0aMPNrJm/lHf
 rCFjulnbgKj9sYd2ill1azgaxbVSkzVmRlEPbAXZ+0ALMS8qEDGet+OtJmWpacsNa46vQXnQR
 mVE6jRttoXsNQa2wg7diSy8ElyG3YIRCwJEWAPOcEpIC4aPBtfkksUoly5a7/5EKCc4EvuICg
 YHQlmrQSz8cwd325SSQ2jSl5oaE8TxRVgzjar1+yw/FjC2rs1pHYfkD4L/u2NKSTYhAEHWZqD
 //Tdu1h6FpFg7G/m1MYCJBESvLEx03W/xk08EHJHT4hVa+Y58QzG42CuKoHzR
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

Add a warning on spurious IRQs to __handle_domain_irq(), also telling the
linux IRQ number (if any), the hw IRQ number and the max nr of IRQs.

That's far more informative than the warnings in (some of) the individual
arch's ack_bad_irq()'s. These aren't really helpful since either the
other callers already had printed more detailed information or (when called
by __handle_domain_irq()) the printout just doesn't tell anything useful.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 kernel/irq/irqdesc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index e810eb9906ea..62a381351775 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -681,6 +681,9 @@ int __handle_domain_irq(struct irq_domain *domain, unsigned int hwirq,
 	 * than crashing, do something sensible.
 	 */
 	if (unlikely(!irq || irq >= nr_irqs)) {
+		if (printk_ratelimit())
+			pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
+				irq, hwirq, nr_irqs);
 		ack_bad_irq(irq);
 		ret = -EINVAL;
 	} else {
-- 
2.11.0


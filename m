Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D602A2DE66D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:22:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCK06Tf0zDrS4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:22:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBsB4vlKzDqq8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:34 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MxV4T-1jsyRe3BBR-00xr1G; Fri, 18 Dec 2020 15:58:03 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
Date: Fri, 18 Dec 2020 15:57:24 +0100
Message-Id: <20201218145746.24205-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:sNvhDkhkHXSckZsIcYNRvhSxb4brkTcSkjpsXzG++3eNb3snJ0g
 J9Qv02uTs0nLp3/Ko4ksdZTvqxTqsz/VJHyYyKuCFEMndBxaiM7R6Nof8j/9Bc9v3uf5xpe
 63QhWeMZuMwyVcEvebQIrDokrsdpA8FvkxHUgTyntRUgah4L5gvEw4KA3yYR+yPnDkLUVC3
 8MNk6k5JHeB3igb+vXtww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9PanUVZdncQ=:ruo0TGsTgyRzC2TD10Yg7n
 tmilzgQTchCUSCtJB+uJD3tGAJPZ9rwFCJr6cZE5MH5SbA2m0AOTtj8oqqDNWs8cLtj8MBzny
 OhaA/tPgAr4XHJ3zLyN+a0GPhlRq80gQgL+Ir6o8L7/nzU8QaaUASC4VwN+2lsvHJnbu/dD2E
 9D88ErzP/g7tyF5JbwFxJzVax960xo3H+WX5YZFCZY+Xcj+4xol4bg6k52Ta6nTcF3SzEjyHC
 ikW+qSf4SJlMh7T8archj1wmz3XI/Y3jh3j8E9P9Uzw5ETe/syz3q2DMAcV1VplhWFe+b6f6E
 xxspiEAqDYUOfrIIQhqv6q9qB51Wdw+U8KHXfmVbQvQSu23IvSIptkF+o6GiMZ74cbRjOBudF
 mpN2jme8ZtPkVAXOogvV4r9jproDuTrmcbv3Eh6uWCxvZnez2YLonKGvYn2my
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


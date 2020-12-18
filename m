Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD12DE500
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:38:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBLX2NyqzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:38:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBGx0yxPzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:18 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPXpS-1kUsIP1N8E-00MbYH; Fri, 18 Dec 2020 15:31:43 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/23] arch: alpha: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:01 +0100
Message-Id: <20201218143122.19459-3-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:pUJzS/tNjFJ37SufUPmB6VHWpKthVZUGxvQ+xKtdprNr8l6YI/1
 KtXA5HiAMRvqC4e/n10rheKKOjnn6zs1jeHwcJ76JSfq/uaXTL12yjWHrsp+aEn4sFIwxGT
 lJtCDGmWiqtjf5DzjgjVtAXh0OE9P2QTM6JEU0+jDRqoh4w+LQlvJQkqtSE/m7lPjEpULQY
 EPZQOPAseqzUM9KoALtEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ImHgQfa9yos=:RMkUA47rpXzNJoIXDG7cLd
 bTIMK4FppxwMKyK22fDhDPRoT6ptco+6GEFPygCKPM3rqApxb1zc8N2Q9IlzRZztk4Mqspi6D
 EuSQLV7z2fEh8QrWp3rs7OPAeetvZb6aDKXn9A7Ga1rUJ1jEzmR/49pLCF7uhaFPSEWVS1iCL
 suvxGUV2sYC9MxuGtuiAG+MWMMbD9qXO8zYXwkujMFVcxMcyH8TmHBCIhoqZ3IdyhU1uYZEd8
 2WqgQk85s0gjS0zLWzGGRKzEC1JigGxQf0B8WdHUmSJh1LFYUVom4P2AHZw+H6DArC2p5KOxz
 x+JqeuLY6uvPHlbVff8Ida8an42pyFx/Dwg6qSQ6w/WH6zt9hco0jJg3PoOelM+wOibrEGeUY
 weYR0zzUBTrMjLce4GumPryxUSHszmfx7+lOptoiMHwpwf+pVLRG6INWMbNJW
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
 arch/alpha/kernel/irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index f6d2946edbd2..c1980eea75a6 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -35,7 +35,6 @@ DEFINE_PER_CPU(unsigned long, irq_pmi_count);
 void ack_bad_irq(unsigned int irq)
 {
 	irq_err_count++;
-	printk(KERN_CRIT "Unexpected IRQ trap at vector %u\n", irq);
 }
 
 #ifdef CONFIG_SMP 
-- 
2.11.0


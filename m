Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A02DE50F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:45:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBVM6p28zDqdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:45:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBGw6PpKzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:18 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKbc4-1kVQWl3lds-00Kwal; Fri, 18 Dec 2020 15:31:48 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/23] arch: c6x: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:03 +0100
Message-Id: <20201218143122.19459-5-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:LpND6+qlyx9AmGzooMou6Vf89HHTFuGLvWMR4fa2jE7KkvluiyQ
 HqgepSPJvSoquixtsLOVm+5iPC4lBlEuZqhzLMv6Gb39cQKFrL17Oy010oVncqAG1hs8ZLb
 pGhAnGzWftumzuN8fhte+J6A0Ofdx/haEbbuFjfqYrl0ZwJ97Mj0nh0dHoPAmWSljvPyBYo
 oj+4mi1bx8jhOre4f7beA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:84I6lyo19tM=:zj+0LdIy55dgj0XHWliHlu
 Z6IKSuWDQ1jjOF8yZCwA+1YWvrGO3DoiBv3ZgcLSKjOz0No0LNOfcA5IENpYgnEjP5Hyg7eF9
 Acr1srgzIAfrzoxVvReEJn6hodNaMiluUJJ4wAyoPFsORwPYP7zv0H1L3PH7AaenUVtOOotQy
 iMBJJV5YM9QbZ4ZeWrCswa1OAXsKNWV0YqhNAlkUQDN9z57gglGl3Vi5GCEsqr/3vT4gxQSop
 RKGgd9gIwDzD/9l5YndWHU0kT9xylbz3DwQuGVqCw4pVhW5yEq+gDn9wr9xXEUP5tWH3yfoIY
 m9ktZtYpbKzqkXtVXJVU1h7nUO6F6hLqjtv8Lyrgbg20wUqy49AHWpak7jjdXFQNyev+foz8D
 mskfV6gct5deZth1Yvg3FfFtrQF72YBxjuRJEDSfr2CzGLxOES+7x30oU5n3V
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
 arch/c6x/kernel/irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/c6x/kernel/irq.c b/arch/c6x/kernel/irq.c
index e4c53d185b62..b9f7cfa2ed21 100644
--- a/arch/c6x/kernel/irq.c
+++ b/arch/c6x/kernel/irq.c
@@ -116,7 +116,6 @@ void __init init_IRQ(void)
 
 void ack_bad_irq(int irq)
 {
-	printk(KERN_ERR "IRQ: spurious interrupt %d\n", irq);
 	irq_err_count++;
 }
 
-- 
2.11.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F12DE660
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:19:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCFJ0Wv8zDrMr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:19:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBs62BC9zDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:29 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1McpeM-1kHUQ10gK2-00a0LR; Fri, 18 Dec 2020 15:58:07 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/23] arch: arm: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:57:26 +0100
Message-Id: <20201218145746.24205-4-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:0+9gMsQwvdqpJQQBUrPevb7lZTXdAu+bb56tdMJu2QYV0ZAzLWa
 WwVXpII0LliKSEnZk+U4QwBd4l6rae4ItxjdHon5KUO1igPURSNy1szXq/EreYUVBmrRLwX
 opegkBwrH8H3b76d6WrMQBudz/Aa+csr+C0WJ+Xq4VSs6PghBibMAfpRzinhNyR06+5EKgy
 XXqMUwoSCXOp59VNnBMPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:leH2LsGSVfE=:ZfGQ4qJq3e6eIJuMuvT1Ze
 XKki5mcYdtDJZqNkZKfePoRGl4rvJAgpfX8KGaMUlx8FS6SvpsCMGh52hgNhW3nmJPzJrWQfB
 1vR9Rn4pwKxmnzkQvx8xkWIeMg2d4aHS7rzfq3+7TDCy5mcsofgJ/IYIbRnFTcStuihzZuQ5l
 a0t9I4FL+MZHVH1vtEAS28Z+e1Tr1ys42Kf/4JClqS2+w03DZfPMPPlMoEcDktI8DFIE3b3H+
 MadcJochoKovJ6F4MMEBonfiAW8F26IomcTpC0XPTWkbUBw61AZe6gYZH0Mp+ONwe95608i3c
 DHqCuWSrvisC08hesFJ/RrJGEAgLSpMc/kxxXryWXNWTBar7DypPcWJMcp4RQnhBCjepxfAzC
 9s2BzACaOIcqrXxKGug/TYt/rW5Dj9noPCGVS6bsZcS1xH1x0OEofUT8RF0cJEbeo/muiFTXk
 grhHVxuK8rwdhxd5PLzt2D8SmMMgN+M2v3kNa5/5e2/cNYrIdb7Ig3wSOyn+Fnd5gux5ESaZ1
 qx+5tRnc5rWsZfee3St84Y=
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
 arch/arm/include/asm/hw_irq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/hw_irq.h b/arch/arm/include/asm/hw_irq.h
index cecc13214ef1..5305c7e33aee 100644
--- a/arch/arm/include/asm/hw_irq.h
+++ b/arch/arm/include/asm/hw_irq.h
@@ -9,7 +9,6 @@ static inline void ack_bad_irq(int irq)
 {
 	extern unsigned long irq_err_count;
 	irq_err_count++;
-	pr_crit("unexpected IRQ trap at vector %02x\n", irq);
 }
 
 #define ARCH_IRQ_INIT_FLAGS	(IRQ_NOREQUEST | IRQ_NOPROBE)
-- 
2.11.0


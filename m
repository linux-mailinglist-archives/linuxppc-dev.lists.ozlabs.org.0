Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD3B2DE67C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:25:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCNm3lHLzDrHg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:25:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBsH1ZgRzDqkd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:38 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N4hex-1k7pjp3to7-011gFY; Fri, 18 Dec 2020 15:58:19 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/23] arch: sh: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:57:33 +0100
Message-Id: <20201218145746.24205-11-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:n12oP3JSFdzHbdPHfGLc/eyYhy99xvRd/Zl5J0TLtYnt5jRmItv
 iBoKqGJzKtE1cptmOrCYFnpxsT2kddEHwQF+M+hdBpwplwB8LieM/+oZLoePAQ1Jbo8ZNUK
 WvZWJRmTU8H7efFxfvGQDAgF/VzmaZFVYYVXPIucMwQtPBZB18ir086XAMcctmg0knXV+nh
 XJAYldaOgDjpgd+dswptQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HjWPrqnCh9g=:nWXKZzOD/GGnb7cDBprLO6
 ltg75MxwEjQU6yee9vlY+d0VqCWO3tEvvA5MwKZg6SKMyexKOYIREKI5Kp71yRtBpIWjN+j7f
 sH8FtAzk+AHl5eAaONphhT/ihtKttLsgoqoDQ0Jv4Tzqtq3GMXompZ/rwxwJ3UREY5RvAQg4t
 GxwMHPuRcSE31pQ+FmeYTBTETpmHcB2zkdBjDfSHCzwUkF9iVw+w4MftOE23kbKIiKVfr0IA4
 Jd2PrwrS5E+YbwHtFxfL54dgMVF1V8lItNBerRHGFs1iVwiKF/yqcwZ29wnzw16hIZcWRdi9T
 PSjDgJD7APPGIotv/zHmUNTD3xOapj4yXPzDi4sKcbNrC9UeNyn/PZRLXJJSFWgW0CDxWj1WZ
 lkFvc3qffLVHibMSlRKfcnbdJwMJ7Xjts6XNamB6l2a4y0RWLv+aRPfk/2dxH7kVRIpO+Wlqu
 e8w9kgL7YOxE6hH/FNlmzdSXRxw4tOLSPJcHgrhXuphsfEXP8PNQ5QL6KEvH3PCi2mkk80ebH
 Zq6rOqLGBYfsv6bh4zUwZE=
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
 arch/sh/kernel/irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/kernel/irq.c b/arch/sh/kernel/irq.c
index ab5f790b0cd2..c14a142efe60 100644
--- a/arch/sh/kernel/irq.c
+++ b/arch/sh/kernel/irq.c
@@ -31,7 +31,6 @@ atomic_t irq_err_count;
 void ack_bad_irq(unsigned int irq)
 {
 	atomic_inc(&irq_err_count);
-	printk("unexpected IRQ trap at vector %02x\n", irq);
 }
 
 #if defined(CONFIG_PROC_FS)
-- 
2.11.0


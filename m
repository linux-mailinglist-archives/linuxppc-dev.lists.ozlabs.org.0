Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F153B2DE514
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBXg0RHpzDqlR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:47:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBH00QFNzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:23 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MORN0-1kRYuy1Knu-00PuPN; Fri, 18 Dec 2020 15:32:02 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/23] arch: sparc: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:10 +0100
Message-Id: <20201218143122.19459-12-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:vpXcdJ5flfT9UMPnHgs6T5l9jtGqBDr3f0tC6p5Rjwsvidh10dx
 d0ToT43G0U3IwpJaBGtCswd9oef4Qd4eA0CAixsHtd5euXXJNxA9w1nGeD2/Gx6uxbiGLS0
 tGewaqJssGqjA707NEZ8gDxxCE6ENgCktLf2r4JFNKn28o5k4rGK9s6JDW+QdfaOEf7J3lv
 xxUqavLjRvPdJSifMz8RA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FAaCbJXPe/U=:euCZpYb16hzPdr0rOmUHvc
 Mbl+JbbJacqEK9NS1X93hWQ41jQUrJHb+lZ1iEOJt9HdnBQK73zA80gWDm5dUlkD4XzE25f4y
 iZAdXdl5Ah1QrxTSxe1Y9y9A+egjNscrkz9H9OjKHRyGuUxTp8qXnHzfp2syekussaP0P6Z2a
 gK3PCoS98+1XjVpv1rbiX7wTafMlpOeqHCPCX7GADLBTi797dxPRr9WMG/Fbu+uKKqXyJkHah
 jk51z873TwfbS+nMdLwkCU7zed0CiUFDHQ4QQUj0LFQxO1Hff0WZ447MWp3VaDYP+tDznjwrf
 Cf8Msp2xoXen16t6PctzlKTRT0MuKxO0wNlYwE+AwG2kgMTqJuSnpzJKj8Amk6YSEoRB0LaJO
 M2X2I0yt2w7VdDkA4pX0Tq421hrWkI6UhRpBP480D9vrnUkMmL2ONPeAnwhyx
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
 arch/sparc/include/asm/hardirq_64.h | 2 +-
 arch/sparc/kernel/irq_64.c          | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/sparc/include/asm/hardirq_64.h b/arch/sparc/include/asm/hardirq_64.h
index 75b92bfe04b5..874151f520de 100644
--- a/arch/sparc/include/asm/hardirq_64.h
+++ b/arch/sparc/include/asm/hardirq_64.h
@@ -14,6 +14,6 @@
 #define local_softirq_pending_ref \
 	__cpu_data.__softirq_pending
 
-void ack_bad_irq(unsigned int irq);
+#define ack_bad_irq(irq)
 
 #endif /* !(__SPARC64_HARDIRQ_H) */
diff --git a/arch/sparc/kernel/irq_64.c b/arch/sparc/kernel/irq_64.c
index 3ec9f1402aad..ea2a52f7fe53 100644
--- a/arch/sparc/kernel/irq_64.c
+++ b/arch/sparc/kernel/irq_64.c
@@ -284,11 +284,6 @@ static unsigned int sysino_exists(u32 devhandle, unsigned int devino)
 	return irq;
 }
 
-void ack_bad_irq(unsigned int irq)
-{
-	pr_crit("BAD IRQ ack %d\n", irq);
-}
-
 void irq_install_pre_handler(int irq,
 			     void (*func)(unsigned int, void *, void *),
 			     void *arg1, void *arg2)
-- 
2.11.0


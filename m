Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB92DE533
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:57:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBmf0mr5zDqv6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:57:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBH35h0kzDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:27 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MjSHa-1kO2md3GAM-00ky1B; Fri, 18 Dec 2020 15:32:05 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/23] arch: generic: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:12 +0100
Message-Id: <20201218143122.19459-14-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:M8aLFwZQt8q/gF3VPIe1M+mslyreXcwR+vIpx4HR0fXlsa/ah7/
 +gpub2bmnwbbfk2vmmd6wqU45nrLu4R8WoBDzlf/sEt8wti8ZNkB2N2Sn2RULrqS35jZqVv
 znY27DxrEH8DcfZBtVtCCD8FZ+9L/4eAR8+CpjqGf2MloaS+b2sZc2tB/+AISxdJcTKKsXj
 JY+ucp7lvJopx9QUjLklw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q1EC+mZUefQ=:GWO/RZjVZ6sQFibA31f9Li
 ecpis2odSRaO8+Go9GXugExpCogb5QHG6jNXU6SjPi/S/x+bzgo7UbVx4UfZCEt1pCuR65h8T
 BfLchQL8Ga2M+Z4iVE76JpqiYI8iKFmB2FWytSxVjIo5JoYZclIhl0xwm1kdd+EeYZJ7ayZ9m
 R05/FDLyX0pws33QW/IDqCovyrlVQPrNyzee0JLBBepkm4Nkv+L7RVBdzzbSnee1qaGSW7Jlt
 i0yymjKfv/qQsx/0NNcIRAMnvLLXUWmWR1Lf1l8XwnftGUWgjM9ryakDKd/sDz3pnwavpUbef
 yDHmiqJ+iHZL+JG6mq6tJdTLwzxduVYn6IlDZR8hMTr1Yy0x3ubJgbfDwnAr9agzmf1S63WpX
 vVVl/hcXPLDGnMprSZjAOlXYJSfmfOU81FiRdChJw1XfU4b6e6p0euhp/z3ez
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
 include/asm-generic/hardirq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/asm-generic/hardirq.h b/include/asm-generic/hardirq.h
index 7317e8258b48..f5a0240cbf52 100644
--- a/include/asm-generic/hardirq.h
+++ b/include/asm-generic/hardirq.h
@@ -19,7 +19,6 @@ DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);
 #ifndef ack_bad_irq
 static inline void ack_bad_irq(unsigned int irq)
 {
-	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
 }
 #endif
 
-- 
2.11.0


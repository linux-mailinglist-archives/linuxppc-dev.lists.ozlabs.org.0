Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 866FF2DE6B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:35:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCcD3CvDzDrB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:35:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBsT0KbBzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:48 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mfpf7-1kAdnV0ZXF-00gK8Q; Fri, 18 Dec 2020 15:58:24 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/23] arch: generic: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:57:36 +0100
Message-Id: <20201218145746.24205-14-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:cqi4G+m4FTr606+5GhtTSDyQJgpbRwMl5WhK+q+f4UEydU6IG9T
 6NbWVpudp/5L1dgq1A9ySLCK4Bn4NGB80INvM32MyUB8+gksTy2aleHOf+UmkFG+F2JN1YA
 3PBL2Y2xDGRvKYWDUajTgYMB1dLGrFsD/bXEv1o9JhWZj6+VAEclEvh63f/Zbgu8mf5Zp1T
 aNN7Xqbq8LGVi2d6zXKQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oKlAQJCLliE=:UpLOMLJDpnIRmq0iclG2Q0
 4Hl9vZrCyPoZALgcAT+7fZsOLxJyN4hmmQzjFAcznIc5ciZeBa5ounj8E35j1YtIoIJNAedAo
 XMR4qkbUiO8ET6cGWdOLeWeiXfmmw4lyrgqLURBmBPxWuxuct2in+BfFsiPpl60pztNirYCS+
 /mAzL1urLT9NN28tZTrqZJGz2X5CwBM38OSVHZbbhPGrHlLG/SNlZl37LIsbJJ0aVUTcvHwDm
 QkOn+UDsmriJkUbWLfbxwAfTT1HAjcsXcIDv/eS+LZg2PTvxTuJxY/R8npn/zWnhqn7fifmbX
 QnjgTIIRAKEoI48LR9yBZbX/oltTOc6XrZOhRxQTbxfXTngXpFL9UZwe3DVpDqESa6X6BcmiG
 GT3nE6rtyLwYQ8QSCxqFV+BhoviVTy5lIOcVyK0LmRFv6JM9KPAw7wm/+bTmVKYtthxJ1DUc7
 r+a9EGv7HsyHGaEQLydmGUuEXJSCGPb5RmOA13mTm2KR4E4rpG8Sl4jr87dFg0z9R/rPcFDXC
 ovtuIoQgVGk6vLCizR/2T0=
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5CC2DE538
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 15:59:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyBpK3z6qzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:59:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBH54f2TzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 01:35:29 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MplPh-1kIFED0xaP-00qCoo; Fri, 18 Dec 2020 15:32:00 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/23] arch: sh: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:31:09 +0100
Message-Id: <20201218143122.19459-11-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218143122.19459-1-info@metux.net>
References: <20201218143122.19459-1-info@metux.net>
X-Provags-ID: V03:K1:6TL4KPw+Ks7RU+AOsNXR+Ltfqz8XJW1b6vQsJcdupkFn/HGWZEu
 Pxb0W8VDuSp/eowGr2QZ2YYTQOeQIZ9sqLBhLlV4U0gn+9wxn0ZUCYDi1tihD8RSGfUeK0C
 FGo4l2UrGrTty9YtCH6eYRewFkVOo2b5I9IK1HudQLPzVrlY+lg/sg4fjnmPhPdkFl0hPAj
 +B/DBmIm2JthV5pOD9Lkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UEl1mf8Ej6U=:vVuWyafI8JwPT8IqekTwUf
 kJjVjnagJeZHcYrcEXI6WwIlGSzMR+6bJyDiDgrQgM7iWZQNxupfE9+KZ4CH8xwAl9bz0An2S
 g9SX/sJHYF9btvrHzN98Mv01lN2WXq/JdCqiiTmep8ayCtPYeqZm1MWA+VpMPBqXCiySp4nKx
 YrriRyCaFlryZz82ICVCzrhapzFYKL90MwPaC/6LLngk9MDuAZXPEeA0CD9w5aVk5j4WXyXy5
 moMvzvbBtoDNV/k1qA+tVeoczyKN9TMEwdpIVorDrHaUiPErxH0/+N3nGQGgxmN6gMk3qWGdm
 EQ926JDJncMRW18rLb97838aejHl2X+vn6odNyiZ81k15fjExFGn5Wsknjg4EIF4+ChUIckPq
 +B2MnXPkaLoMWdjQowJZMdiHVoEkc5t1KkUtVQLM/6nWRTJu4GUgNhKYVSNhR
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A42DE682
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:27:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCQk3ylmzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:27:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyBsG6LDkzDqf2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:01:37 +1100 (AEDT)
Received: from orion.localdomain ([95.115.54.243]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N0Fh1-1jucJt14Nz-00xIWK; Fri, 18 Dec 2020 15:58:22 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/23] arch: x86: drop misleading warning on spurious IRQ
Date: Fri, 18 Dec 2020 15:57:35 +0100
Message-Id: <20201218145746.24205-13-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218145746.24205-1-info@metux.net>
References: <20201218145746.24205-1-info@metux.net>
X-Provags-ID: V03:K1:0sbtQbefw8DQehEDviccuy0g2n3RO+b59+ihLBG4lLCKZynjSrI
 NPySoNrWbmhPWz0zjwKwrHWKuL/81jaRyevBRrHOPztRsHF4wxMuMRTaSK51mrdACZ96DRC
 Bun60UcXXd1iKXb9KhVkLzHK1IV0u6XGuGbtMZI5aJNMMlLVJLjYDgh8A4AwsQEFLHZoUHu
 5JUvMnmUoCKVsXwMey7XQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EnZ1T1GVBLA=:CKePjyo1KyFCkC4uxmd+BO
 Z3yoeE4a4pCsGC1fG8PmlRC5S2hwgdnyWHnBriA5prvGI/QUTQBVWU21S6V6h3cTpKFbFfEV5
 NNFXWLmW99vgTGiPqP77i45iQCeZMwUpfzuqawXJyZQ8823Z3w33M+2WIIT6HzHRL8VDlu0hH
 GnnNvQUmlileL1b+T8E7bvrtIFJ1564KNxdvQuF7Vqgi6esH5rpeZOLc/CpBI4XTTy6U6fkG+
 8DTTVUP5gL9zafWjgP7ZHMOzo1TinGD/C9mKLaC0CsASAmEyGbErnBRvWbyqYo3F8/8eLlvm9
 YYNdihZLUyVTzmxnwfWq681RURVj9eNqo0rJFVEYVvWX3MHOthIIkfhhKn/P9HwnBX3JLPr1C
 3TkDt/bSNRY8PWcqeM6DdV60QgkJ0h72AymRd5hD8bOJhDdkIRkym6xulIk1N
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
 arch/x86/kernel/irq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index c5dd50369e2f..5c66c44b6b60 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -36,9 +36,6 @@ atomic_t irq_err_count;
  */
 void ack_bad_irq(unsigned int irq)
 {
-	if (printk_ratelimit())
-		pr_err("unexpected IRQ trap at vector %02x\n", irq);
-
 	/*
 	 * Currently unexpected vectors happen only on SMP and APIC.
 	 * We _must_ ack these because every local APIC has only N
-- 
2.11.0


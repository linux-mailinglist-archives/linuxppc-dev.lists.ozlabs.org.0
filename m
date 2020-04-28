Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9011BC015
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 15:47:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BNHy02q3zDqvK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 23:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=tZ696ccJ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BMcb1k6QzDqqY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:17:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49BMcN4J7Jz9v0DC;
 Tue, 28 Apr 2020 15:16:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tZ696ccJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UgvCY0KN0IY2; Tue, 28 Apr 2020 15:16:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49BMcN3DPWz9v0D9;
 Tue, 28 Apr 2020 15:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588079812; bh=uI9Ui2HzQEfNGrmOOyGMT9HmBbcvnao0kBvyV0cXwes=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tZ696ccJCjTNT30zuKCU4FPtR8kT4yN4PhJDU1leZmitbqQlXkwgVvApDfOiCq647
 4/LWGWb95wycCso8i7xm1MBaoamK1r4Kn/MlJxI8Gc+579AW76fcmyfO51lG7eexTi
 xp99JTgiAqDxWq/Rd8kCGTymwik+xjNFJh0wcvt4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E07CB8B828;
 Tue, 28 Apr 2020 15:16:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UoafEZMJBl87; Tue, 28 Apr 2020 15:16:53 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A10448B82C;
 Tue, 28 Apr 2020 15:16:53 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6CD66658AD; Tue, 28 Apr 2020 13:16:53 +0000 (UTC)
Message-Id: <1ab6a62c356c3bec35d1623563ef9c636205bcda.1588079622.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1588079622.git.christophe.leroy@c-s.fr>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v8 7/8] lib/vdso: force inlining of
 __cvdso_clock_gettime_common()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com
Date: Tue, 28 Apr 2020 13:16:53 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When adding gettime64() to a 32 bit architecture (namely powerpc/32)
it has been noticed that GCC doesn't inline anymore
__cvdso_clock_gettime_common() because it is called twice
(Once by __cvdso_clock_gettime() and once by
__cvdso_clock_gettime32).

This has the effect of seriously degrading the performance:

Before the implementation of gettime64(), gettime() runs in:

	clock-gettime-monotonic-raw:    vdso: 1003 nsec/call
	clock-gettime-monotonic-coarse:    vdso: 592 nsec/call
	clock-gettime-monotonic:    vdso: 942 nsec/call

When adding a gettime64() entry point, the standard gettime()
performance is degraded by 30% to 50%:

	clock-gettime-monotonic-raw:    vdso: 1300 nsec/call
	clock-gettime-monotonic-coarse:    vdso: 900 nsec/call
	clock-gettime-monotonic:    vdso: 1232 nsec/call

Adding __always_inline() to __cvdso_clock_gettime_common()
regains the original performance.

In terms of code size, the inlining increases the code size
by only 176 bytes. This is in the noise for a kernel image.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index a2909af4b924..7938d3c4901d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -210,7 +210,7 @@ static __always_inline int do_coarse(const struct vdso_data *vd, clockid_t clk,
 	return 0;
 }
 
-static __maybe_unused int
+static __always_inline int
 __cvdso_clock_gettime_common(const struct vdso_data *vd, clockid_t clock,
 			     struct __kernel_timespec *ts)
 {
-- 
2.25.0


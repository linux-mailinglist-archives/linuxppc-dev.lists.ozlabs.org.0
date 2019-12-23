Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C461297AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 15:46:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hMbn3ph8zDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 01:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="WqRlriy0"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hMGm54kCzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 01:31:12 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hMGY4PS8z9txhl;
 Mon, 23 Dec 2019 15:31:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WqRlriy0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lyyav2mt8lCR; Mon, 23 Dec 2019 15:31:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGY3DMLz9txhg;
 Mon, 23 Dec 2019 15:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577111461; bh=4HlVdfb/m2bnebYsqTVj7kFlC+Ng414ig/AZSZp6k7s=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=WqRlriy0DqcZh60SDjoGMQijbqFO68IO3uompTe3PTUn5JPopZMKehw9+2nPSPIZP
 hwfYncZjR/MLSaTvHfyl3A0w9elV2k2/xL/eg8+TK6KKCyFx1bzcUuK7n2o2YsIyfr
 HAsfky9f/aUORYv0A9P41kc9Lg3ATeICFVaYId54=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8959D8B7AB;
 Mon, 23 Dec 2019 15:31:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pPU4VC3HWwT0; Mon, 23 Dec 2019 15:31:06 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CBAE8B7A1;
 Mon, 23 Dec 2019 15:31:06 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 66892637D4; Mon, 23 Dec 2019 14:31:06 +0000 (UTC)
Message-Id: <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org
Date: Mon, 23 Dec 2019 14:31:06 +0000 (UTC)
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

do_hres() is called from several places, so GCC doesn't inline
it at first.

do_hres() takes a struct __kernel_timespec * parameter for
passing the result. In the 32 bits case, this parameter corresponds
to a local var in the caller. In order to provide a pointer
to this structure, the caller has to put it in its stack and
do_hres() has to write the result in the stack. This is suboptimal,
especially on RISC processor like powerpc.

By making GCC inline the function, the struct __kernel_timespec
remains a local var using registers, avoiding the need to write and
read stack.

The improvement is significant on powerpc.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 24e1ba838260..86d5b1c8796b 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -34,8 +34,8 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 }
 #endif
 
-static int do_hres(const struct vdso_data *vd, clockid_t clk,
-		   struct __kernel_timespec *ts)
+static inline int do_hres(const struct vdso_data *vd, clockid_t clk,
+			  struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
 	u64 cycles, last, sec, ns;
-- 
2.13.3


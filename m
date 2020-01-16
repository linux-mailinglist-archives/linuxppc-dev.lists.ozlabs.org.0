Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A413FAD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:47:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zGV33t0LzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 07:47:39 +1100 (AEDT)
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
 header.s=mail header.b=VpEAVsMo; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBl06T8fzDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:58:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47zBkv4jWBz9v4gd;
 Thu, 16 Jan 2020 18:58:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VpEAVsMo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DXtJZSmMJMX7; Thu, 16 Jan 2020 18:58:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkv3NwQz9v4gc;
 Thu, 16 Jan 2020 18:58:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579197511; bh=wfHgFrBCUMEE5/kS6fI9jRYQD9EPAenOLbEqfa9DCHQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=VpEAVsMoaRaYR/GDi6jEna8DY+dp86tqIqGVdjZ9p7CFVKq9q4/QlPb4PyiZjRSKd
 pkZmibrJqKFhI86ouCtZlJGL+CvG8vsycMzfZZq6zR5sEiwOxE1evs6xYe+ppXJtC0
 rPKQ3nF22KjCabgC73k1U7UYgFh9oD/+ZhvTL1ik=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F39148B82D;
 Thu, 16 Jan 2020 18:58:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yj3XipUHd9_m; Thu, 16 Jan 2020 18:58:32 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B80628B82A;
 Thu, 16 Jan 2020 18:58:32 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8FAE264A33; Thu, 16 Jan 2020 17:58:32 +0000 (UTC)
Message-Id: <1b278bc1f6859d4df734fb2cde61cf298e6e07fd.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 08/11] lib: vdso: allow fixed clock mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, arnd@arndb.de, tglx@linutronix.de,
 vincenzo.frascino@arm.com, luto@kernel.org
Date: Thu, 16 Jan 2020 17:58:32 +0000 (UTC)
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

On arches like POWERPC, the clock is always the timebase, it
cannot be changed on the fly and it is always VDSO capable.

Therefore, give arches the opportunity to redefine the way
clock_mode is checked by moving the check into an overridable
__arch_vdso_capable() macro.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9fa249809399..724b45c3e8ac 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -46,6 +46,13 @@ static inline bool __arch_vdso_hres_capable(void)
 }
 #endif
 
+#ifndef __arch_vdso_capable
+static inline bool __arch_vdso_capable(const struct vdso_data *vd)
+{
+	return vd->clock_mode != VDSO_CLOCKMODE_NONE;
+}
+#endif
+
 #ifdef CONFIG_TIME_NS
 static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
 			  struct __kernel_timespec *ts)
@@ -66,7 +73,7 @@ static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
 	do {
 		seq = vdso_read_begin(vd);
 
-		if (unlikely(vd->clock_mode == VDSO_CLOCKMODE_NONE))
+		if (unlikely(!__arch_vdso_capable(vd)))
 			return -1;
 
 		cycles = __arch_get_hw_counter(vd->clock_mode);
@@ -134,7 +141,7 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 		}
 		smp_rmb();
 
-		if (unlikely(vd->clock_mode == VDSO_CLOCKMODE_NONE))
+		if (unlikely(!__arch_vdso_capable(vd)))
 			return -1;
 
 		cycles = __arch_get_hw_counter(vd->clock_mode);
-- 
2.13.3


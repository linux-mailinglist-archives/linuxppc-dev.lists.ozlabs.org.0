Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBA13976E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 18:22:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xL4J6r6LzDqFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 04:22:08 +1100 (AEDT)
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
 header.s=mail header.b=HtFNRPge; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xKmx4G8VzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 04:08:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xKmk72cCz9txyx;
 Mon, 13 Jan 2020 18:08:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HtFNRPge; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mjoWBsPHa-lT; Mon, 13 Jan 2020 18:08:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmk5mb2z9txyq;
 Mon, 13 Jan 2020 18:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578935318; bh=Eb2ZF+M9WBtPogiQVXilo9gV/urkBEO8lF9A3E/Edxw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=HtFNRPgemN7felkbeT+FB0EwFPgnVRgimg07M9iZM8wdrHwAwhSoKmrDZbQvBZlfA
 n+uw1euzbaRGoi7intJLkB8fWtUVdQpvovV7HtTph8+lzZUOYBROTg3WQ6RYuxMmZf
 qrbTgWxm7Zg/Bj13VNbh0acYZyo3CV4jtooAuD9I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24A058B7C9;
 Mon, 13 Jan 2020 18:08:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mGn9IhJ8RRPM; Mon, 13 Jan 2020 18:08:44 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3A8A8B7BE;
 Mon, 13 Jan 2020 18:08:43 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id B3CB164A1D; Mon, 13 Jan 2020 17:08:43 +0000 (UTC)
Message-Id: <9e4f75ca93c46b8aa0239f561f3a61dc713577f3.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 05/12] lib: vdso: Avoid duplication in
 __cvdso_clock_getres()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org
Date: Mon, 13 Jan 2020 17:08:43 +0000 (UTC)
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

VDSO_HRES and VDSO_RAW clocks are handled the same way.

Don't duplicate code.

Before the patch:
clock-getres-monotonic-raw:    vdso: 737 nsec/call
clock-getres-monotonic-coarse:    vdso: 753 nsec/call
clock-getres-monotonic:    vdso: 691 nsec/call

After the patch:
clock-getres-monotonic-raw:    vdso: 715 nsec/call
clock-getres-monotonic-coarse:    vdso: 715 nsec/call
clock-getres-monotonic:    vdso: 714 nsec/call

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Andy Lutomirski <luto@kernel.org>
---
 lib/vdso/gettimeofday.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index d75e44ba716f..decd3f2b37af 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -184,7 +184,6 @@ static __maybe_unused
 int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	u64 hrtimer_res;
 	u32 msk;
 	u64 ns;
 
@@ -192,27 +191,21 @@ int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 	if (unlikely((u32) clock >= MAX_CLOCKS))
 		return -1;
 
-	hrtimer_res = READ_ONCE(vd[CS_HRES_COARSE].hrtimer_res);
 	/*
 	 * Convert the clockid to a bitmask and use it to check which
 	 * clocks are handled in the VDSO directly.
 	 */
 	msk = 1U << clock;
-	if (msk & VDSO_HRES) {
+	if (msk & (VDSO_HRES | VDSO_RAW)) {
 		/*
 		 * Preserves the behaviour of posix_get_hrtimer_res().
 		 */
-		ns = hrtimer_res;
+		ns = READ_ONCE(vd[CS_HRES_COARSE].hrtimer_res);
 	} else if (msk & VDSO_COARSE) {
 		/*
 		 * Preserves the behaviour of posix_get_coarse_res().
 		 */
 		ns = LOW_RES_NSEC;
-	} else if (msk & VDSO_RAW) {
-		/*
-		 * Preserves the behaviour of posix_get_hrtimer_res().
-		 */
-		ns = hrtimer_res;
 	} else {
 		return -1;
 	}
-- 
2.13.3


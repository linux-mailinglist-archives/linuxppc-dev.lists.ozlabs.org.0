Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E4155B59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 17:05:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Dg9w4HCWzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 03:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Dg8M2ZvtzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 03:03:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=t/i9IkcX; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Dg8L5g4Nz8svt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 03:03:46 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Dg8L4sTVz9sSJ; Sat,  8 Feb 2020 03:03:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=t/i9IkcX; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Dg8K2KFSz9sRK
 for <linuxppc-dev@ozlabs.org>; Sat,  8 Feb 2020 03:03:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Dg8B3yGxz9v0Z4;
 Fri,  7 Feb 2020 17:03:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=t/i9IkcX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zEa2JQMDWBgP; Fri,  7 Feb 2020 17:03:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Dg8B2t5kz9v0Z2;
 Fri,  7 Feb 2020 17:03:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581091418; bh=dtfmT3LfaCliYknPGpwarGAcHjTbvLJexd/Fuj59Yyg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=t/i9IkcXk52yTMyQNnhxbsvOpsknsgEtvQ9b5vX2ludGgU0QYKR6OJWHhlC8PGs15
 wGN2uU8ydTOcGkjJ/R+4BYi0wDlO32nxgRihgWt/HlBsT3u2VFFzxj1i6y9qWTdNdX
 NXD9fZYoaCyNV6t6ikPmXDp7QFmDg1kiKsSpEXu8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12E088B8D9;
 Fri,  7 Feb 2020 17:03:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qGIrUrCe-egF; Fri,  7 Feb 2020 17:03:39 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F1A48B8BA;
 Fri,  7 Feb 2020 17:03:39 +0100 (CET)
Subject: Re: [PATCH] powerpc/futex: Fix incorrect user access blocking
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200207122145.11928-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e5d2e152-21af-cc25-c3d2-057661d3e329@c-s.fr>
Date: Fri, 7 Feb 2020 17:03:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207122145.11928-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/02/2020 à 13:21, Michael Ellerman a écrit :
> The early versions of our kernel user access prevention (KUAP) were
> written by Russell and Christophe, and didn't have separate
> read/write access.
> 
> At some point I picked up the series and added the read/write access,
> but I failed to update the usages in futex.h to correctly allow read
> and write.
> 
> However we didn't notice because of another bug which was causing the
> low-level code to always enable read and write. That bug was fixed
> recently in commit 1d8f739b07bd ("powerpc/kuap: Fix set direction in
> allow/prevent_user_access()").
> 
> futex_atomic_cmpxchg_inatomic() is passed the user address as %3 and
> does:
> 
>    1:     lwarx   %1,  0, %3
>           cmpw    0,  %1, %4
>           bne-    3f
>    2:     stwcx.  %5,  0, %3
> 
> Which clearly loads and stores from/to %3. The logic in
> arch_futex_atomic_op_inuser() is similar, so fix both of them to use
> allow_read_write_user().
> 
> Without this fix, and with PPC_KUAP_DEBUG=y, we see eg:
> 
>    Bug: Read fault blocked by AMR!
>    WARNING: CPU: 94 PID: 149215 at arch/powerpc/include/asm/book3s/64/kup-radix.h:126 __do_page_fault+0x600/0xf30
>    CPU: 94 PID: 149215 Comm: futex_requeue_p Tainted: G        W         5.5.0-rc7-gcc9x-g4c25df5640ae #1
>    ...
>    NIP [c000000000070680] __do_page_fault+0x600/0xf30
>    LR [c00000000007067c] __do_page_fault+0x5fc/0xf30
>    Call Trace:
>    [c00020138e5637e0] [c00000000007067c] __do_page_fault+0x5fc/0xf30 (unreliable)
>    [c00020138e5638c0] [c00000000000ada8] handle_page_fault+0x10/0x30
>    --- interrupt: 301 at cmpxchg_futex_value_locked+0x68/0xd0
>        LR = futex_lock_pi_atomic+0xe0/0x1f0
>    [c00020138e563bc0] [c000000000217b50] futex_lock_pi_atomic+0x80/0x1f0 (unreliable)
>    [c00020138e563c30] [c00000000021b668] futex_requeue+0x438/0xb60
>    [c00020138e563d60] [c00000000021c6cc] do_futex+0x1ec/0x2b0
>    [c00020138e563d90] [c00000000021c8b8] sys_futex+0x128/0x200
>    [c00020138e563e20] [c00000000000b7ac] system_call+0x5c/0x68
> 
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/include/asm/futex.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/futex.h b/arch/powerpc/include/asm/futex.h
> index eea28ca679db..bc7d9d06a6d9 100644
> --- a/arch/powerpc/include/asm/futex.h
> +++ b/arch/powerpc/include/asm/futex.h
> @@ -35,7 +35,7 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
>   {
>   	int oldval = 0, ret;
>   
> -	allow_write_to_user(uaddr, sizeof(*uaddr));
> +	allow_read_write_user(uaddr, uaddr, sizeof(*uaddr));
>   	pagefault_disable();
>   
>   	switch (op) {
> @@ -62,7 +62,7 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
>   
>   	*oval = oldval;
>   
> -	prevent_write_to_user(uaddr, sizeof(*uaddr));
> +	prevent_read_write_user(uaddr, uaddr, sizeof(*uaddr));
>   	return ret;
>   }
>   
> @@ -76,7 +76,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>   	if (!access_ok(uaddr, sizeof(u32)))
>   		return -EFAULT;
>   
> -	allow_write_to_user(uaddr, sizeof(*uaddr));
> +	allow_read_write_user(uaddr, uaddr, sizeof(*uaddr));
> +
>           __asm__ __volatile__ (
>           PPC_ATOMIC_ENTRY_BARRIER
>   "1:     lwarx   %1,0,%3         # futex_atomic_cmpxchg_inatomic\n\
> @@ -97,7 +98,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>           : "cc", "memory");
>   
>   	*uval = prev;
> -	prevent_write_to_user(uaddr, sizeof(*uaddr));
> +	prevent_read_write_user(uaddr, uaddr, sizeof(*uaddr));
> +
>           return ret;
>   }
>   
> 

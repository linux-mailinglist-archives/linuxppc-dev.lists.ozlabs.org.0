Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D01776B9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 14:12:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wy9X1GTMzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 00:12:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wy6Z4qjNzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 00:10:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Q/BQpHqn; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Wy6Z2Jdgz9BNP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 00:10:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Wy6Z1c82z9sR4; Wed,  4 Mar 2020 00:10:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Q/BQpHqn; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Wy6W4gZKz9sRY
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Mar 2020 00:10:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Wy6N3pqCz9v12s;
 Tue,  3 Mar 2020 14:10:04 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Q/BQpHqn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oae5-PZjKsBf; Tue,  3 Mar 2020 14:10:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Wy6N2j3hz9v12r;
 Tue,  3 Mar 2020 14:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583241004; bh=q4YDJGzOXoGsHuEmt5FskEA57P8/zuCYpL6QzdVMqZM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q/BQpHqn+ami1q4MGyLvflqymIdjPs+6jeRxd4GBvKgdHPGgMcfGgKkL6/4i38j+v
 niy4pFyu92n9Ev/xsecoRJoqR9z6Rxx7SL4FJf/BoFQoxIJgWEAbnEjXiHb0h2vaON
 O5XP7PqvqDZOLU+jFv2vE7flZ0z7svnjdA4q/GmE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66F8E8B815;
 Tue,  3 Mar 2020 14:10:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YkKzhtH7QIc6; Tue,  3 Mar 2020 14:10:05 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A79088B810;
 Tue,  3 Mar 2020 14:10:00 +0100 (CET)
Subject: Re: [PATCH] powerpc/mm: Fix missing KUAP disable in
 flush_coherent_icache()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200303125949.27172-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2ad423ee-590b-9198-7fc3-ea6f8900ad23@c-s.fr>
Date: Tue, 3 Mar 2020 14:10:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303125949.27172-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/03/2020 à 13:59, Michael Ellerman a écrit :
> We received a report of strange kernel faults which turned out to be
> due to a missing KUAP disable in flush_coherent_icache() called
> from flush_icache_range().
> 
> The fault looks like:
> 
>    Kernel attempted to access user page (7fffc30d9c00) - exploit attempt? (uid: 1009)
>    BUG: Unable to handle kernel data access on read at 0x7fffc30d9c00
>    Faulting instruction address: 0xc00000000007232c
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>    CPU: 35 PID: 5886 Comm: sigtramp Not tainted 5.6.0-rc2-gcc-8.2.0-00003-gfc37a1632d40 #79
>    NIP:  c00000000007232c LR: c00000000003b7fc CTR: 0000000000000000
>    REGS: c000001e11093940 TRAP: 0300   Not tainted  (5.6.0-rc2-gcc-8.2.0-00003-gfc37a1632d40)
>    MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28000884  XER: 00000000
>    CFAR: c0000000000722fc DAR: 00007fffc30d9c00 DSISR: 08000000 IRQMASK: 0
>    GPR00: c00000000003b7fc c000001e11093bd0 c0000000023ac200 00007fffc30d9c00
>    GPR04: 00007fffc30d9c18 0000000000000000 c000001e11093bd4 0000000000000000
>    GPR08: 0000000000000000 0000000000000001 0000000000000000 c000001e1104ed80
>    GPR12: 0000000000000000 c000001fff6ab380 c0000000016be2d0 4000000000000000
>    GPR16: c000000000000000 bfffffffffffffff 0000000000000000 0000000000000000
>    GPR20: 00007fffc30d9c00 00007fffc30d8f58 00007fffc30d9c18 00007fffc30d9c20
>    GPR24: 00007fffc30d9c18 0000000000000000 c000001e11093d90 c000001e1104ed80
>    GPR28: c000001e11093e90 0000000000000000 c0000000023d9d18 00007fffc30d9c00
>    NIP flush_icache_range+0x5c/0x80
>    LR  handle_rt_signal64+0x95c/0xc2c
>    Call Trace:
>      0xc000001e11093d90 (unreliable)
>      handle_rt_signal64+0x93c/0xc2c
>      do_notify_resume+0x310/0x430
>      ret_from_except_lite+0x70/0x74
>    Instruction dump:
>    409e002c 7c0802a6 3c62ff31 3863f6a0 f8010080 48195fed 60000000 48fe4c8d
>    60000000 e8010080 7c0803a6 7c0004ac <7c00ffac> 7c0004ac 4c00012c 38210070
> 
> This path through handle_rt_signal64() to setup_trampoline() and
> flush_icache_range() is only triggered by 64-bit processes that have
> unmapped their VDSO, which is rare.
> 
> flush_icache_range() takes a range of addresses to flush. In
> flush_coherent_icache() we implement an optimisation for CPUs where we
> know we don't actually have to flush the whole range, we just need to
> do a single icbi.
> 
> However we still execute the icbi on the user address of the start of
> the range we're flushing. On CPUs that also implement KUAP (Power9)
> that leads to the spurious fault above.
> 
> We should be able to pass any address, including a kernel address, to
> the icbi on these CPUs, which would avoid any interaction with KUAP.
> But I don't want to make that change in a bug fix, just in case it
> surfaces some strange behaviour on some CPU.
> 
> So for now just disable KUAP around the icbi. Note the icbi is treated
> as a load, so we allow read access, not write as you'd expect.
> 
> Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/mm/mem.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ef7b1119b2e2..184850d9d000 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -373,7 +373,9 @@ static inline bool flush_coherent_icache(unsigned long addr)
>   	 */
>   	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
>   		mb(); /* sync */
> +		allow_read_from_user((void *)addr, 4);

I know that's ignored on Radix, but shouldn't we use L1_CACHE_BYTES as a 
length ?

>   		icbi((void *)addr);
> +		prevent_read_from_user((void *)addr, 4);
>   		mb(); /* sync */
>   		isync();
>   		return true;
> 

Christophe

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E63B71AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 13:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDjgf2xgZz2yP3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 21:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HFWjSZIZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HFWjSZIZ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDjgD313lz2yN6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 21:58:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GDjgB3Fp9z9sCD;
 Tue, 29 Jun 2021 21:58:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624967926;
 bh=533gyRZK9TmPTAfumIEpfhjf9bBGEwRDqTzjjeqan60=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HFWjSZIZkTSQj/nTgsEsjVAI7zL3d+2WyLr66KRC7mD3N066+boKXh+AGlggtXhaC
 B/bk9puwEZg34DFC0x2GFxvjNXLxyz1xZ0rPQiv4QGIjOrUZ8yfMkPIkqyke4j020g
 GFUqr9z5Q5M57CJCiMBIoUE3iTo5iDvVUVoX74llYPO06OSWBZvoFx+EYMEFYEE28H
 VHV6bPCcNH+UT98EFGkHEGhCj1+WTHsg3QVXSYSTMkrfGL1NEUwrg9p0ks53s8hGGm
 VgiE7DVILSASOs+3M6Qjl5PImVCyYKTQD/r1ZWBSw+cPFh0AStuz9cUYJC82urqp9O
 KpxTeaYxDPwXw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/4xx: Fix setup_kuep() on SMP
In-Reply-To: <b9c2a9add0f11754539e24c6f421bd2009327c36.1624863323.git.christophe.leroy@csgroup.eu>
References: <b9c2a9add0f11754539e24c6f421bd2009327c36.1624863323.git.christophe.leroy@csgroup.eu>
Date: Tue, 29 Jun 2021 21:58:45 +1000
Message-ID: <87tulg7uh6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> On SMP, setup_kuep() is also called from start_secondary() since
> commit 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").
>
> start_secondary() is not an __init function.
>
> Remove the __init marker from setup_kuep() and bail out when
> not caller on the first CPU as the work is already done.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 10248dcba120 ("powerpc/44x: Implement Kernel Userspace Exec Protection (KUEP)")
> Fixes: 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/nohash/44x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
> index 7da6d1e9fc9b..20c18bd5b9a0 100644
> --- a/arch/powerpc/mm/nohash/44x.c
> +++ b/arch/powerpc/mm/nohash/44x.c
> @@ -241,8 +241,11 @@ void __init mmu_init_secondary(int cpu)
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_PPC_KUEP
> -void __init setup_kuep(bool disabled)
> +void setup_kuep(bool disabled)
>  {
> +	if (smp_processor_id() != boot_cpuid)
> +		return;
> +
>  	if (disabled)
>  		patch_instruction_site(&patch__tlb_44x_kuep, ppc_inst(PPC_RAW_NOP()));
>  	else

Building ppc44x_defconfig gives me:

  /linux/arch/powerpc/mm/nohash/44x.c: In function 'setup_kuep':
  /linux/arch/powerpc/mm/nohash/44x.c:246:35: error: 'boot_cpuid' undeclared (first use in this function); did you mean 'boot_cpu_init'?
    246 |         if (smp_processor_id() != boot_cpuid)
        |                                   ^~~~~~~~~~
        |                                   boot_cpu_init
  /linux/arch/powerpc/mm/nohash/44x.c:246:35: note: each undeclared identifier is reported only once for each function it appears in

cheers

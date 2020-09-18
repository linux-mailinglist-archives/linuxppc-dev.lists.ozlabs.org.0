Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E826F6AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 09:22:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt4zd58H1zDqkR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 17:22:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt4xl2kNpzDqMt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 17:20:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZqfWVf37; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt4xj2lDgz9sRf;
 Fri, 18 Sep 2020 17:20:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600413657;
 bh=sq+v1Yk0DH3GDkr/BskxzqrSIZnCM3qgYpDWId55Gcg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZqfWVf37NbKt+YjvX4DZL6LJ5MbzTLlrwnAxyaiT+eOCiRs5k8WwLCHQXW9MTeCR8
 Pyndw4TqmhBzZxdlldMubl3JUIaoUpwD4tdmCFV7KNBzf/kGUC/c+e2E+NbrAV2Fs1
 qgIvg/3MtL5KI6I3aA+gtjOCgZboKcAn7zVGxQZn/gP4HgP2M5A1Ev74oKrxylAzhW
 tMSc3+GBIwxAQCz4JObgQU71BrIiYroLuMh/YV9hF8iZviB292lydURtiSjRL5wlNz
 2IHCggph8W9Wh0/I2oDOVcxXKSdZ1SDWOkhz/Omd7AvON3tDG7J4tit/7AUEmkPUFJ
 0ABnkmDDVElwA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
In-Reply-To: <20200917091716.4631-1-jniethe5@gmail.com>
References: <20200917091716.4631-1-jniethe5@gmail.com>
Date: Fri, 18 Sep 2020 17:20:53 +1000
Message-ID: <877dsro8iy.fsf@mpe.ellerman.id.au>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, oohall@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jordan,

Jordan Niethe <jniethe5@gmail.com> writes:
> Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
> is called before a stack has been set up in r1. This was previously fine
> as the cpu_restore() functions were implemented in assembly and did not
> use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
> device tree binding for discovering CPU features") used
> __restore_cpu_cpufeatures() as the cpu_restore() function for a
> device-tree features based cputable entry. This is a C function and
> hence uses a stack in r1.
>
> generic_secondary_smp_init() is entered on the secondary cpus via the
> primary cpu using the OPAL call opal_start_cpu(). In OPAL, each hardware
> thread has its own stack. The OPAL call is ran in the primary's hardware
> thread. During the call, a job is scheduled on a secondary cpu that will
> start executing at the address of generic_secondary_smp_init().  Hence
> the value that will be left in r1 when the secondary cpu enters the
> kernel is part of that secondary cpu's individual OPAL stack. This means
> that __restore_cpu_cpufeatures() will write to that OPAL stack. This is
> not horribly bad as each hardware thread has its own stack and the call
> that enters the kernel from OPAL never returns, but it is still wrong
> and should be corrected.
>
> Create the temp kernel stack before calling cpu_restore().
>
> Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Add more detail to the commit message
> ---
>  arch/powerpc/kernel/head_64.S | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Unfortunately this breaks booting via kexec.

In that case the secondaries come in to 0x60 and spin until they're
released by smp_release_cpus(), which is before emergency_stack_init()
has run. That means they pick up a bad r1 value and crash/get stuck.

I'm not sure what the best solution is.

I've thought in the past that it would be nicer if the CPU setup didn't
run until the secondary is told to start (via PACAPROCSTART), ie. more
the CPU setup call below there.

But that opens the possibility that we run threads with different
settings of some SPRs until SMP bringup, and if the user has said not to
start secondaries then possibly for ever. And I haven't though hard
enough about whether that's actually problematic (running with different
SPR values).

cheers


> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index 0e05a9a47a4b..4b7f4c6c2600 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -420,6 +420,10 @@ generic_secondary_common_init:
>  	/* From now on, r24 is expected to be logical cpuid */
>  	mr	r24,r5
>  
> +	/* Create a temp kernel stack for use before relocation is on.	*/
> +	ld	r1,PACAEMERGSP(r13)
> +	subi	r1,r1,STACK_FRAME_OVERHEAD
> +
>  	/* See if we need to call a cpu state restore handler */
>  	LOAD_REG_ADDR(r23, cur_cpu_spec)
>  	ld	r23,0(r23)
> @@ -448,10 +452,6 @@ generic_secondary_common_init:
>  	sync				/* order paca.run and cur_cpu_spec */
>  	isync				/* In case code patching happened */
>  
> -	/* Create a temp kernel stack for use before relocation is on.	*/
> -	ld	r1,PACAEMERGSP(r13)
> -	subi	r1,r1,STACK_FRAME_OVERHEAD
> -
>  	b	__secondary_start
>  #endif /* SMP */
>  
> -- 
> 2.17.1

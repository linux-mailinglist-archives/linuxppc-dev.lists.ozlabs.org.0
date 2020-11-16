Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875E2B43F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 13:49:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZTS315wLzDqGv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 23:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZTNZ0FdhzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 23:46:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dBsOqD/D; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZTNY1Tgnz9sPB;
 Mon, 16 Nov 2020 23:46:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605530813;
 bh=xMAELCkltgTjsJeMY4qaKQV8GQbtRxt8MjuwMsICxw8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=dBsOqD/DynpKEywEw+z2q3N5AUsSU47Iiu0CkTJJLO3LWUEhRd+V+/1fL1iYhyufm
 t1AkaHqj0OaABp8q9ZkuZYVHOWPEb9yMQakO8Cxohlz5WnMdjgII5Mg2OYykKE6Wky
 hIlgxQ78xlGB+Yz+fXHTUN+Skkref2HlQvSfrZsuQYsyH3evNsFRnRlimoEsCv5qx9
 Yd5Y5fEamtlrlymgMIH5FTm9MzPSDIe5ZLhgJcyGGBI+KlNx5CVPI3kucsyRoMUpoV
 OE6kpYlzcgCvIprg5R5T17/Qpm0juINfhvZsAyII0nF7VM/0y9n22MndytJBJDFnKp
 mG3G9iQ6mxvfw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wang Qing <wangqing@vivo.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 Alistair Popple <alistair@popple.id.au>, Wang Qing <wangqing@vivo.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] sched/rt, powerpc: Prepare for PREEMPT_RT
In-Reply-To: <1604998411-16116-1-git-send-email-wangqing@vivo.com>
References: <1604998411-16116-1-git-send-email-wangqing@vivo.com>
Date: Mon, 16 Nov 2020 23:46:51 +1100
Message-ID: <871rgt4gg4.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wang Qing <wangqing@vivo.com> writes:
> PREEMPT_RT is a separate preemption model, CONFIG_PREEMPT will
>  be disabled when CONFIG_PREEMPT_RT is enabled,  so we need
> to add CONFIG_PREEMPT_RT output to __die().
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Something fairly similar was posted previously.

That time I said:

  I don't think there's any point adding the "_RT" to the __die() output
  until/if we ever start supporting PREEMPT_RT.

  https://lore.kernel.org/linuxppc-dev/87d0ext4q3.fsf@mpe.ellerman.id.au/
   

And I think I still feel the same way. It's not clear powerpc will ever
support PREEMPT_RT, so this would just be confusing to people. And
potentially someone will then send a patch to remove it as dead code.

cheers



> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 5006dcb..dec7b81
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -262,10 +262,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>  {
>  	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>  
> -	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
> +	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s%s %s\n",
>  	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>  	       PAGE_SIZE / 1024, get_mmu_str(),
>  	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       IS_ENABLED(CONFIG_PREEMPT_RT) ? " PREEMPT_RT" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>  	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
> -- 
> 2.7.4

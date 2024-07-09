Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D792B5FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 12:54:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ep5yM+XM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9BcXKMIJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GnDPxJa5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lkILmT7M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJHt65FMvz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 20:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ep5yM+XM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9BcXKMIJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GnDPxJa5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lkILmT7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJHsN46DHz30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 20:53:28 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E06AF1F7B5;
	Tue,  9 Jul 2024 10:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720522396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6PZdiJUUOQ7/tocirlXk54I+exN8OLe8KW3h1b5AAU=;
	b=Ep5yM+XMyBz5JKZvmiZ3dx+0gOJlUf9vDrLHcGSo5+yeUBspfy4FYvLpaP5klu3/Mp50jq
	uI0mawcGJpeLGq9NPwXm27ghdDzAwVAbRXNX7GgvZvuYtTI1KPTyCA+FiK9ln/xHZ38ID+
	IpDuLMV/jq1CDbczhp+Ody2m2S4bQeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720522396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6PZdiJUUOQ7/tocirlXk54I+exN8OLe8KW3h1b5AAU=;
	b=9BcXKMIJwRrV2+r7BsOiKjQJphoJdzNcCCfNIUEK9lSHE3FcEd1Y8trxy3JsLOWvEDj++h
	11vTSfV8kPXQBbAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720522395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6PZdiJUUOQ7/tocirlXk54I+exN8OLe8KW3h1b5AAU=;
	b=GnDPxJa5ZNCS15va8Zb+oR/Li2PPkBaKeuUfQVSnmkw2LXEGSItP5XB3/PCkYLgqePd76G
	V483aJP/fRsigiX+wJx5Y6jHf1CxmFbYBbtI6FkU6uzWPPmOrgB4vWdILxTAY8emKqI12K
	4g+ipnibhAd15xW6iVbMT8bBpqPUVJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720522395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6PZdiJUUOQ7/tocirlXk54I+exN8OLe8KW3h1b5AAU=;
	b=lkILmT7Mzc+btc0jAmQiIw/Ob2VT4dlvTnRVHbDGCvlfrlSJktY9ZzsjF18vZY8HwTTcjG
	vS/iYZmVshVCGoAA==
Date: Tue, 9 Jul 2024 12:53:14 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
Message-ID: <20240709105314.GA26833@kitsune.suse.cz>
References: <20240625134047.298759-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625134047.298759-1-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, Jun 25, 2024 at 11:40:47PM +1000, Nicholas Piggin wrote:
> kexec on pseries disables AIL (reloc_on_exc), required for scv
> instruction support, before other CPUs have been shut down. This means
> they can execute scv instructions after AIL is disabled, which causes an
> interrupt at an unexpected entry location that crashes the kernel.
> 
> Change the kexec sequence to disable AIL after other CPUs have been
> brought down.
> 
> As a refresher, the real-mode scv interrupt vector is 0x17000, and the
> fixed-location head code probably couldn't easily deal with implementing
> such high addresses so it was just decided not to support that interrupt
> at all.
> 
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")

looks like this is only broken by
commit 2ab2d5794f14 ("powerpc/kasan: Disable address sanitization in kexec paths")

This change reverts the kexec parts done in that commit.

That is the fix is 5.19+, not 5.9+

Thanks

Michal

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kexec/core_64.c             | 11 +++++++++++
>  arch/powerpc/platforms/pseries/kexec.c   |  8 --------
>  arch/powerpc/platforms/pseries/pseries.h |  1 -
>  arch/powerpc/platforms/pseries/setup.c   |  1 -
>  4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 85050be08a23..72b12bc10f90 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -27,6 +27,7 @@
>  #include <asm/paca.h>
>  #include <asm/mmu.h>
>  #include <asm/sections.h>	/* _end */
> +#include <asm/setup.h>
>  #include <asm/smp.h>
>  #include <asm/hw_breakpoint.h>
>  #include <asm/svm.h>
> @@ -317,6 +318,16 @@ void default_machine_kexec(struct kimage *image)
>  	if (!kdump_in_progress())
>  		kexec_prepare_cpus();
>  
> +#ifdef CONFIG_PPC_PSERIES
> +	/*
> +	 * This must be done after other CPUs have shut down, otherwise they
> +	 * could execute the 'scv' instruction, which is not supported with
> +	 * reloc disabled (see configure_exceptions()).
> +	 */
> +	if (firmware_has_feature(FW_FEATURE_SET_MODE))
> +		pseries_disable_reloc_on_exc();
> +#endif
> +
>  	printk("kexec: Starting switchover sequence.\n");
>  
>  	/* switch to a staticly allocated stack.  Based on irq stack code.
> diff --git a/arch/powerpc/platforms/pseries/kexec.c b/arch/powerpc/platforms/pseries/kexec.c
> index 096d09ed89f6..431be156ca9b 100644
> --- a/arch/powerpc/platforms/pseries/kexec.c
> +++ b/arch/powerpc/platforms/pseries/kexec.c
> @@ -61,11 +61,3 @@ void pseries_kexec_cpu_down(int crash_shutdown, int secondary)
>  	} else
>  		xics_kexec_teardown_cpu(secondary);
>  }
> -
> -void pseries_machine_kexec(struct kimage *image)
> -{
> -	if (firmware_has_feature(FW_FEATURE_SET_MODE))
> -		pseries_disable_reloc_on_exc();
> -
> -	default_machine_kexec(image);
> -}
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
> index bba4ad192b0f..3968a6970fa8 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -38,7 +38,6 @@ static inline void smp_init_pseries(void) { }
>  #endif
>  
>  extern void pseries_kexec_cpu_down(int crash_shutdown, int secondary);
> -void pseries_machine_kexec(struct kimage *image);
>  
>  extern void pSeries_final_fixup(void);
>  
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 284a6fa04b0c..b44de0f0822f 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -1159,7 +1159,6 @@ define_machine(pseries) {
>  	.machine_check_exception = pSeries_machine_check_exception,
>  	.machine_check_log_err	= pSeries_machine_check_log_err,
>  #ifdef CONFIG_KEXEC_CORE
> -	.machine_kexec          = pseries_machine_kexec,
>  	.kexec_cpu_down         = pseries_kexec_cpu_down,
>  #endif
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -- 
> 2.45.1
> 

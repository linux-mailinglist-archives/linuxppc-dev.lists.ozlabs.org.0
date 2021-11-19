Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01E4572F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 17:29:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hwhv64c7jz3c9f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 03:29:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J3KzIZ9B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=J3KzIZ9B; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwhtN693Gz2xY4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 03:28:26 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so11377612pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ybj8leGqi8HAKT+pZnPyX6b+iagwbpbkNfSOtTdmlOk=;
 b=J3KzIZ9Bz7ZsQjbZNp2SLJAH7S0PF0ybPyaDvwLXqTkv3XKz8jVAjfzuxKtwJooWFX
 +Jv5JjK8VF8WfZvtfaAJfqw3iYK1phZs78z/4ivAS7EnhQNJZsOtd9nRKOBNIVTqIjCn
 3sSmRjFCPhh/D3BE+cneGg5PPH3gypU+auoNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ybj8leGqi8HAKT+pZnPyX6b+iagwbpbkNfSOtTdmlOk=;
 b=PRVmdzLXllSA9ErCVBpwpTq3321WXjft0h48rXHsFQKabr95Amup7OCVwrh8gAK6Dp
 2qiFTft2NvNQJ8YO/6vs56HDdurPD7tRyr/NqmZGR9eO5FLHnb//zlN/GVksQxBjl9Mi
 p5t8D4bct2eAIKniFDrDyUoeNk9/2FjpC8j3AWBpPCdB75eZgwKFhbOfaSo5ngazLHZm
 zrmQrPP/KQPUH3h0qXk/HYE8AYKbRudh9o6bfTVOzqT9T6+qXS07CIPTLVUR6nA21C7k
 5RXDKgKyAK4CBGjD7wShR5vGHrHGC4p6nNAJS6WP5O494Ro/YW9eXn8BhF5MEfFf0sqr
 1Q0g==
X-Gm-Message-State: AOAM533oq2sTxWBib3qKETgslc78T8PQ3fo9lmBPt8arPTTgKMtCtbxs
 3u/HY8du33zEqZbf3x8pfu+Qaw==
X-Google-Smtp-Source: ABdhPJxRffQGESQhnw0mmGeDMIRmUJZyEDMjlQcKSSft47HbFV/oRz9Z37VmdGYBtBFL6i0yNPTRfg==
X-Received: by 2002:a17:90a:f002:: with SMTP id
 bt2mr956004pjb.221.1637339302086; 
 Fri, 19 Nov 2021 08:28:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i13sm190799pgr.22.2021.11.19.08.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:28:21 -0800 (PST)
Date: Fri, 19 Nov 2021 08:28:21 -0800
From: Kees Cook <keescook@chromium.org>
To: LEROY Christophe <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Message-ID: <202111190824.AEBBE1328@keescook>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 19, 2021 at 08:46:27AM +0000, LEROY Christophe wrote:
> 
> 
> Le 18/11/2021 à 21:36, Kees Cook a écrit :
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> > 
> > Add a struct_group() for the spe registers so that memset() can correctly reason
> > about the size:
> > 
> >     In function 'fortify_memset_chk',
> >         inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
> >     >> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >       195 |    __write_overflow_field();
> >           |    ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> However, is it really worth adding that grouping ? Wouldn't it be 
> cleaner to handle evr[] and acc separately ? Now that we are using 
> unsafe variants of get/put user performance wouldn't be impacted.

I'm fine with whatever is desired here. I reworked an earlier version of
this patch based on mpe's feedback, so I can certain rework it again. :)

> 
> I have some doubts about things like:
> 
> 	unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
> 				    ELF_NEVRREG * sizeof(u32), failed);
> 
> Because as far as I can see, ELF_NEVRREG is 34 but mc_vregs is a table 
> of 33 u32 and is at the end of the structure:
> 
> 	struct mcontext {
> 		elf_gregset_t	mc_gregs;
> 		elf_fpregset_t	mc_fregs;
> 		unsigned long	mc_pad[2];
> 		elf_vrregset_t	mc_vregs __attribute__((__aligned__(16)));
> 	};
> 
> 	typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
> 
> 	# define ELF_NEVRREG	34	/* includes acc (as 2) */
> 	# define ELF_NVRREG	33	/* includes vscr */

I don't know these internals very well -- do you want me to change this
specifically somehow? With the BUILD_BUG_ON()s added, there's no binary
change here -- I wanted to make sure nothing was different in the
output.

-Kees

> 
> 
> 
> > ---
> >   arch/powerpc/include/asm/processor.h |  6 ++++--
> >   arch/powerpc/kernel/signal_32.c      | 14 +++++++++-----
> >   2 files changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> > index e39bd0ff69f3..978a80308466 100644
> > --- a/arch/powerpc/include/asm/processor.h
> > +++ b/arch/powerpc/include/asm/processor.h
> > @@ -191,8 +191,10 @@ struct thread_struct {
> >   	int		used_vsr;	/* set if process has used VSX */
> >   #endif /* CONFIG_VSX */
> >   #ifdef CONFIG_SPE
> > -	unsigned long	evr[32];	/* upper 32-bits of SPE regs */
> > -	u64		acc;		/* Accumulator */
> > +	struct_group(spe,
> > +		unsigned long	evr[32];	/* upper 32-bits of SPE regs */
> > +		u64		acc;		/* Accumulator */
> > +	);
> >   	unsigned long	spefscr;	/* SPE & eFP status */
> >   	unsigned long	spefscr_last;	/* SPEFSCR value on last prctl
> >   					   call or trap return */
> > diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> > index 00a9c9cd6d42..5e1664b501e4 100644
> > --- a/arch/powerpc/kernel/signal_32.c
> > +++ b/arch/powerpc/kernel/signal_32.c
> > @@ -527,16 +527,20 @@ static long restore_user_regs(struct pt_regs *regs,
> >   	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1));
> >   
> >   #ifdef CONFIG_SPE
> > -	/* force the process to reload the spe registers from
> > -	   current->thread when it next does spe instructions */
> > +	/*
> > +	 * Force the process to reload the spe registers from
> > +	 * current->thread when it next does spe instructions.
> > +	 * Since this is user ABI, we must enforce the sizing.
> > +	 */
> > +	BUILD_BUG_ON(sizeof(current->thread.spe) != ELF_NEVRREG * sizeof(u32));
> >   	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
> >   	if (msr & MSR_SPE) {
> >   		/* restore spe registers from the stack */
> > -		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
> > -				      ELF_NEVRREG * sizeof(u32), failed);
> > +		unsafe_copy_from_user(&current->thread.spe, &sr->mc_vregs,
> > +				      sizeof(current->thread.spe), failed);
> >   		current->thread.used_spe = true;
> >   	} else if (current->thread.used_spe)
> > -		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
> > +		memset(&current->thread.spe, 0, sizeof(current->thread.spe));
> >   
> >   	/* Always get SPEFSCR back */
> >   	unsafe_get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
> > 

-- 
Kees Cook

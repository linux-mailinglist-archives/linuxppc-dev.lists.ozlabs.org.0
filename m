Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9544E246
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 08:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hr8tm2GVxz2xCc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 18:13:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=pBt3Hhyh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=pBt3Hhyh; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hr8t43wpzz2xrN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 18:12:27 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id np3so6003951pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 23:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=LlRxdHVGeDy8D9okuSnembJr1NtoBLfddmx0/8MReoE=;
 b=pBt3HhyhuqtNPBVARnRi9gxRgoI5KOxdSlLJ01blWR/TeIhUxDjacrWEd9k3lMMF7N
 Gm+07zXgIzcD1uQ5iC5pgqKHxiLVwfzDoyoJsSTy14frbldMiVowAAMugJPZXZbuAeIX
 DECQo2uuEyeUcHdSDcXq1/F2gOHiYqE8gRrVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LlRxdHVGeDy8D9okuSnembJr1NtoBLfddmx0/8MReoE=;
 b=IakIV4Cfk1opzdw2H++Ejoiat/naDhmi1P4AnBqfBU8HWiOed6wJzTSHFZZD+KI4B+
 mQrRHa9Tf/ekIp5hZCmnyMVz99P3n8HVC//qhSExdMRgKtAuAnv/+lgVG2loSdc607LH
 loeUR6IYeytOqtmIX2yy2dYfVCjldk/JYnT37H1GAIm2VkdFKk57O/RbnA4aEVOJXSck
 68r6m4NOiuvVKLd/BxTLY7Hr88lUqVu27EdRlDuNg3uKPDv/GEL5V07jQBM4P4+04w+l
 s1g5EdX7SlIESqA+N01oKM1Das7V2D8o8kUrn3zS2FYMNosI8bUsnQa6MyIzaw+ODb5r
 uOaw==
X-Gm-Message-State: AOAM530ozsFwzsfUE3b03CSofu+qJvWdYN8xPIW+4yPuoXy2ozvLnCve
 CQ0XgJSyRJqA9QoqONKI0M8eraSzlMAHPw==
X-Google-Smtp-Source: ABdhPJzkhoGUj4dZ82csDc2RmKH/GQ9cwHw72kLf6VmJnA6c12ikLQ+4/DiJMTAH2wAfxrcOjJELMA==
X-Received: by 2002:a17:90b:4b0d:: with SMTP id
 lx13mr15713481pjb.146.1636701145683; 
 Thu, 11 Nov 2021 23:12:25 -0800 (PST)
Received: from localhost ([2001:4479:e000:e400:80e0:6b9:6120:335d])
 by smtp.gmail.com with ESMTPSA id c3sm5239830pfm.177.2021.11.11.23.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 23:12:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: [PATCH 1/2] powerpc/mce: Avoid using irq_work_queue() in realmode
In-Reply-To: <20211108083804.380142-1-ganeshgr@linux.ibm.com>
References: <20211108083804.380142-1-ganeshgr@linux.ibm.com>
Date: Fri, 12 Nov 2021 18:12:21 +1100
Message-ID: <87lf1t3l0q.fsf@linkitivity.dja.id.au>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

> In realmode mce handler we use irq_work_queue() to defer
> the processing of mce events, irq_work_queue() can only
> be called when translation is enabled because it touches
> memory outside RMA, hence we enable translation before
> calling irq_work_queue and disable on return, though it
> is not safe to do in realmode.
>
> To avoid this, program the decrementer and call the event
> processing functions from timer handler.
>

This is an interesting approach, and it would indeed be nice to clear up
the MCE handling a bit.

I have a few questions:

> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
> index 331d944280b8..187810f13669 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
>  unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>  extern void mce_common_process_ue(struct pt_regs *regs,
>  				  struct mce_error_info *mce_err);
> +extern void machine_check_raise_dec_intr(void);

Does this need an extern? I think that's the default...?

>  int mce_register_notifier(struct notifier_block *nb);
>  int mce_unregister_notifier(struct notifier_block *nb);
> +void mce_run_late_handlers(void);
>  #ifdef CONFIG_PPC_BOOK3S_64
>  void flush_and_reload_slb(void);
>  void flush_erat(void);
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
> index dc05a862e72a..f49180f8c9be 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -280,6 +280,7 @@ struct paca_struct {
>  #endif
>  #ifdef CONFIG_PPC_BOOK3S_64
>  	struct mce_info *mce_info;
> +	atomic_t mces_to_process;

This is in the PACA, which is supposed to be a per-cpu structure: hey
does it need to be atomic_t? Isn't there only one CPU accessing it?

Does this variable provide anything new compared to mce_nest_count or
mce_queue_count + mce_ue_count? It looks like
machine_check_process_queued_event will clear a queue based on value of
mce_queue_count and machine_check_process_ue_event will clear a queue
based on mce_ue_count...

I think (absent nested interrupts which I talk about below) it should be
the case that mces_to_process == mce_queue_count + mce_ue_count but I
might be wrong?

>  #endif /* CONFIG_PPC_BOOK3S_64 */
>  } ____cacheline_aligned;

  
>  /*
>   * Decode and save high level MCE information into per cpu buffer which
>   * is an array of machine_check_event structure.
> @@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
>  	if (mce->error_type == MCE_ERROR_TYPE_UE)
>  		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>  
> +	atomic_inc(&local_paca->mces_to_process);
> +

Is there any chance the decrementer will fire between when you do this
atomic_inc() and when you finish adding all the information to the mce
data structure in the remainder of save_mce_event? (e.g. filling in the
tlb_errror.effective_address field)?

(Or does save_mce_event get called with interrupts masked? I find it
very hard to remember what parts of the MCE code path happen under what
circumstances!)

>  	if (!addr)
>  		return;
>  


> @@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_struct *work)
>   * process pending MCE event from the mce event queue. This function will be
>   * called during syscall exit.

Is this comment still accurate if this patch is applied?

>   */
> -static void machine_check_process_queued_event(struct irq_work *work)
> +static void machine_check_process_queued_event(void)
>  {
>  	int index;
>  	struct machine_check_event *evt;
> @@ -363,6 +347,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
>  	}
>  }
>  
> +void mce_run_late_handlers(void)
> +{
> +	if (unlikely(atomic_read(&local_paca->mces_to_process))) {
> +		if (ppc_md.machine_check_log_err)
> +			ppc_md.machine_check_log_err();
> +		machine_check_process_queued_event();
> +		machine_check_ue_work();
> +		atomic_dec(&local_paca->mces_to_process);
> +	}
> +}

What happens if you get a nested MCE between log_err() and
process_queued_event()? If my very foggy memory of the MCE handling is
correct, we enable nested MCEs very early in the process because the
alternative is that a nested MCE will checkstop the box. So I think this
might be possible, albeit probably unlikely.

It looks like process_queued_event clears the entire MCE queue as
determined by the mce_queue_count. So, consider the following sequence
of events:

1. Take MCE 1. Save to queue, increment mce_queue_count, increment
   mces_to_process, set decrementer to fire.

2. Decrementer fires. mce_run_late_handlers is called.

3. mces_to_process = 1, so we call machine_check_log_err(), which prints
   (on pseries) the info for MCE 1.

4. Take MCE 2. This is saved to the queue, mce_queue_count is
   incremented, mces_to_process is incremented, and the decrementer is
   armed again.

5. We then leave the MCE interrupt context and return to the decrementer
   handling context. The next thing we do is we call
   m_c_e_process_queued_event(), which clears the entire queue (that is,
   MCEs 1 and 2):

	while (local_paca->mce_info->mce_queue_count > 0) {
		index = local_paca->mce_info->mce_queue_count - 1;
		evt = &local_paca->mce_info->mce_event_queue[index];

		if (evt->error_type == MCE_ERROR_TYPE_UE &&
		    evt->u.ue_error.ignore_event) {
			local_paca->mce_info->mce_queue_count--;
			continue;
		}
		machine_check_print_event_info(evt, false, false);
		local_paca->mce_info->mce_queue_count--;
	}

 6. We finish mce_run_late_handlers() and decrement mces_to_process,
    so it's now 1.

 7. The decrementer fires again, mces_to_process is 1, so we start
    processing again.

 8. We call machine_check_log_err again, it will now call the FWNMI code
    again and possibly print error 2.

 9. process_queued_event will be called again but mce_queue_count will
    be 0 so it it will bail out early.

I _think_ the worst that can happen - at least so long as pseries is the
only implementaion of machine_check_log_err - is that we will handle
MCE 2 before we query the firmware about it. That's probably benign, but
I am still concerned with the overall interaction around nested
interrupts.

>  void machine_check_print_event_info(struct machine_check_event *evt,
>  				    bool user_mode, bool in_guest)
>  {
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 934d8ae66cc6..2dc09d75d77c 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -597,6 +597,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>  		irq_work_run();
>  	}
>  
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	mce_run_late_handlers();
> +#endif
>
So we're now branching to a function in a different file and doing an
atomic read in every timer interrupt. Is this a hot path? Is there any
speed implication to doing this?

>  	now = get_tb();
>  	if (now >= *next_tb) {
>  		*next_tb = ~(u64)0;


> @@ -729,40 +724,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>  	error_type = mce_log->error_type;
>  
>  	disposition = mce_handle_err_realmode(disposition, error_type);
> -
> -	/*
> -	 * Enable translation as we will be accessing per-cpu variables
> -	 * in save_mce_event() which may fall outside RMO region, also
> -	 * leave it enabled because subsequently we will be queuing work
> -	 * to workqueues where again per-cpu variables accessed, besides
> -	 * fwnmi_release_errinfo() crashes when called in realmode on
> -	 * pseries.
> -	 * Note: All the realmode handling like flushing SLB entries for
> -	 *       SLB multihit is done by now.
> -	 */
>  out:
> -	msr = mfmsr();
> -	mtmsr(msr | MSR_IR | MSR_DR);
> -
>  	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
>  					      disposition);

Now you are not in virtual mode/translations on when you are calling
mce_handle_err_virtmode(). From the name, I thought that
mce_handle_err_virtmode() would assume that you are in virtual mode?
Does the function assume that? If so is it safe to call it in real mode?
If not, should we rename it as part of this patch?

> -
> -	/*
> -	 * Queue irq work to log this rtas event later.
> -	 * irq_work_queue uses per-cpu variables, so do this in virt
> -	 * mode as well.
> -	 */
> -	irq_work_queue(&mce_errlog_process_work);
> -
> -	mtmsr(msr);
> -
>  	return disposition;
>  }

Kind regards,
Daniel

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEC37F527
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 12:00:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgnGD33XBz308T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 20:00:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=owiOwiXF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=owiOwiXF; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgnFS0Jngz2xv4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 19:59:36 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id q2so21189302pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cb7mF8mUCzm5FHZWYdQMr07R0wZnGeUq5VRRLke62V8=;
 b=owiOwiXFj8Pup6Y3YnGQ4T9GNIv4yrXH5ktI2w/2OCDgEHoHWN0eqjy4W5LTPKAJu5
 Iami60jOS4z5FQ6xKgpXkAlC+d1md2NeuwEf4/1kyp1vVHGknEfBiQ6V0OELa7cUbnAf
 +gLJKfK0qkw3OZ33a39EdJw7ckfzND/h6GaDM3YiBvtxqbKfAES6firL6DGUviTVG2V1
 Rz5XizrlB7IDJtt3664xEFeLP4YWKINXG5rYgDcJEvAEfMe3MFP8Z1CDgJsPr0Tq1cWR
 U0ZYDo0ri+YdgrzolqQMi5qy+fx6Smf391HH8fCiUgW0WKQymPV9qZqWey7wcmNCCkUF
 jBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cb7mF8mUCzm5FHZWYdQMr07R0wZnGeUq5VRRLke62V8=;
 b=QCnK2H6HH+bezwIPGDNZAcYjVwpbefpvWBFugBa8hHmlA/6fIz6+m7ahdTRuwyj56m
 AnNeTGeztAxUCDSms4G67+lbYNeimfYOkEUJ0Re0Dds4LPRporymW73tIgxaT0LLHi1t
 TVJ9PLOXWIzFyazW9wkUCttkAoDmNbQBkp8xsL7Amrez9TCxivlqE60vSO+MG5UzWLxS
 TSA3mfKzcxSc09Xg5WuaOOB5Ad1+M32eABNAfKtI/XLhnEHs4PomACxGdWHby8Dlr621
 uZ7AzKvUAE2ACDNSQHMd1WUX5xjrahHD856CJ0ww/7wwauAmiRyVKNcyj2f/tLRcBsZn
 YzWg==
X-Gm-Message-State: AOAM530OfrbZfBt7x0a1woRR3VtszjcWz1eSoSNrpYpcpwVhfpkKrzKh
 3yi0tpe7zESFoV581EccvwGkKA==
X-Google-Smtp-Source: ABdhPJz2N1v8n9/+Xm0eEysEdWwiLUm2vnBr4+8KkxhoTIrZasVfqKHwaDt6Vvltf/jf1wIiuiGElw==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr7603890pjq.179.1620899969034; 
 Thu, 13 May 2021 02:59:29 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id g13sm1844732pfi.18.2021.05.13.02.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:59:28 -0700 (PDT)
Message-ID: <06c92248-b4ff-18a6-b241-76a98def41fb@ozlabs.ru>
Date: Thu, 13 May 2021 19:59:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [RFC 01/10] powerpc/rtas: new APIs for busy and extended delay
 statuses
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
 <20210504030358.1715034-2-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210504030358.1715034-2-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>,
 tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/05/2021 13:03, Nathan Lynch wrote:
> Add new APIs for handling busy (-2) and extended delay
> hint (9900...9905) statuses from RTAS. These are intended to be
> drop-in replacements for existing uses of rtas_busy_delay().
> 
> A problem with rtas_busy_delay() and rtas_busy_delay_time() is that
> they consider -2/busy to be equivalent to 9900 (wait 1ms). In fact,
> the OS should call again as soon as it wants on -2, which at least on
> PowerVM means RTAS is returning only to uphold the general requirement
> that RTAS must return control to the OS in a "timely fashion" (250us).
> 
> Combine this with the fact that msleep(1) actually sleeps for more
> like 20ms in practice: on busy VMs we schedule away for much longer
> than necessary on -2 and 9900.
> 
> This is fixed in rtas_sched_if_busy(), which uses usleep_range() for
> small delay hints, and only schedules away on -2 if there is other
> work available. It also refuses to sleep longer than one second
> regardless of the hinted value, on the assumption that even longer
> running operations can tolerate polling at 1HZ.
> 
> rtas_spin_if_busy() and rtas_force_spin_if_busy() are provided for
> atomic contexts which need to handle busy status and extended delay
> hints.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/rtas.h |   4 +
>   arch/powerpc/kernel/rtas.c      | 168 ++++++++++++++++++++++++++++++++
>   2 files changed, 172 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 9dc97d2f9d27..555ff3290f92 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -266,6 +266,10 @@ extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
>   extern unsigned int rtas_busy_delay_time(int status);
>   extern unsigned int rtas_busy_delay(int status);
>   
> +bool rtas_sched_if_busy(int status);
> +bool rtas_spin_if_busy(int status);
> +bool rtas_force_spin_if_busy(int status);
> +
>   extern int early_init_dt_scan_rtas(unsigned long node,
>   		const char *uname, int depth, void *data);
>   
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 6bada744402b..4a1dfbfa51ba 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -519,6 +519,174 @@ unsigned int rtas_busy_delay(int status)
>   }
>   EXPORT_SYMBOL(rtas_busy_delay);
>   
> +/**
> + * rtas_force_spin_if_busy() - Consume a busy or extended delay status
> + *                             in atomic context.
> + * @status: Return value from rtas_call() or similar function.
> + *
> + * Use this function when you cannot avoid using an RTAS function
> + * which may return an extended delay hint in atomic context. If
> + * possible, use rtas_spin_if_busy() or rtas_sched_if_busy() instead
> + * of this function.
> + *
> + * Return: True if @status is -2 or 990x, in which case
> + *         rtas_spin_if_busy() will have delayed an appropriate amount
> + *         of time, and the caller should call the RTAS function
> + *         again. False otherwise.
> + */
> +bool rtas_force_spin_if_busy(int status)

rtas_force_delay_if_busy()? neither this one nor rtas_spin_if_busy() 
actually spins.


> +{
> +	bool was_busy = true;
> +
> +	switch (status) {
> +	case RTAS_BUSY:
> +		/* OK to call again immediately; do nothing. */
> +		break;
> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> +		mdelay(1);
> +		break;
> +	default:
> +		was_busy = false;
> +		break;
> +	}
> +
> +	return was_busy;
> +}
> +
> +/**
> + * rtas_spin_if_busy() - Consume a busy status in atomic context.
> + * @status: Return value from rtas_call() or similar function.
> + *
> + * Prefer rtas_sched_if_busy() over this function. Prefer this
> + * function over rtas_force_spin_if_busy(). Use this function in
> + * atomic contexts with RTAS calls that are specified to return -2 but
> + * not 990x. This function will complain and execute a minimal delay
> + * if passed a 990x status.
> + *
> + * Return: True if @status is -2 or 990x, in which case
> + *         rtas_spin_if_busy() will have delayed an appropriate amount
> + *         of time, and the caller should call the RTAS function
> + *         again. False otherwise.
> + */
> +bool rtas_spin_if_busy(int status)

rtas_delay_if_busy()?


> +{
> +	bool was_busy = true;
> +
> +	switch (status) {
> +	case RTAS_BUSY:
> +		/* OK to call again immediately; do nothing. */
> +		break;
> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> +		/*
> +		 * Generally, RTAS functions which can return this
> +		 * status should be considered too expensive to use in
> +		 * atomic context. Change the calling code to use
> +		 * rtas_sched_if_busy(), or if that's not possible,
> +		 * use rtas_force_spin_if_busy().
> +		 */
> +		pr_warn_once("%pS may use RTAS call in atomic context which returns extended delay.\n",
> +			     __builtin_return_address(0));
> +		mdelay(1);
> +		break;
> +	default:
> +		was_busy = false;
> +		break;
> +	}
> +
> +	return was_busy;
> +}
> +
> +static unsigned long extended_delay_ms(unsigned int status)

extended_delay_to_ms()?

> +{
> +	unsigned int extdelay;
> +	unsigned int order;
> +	unsigned int ms;
> +
> +	extdelay = clamp((int)status, RTAS_EXTENDED_DELAY_MIN, RTAS_EXTENDED_DELAY_MAX);
> +	WARN_ONCE(extdelay != status, "%s passed invalid status %u\n", __func__, status);
> +
> +	order = status - RTAS_EXTENDED_DELAY_MIN;


Using extdelay instead of status seems safer.


> +	for (ms = 1; order > 0; order--)
> +		ms *= 10;
> +
> +	return ms;
> +}
> +
> +static void handle_extended_delay(unsigned int status)

rtas_sleep()? rtas_extended_delay()?


> +{
> +	unsigned long usecs;
> +
> +	usecs = 1000 * extended_delay_ms(status);


usecs could be msecs, you would need fewer zeroes and would not need 
DIV_ROUND_UP below...


> +
> +	/*
> +	 * If we have no other work pending, there's no reason to
> +	 * sleep.
> +	 */
> +	if (!need_resched())
> +		return;
> +
> +	/*
> +	 * The extended delay hint can be as high as 100
> +	 * seconds. Surely any function returning such a status is
> +	 * either buggy or isn't going to be significantly slowed by
> +	 * us polling at 1HZ. Clamp the sleep time to one second.
> +	 */
> +	usecs = clamp(usecs, 1000UL, 1000000UL);
> +
> +	/*
> +	 * The delay hint is an order-of-magnitude suggestion, not a
> +	 * minimum. It is fine, possibly even advantageous, for us to
> +	 * pause for less time than suggested. For small values, use
> +	 * usleep_range() to ensure we don't sleep much longer than
> +	 * actually suggested.
> +	 *
> +	 * See Documentation/timers/timers-howto.rst for explanation
> +	 * of the threshold used here.
> +	 */
> +	if (usecs <= 20000)
> +		usleep_range(usecs / 2, 2 * usecs);

... and this would be usleep_range(msecs*500, msecs*2000).


> +	else
> +		msleep(DIV_ROUND_UP(usecs, 1000));
> +}
> +
> +/**
> + * rtas_sched_if_busy() - Consume a busy or extended delay status.
> + * @status: Return value from rtas_call() or similar function.
> + *
> + * Prefer this function over rtas_spin_if_busy().
> + *
> + * Context: This function may sleep.
> + *
> + * Return: True if @status is -2 or 990x, in which case
> + *         rtas_sched_if_busy() will have slept an appropriate amount
> + *         of time, and the caller should call the RTAS function
> + *         again. False otherwise.
> + */
> +bool rtas_sched_if_busy(int status)
> +{
> +	bool was_busy = true;
> +
> +	might_sleep();
> +
> +	switch (status) {
> +	case RTAS_BUSY:
> +		/*
> +		 * OK to call again immediately. Schedule if there's
> +		 * other work to do, but no sleep is necessary.
> +		 */
> +		cond_resched();
> +		break;
> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> +		handle_extended_delay(status);
> +		break;
> +	default:
> +		was_busy = false;
> +		break;
> +	}
> +
> +	return was_busy;
> +}

Throughout the series this one is called instead of simple spinning, 
03/10..05/10, and some of those have in_interrupt() checks for a reason 
(which I do not know but nevertheless) so they may be called with 
interrupts disabled which in turn means we should not be calling 
cond_resched() unconditionally. I am told this is should be done:


if (!preemptible())
	/* print warning, don't sleep or cond_resched */



> +
>   static int rtas_error_rc(int rtas_rc)
>   {
>   	int rc;
> 

-- 
Alexey

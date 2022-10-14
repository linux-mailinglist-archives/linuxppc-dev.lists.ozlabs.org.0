Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E905FE633
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:20:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpRqS5d3Dz3cds
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fzAPlEp3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fzAPlEp3;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpRms6vr0z3cBS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 11:18:05 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id r18so2913345pgr.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSBzZSb65gn/j9NaItoSfk3CggK32TvwZMOVPNUDON0=;
        b=fzAPlEp3SxmISYEPOFkBcOj8BgcwWMj7ob5kZjCVyjI2TefmMoRom8Cjr9n0UoIsb5
         ksk2RCQDNmL0izlAjEU/m6PLEu+vrT97GNEZ/t08Vn4ES4qYZjaIMaR2pedNrwZ14Psw
         FA1PPT37QtvPtj89Y4SFG3KT2x/9Ep1PuaunAQVGeDm7TfrNqgEBEv58Og+O1QmXQGVm
         pWdB/DsobTal3hHB0EZwFX7hNIo0h7KLbY+KO5/HcUIEzZZU5PpT9U7c7b39Ulig+Dls
         aKlilIfewOefzEk9CP44oL2u6fbU0+lWnXl3CAM6/9doTSoLACoIRa+MUP2/JvlfNzA1
         sbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSBzZSb65gn/j9NaItoSfk3CggK32TvwZMOVPNUDON0=;
        b=32gz9+RIZBw/kNZgUKdmDKSyIGVsi4FhbKZyHw9TYBc9xUBXYpSnATV9grs7u2Vi0y
         3aC6sgY0BVK88dbsZ6l7ijYwVHnhC7NEgEbEpTQBW5PCY5kyHCfEVpPyoA+HVgT/WcUS
         OAxzc6PKZQ4bHijfR25GZ2BspAVLyE2Z3J7fApbzD1biZxNWwZCwV2MVvwK5+Vqtym2M
         REgvJAO3eS/QwfrBlqJj5B8xzjqXrphZ6NSirbM7R/CeFZKHizZygXKjU+7JpT7h9ikf
         2V/VF9+0k4k7eAzJw+bzGIQ5Pox3Wu2/dv5SrlvrJ9ql6ha4pFjIQf9vej2hRdvhAdli
         gn1w==
X-Gm-Message-State: ACrzQf2nJq8rKco/qMQe005XN6a1lDif/abQrup6aaEtU6rmYURK6T6l
	jD62munor7vNqkF8W+vvS4gaOZx7EQs=
X-Google-Smtp-Source: AMsMyM7+BvA8w34L0RzIlgyhhbWpSu7387UxVj9N/Wf98XMIGKXZg1e1vjz9kwAj9aqwX8BiXfM/1A==
X-Received: by 2002:a65:6ccd:0:b0:439:2033:6ee with SMTP id g13-20020a656ccd000000b00439203306eemr2175776pgw.271.1665706682927;
        Thu, 13 Oct 2022 17:18:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o7-20020a625a07000000b00562496395besm275632pfb.170.2022.10.13.17.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 17:18:02 -0700 (PDT)
Date: Thu, 13 Oct 2022 17:18:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: fix reschedule bug in KUAP-unlocked user
 copy
Message-ID: <20221014001801.GC412544@roeck-us.net>
References: <20221013151647.1857994-1-npiggin@gmail.com>
 <20221013151647.1857994-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151647.1857994-3-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 01:16:47AM +1000, Nicholas Piggin wrote:
> schedule must not be explicitly called while KUAP is unlocked, because
> the AMR register will not be saved across the context switch on 64s
> (preemption is allowed because that is driven by interrupts which do
> save the AMR).
> 
> exit_vmx_usercopy() runs inside an unlocked user access region, and it
> calls preempt_enable() which will call schedule() if need_resched() was
> set while non-preemptible. This can cause tasks to run unprotected when
> the should not, and can cause the user copy to be improperly blocked
> when scheduling back to it.
> 
> Fix this by avoiding the explicit resched for preempt kernels by
> generating an interrupt to reschedule the context if need_resched() got
> set.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/lib/vmx-helper.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index f76a50291fd7..d491da8d1838 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -36,7 +36,17 @@ int exit_vmx_usercopy(void)
>  {
>  	disable_kernel_altivec();
>  	pagefault_enable();
> -	preempt_enable();
> +	preempt_enable_no_resched();
> +	/*
> +	 * Must never explicitly call schedule (including preempt_enable())
> +	 * while in a kuap-unlocked user copy, because the AMR register will
> +	 * not be saved and restored across context switch. However preempt
> +	 * kernels need to be preempted as soon as possible if need_resched is
> +	 * set and we are preemptible. The hack here is to schedule a
> +	 * decrementer to fire here and reschedule for us if necessary.
> +	 */
> +	if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
> +		set_dec(1);
>  	return 0;
>  }
>  
> -- 
> 2.37.2
> 

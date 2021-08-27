Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 706293F9526
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 09:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwryG2PQXz307f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 17:32:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=eb9xpFF7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=eb9xpFF7; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwrxX1WfGz2yJP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 17:31:25 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id r13so4570934pff.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 00:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vRZE7zKJv+9hDRC0MFS4/Swo0j6yp1hd8zI+3AQJ0hg=;
 b=eb9xpFF7B/N8t/PF+CKZB/xDAEXMkzEsAkBsK7dLWuU0qiIibFGprQq8Njh1q1YrVQ
 HNbFJylFCZirKZDAISO/iBqQzUlNhqSWtVz/Nx+syYVPkJacXxc4y42vuDcAGxmujv6x
 bdzr0t45ottiSoiudxjKsZcdAiohWTO6s3Pxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vRZE7zKJv+9hDRC0MFS4/Swo0j6yp1hd8zI+3AQJ0hg=;
 b=GBOeKIHCNN1NfYfaA9Gw1SaPgF7DaRPjI+BASaPqwGxmVElZxQLZqNwbIdPUfpq80f
 soUvT2RcdP41oadBUVlrVOOYX4f0VXX85AN5Lv1HIIA7XzUPUKKnhVG2cczmAIeElrRX
 od/dNzCXJpVGprXJupfrwfgPKVII0RJFGvWmJzhhzleIOoqmBQlvv+g46z94KMwG2ql6
 vdybzjD86QwlspVZinjingEy5VF1VbAUAeQ23lLZbqovUk3ortXs/IJwfhc2ysZR/et5
 2Og18KiNm/z31iwt4l0vAhoPGhx1Osdb4oriVhPKXmZSgoj1clYRScvbJGlPQC2jHw+Y
 NBsA==
X-Gm-Message-State: AOAM530Q9OJZSXmaFzZLxM8j2NyAI6Aq/8bSae87/Wf0UTXf94L6zJPP
 hPL4S6fPXlb0EGOl4NXCWnG9Rl3DbZn20g==
X-Google-Smtp-Source: ABdhPJyYqy/mbPghtydK+/AigtsUW/MwvaKKYWbpGBz0vwtStrVWJ6KRX/t1r27L3wqwHBtD09fxgw==
X-Received: by 2002:a63:391:: with SMTP id 139mr6879999pgd.410.1630049482348; 
 Fri, 27 Aug 2021 00:31:22 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:d5b:df05:c58c:4088])
 by smtp.gmail.com with ESMTPSA id o9sm5502268pfh.217.2021.08.27.00.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 00:31:22 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/4] powerpc/64: handle MSR EE and RI in interrupt
 entry wrapper
In-Reply-To: <20210825123714.706201-2-npiggin@gmail.com>
References: <20210825123714.706201-1-npiggin@gmail.com>
 <20210825123714.706201-2-npiggin@gmail.com>
Date: Fri, 27 Aug 2021 17:31:19 +1000
Message-ID: <87mtp3e43c.fsf@linkitivity.dja.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> Similarly to the system call change in the previous patch, the mtmsrd to

I don't actually know what patch this was - I assume it's from a series
that has since been applied?

> enable RI can be combined with the mtmsrd to enable EE for interrupts
> which enable the latter, which tends to be the important synchronous
> interrupts (i.e., page faults).
>
> Do this by enabling EE and RI together at the beginning of the entry
> wrapper if PACA_IRQ_HARD_DIS is clear, and just enabling RI if it is set
> (which means something wanted EE=0).


> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 6b800d3e2681..e3228a911b35 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -148,9 +148,21 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>  #endif
>  
>  #ifdef CONFIG_PPC64
> -	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
> +	bool trace_enable = false;
> +
> +	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
> +		if (irq_soft_mask_set_return(IRQS_DISABLED) == IRQS_ENABLED)

In the previous code we had IRQS_ALL_DISABLED, now we just have
IRQS_DISABLED. Is that intentional?

> +			trace_enable = true;
> +	} else {
> +		irq_soft_mask_set(IRQS_DISABLED);
> +	}
> +	/* If the interrupt was taken with HARD_DIS set, don't enable MSR[EE] */
> +	if (local_paca->irq_happened & PACA_IRQ_HARD_DIS)
> +		__hard_RI_enable();
> +	else
> +		__hard_irq_enable();
> +	if (trace_enable)
>  		trace_hardirqs_off();
> -	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
>  
>  	if (user_mode(regs)) {
>  		CT_WARN_ON(ct_state() != CONTEXT_USER);


> @@ -901,11 +892,6 @@ INT_DEFINE_BEGIN(system_reset)
>  	IVEC=0x100
>  	IAREA=PACA_EXNMI
>  	IVIRT=0 /* no virt entry point */
> -	/*
> -	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
> -	 * being used, so a nested NMI exception would corrupt it.
> -	 */
> -	ISET_RI=0
>  	ISTACK=0
>  	IKVM_REAL=1
>  INT_DEFINE_END(system_reset)

> @@ -986,8 +972,6 @@ EXC_COMMON_BEGIN(system_reset_common)

Right before this change, there's a comment that reads:

	/*
	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
	 * to recover, but nested NMI will notice in_nmi and not recover
    ...

You've taken out the bit that enables MSR_RI, which means the comment is
no longer accurate.

Beyond that, I'm still trying to follow all the various changes in code
flows. It seems to make at least vague sense: we move the setting of
MSR_RI from the early asm to interrupt*enter_prepare. I'm just
struggling to convince myself that when we hit the underlying handler
that the RI states all line up.

Kind regards,
Daniel


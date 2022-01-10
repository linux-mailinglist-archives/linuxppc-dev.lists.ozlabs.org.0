Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238AC488EE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 04:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXJyj70w2z2ybK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:21:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GXBF+LW6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GXBF+LW6; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXJxz31SJz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 14:21:08 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so20725823pjf.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jan 2022 19:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qIzdLZrwJhMt1nWE11pWljtXDkVev1UMLH6KZdKL0mc=;
 b=GXBF+LW6+nuKGzsbZWnyF4QOoYsv1mUypepag0dkAOn7tax/E5NgCcnyL0OIt5KL5I
 Bbvm0nBc3I0vQON/OwqbYAxY0Kv0GdaNGktrg379VCmlvGLOCqrNNDA90hDas7hyH7/p
 iedLBq0BG26+8UH/fphJTtJaTGL3VIScFoOcIa9cecvWCRJXRN+JofG6mFkIkaO1NtmM
 9WuKM1TamKLOo8JdYP232PCf8zmeisZi8du4P4+0KeslD1JBQPKHf2Xw9xKp1tSDCWyR
 IIHNnfhdU2c3nOvxGDfIas2ZBRQL1l2qykjstzqCn9h30bMJDlrUpv73wdMvju4AeKz4
 8gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qIzdLZrwJhMt1nWE11pWljtXDkVev1UMLH6KZdKL0mc=;
 b=Yc+34JGepVHVOzMSsCQ83tFqyqw/r8n23xolFhP3oG/dH+DniuJyoFzFUTdpg0WXTQ
 uUzvZ/HOdYYixriG7dYPTYY4+5bwFCw4A4q6+tjp6WH0f7uHxzi9+fEaYwHXdw/rsd59
 KXQvjyVacTo4ITayBF0/WLHNa1COcgbznIYstpw17X6xrtrmu1bgPoEWOQdjx2C8cwut
 p69lQuY91MWNu1UWibjSH1IW4GQyKJpiityQ8RimDd7VierDPwMePinLvyTi/olcoY0r
 af3xoWJRITmmrFxYtOTnizwu3NAMO8p3gl4YgCJFwbR9evvEYy+bI31Dt2uh9zQm9Lph
 NZCw==
X-Gm-Message-State: AOAM5321j8eK/wU2CL7e6vuNZyDj2zmllbd50Aw79Q1Q5qqacYnpR4Kp
 sx56RlVW255783Rleds317hWPg==
X-Google-Smtp-Source: ABdhPJyMJ7nGOq9baGtL0KdQ8RqTjf5qKgEMXjusMZJZT1KPNJSquC3EqQFtwZfmjaUUKv3wN2B90A==
X-Received: by 2002:a17:90a:191a:: with SMTP id
 26mr2086001pjg.50.1641784864100; 
 Sun, 09 Jan 2022 19:21:04 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id h5sm4942613pfi.46.2022.01.09.19.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 19:21:03 -0800 (PST)
Message-ID: <2d299fdf-1876-61a2-5569-38aab9747ff4@ozlabs.ru>
Date: Mon, 10 Jan 2022 14:20:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v3 4/6] KVM: PPC: mmio: Queue interrupt at
 kvmppc_emulate_mmio
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-5-farosas@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220107210012.4091153-5-farosas@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/01/2022 08:00, Fabiano Rosas wrote:
> If MMIO emulation fails, we queue a Program interrupt to the
> guest. Move that line up into kvmppc_emulate_mmio, which is where we
> set RESUME_GUEST/HOST. This allows the removal of the 'advance'
> variable.
> 
> No functional change, just separation of responsibilities.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/kvm/emulate_loadstore.c | 8 +-------
>   arch/powerpc/kvm/powerpc.c           | 2 +-
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
> index 48272a9b9c30..4dec920fe4c9 100644
> --- a/arch/powerpc/kvm/emulate_loadstore.c
> +++ b/arch/powerpc/kvm/emulate_loadstore.c
> @@ -73,7 +73,6 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>   {
>   	u32 inst;
>   	enum emulation_result emulated = EMULATE_FAIL;
> -	int advance = 1;
>   	struct instruction_op op;
>   
>   	/* this default type might be overwritten by subcategories */
> @@ -355,15 +354,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>   		}
>   	}
>   
> -	if (emulated == EMULATE_FAIL) {
> -		advance = 0;
> -		kvmppc_core_queue_program(vcpu, 0);
> -	}
> -
>   	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
>   
>   	/* Advance past emulated instruction. */
> -	if (advance)
> +	if (emulated != EMULATE_FAIL)
>   		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
>   
>   	return emulated;
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 4d7d0d080232..6daeea4a7de1 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -307,7 +307,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>   		u32 last_inst;
>   
>   		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
> -		/* XXX Deliver Program interrupt to guest. */
> +		kvmppc_core_queue_program(vcpu, 0);
>   		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>   		r = RESUME_HOST;
>   		break;

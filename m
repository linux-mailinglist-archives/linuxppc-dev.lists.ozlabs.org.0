Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5F34368E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 03:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3dHB2bhhz2yxc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 13:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=MgZbZ0AG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MgZbZ0AG; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3dGl6Bsmz2xxj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 13:09:16 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so7709238pjv.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 19:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JFsejohb4GGy/6+7vYAcx2N5NH66/8Q56swBejy1LwA=;
 b=MgZbZ0AGt6UFhsgm0JNdpxwurPJpzzt+1AlV6uizLp6F7rD+Yx8nk6r5Qx/y9Xgx0R
 VIFGoQGlpgxP/kR4MAMmHEmxuExmZXiZTyNbIbLXG0i72q83mJ+rog3GmLzMCrZVgQP/
 Lb40hY6N2JuMA5gsyU7UZ2xJCwPKw38Nx97o+hO0UyewpS+9xNrNx7lHr12HkEKEhYou
 Rb2bZupso77M4F9b92MFmWzpRyHWQBda5KLQnKDBT4BlQrxUR7yynxL3VzcEahGcKHaS
 YgKMh3lpa7U8DntgUlVfzgvZXTsC3lAg9Ex1hoUxEEdNoIaH7UI2a//6rVyO38bUV+Sl
 w1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JFsejohb4GGy/6+7vYAcx2N5NH66/8Q56swBejy1LwA=;
 b=pKWe1X8+ZPJN1Qn+/wqyKxcLVQK9V+XV5E1PSpQqFr/Mei+OQuGQs6afiPLn0Jr5Dg
 Cd+2nq8mH7aW65hE2QRTFDamnAg/9s5hjHdBOP/jaVdSqCwXpbjfIFPeB6qvdycG0xLE
 HVSao3Yi384LGWxSWoTpCDYPc56TcjbNbM5ozg8kROtL1bfCBPYAmhE46ovsLj0bagiF
 AKwkih15/I+fM64D4VrwotJHEY2hRkR1Ae8952ZEw92xszITsAmejlU4NeQcIKaElCiC
 ixcMqQzOZ+GxP7CXdS6oa+sdUEtrmUhVoDatwO+ERbdHBdKn0FwBT1NDqTCAMJQ/jITG
 7JvQ==
X-Gm-Message-State: AOAM533FjGLOiKxV48XKnAr0xYyxsCiwODfuBCKzGPvmzj8Wa7yeGy5F
 9eatzLY/fSAA6wsZdFc1X8Md9FMPQk6GbTjM
X-Google-Smtp-Source: ABdhPJz07Zkr6k/xW/2fxIf9ok3d9BQRE7rOcVy4fzW03RPA/khHfhehu+gdC2YFx7yJlyUYsofT/A==
X-Received: by 2002:a17:902:ea0e:b029:e4:81d4:ddae with SMTP id
 s14-20020a170902ea0eb02900e481d4ddaemr25204484plg.12.1616378952366; 
 Sun, 21 Mar 2021 19:09:12 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id h6sm11170531pfb.157.2021.03.21.19.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 19:09:11 -0700 (PDT)
Message-ID: <3185a6cf-9eaa-8321-27f2-134ad70c7df8@ozlabs.ru>
Date: Mon, 22 Mar 2021 13:09:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 15/41] KVM: PPC: Book3S 64: Minimise hcall handler
 calling convention differences
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-16-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-16-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/03/2021 02:06, Nicholas Piggin wrote:
> This sets up the same calling convention from interrupt entry to
> KVM interrupt handler for system calls as exists for other interrupt
> types.
> 
> This is a better API, it uses a save area rather than SPR, and it has
> more registers free to use. Using a single common API helps maintain
> it, and it becomes easier to use in C in a later patch.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> ---
>   arch/powerpc/kernel/exceptions-64s.S | 16 +++++++++++++++-
>   arch/powerpc/kvm/book3s_64_entry.S   | 22 +++-------------------
>   2 files changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b4eab5084964..ce6f5f863d3d 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1892,8 +1892,22 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
>   
>   #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
>   TRAMP_REAL_BEGIN(kvm_hcall)
> +	std	r9,PACA_EXGEN+EX_R9(r13)
> +	std	r11,PACA_EXGEN+EX_R11(r13)
> +	std	r12,PACA_EXGEN+EX_R12(r13)
> +	mfcr	r9
>   	mfctr	r10
> -	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
> +	std	r10,PACA_EXGEN+EX_R13(r13)
> +	li	r10,0
> +	std	r10,PACA_EXGEN+EX_CFAR(r13)
> +	std	r10,PACA_EXGEN+EX_CTR(r13)
> +BEGIN_FTR_SECTION
> +	mfspr	r10,SPRN_PPR
> +	std	r10,PACA_EXGEN+EX_PPR(r13)
> +END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> +
> +	HMT_MEDIUM
> +
>   #ifdef CONFIG_RELOCATABLE
>   	/*
>   	 * Requires __LOAD_FAR_HANDLER beause kvmppc_hcall lives
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index 7a6b060ceed8..129d3f81800e 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -14,24 +14,9 @@
>   .global	kvmppc_hcall
>   .balign IFETCH_ALIGN_BYTES
>   kvmppc_hcall:
> -	/*
> -	 * This is a hcall, so register convention is as
> -	 * Documentation/powerpc/papr_hcalls.rst, with these additions:
> -	 * R13		= PACA
> -	 * guest R13 saved in SPRN_SCRATCH0
> -	 * R10		= free
> -	 */
> -BEGIN_FTR_SECTION
> -	mfspr	r10,SPRN_PPR
> -	std	r10,HSTATE_PPR(r13)
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -	HMT_MEDIUM
> -	mfcr	r10
> -	std	r12,HSTATE_SCRATCH0(r13)
> -	sldi	r12,r10,32
> -	ori	r12,r12,0xc00
> -	ld	r10,PACA_EXGEN+EX_R10(r13)
> -	b	do_kvm_interrupt
> +	ld	r10,PACA_EXGEN+EX_R13(r13)
> +	SET_SCRATCH0(r10)
> +	li	r10,0xc00
>   
>   .global	kvmppc_interrupt
>   .balign IFETCH_ALIGN_BYTES
> @@ -62,7 +47,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   	ld	r10,EX_R10(r11)
>   	ld	r11,EX_R11(r11)
>   
> -do_kvm_interrupt:
>   	/*
>   	 * Hcalls and other interrupts come here after normalising register
>   	 * contents and save locations:
> 

-- 
Alexey

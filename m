Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6A335997C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGtRk4ql0z3bwL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=eqIhnDSz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=eqIhnDSz; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGtRH4ZxWz2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:40:41 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id nh5so2609750pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Apr 2021 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YmU4UiRVkN1jsGVU6rQrNh3lTqcstMlm4Jq3GPaOiBg=;
 b=eqIhnDSzpDVsrQPF0Ue5XOV2jhZhuABTesoYNs+8JkS5P/26nSC6kEcLaTg6hhRs+t
 EBn18+xL8oMlFGcuH9Ho7V6URI56y7m4z5vHbYa7+1WeuFI6HTryEpAMA0spRWinOHbu
 TjZj1V6txt49AJklDB7yEWntiF/Hwc/BSpVZQSWr8dxlfjBpaDW+sv0KA/ssn8lgSXy3
 VEtN5j/XE1PqAa2I3SRlaFueEtpOSlPLqABVnvwwvALloBokUoGBWMUNZBTiOvzFYR03
 XvduPait262wk1qAQkFlT+rNEQ0U4oTfGjEYo9XgS9sV+zV1+f2d85IwmJffEFNWhQR6
 LxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YmU4UiRVkN1jsGVU6rQrNh3lTqcstMlm4Jq3GPaOiBg=;
 b=IkoUkFeomMUTaKgRQ7hrDLfZFD9WISVho3zgxcfo5czEeuQOSAAxk1mgdgmeXFcwRO
 SqQM+BdWi93yl0vZd/Tevab5JAzXnGdwInuAVMluPhiyn8tIAoTcA+XudcEsjo/at+Mh
 AfplccbH0XqT+nYsAeE1LK7s/dDHAEesCiSp4q6s3a6GEyqgLl8s11X89l+E0RHeg6G7
 3OnsXFsIvnY/iFWwfs1/Iv5J0tus2Q+FEsyUvcH6wkLftunrMWufKWpNaUXHuu00nWVb
 D7ChWFTzC9HOSNUIFcP1cO1+22U6tG5txSLminfkuWbefF1Zq8YH7OiW+SK3uVqEOF+0
 rAoA==
X-Gm-Message-State: AOAM532s3mZLNptvvbFAEIcV98Ssxz60s7NvwNlBBcTyPVoJozHqX0+I
 RxHaQehh63ellQXkgKNphkTmEA==
X-Google-Smtp-Source: ABdhPJzBJnlNgNVxBVoaHcGTjRjTuUWT11L073en1sQkvqt5WFQV4jpmf9QTqoOhmXIVyzYlH7u8eQ==
X-Received: by 2002:a17:902:f686:b029:e5:de44:af60 with SMTP id
 l6-20020a170902f686b02900e5de44af60mr12117445plg.64.1617961237726; 
 Fri, 09 Apr 2021 02:40:37 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id f135sm1721237pfa.102.2021.04.09.02.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 02:40:36 -0700 (PDT)
Message-ID: <19d2d94d-8c7e-70ae-1a40-97c67654a373@ozlabs.ru>
Date: Fri, 9 Apr 2021 19:40:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v6 33/48] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-34-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210405011948.675354-34-npiggin@gmail.com>
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



On 05/04/2021 11:19, Nicholas Piggin wrote:
> The C conversion caused exit timing to become a bit cramped. Expand it
> to cover more of the entry and exit code.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

> ---
>   arch/powerpc/kvm/book3s_hv_interrupt.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
> index e93d2a6456ff..44c77f907f91 100644
> --- a/arch/powerpc/kvm/book3s_hv_interrupt.c
> +++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
> @@ -154,6 +154,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>   	if (hdec < 0)
>   		return BOOK3S_INTERRUPT_HV_DECREMENTER;
>   
> +	start_timing(vcpu, &vcpu->arch.rm_entry);
> +
>   	if (vc->tb_offset) {
>   		u64 new_tb = tb + vc->tb_offset;
>   		mtspr(SPRN_TBU40, new_tb);
> @@ -204,8 +206,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>   	 */
>   	mtspr(SPRN_HDEC, hdec);
>   
> -	start_timing(vcpu, &vcpu->arch.rm_entry);
> -
>   	vcpu->arch.ceded = 0;
>   
>   	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
> @@ -349,8 +349,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>   
>   	accumulate_time(vcpu, &vcpu->arch.rm_exit);
>   
> -	end_timing(vcpu);
> -
>   	/* Advance host PURR/SPURR by the amount used by guest */
>   	purr = mfspr(SPRN_PURR);
>   	spurr = mfspr(SPRN_SPURR);
> @@ -415,6 +413,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>   
>   	switch_mmu_to_host_radix(kvm, host_pidr);
>   
> +	end_timing(vcpu);
> +
>   	return trap;
>   }
>   EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
> 

-- 
Alexey

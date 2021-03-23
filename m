Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE2345BBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4RzD4Vyjz3bmh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=MqCkGTz4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MqCkGTz4; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Ryn2xHRz30Dt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 21:13:20 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so9896647pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S0VXCg+nlzBozrdWHXgTNulRU5+BlACmvhzlexa5ah8=;
 b=MqCkGTz40Bz/d4qLMARgRqU1nV/4StH8XiyPZEAUr/RQZG5lkVX2RmS3LgykzG70Ug
 IocoZD2rifEiFsAWdKpE989Ee1TlxCMIXDCVylJrw169vOvrQaLOjTob1l/I3wzg7q/b
 Pl8t+waZGyOwrosjJfXFkOC2aS8+9L/3MNexdzFzjYZV/tNTokRREGSTdG7hS7rzB0wK
 EJf5frdhAM2v4lpvkglfsQN+CRLjunlNwE6IbUufScfhIvoHBVfxIF21Rpk1XoGXzRSN
 VtHE+I5PeQBzUJnkHGYlwQPDDGBM8Bgcthp0WytoWAQEl5TEbbbeoG1932UvPBGrSHon
 mu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S0VXCg+nlzBozrdWHXgTNulRU5+BlACmvhzlexa5ah8=;
 b=H89ekeiOg3FQn/gEBOH4uj5HYNbQdZixWYRVx60p4KUuR749DD5+9HGC45xEAyU8oB
 Vg2/fFIJXyDn2hmvEibGgGnuWI5ol2teAcarr24VShv3QBgAjsLGgkXDUFt/1X6SX6tu
 zbzewxRwMMFH6ckxWxfEiHzHjC43Zyj2D3GT3XgS7e9ZSyS4btxbCUGp2eXPVMKm/0c1
 AZHfwmrfc8moxo+iYGtW1VgaDWq/qcK8OfmmkHZq3PsGy0inQdOgOJXFiX/DvG/RUKQJ
 M1QrRxkLPt3Im/LcEV2b9kZ3yTtjF2HZBAjv0F6KorhRtmCZHrExyJJsiCOMqasozcC/
 nZSA==
X-Gm-Message-State: AOAM530v3vPMpr//MP4odfoQYTQbLWcLi/ZINlz8o8j7Zz6O+VjdO7a9
 vZD523rLgSQ3QsjTelgLTtZi6PRGBkaJHDQB
X-Google-Smtp-Source: ABdhPJze4HUPAcXMoEk5PkqyXQzhctwqxPR2w4c2vUnIWIqZAwgYV1xsV8DH8J/nVKtG8Bw/NpX9Nw==
X-Received: by 2002:a17:90b:903:: with SMTP id
 bo3mr3949176pjb.198.1616494396659; 
 Tue, 23 Mar 2021 03:13:16 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id x4sm15730543pfn.134.2021.03.23.03.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 03:13:16 -0700 (PDT)
Message-ID: <3ca0e504-70df-2a25-12af-a1addac842b6@ozlabs.ru>
Date: Tue, 23 Mar 2021 21:13:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v4 28/46] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-29-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210323010305.1045293-29-npiggin@gmail.com>
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



On 23/03/2021 12:02, Nicholas Piggin wrote:
> irq_work's use of the DEC SPR is racy with guest<->host switch and guest
> entry which flips the DEC interrupt to guest, which could lose a host
> work interrupt.
> 
> This patch closes one race, and attempts to comment another class of
> races.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kvm/book3s_hv.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1f38a0abc611..989a1ff5ad11 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3745,6 +3745,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>   	if (!(vcpu->arch.ctrl & 1))
>   		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
>   
> +	/*
> +	 * When setting DEC, we must always deal with irq_work_raise via NMI vs
> +	 * setting DEC. The problem occurs right as we switch into guest mode
> +	 * if a NMI hits and sets pending work and sets DEC, then that will
> +	 * apply to the guest and not bring us back to the host.
> +	 *
> +	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
> +	 * example) and set HDEC to 1? That wouldn't solve the nested hv
> +	 * case which needs to abort the hcall or zero the time limit.
> +	 *
> +	 * XXX: Another day's problem.
> +	 */
>   	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
>   
>   	if (kvmhv_on_pseries()) {
> @@ -3879,7 +3891,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>   	vc->entry_exit_map = 0x101;
>   	vc->in_guest = 0;
>   
> -	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
> +	set_dec_or_work(local_paca->kvm_hstate.dec_expires - tb);


set_dec_or_work() will write local_paca->kvm_hstate.dec_expires - tb - 1 
to SPRN_DEC which is not exactly the same, is this still alright?

I asked in v3 but it is probably lost :)

> +
>   	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
>   
>   	kvmhv_load_host_pmu();
> 

-- 
Alexey

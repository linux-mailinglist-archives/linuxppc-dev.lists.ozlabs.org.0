Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF13459E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 09:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Pr715zYz3bdG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 19:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=D0h0vz8g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=D0h0vz8g; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Pqh3JDNz30BD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 19:37:01 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id q5so13559268pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jN5HG3Z7JQSh5RH3WCWd1hLZbONUmt0c5YylqPs4xT4=;
 b=D0h0vz8g1KyCKIYnd63QZf0Qd3o07YZUIpKZYi4P85ZIEhTqmYjil9Yown7zOG60xh
 iESiee25NRfqTtHvrbN3XqiTyoJHptkjj48KtDlAX7DqOTmxuhAJTFiOYVGvvQTyjLyz
 eN/79aVJ7oo3LqzCy7d21RAFg8VOpvglbEtsbbJeh6qgtv/55tspYnyNi9rqq8b4S4Rv
 uy78HnDNvltE3j1WBXh05u5UoUkuBrM41lbTZAYks96Jf0e5bAMzEBnfKZujxmZBJpP7
 KPwTz0Nbxa0pLLHRvMmO5ZNnglXhybMD2qUbZ9k8CrOPf+fReMFjAhUkGD4Of+WH+D2c
 A0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jN5HG3Z7JQSh5RH3WCWd1hLZbONUmt0c5YylqPs4xT4=;
 b=Zk7Fm2qgSeKFDX+zXDTp8D0I6PZHOB9CPcqA9rHBORwUm4688OvqmyRDgPFIpS5pSU
 hnYBGN4WY6oKbvjy6yR6PqFavU+LwlgjJyPdiLWqfQ5lwg0vIUhh3IMhV9zQ11GidWdD
 KdrIMuCdqZKXuDQMy6npidlJJchBloffCw+XeHjtORE6YPij7DhN5X2jUfEAjiU4YBAl
 wfJKAVWz0I12vgLJ0TFj6r52EjQu+NK0DBM3yDRbiN9qw/GltZbH6SkEcqMUEalc9l4J
 qS3Ou+p5hVBRY8fsYcHeR63J/AavRJqClgL7ciPgEBZ8zr/pFuf+chUsBt12W0Atiyrm
 Nh3A==
X-Gm-Message-State: AOAM532fqLRn49iRJLsfYs/muUTtdryhHUuBh7i1uxBS7gYXQ4yAZyp0
 9Nh+FPnLr9VPydwk/r+SNZLwfmDRktOgILVm
X-Google-Smtp-Source: ABdhPJw22HT3fMJlX3CqClhcXpEBjWosJQcb3XgGXhanOKSlabMuBpdS63L42+ZwJEJElYbgL87KSg==
X-Received: by 2002:a63:f055:: with SMTP id s21mr3151448pgj.293.1616488619359; 
 Tue, 23 Mar 2021 01:36:59 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id m5sm16525581pfd.96.2021.03.23.01.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 01:36:58 -0700 (PDT)
Message-ID: <efcbb80d-2d91-aee7-6e8a-e9904ce4c987@ozlabs.ru>
Date: Tue, 23 Mar 2021 19:36:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v4 04/46] KVM: PPC: Book3S HV: Prevent radix guests from
 setting LPCR[TC]
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-5-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210323010305.1045293-5-npiggin@gmail.com>
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
> This bit only applies to hash partitions.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

> ---
>   arch/powerpc/kvm/book3s_hv.c        | 6 ++++++
>   arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index c5de7e3f22b6..1ffb0902e779 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1645,6 +1645,12 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struct kvm_vcpu *vcpu,
>    */
>   unsigned long kvmppc_filter_lpcr_hv(struct kvmppc_vcore *vc, unsigned long lpcr)
>   {
> +	struct kvm *kvm = vc->kvm;
> +
> +	/* LPCR_TC only applies to HPT guests */
> +	if (kvm_is_radix(kvm))
> +		lpcr &= ~LPCR_TC;
> +
>   	/* On POWER8 and above, userspace can modify AIL */
>   	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
>   		lpcr &= ~LPCR_AIL;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index f7b441b3eb17..851e3f527eb2 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -140,8 +140,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>   	/*
>   	 * Don't let L1 change LPCR bits for the L2 except these:
>   	 */
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> -		LPCR_LPES | LPCR_MER;
> +	mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_LPES | LPCR_MER;
>   	hr->lpcr = kvmppc_filter_lpcr_hv(vc,
>   			(vc->lpcr & ~mask) | (hr->lpcr & mask));
>   
> 

-- 
Alexey

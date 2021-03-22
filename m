Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B034388C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 06:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3jlb31j1z309Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:31:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=K1l8oDBj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=K1l8oDBj; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3jl556n8z2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 16:30:38 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id k4so5944223plk.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DYK1va0J17C8K7UJDUeSzbRBcaCN8zcsfIRDdQK2F5o=;
 b=K1l8oDBjUv+tdgioqBAL6KhXYYBtZ459MaWjF3i18jf5042G9cm8i7f14i5aN2121E
 jJSpCkCfmK/V3E9v5hBk5S/qNp0/bHI81oE7yNBx+vtVTh+VH055TZFXYfXoG6tf08DE
 V8e5dk2F/nlDk6U3NkDoxXyGW5pMQaaIEYp8P69K0AoymmvhyyeCArovDoqtct3o4FCS
 ENLtWWSPpw/Nu3E2yiYXYkHYr+WfKz0kVLJ3HG1vJar84WPA9taCl+awe3kcpb94NKCp
 o23FZqmQsz++77IBAKqgOiQXE0EkXGX6+K9QH7IzLQvmNnyPyS39rPKZHkNVw1hJf4X5
 H4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DYK1va0J17C8K7UJDUeSzbRBcaCN8zcsfIRDdQK2F5o=;
 b=mIu81cv36jHMpaDxv0/VPoxIBgh/P5uoyI84b9TBsqzj9qk5wWBx7Bfro8X7qTBiuU
 y3blybswEl4q8AGhRnOEweSuef3MlIURjMRWD1m8ZlqwMmOKAPArqHkdXkkBvXK2ayMZ
 C2p1KIQ2nEPfYOVgcYOOdQmEKyne9Az0PPP/ONi0Oc5qgGhcWQKmuw6Ne1b3e3qNgZzB
 sWg2IiwDP/OeDHE8APSiwLyegbe5FAaiEEFLzLhUp/aBcfgFB5f8pAhj65O+iLd4GjpK
 rrS6dwpMVTf+U+Ws33KPSgPaH/FhJEB54AygQe0Q/CJIbPkatMyXlmnpeJgRCHJslE6x
 Vs3g==
X-Gm-Message-State: AOAM532ZdmcL1f+L7GZKlJNLd/srY+nvZq0VhryP26+eMHJRErkx/ntd
 rlUG2129L5OF2TsaZvB15nAohrtweJ5fQ9jm
X-Google-Smtp-Source: ABdhPJwZYnRy9SxkqxvX3iIvq7BLLRH7kN6jLmue9KJW6HsQOxeV6OW2UOBuETxNxYqxf1Yd0S7maA==
X-Received: by 2002:a17:90a:d3d8:: with SMTP id
 d24mr11075127pjw.166.1616391036183; 
 Sun, 21 Mar 2021 22:30:36 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id 186sm12710435pfb.143.2021.03.21.22.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 22:30:35 -0700 (PDT)
Message-ID: <f2c456f7-edc2-9e73-9ee2-58179cebfdda@ozlabs.ru>
Date: Mon, 22 Mar 2021 16:30:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 18/41] KVM: PPC: Book3S HV P9: Move xive vcpu context
 management into kvmhv_p9_guest_entry
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-19-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-19-npiggin@gmail.com>
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
> Move the xive management up so the low level register switching can be
> pushed further down in a later patch. XIVE MMIO CI operations can run in
> higher level code with machine checks, tracing, etc., available.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/kvm/book3s_hv.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index b265522fc467..497f216ad724 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3558,15 +3558,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   
>   	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
>   
> -	kvmppc_xive_push_vcpu(vcpu);
> -
>   	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
>   	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
>   
>   	trap = __kvmhv_vcpu_entry_p9(vcpu);
>   
> -	kvmppc_xive_pull_vcpu(vcpu);
> -
>   	/* Advance host PURR/SPURR by the amount used by guest */
>   	purr = mfspr(SPRN_PURR);
>   	spurr = mfspr(SPRN_SPURR);
> @@ -3749,7 +3745,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>   			trap = 0;
>   		}
>   	} else {
> +		kvmppc_xive_push_vcpu(vcpu);
>   		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
> +		kvmppc_xive_pull_vcpu(vcpu);
> +
>   	}
>   
>   	vcpu->arch.slb_max = 0;
> 

-- 
Alexey

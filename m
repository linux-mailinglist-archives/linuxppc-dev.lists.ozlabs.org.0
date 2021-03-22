Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF4343B11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 08:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3n2W3hcQz2ym4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 18:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=0Lh1cosM;
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
 header.s=20150623 header.b=0Lh1cosM; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3n253FbLz2yZD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:58:52 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so7755806pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SV1JmF5jI6hBhmsXPOoH9WCSO0IGU+uMmfBL8+n1w0k=;
 b=0Lh1cosMR1BLYkp7/XbLzo6yQSDwNX4gS2sX/Bxqc3OHZw5rtU3ALqpBaPtnhnodQ8
 T6aspYPia/9vkc8e3gqVEHFv9YOkkLq7r0xOxMkp7ra6gK7X8nCiEauD1eIz9iKIcUCD
 81JNOObhpBcLZA58ElzIts9T9nfOkZLYsZworAKKfSkoAwpQCIdcn8Izg2BTighKEwu+
 HHAzaKvQe4tTV+2QpJjGm1ypxQj2MPGUY2hJhwdxTr3qgt1SgAAewiyp7atb6ScsyobL
 xYTXo+yZXs7w9DrniAotXxRsL8lWU8XiI+rrIZyZ/ZWsqXWBR7aqvPzVvWeFPuwahqmN
 /btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SV1JmF5jI6hBhmsXPOoH9WCSO0IGU+uMmfBL8+n1w0k=;
 b=FbOT6UYHVx+9vo6OLr894y+myrqS5WO9NHOBOvXekqqoxwY/IV0l0O/cqwkCzYw3yQ
 4B9Sjle1xypef2TmL071Re5OnkRAk30eLXqccsWiTiYZKsE5RH5VvGxAlkk0xqa/1uta
 3GxJu0MxVJLK0pKyN8/YWE6/rsDdp1PG4q7oW7mPD72KaX6xCvpXrD+5yW56plRyoZkp
 IFZjNt1S8A7cE/nrxAsTwzYBYrWxcFQxDdfJVszZS+D5Rq56u12DvF19oUXOb4h0zhgD
 B/0v7wvbAeC/spzSSlQUnvnGVhB6vs2mprVuOLv0Pw58tfzhpljQOgBnuLiLD7pSNCph
 2grw==
X-Gm-Message-State: AOAM531Rxb+QjyUIMD+t1GyQK8laAzqOAPWX0v7tEdzeMAGYGPiqpetF
 IsZmW1JgCH+bNApq4YAm3jM0IbcG7tAPBGU1
X-Google-Smtp-Source: ABdhPJysgIKQ5ANlDj5YACAaHZKuy80S0VKVypSFucQvMwqG/iLk/cXRthM98iEePXqEinb+c82F4g==
X-Received: by 2002:a17:90a:bf07:: with SMTP id
 c7mr12588847pjs.15.1616399928690; 
 Mon, 22 Mar 2021 00:58:48 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id g21sm12885405pfk.30.2021.03.22.00.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 00:58:48 -0700 (PDT)
Message-ID: <6de508df-319a-3be9-8e8c-3326b547be2a@ozlabs.ru>
Date: Mon, 22 Mar 2021 18:58:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 21/41] KVM: PPC: Book3S HV P9: Use large decrementer
 for HDEC
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-22-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-22-npiggin@gmail.com>
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
> On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
> this could help reduce needless guest exits due to leftover exceptions on
> entering the guest.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/include/asm/time.h | 2 ++
>   arch/powerpc/kvm/book3s_hv.c    | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8dd3cdb25338..68d94711811e 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -18,6 +18,8 @@
>   #include <asm/vdso/timebase.h>
>   
>   /* time.c */
> +extern u64 decrementer_max;
> +
>   extern unsigned long tb_ticks_per_jiffy;
>   extern unsigned long tb_ticks_per_usec;
>   extern unsigned long tb_ticks_per_sec;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index ffde1917ab68..24b0680f0ad7 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3623,7 +3623,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   		vc->tb_offset_applied = 0;
>   	}
>   
> -	mtspr(SPRN_HDEC, 0x7fffffff);
> +	/* HDEC must be at least as large as DEC, so decrementer_max fits */
> +	mtspr(SPRN_HDEC, decrementer_max);
>   
>   	switch_mmu_to_host_radix(kvm, host_pidr);
>   




-- 
Alexey

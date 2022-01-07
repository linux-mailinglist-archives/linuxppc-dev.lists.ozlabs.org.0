Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463AC486EA9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 01:20:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVP5B0w1Fz30Qw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 11:20:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ubRsDgaO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ubRsDgaO; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVP4T3Hytz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 11:20:08 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id z30so503454pge.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 16:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X7KaqNcHCCOkAU37GOJO3qlHigFSzpcBdrbhs9RDte8=;
 b=ubRsDgaOTkfgqjXYczjyRXzKHPC623ahI7l/PK74JBcBqFmIbMpIrs1xWrpWwmG8xm
 3U1o8HkcKpc2dFL+Frg8xTuYxGuc+SYbxIHaEwoEg3UatR4Ro0gj6mnGkNubHCz60I3W
 oiF5D7pIUW4VHTS31vbQ2Ey3f38VmwTduwYCpe2jcByjior8eB3QBETgp/OIL+1IGjIT
 hX10jgULJnoliAdsVKyYUq2IjtfdvrigFgdXgqPGPjHtmLsMrHiaqkDVbocBooG7oDw7
 GNewpIj8j03H8rJ3O8Tv0Yh5tAIpGPZtK/STok+lCs5l4YxW4dz4KN4fWJRz3npSzTaJ
 9VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X7KaqNcHCCOkAU37GOJO3qlHigFSzpcBdrbhs9RDte8=;
 b=HbhG0yw067Y/qjGyzgbWwAWu1bEmzo9x1XDQze/Vz92knaZbo5ObUfBlVcUpUU8Ndn
 oZgBA5ohtaguzel5o9vV98wItZi/2sx8VgSD15tMzzmuJZyGm442aBpnUiF8y1BrVtf3
 /5Q39fRMGVVDyEFdli1+Uy5+q1Os6FG/gYOTQT44UOvbJi9ryQcsL7NGJYDcOGF8dRhH
 gMYYqiCN6PVAqPqhBr5Ghk4U7451C3vBQrAiB90Qh8WQ0YOgmLOFb7jHpagl1rWRXGLk
 2zpig/PhLJVSUIYU3oSEf8utva0cE36rSacuIz1oHG8V/i64SD53zTb/oiJMfs8jvSGg
 VgVQ==
X-Gm-Message-State: AOAM532JLhePChNN8xc03ZztIsYcM9MKKGVbDv7HfPCXcTOYC3RC6lib
 n85E6LOU+4SHMTTXQarrtWB+hg==
X-Google-Smtp-Source: ABdhPJzULnKcypv8WIXnTMPEvNj/K+WRa8PL+yP2if89CKSD+qv/FGHa0W+YeYJg/BcRzq5Qg9ZgYw==
X-Received: by 2002:a63:fd53:: with SMTP id m19mr53560148pgj.563.1641514803247; 
 Thu, 06 Jan 2022 16:20:03 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id ip2sm6794471pjb.34.2022.01.06.16.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:20:02 -0800 (PST)
Message-ID: <21736a11-1b0f-d4b6-bdd5-2560fc8ffcf1@ozlabs.ru>
Date: Fri, 7 Jan 2022 11:19:56 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2 3/7] KVM: PPC: Fix mmio length message
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
 <20220106200304.4070825-4-farosas@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220106200304.4070825-4-farosas@linux.ibm.com>
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



On 07/01/2022 07:03, Fabiano Rosas wrote:
> We check against 'bytes' but print 'run->mmio.len' which at that point
> has an old value.
> 
> e.g. 16-byte load:
> 
> before:
> __kvmppc_handle_load: bad MMIO length: 8
> 
> now:
> __kvmppc_handle_load: bad MMIO length: 16
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   arch/powerpc/kvm/powerpc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 92e552ab5a77..0b0818d032e1 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1246,7 +1246,7 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
>   
>   	if (bytes > sizeof(run->mmio.data)) {
>   		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
> -		       run->mmio.len);
> +		       bytes);


"return EMULATE_FAIL;" here and below as there is really no point in 
trashing kvm_run::mmio (not much harm too but still) and this code does 
not handle more than 8 bytes anyway.



>   	}
>   
>   	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
> @@ -1335,7 +1335,7 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
>   
>   	if (bytes > sizeof(run->mmio.data)) {
>   		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
> -		       run->mmio.len);
> +		       bytes);
>   	}
>   
>   	run->mmio.phys_addr = vcpu->arch.paddr_accessed;

-- 
Alexey

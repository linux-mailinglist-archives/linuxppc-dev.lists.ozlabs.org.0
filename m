Return-Path: <linuxppc-dev+bounces-3774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677329E339F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 07:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y37L844hdz30V7;
	Wed,  4 Dec 2024 17:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733294688;
	cv=none; b=fGQHrQGzIy5INkDsIFlrwN9nprwZ2HqL7dC7OVPyADEJXYYc+G+yrZkmOmDehRXenXx24LTO8oMMvj5bT/9mw+nBJfyeDHBdHF2O7G6SLbhUZOEgtNqYtevpEsagN87QfYvjNIB1Z8dL2jrnAlMT22o3L9LjKlaWUZMgXsjV2FjqEasIfWudGVhyxm14rvj72epzUQHAFUmT+lzTfhv5ecMre9rFhoYPlRKj1u/TJIIgYE8OhzWFyddKM/M0GVppfSS3q1adomJX11Az1+DhLZhSa7VtUJRQQpwzISUKWzYNFvfiLTByxRF0oxrH1Ler64w2gmIlmAD4jv9c9W2vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733294688; c=relaxed/relaxed;
	bh=4Hn/I5McNcvP3fZI87NWbUPJovPE64CkF9gRwRvV0lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2pp9eyVvBgalLYZhlFVB4JrdRUEs9ZFLXuOcRI8R0QiD3MrQFV5XF1k7L6pEc3MjfZ2Ev6cxgp+257/+1AjIXIShONzscFuzLvqT5zz1zg+qps54IplEET/uso4AhXgqTim3iJHxtZo/2RFFBBEm7blRrNi/GYhGr3EXiQpPZheP38/NY22EmGV92iFnFAFsu6K8Uok3ZWpGwXfml2RV9asc2SopHnWAT+2S8FmNN8H9OKFHWv2Eh83J5eKyOQRq0lciRA4CZ73/MuFuG4tB+nP3dmTqf5J9VgEn/qKRsEDzn6c+y105iW4vpM6B7ao8aUV3VngkWIYZ1USybunTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y37L72z9Wz30RS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 17:44:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y37L348bYz9stF;
	Wed,  4 Dec 2024 07:44:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jQrAaaTRKQc; Wed,  4 Dec 2024 07:44:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y37L32vTfz9stD;
	Wed,  4 Dec 2024 07:44:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47A838B767;
	Wed,  4 Dec 2024 07:44:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TT-qyXS56Ygr; Wed,  4 Dec 2024 07:44:43 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 160608B763;
	Wed,  4 Dec 2024 07:44:43 +0100 (CET)
Message-ID: <17b2588e-cf5e-43bd-8453-e6c2e1fef660@csgroup.eu>
Date: Wed, 4 Dec 2024 07:44:42 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] powerpc: print right preemption model in die
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-4-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241125042212.1522315-4-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
> Preemption models can change at runtime with dynamic preemption in
> place. So need to use the right methods instead of relying on
> CONFIG_PREEMPT to decide whether its full preemption or not.

Then this patch should go _before_ activating dynamic preemption.

But at the end, with the change to avoid the full copy of preempt.h, at 
the end the amount of changes is small and all three patches can be 
squashed into a single one.

> 
> While there, fix it to print preemption model correctly.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   arch/powerpc/kernel/traps.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index edf5cabe5dfd..2556fa8ec019 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -266,7 +266,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>   	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>   	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       preempt_model_none()      ? "none" :
> +	       preempt_model_voluntary() ? "voluntary" :
> +	       preempt_model_full()      ? "full" :
> +	       preempt_model_lazy()      ? "lazy" :
> +	       "",
>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",



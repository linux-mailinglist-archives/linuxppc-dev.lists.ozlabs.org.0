Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055114129CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD1tP6Xpzz2yw6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 10:06:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T+88ASI6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=T+88ASI6; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD1sm1mZLz2xrg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 10:05:47 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id j13so12523296qtq.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 17:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jpCgNzQxFC4qpARYFl0aMi6+0wE/Rb9Nb4OfxjZUPZs=;
 b=T+88ASI6NcBVu5o5hmMdsIgqA1x2mb9VR7Q/cfRd2gsVdc/K2LSyYQRAxFtwTcaeo1
 oN0HzOxD0XYU86igvUviZ6x94H2LYase7eYHNcCcbH1Rw0yDvq/Dgb2+J7MBqYTch4lx
 3AbS6VOiD/NaxAkxptAs5oThLXcK9V9hbt7PhXhbjoOffPvbVFKkEdofg25qII2N4CBc
 BJwN+vlPHQzm7arXeTlWLGJu7tPpUu9RqWsKQxRR97iozMP1+Ay+KdGg42jyf/gkclq4
 8nmlPeJhmFQSDsyntSIMe3gICd3TBAXJCYTHLcsvvQOP+Db6vmsDW4cXfbUN2NV+2Y36
 HSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jpCgNzQxFC4qpARYFl0aMi6+0wE/Rb9Nb4OfxjZUPZs=;
 b=pwggDSMJLGpcknzgsSIo4mJLfBoyaj54cbtFHUKsCS3LDabGKWkkf8+r5qSco3kiOb
 kOA49D6nTlgsxsKA8RGrnPT8BQwUMVHTxVLi3elzAV3pr/wJ4D7YuYGGXX4yDpZHMWMR
 uDh8uUAjdEOD2djxq8O2bqY2770odKRmuiTt7F6qClAVSpiY2r5rJ1rDD4qfwUbt/2++
 Pqm6539s8TbzQigfkUbF14dXMWoEHLNr/UGj/MVqRy15Y1JinBhGNBRBdH+zSgc3D8de
 kFtLjcDL8q3TprJlZ4iJlnSOB+kBhZZAxpLk8FBwvm7e9bhcYzqqCR035ltSIaiGJsRS
 fbEw==
X-Gm-Message-State: AOAM533urATn8IdrVaojYhvEB8Fom9a5drPLbO5ynJhvQiY+gO9R1uma
 E/0dgR1CuUUyRfiiq0riWHY=
X-Google-Smtp-Source: ABdhPJyOmVb2yiJLWiq1P75iDwajSIE5cqssvhigxtOZUql3kPmrF/OCLsXEVaJfvzI0uT9ToGtOKg==
X-Received: by 2002:ac8:7d81:: with SMTP id c1mr25429454qtd.229.1632182743887; 
 Mon, 20 Sep 2021 17:05:43 -0700 (PDT)
Received: from [192.168.10.222] ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id f10sm2193754qkp.50.2021.09.20.17.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 17:05:43 -0700 (PDT)
Message-ID: <c0e3c2ef-10e6-de96-8782-d9cf81198197@gmail.com>
Date: Mon, 20 Sep 2021 21:05:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] powerpc/cpuhp: BUG -> WARN conversion in offline path
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
 <20210920135504.1792219-3-nathanl@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210920135504.1792219-3-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/20/21 10:55, Nathan Lynch wrote:
> If, due to bugs elsewhere, we get into unregister_cpu_online() with a CPU
> that isn't marked hotpluggable, we can emit a warning and return an
> appropriate error instead of crashing.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---

As mentioned by Christophe this will not solve the crash for kernels with
panic_on_warn, but at least it will panic with a clearer message on those
and will not panic for everyone else.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>   arch/powerpc/kernel/sysfs.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index defecb3b1b15..08d8072d6e7a 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -928,7 +928,8 @@ static int unregister_cpu_online(unsigned int cpu)
>   	struct device_attribute *attrs, *pmc_attrs;
>   	int i, nattrs;
>   
> -	BUG_ON(!c->hotpluggable);
> +	if (WARN_RATELIMIT(!c->hotpluggable, "cpu %d can't be offlined\n", cpu))
> +		return -EBUSY;
>   
>   #ifdef CONFIG_PPC64
>   	if (cpu_has_feature(CPU_FTR_SMT))
> 

Return-Path: <linuxppc-dev+bounces-1686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E8989CC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 10:27:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHDhn2GqXz2xYs;
	Mon, 30 Sep 2024 18:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727684856;
	cv=none; b=Mx9uKcJlNrTn/EHGmOKjkqDLk88b+PfGyvmQOsf3MUTWoQV2Bv6ewAY46qMvMEFkJx/zYE+38qhoxnRv+Q0sC0cfPkrzBrS8K/pC0Y+GMQVyhziL7JlTxJwTGiRsxg/vkDjXZFKR4BeOaGOrZb0/ZNMHn0NYRr1WD+w7X5V9o4aS+azS2t0bRp//fr62cZwwn50PFaMzn05mwm+4icZEnyRXGBCFvvN7QvGy7Op4bUMAKvrZTHY9akHXWOsS5JVVREeuopfwzrwQUP0rzOvvUZhyPbgY5vsHiPg6FeLKIr89LZ2JEO9d1Y9XJsY2mAPybNe5cT1w5YTar7Y8bgKMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727684856; c=relaxed/relaxed;
	bh=+XdPg7C+lpqWLav2uWpdXQiEvkgbv3m1vc4ARo1Zv3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2rl7Zpw2YZCoAQk9tdv7HYgPCNIoM72vcWu7qCnTUWkxs6RJJBavnW4i993N0N3h2YLyHZ4f2vPr3nYd66cTDc/C63s93x7GIFTgjcFE3F1L2YkBZUl1FZRRA5a9mg0ZGZOeebh1BJRKt6DCohkY/SulAvYUBIFsHCCuADTAXDQTozLjW8n1qHFTkMEWkzRaff8NhUga8vVLZDQEAkMpA9XjFk3+eIMs2twnxLNOOaq0vl1FvJg7ugmV1vabV99s8dNppM+6fyU1+uLBtquU8iAYpcG4uaNQqD3PwVmLw9bwdHoke2ZS5atEvz2MhoNsdmCZrOGGlURQnvIr1V7jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHDhm1SVjz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 18:27:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XHDhf3Z4Dz9sPd;
	Mon, 30 Sep 2024 10:27:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2YkgV7CSOq2; Mon, 30 Sep 2024 10:27:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XHDhf2hbRz9rvV;
	Mon, 30 Sep 2024 10:27:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C4108B765;
	Mon, 30 Sep 2024 10:27:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JoWvvBouykuU; Mon, 30 Sep 2024 10:27:26 +0200 (CEST)
Received: from [192.168.232.172] (unknown [192.168.232.172])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9F868B764;
	Mon, 30 Sep 2024 10:27:25 +0200 (CEST)
Message-ID: <37ee3c12-8a88-45ca-a70b-72af504e0d2b@csgroup.eu>
Date: Mon, 30 Sep 2024 10:27:25 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/kexec: Fix the return of uninitialized variable
To: Zhang Zekun <zhangzekun11@huawei.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, naveen@kernel.org, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Cc: chenjun102@huawei.com
References: <20240930075628.125138-1-zhangzekun11@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240930075628.125138-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 30/09/2024 à 09:56, Zhang Zekun a écrit :
> [Vous ne recevez pas souvent de courriers de zhangzekun11@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The of_property_read_u64() can fail and remain the variable uninitialized,

Replace "remain" by "leave".

> which will then be used. Return error if we failed to read the property.

Rewrite to avoid "we".  For instance "Return error if reading the 
property failed"

> 
> Fixes: 2e6bd221d96f ("powerpc/kexec_file: Enable early kernel OPAL calls")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>   arch/powerpc/kexec/file_load_64.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 9738adabeb1f..dc65c1391157 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -736,13 +736,18 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>          if (dn) {
>                  u64 val;
> 
> -               of_property_read_u64(dn, "opal-base-address", &val);
> +               ret = of_property_read_u64(dn, "opal-base-address", &val);
> +               if (ret)
> +                       goto out;
> +
>                  ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
>                                                       sizeof(val), false);
>                  if (ret)
>                          goto out;
> 
> -               of_property_read_u64(dn, "opal-entry-address", &val);
> +               ret = of_property_read_u64(dn, "opal-entry-address", &val);
> +               if (ret)
> +                       goto out;
>                  ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
>                                                       sizeof(val), false);
>          }
> --
> 2.17.1
> 


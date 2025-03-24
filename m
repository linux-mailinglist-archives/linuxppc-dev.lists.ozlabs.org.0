Return-Path: <linuxppc-dev+bounces-7305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE6A6D4E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 08:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLkw65pF6z2ygp;
	Mon, 24 Mar 2025 18:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742800806;
	cv=none; b=gtoeRn3EpiR9VQpW1/HyHiMF8PXK/8ZB90GWKOPdq7EOVEoq3pY8h2GftVD1UodsgLwf2cHhjqwg8N3auMfwlY5AZyaZfcYyKUZtDpaXF67kaLmJ47Qie0/TwMd+eOjpTACEVKwH0XGhBAIIEx8YAGpPiq5rnX8SXh8Ys0nSdmnQMp5UCPnNUBkyWrNgWEjJ+GwzQkc6p4vZIaR7xc3umVjmNOnYnP63dLl6KgWyu/61S9YZX2Sluw8lpOBKJFsfaluAnOH80aqjiC/l8Y0iyn0atBRWziFIsl4STkJstRIv9kyN/+SnmRJVwAeONX4rDp4o0/wpgT1hKX+flDawaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742800806; c=relaxed/relaxed;
	bh=jCIrSZtjzrx/+kl5ySP00qO/T3/En3tsz9d/EG5Q2hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aK20jAEkkQ0NF9EHA8AuwEsEYgzyX+VUsBnnwVpd4FMjWpXAwZDOXGb/y2MzDHYWyLuRx+89qJI7HK07Yyjf3nxT3qWxTbyQptyG16sVdExQlzQDakU5tpE58TGSLdVTcy4HVh9Mn21euDP8IPXxlPj4PtqMkMQoImFjxkfIIqqgDsNERwkkYe1SiOKezPSSLkcbJrjnyhW0ETCvqh1MzQ9Ti0Q8ACkYU+eS7NEPJg1BTZHSeJ6t9+l2Ob9FfICPsUK9dQpopQ1qGGbCLM18I1kHvV4XvaoMpaMHAnEDzlFqTSSxK9C4J8is9WjEFcXk7cdB7vrh8uJX3ezyuo8fdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLkw55Ywdz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 18:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZLkjY2Zx5z9sRr;
	Mon, 24 Mar 2025 08:10:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuLGQKMl-Xvp; Mon, 24 Mar 2025 08:10:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZLkjY1hKHz9sPd;
	Mon, 24 Mar 2025 08:10:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E8F38B764;
	Mon, 24 Mar 2025 08:10:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 41OC9VxkX_tb; Mon, 24 Mar 2025 08:10:57 +0100 (CET)
Received: from [10.25.207.144] (unknown [10.25.207.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA7228B763;
	Mon, 24 Mar 2025 08:10:56 +0100 (CET)
Message-ID: <4387b1d1-7936-42a3-8347-e10e63e93517@csgroup.eu>
Date: Mon, 24 Mar 2025 08:10:56 +0100
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
Subject: Re: [PATCH] arch: powerpc: defconfig: Drop obsolete
 CONFIG_NET_CLS_TCINDEX
To: Johan Korsnes <johan.korsnes@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>
References: <20250323191116.113482-1-johan.korsnes@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250323191116.113482-1-johan.korsnes@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 23/03/2025 à 20:11, Johan Korsnes a écrit :
> [Vous ne recevez pas souvent de courriers de johan.korsnes@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> This option was removed from the Kconfig in commit
> 8c710f75256b ("net/sched: Retire tcindex classifier") but it was not
> removed from the defconfigs.
> 
> Fixes: 8c710f75256b ("net/sched: Retire tcindex classifier")
> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   arch/powerpc/configs/ppc6xx_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index ca0c90e95837..b8eb158a80fd 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -253,7 +253,6 @@ CONFIG_NET_SCH_DSMARK=m
>   CONFIG_NET_SCH_NETEM=m
>   CONFIG_NET_SCH_INGRESS=m
>   CONFIG_NET_CLS_BASIC=m
> -CONFIG_NET_CLS_TCINDEX=m
>   CONFIG_NET_CLS_ROUTE4=m
>   CONFIG_NET_CLS_FW=m
>   CONFIG_NET_CLS_U32=m
> --
> 2.49.0
> 



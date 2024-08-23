Return-Path: <linuxppc-dev+bounces-467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A423C95D3DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 19:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr5tB3P1Vz2yyM;
	Sat, 24 Aug 2024 03:00:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724432434;
	cv=none; b=J+f1AVtqrpvFioq28vzwdUQlANtu1MvhIYilMpR+bRotm8rcL1/BTjFg/jpNwhvubgY/ZseO5Z2zxpNa25vt64GuvZtXeX8VGN7WKrpDBCgrji3pLTwbj1EI7OohsJq81TzCZbbofsCffvvxi3CcvcYUKHfK2IE3Xk90ANqzXAdx8ZzhYajGDYCQrnlFcz4+AloJjalqMJdhspQIuRkaT4Zki6w+6GccO3O51cBLY8qUlYhbMRNIJQUtHEp2KKHl8UylFrI0dELI+CDD/Cw7FOtxHoIsVxqK0nkAgmdZnH7ZcLiCMt0WXqUh8rjzBSlFgJEEmFb4pKwk78+RlOqUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724432434; c=relaxed/relaxed;
	bh=nqJVi00aOEVlDkK0PjSPuKtGx8CvD9g4JJliYdUALbI=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=LaZvEnto3U63TKaXVojZgdJtkcovxOug76xRozquabMFIHO1p+2l3zdKLyE0vKWmm4QBcTvvmjTnageh7VszIZl3aZpIA9hTfU6sjpgHSLTI3nC6alvBUqs6VlSts8WtFktpbNCuNgA86rRMIpvBrQD+unyOmzD812jme28wDL/vLZstZuX/tnfrkYaFdUSKlbfRDi3d3GwoPf0Ib+p5LXu0JvtPXQ72aLCEOgFsvzPXLw3BZPEFa61aV2ATD+amaDcSo13zYNsX8kUs8D9mfrcyg7xWipwNTeEl0/y9eub6boZku1BiY7wLdf1Jen0B3+WZq/E4safZAoBJFthcIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr5tB1885z2yx5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 03:00:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wr5t62S3Qz9sRr;
	Fri, 23 Aug 2024 19:00:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5E58EHGa9Ba; Fri, 23 Aug 2024 19:00:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wr5t61dk7z9sRk;
	Fri, 23 Aug 2024 19:00:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2720C8B781;
	Fri, 23 Aug 2024 19:00:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gn3olMTCJfO7; Fri, 23 Aug 2024 19:00:30 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B6E8C8B763;
	Fri, 23 Aug 2024 19:00:29 +0200 (CEST)
Message-ID: <584eebac-d052-4748-8886-ded7c8776f5a@csgroup.eu>
Date: Fri, 23 Aug 2024 19:00:29 +0200
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
Subject: Re: [PATCH] bus: fsl-mc: make fsl_mc_bus_type const
To: Kunwu Chan <kunwu.chan@linux.dev>, stuyoder@gmail.com,
 laurentiu.tudor@nxp.com
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Kunwu Chan <chentao@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240823062440.113628-1-kunwu.chan@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240823062440.113628-1-kunwu.chan@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/08/2024 à 08:24, Kunwu Chan a écrit :
> [Vous ne recevez pas souvent de courriers de kunwu.chan@linux.dev. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Kunwu Chan <chentao@kylinos.cn>
> 
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the fsl_mc_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # for 
include/linux/fsl/mc.h

> ---
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 2 +-
>   include/linux/fsl/mc.h          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index dd68b8191a0a..930d8a3ba722 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -309,7 +309,7 @@ static struct attribute *fsl_mc_bus_attrs[] = {
> 
>   ATTRIBUTE_GROUPS(fsl_mc_bus);
> 
> -struct bus_type fsl_mc_bus_type = {
> +const struct bus_type fsl_mc_bus_type = {
>          .name = "fsl-mc",
>          .match = fsl_mc_bus_match,
>          .uevent = fsl_mc_bus_uevent,
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index 083c860fd28e..c90ec889bfc2 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -436,7 +436,7 @@ void fsl_mc_free_irqs(struct fsl_mc_device *mc_dev);
>   struct fsl_mc_device *fsl_mc_get_endpoint(struct fsl_mc_device *mc_dev,
>                                            u16 if_id);
> 
> -extern struct bus_type fsl_mc_bus_type;
> +extern const struct bus_type fsl_mc_bus_type;
> 
>   extern struct device_type fsl_mc_bus_dprc_type;
>   extern struct device_type fsl_mc_bus_dpni_type;
> --
> 2.43.0
> 


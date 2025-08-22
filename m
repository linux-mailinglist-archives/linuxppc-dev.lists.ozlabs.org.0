Return-Path: <linuxppc-dev+bounces-11186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC69B31939
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 15:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7gmQ0bRqz3cfx;
	Fri, 22 Aug 2025 23:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755868838;
	cv=none; b=OM/ViBo6AtYLgnsDmyVE5VjY15WQZR/5U6HsCQteh+eTKE40aeDXuPpkx+AhGxxHatUAfzHalmUIjK2BwTVbjNb9lWcWGmReiXnsbG0eQ2gEmO7JkdC5ke6XDk2xFW6K9G4/MuktDDUNBUc1p0gahfaGQp+SkWulXBh0rdo9KAPhmRRm+RLNP9WKOLKveExGN8FCIwfgPP5ZrTky509C5LGYXyyUSJUslsAmZncXXWnd1n10iGx4y29+BCMxB12DS4YN4Ct/L4mIpovgbJAi457wTrhm1awCjUmscdQOFXeafnwIbmjujeu6peza6D4elRVj1osyHpRpFbQucPPQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755868838; c=relaxed/relaxed;
	bh=WC3WkoBFj1Dc2/WWQoRouWQHcQNwKM7/CFyF5aNsGyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9qFkJLgesQPesGQ35H6fHz5aj+sa6idWjZfvelp5BjR/aj5wEvEu0YZWLTOYD1KiaTrtIMBPsXxes5w21gKKMU9PEcblEpZ5vy/iFw0PqYFL+sKfqoObvc1E1VhYFr6kzkcqS5uUYGOu7JFRFyE+vAQ+W5jX9ias0pRyZYjWfQ133aio+LqRbWK+1vJGj8sAYouFiI0Qdc9tMn7Mf1cTMUQp3fTG13lVkQ1ECa58mKGsfTVJbC+oWGc/RQhm//OHqAu6cRTtpJuMZjclG/6gqHihOHNwZuQCjpJowhnDLWVPJHraIEyaEJ2NQopM5wCVujQpV+4GHG081CQ3vncrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7gmP2zP6z3cYJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7fd45Fw7z9sSL;
	Fri, 22 Aug 2025 14:29:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwMwaebHU1t7; Fri, 22 Aug 2025 14:29:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7fd44V0sz9sRs;
	Fri, 22 Aug 2025 14:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F7438B775;
	Fri, 22 Aug 2025 14:29:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id I5eJSvUZ-qdo; Fri, 22 Aug 2025 14:29:12 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 497B28B763;
	Fri, 22 Aug 2025 14:29:12 +0200 (CEST)
Message-ID: <a60b99de-7ca3-4f82-b374-657db1d8657c@csgroup.eu>
Date: Fri, 22 Aug 2025 14:29:11 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: Replace snprintf with sysfs_emit in sysfs
 show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org
References: <20250822115704.1731999-1-chelsyratnawat2001@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250822115704.1731999-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/08/2025 à 13:57, Chelsy Ratnawat a écrit :
> Use sysfs_emit() instead of snprintf() when writing to sysfs buffers,
> as recommended by the kernel documentation.

Change modalias_show() at the same time.

Christophe

> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index c1c0a4759c7e..13172a0cdb48 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -203,7 +203,7 @@ static ssize_t driver_override_show(struct device *dev,
>   {
>          struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> 
> -       return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
> +       return sysfs_emit(buf, "%s\n", mc_dev->driver_override);
>   }
>   static DEVICE_ATTR_RW(driver_override);
> 
> --
> 2.47.3
> 
> 



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00A533280
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 22:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L75VH5dm8z3bkQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 06:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.125; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L75Tr0cdbz308w
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 06:32:13 +1000 (AEST)
Received: from [192.168.1.18] ([90.11.191.102]) by smtp.orange.fr with ESMTPA
 id tb4xnPisO4Ltqtb4xnh97t; Tue, 24 May 2022 22:24:36 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 24 May 2022 22:24:36 +0200
X-ME-IP: 90.11.191.102
Message-ID: <27777e38-5967-6c87-210a-626461ec125c@wanadoo.fr>
Date: Tue, 24 May 2022 22:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V2] platforms/83xx: Use of_device_get_match_data()
Content-Language: en-GB
To: cgel.zte@gmail.com, oss@buserror.net
References: <20220225010737.2038781-1-chi.minghao@zte.com.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220225010737.2038781-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 25/02/2022 à 02:07, cgel.zte@gmail.com a écrit :
> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> 
> Use of_device_get_match_data() to simplify the code.
> v1->v2:
> 	Add a judgment on the return value of the A function as NULL
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
> ---
>   arch/powerpc/platforms/83xx/suspend.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
> index bb147d34d4a6..6d47a5b81485 100644
> --- a/arch/powerpc/platforms/83xx/suspend.c
> +++ b/arch/powerpc/platforms/83xx/suspend.c
> @@ -322,18 +322,15 @@ static const struct platform_suspend_ops mpc83xx_suspend_ops = {
>   static const struct of_device_id pmc_match[];

Hi,
I think that the line above can now be removed as well.

just my 2c.

CJ


>   static int pmc_probe(struct platform_device *ofdev)
>   {
> -	const struct of_device_id *match;
>   	struct device_node *np = ofdev->dev.of_node;
>   	struct resource res;
>   	const struct pmc_type *type;
>   	int ret = 0;
>   
> -	match = of_match_device(pmc_match, &ofdev->dev);
> -	if (!match)
> +	type = of_device_get_match_data(&ofdev->dev);
> +	if (!type)
>   		return -EINVAL;
>   
> -	type = match->data;
> -
>   	if (!of_device_is_available(np))
>   		return -ENODEV;
>   


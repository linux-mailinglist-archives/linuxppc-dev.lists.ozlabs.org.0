Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960861E35E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 17:16:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4zyW37dkz3f3g
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 03:16:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.14; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4zxt6fNlz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 03:16:16 +1100 (AEDT)
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id riCForZc23VQxriCFoI6AX; Sun, 06 Nov 2022 17:08:41 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 06 Nov 2022 17:08:41 +0100
X-ME-IP: 86.243.100.34
Message-ID: <f4c81b9a-ba70-3dea-e4f6-9ff62a3e27e8@wanadoo.fr>
Date: Sun, 6 Nov 2022 17:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] macintosh: Fix warning comparing pointer to 0
Content-Language: fr
To: wangkailong@jari.cn, benh@kernel.crashing.org,
 christophe.leroy@csgroup.eu, mpe@ellerman.id.au
References: <c31207c.c3.1844d85a6aa.Coremail.wangkailong@jari.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <c31207c.c3.1844d85a6aa.Coremail.wangkailong@jari.cn>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 06/11/2022 à 16:18, wangkailong@jari.cn a écrit :
> Fix the following coccicheck warning:
> 
> drivers/macintosh/macio-adb.c:103:13-14: WARNING comparing pointer to 0.
> 
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>
> ---
>   drivers/macintosh/macio-adb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
> index 9b63bd2551c6..1c1c375a817d 100644
> --- a/drivers/macintosh/macio-adb.c
> +++ b/drivers/macintosh/macio-adb.c
> @@ -100,7 +100,7 @@ int macio_init(void)
>   	unsigned int irq;
>   
>   	adbs = of_find_compatible_node(NULL, "adb", "chrp,adb0");
> -	if (adbs == 0)
> +	if (adbs)

Hi
no, this should be "if (!adbs)"

CJ

>   		return -ENXIO;
>   
>   	if (of_address_to_resource(adbs, 0, &r)) {


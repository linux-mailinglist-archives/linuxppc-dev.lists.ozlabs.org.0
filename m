Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB0561E361
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 17:21:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N503J20Tgz3f3V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 03:21:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.18; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N502m1zbyz2xkw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 03:20:32 +1100 (AEDT)
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id riGKoGCAyXaJmriGKor48n; Sun, 06 Nov 2022 17:12:59 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 06 Nov 2022 17:12:59 +0100
X-ME-IP: 86.243.100.34
Message-ID: <7924fc05-02d7-a2b3-85e3-d30dfe081da3@wanadoo.fr>
Date: Sun, 6 Nov 2022 17:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] macintosh/adb: Fix warning comparing pointer to 0
Content-Language: fr
To: wangkailong@jari.cn, benh@kernel.crashing.org, mpe@ellerman.id.au,
 gregkh@linuxfoundation.org, sohu0106@126.com, christophe.leroy@csgroup.eu
References: <2ef267c.c4.1844d8ef2d8.Coremail.wangkailong@jari.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <2ef267c.c4.1844d8ef2d8.Coremail.wangkailong@jari.cn>
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

Le 06/11/2022 à 16:28, wangkailong@jari.cn a écrit :
> Fix the following coccicheck warning:
> 
> drivers/macintosh/adb.c:676:14-15: WARNING comparing pointer to 0.
> 
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>
> ---
>   drivers/macintosh/adb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
> index 1bbb9ca08d40..076253599bd4 100644
> --- a/drivers/macintosh/adb.c
> +++ b/drivers/macintosh/adb.c
> @@ -673,7 +673,7 @@ static int adb_open(struct inode *inode, struct file *file)
>   		goto out;
>   	}
>   	state = kmalloc(sizeof(struct adbdev_state), GFP_KERNEL);
> -	if (state == 0) {
> +	if (state) {

Hi
no, this should be "if (!state)"

CJ

>   		ret = -ENOMEM;
>   		goto out;
>   	}


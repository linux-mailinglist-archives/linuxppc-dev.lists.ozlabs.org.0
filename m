Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC46056CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 07:30:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtGQ43Wqkz3drP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 16:30:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.50; helo=mail-ed1-f50.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtGPV6ssVz2yQg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 16:29:34 +1100 (AEDT)
Received: by mail-ed1-f50.google.com with SMTP id l22so28260753edj.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 22:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5uleha1nzv3NDWgFG6RrLUbIce/IAvJbRw2gmfM1nA=;
        b=MjCXiMxtgPJewaVB66kvw2NScX4BHFuoD86uGGy3THaN/TG4vH2IK9YsAgBe0qu5S/
         ayuW0pJEZK0XoTT3BDdSaW1P6KAGZOqVxFk8tz3iUBt2fDwL1CJ33vgjZyLhIeRSJfNM
         7Ox3zu8YdzThxcgIlNpMA5Ho8TXuRgi7HQLmI39GGx5A3iCq0iwMbEvyP/niHPx3g0dj
         YCqzBwV3wfXXY+SnzmpcTbJq8ZpOZPBmG5oV3yLaRAv2ASAyWSfC3qpUi2YYkXxBv0IR
         nzk+QDgKu19AR4xnUrfGhddalEFtGP3z5cFvqTOVBOaEIJ8ACZ3tC1PuY4ABz0pZilF3
         ouow==
X-Gm-Message-State: ACrzQf2qi+uu7PLRddHVCD8g8KLpXPpN286ifmC9PRUw8sUS51HIlpk9
	7RZEVJ4kJ1SSUTvLvxVGhgE=
X-Google-Smtp-Source: AMsMyM5cRIqOwXdmST/afDgqAJBDMBSMmyDmi4u4wtHf0dwji3CpnU+xSolltQn1imdV6iXcMdliWQ==
X-Received: by 2002:aa7:d651:0:b0:459:d1c:394e with SMTP id v17-20020aa7d651000000b004590d1c394emr10827647edr.10.1666243769081;
        Wed, 19 Oct 2022 22:29:29 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id a16-20020aa7d910000000b00459ad800bbcsm11493000edr.33.2022.10.19.22.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 22:29:28 -0700 (PDT)
Message-ID: <effb4a2a-2bdd-a4b7-f6db-948666515996@kernel.org>
Date: Thu, 20 Oct 2022 07:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH -next] tty: hvc: make hvc_rtas_dev static
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20221019064412.3759874-1-ruanjinjie@huawei.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221019064412.3759874-1-ruanjinjie@huawei.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19. 10. 22, 8:44, ruanjinjie wrote:
> The symbol is not used outside of the file, so mark it static.
> 
> Fixes the following warning:
> 
> drivers/tty/hvc/hvc_rtas.c:29:19: warning: symbol 'hvc_rtas_dev' was
> not declared. Should it be static?

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>   drivers/tty/hvc/hvc_rtas.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/hvc/hvc_rtas.c b/drivers/tty/hvc/hvc_rtas.c
> index e8b8c645482b..184d325abeed 100644
> --- a/drivers/tty/hvc/hvc_rtas.c
> +++ b/drivers/tty/hvc/hvc_rtas.c
> @@ -26,7 +26,7 @@
>   #include "hvc_console.h"
>   
>   #define hvc_rtas_cookie 0x67781e15
> -struct hvc_struct *hvc_rtas_dev;
> +static struct hvc_struct *hvc_rtas_dev;
>   
>   static int rtascons_put_char_token = RTAS_UNKNOWN_SERVICE;
>   static int rtascons_get_char_token = RTAS_UNKNOWN_SERVICE;

-- 
js
suse labs


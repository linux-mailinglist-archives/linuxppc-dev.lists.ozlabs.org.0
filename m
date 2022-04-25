Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E319350D908
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 07:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmvSg6cRJz3brq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 15:58:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmvSF6Glqz2xvy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 15:57:47 +1000 (AEST)
Received: by mail-ej1-f54.google.com with SMTP id w16so6249998ejb.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 22:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7gVJ2Utcvosx/ULF+UBSbPDY0euXt/mFCYfcwdEKABE=;
 b=V/8wBqkt4M5r39aorB1rdsjhqi5oDj9RvzeGRgKean631Dy+vUZjgkXlhLOzPI+tKu
 Nu4N95qq730FSIeuGTqxEGPOQpDdDC10aGd56+lCtDl42jzhEgc4Z7bcxNKemMO+swG5
 0ZGKMHf3t/jvGmp359ghqMoyM3O+CJE1nJtSo/uSpep4FLQqsuKhAIy/MEKlYe5ES5WD
 33cymnelHa08CSEITQwpwgctlkGgg5fJJkflmFmDky2xBu+RuUZn7CnFU7eFSNyh09tJ
 DdID6ezEKnF9+hGR57h3IOYQdd+nMqNtkwkCBckVkuqlDNxWZxKVJ5Hv8GdxpNHFGjZk
 2ZHw==
X-Gm-Message-State: AOAM530ESKyNWc/HViJ+Q4XkAL9U8O6xI5zNbuo2pVRZ3OHa2DvEbKXy
 fGaf61FI2CdG6iwU2m0rc0s=
X-Google-Smtp-Source: ABdhPJwNjWzQpWbujPmDPI0ystpnRedGsg7AJyeQ/ZLHueI3IpwaY4uVuJMpcbXmNjzSmbYS0LCifg==
X-Received: by 2002:a17:906:4313:b0:6b8:b3e5:a46 with SMTP id
 j19-20020a170906431300b006b8b3e50a46mr14695767ejm.417.1650866262907; 
 Sun, 24 Apr 2022 22:57:42 -0700 (PDT)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a170906974500b006dfc781498dsm3262766ejy.37.2022.04.24.22.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 22:57:42 -0700 (PDT)
Message-ID: <2c1e137b-9866-4f6b-1413-0adaa8fdd57b@kernel.org>
Date: Mon, 25 Apr 2022 07:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tty/hvc_opal: simplify if-if to if-else
Content-Language: en-US
To: Wan Jiabing <wanjiabing@vivo.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220424092511.100309-1-wanjiabing@vivo.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220424092511.100309-1-wanjiabing@vivo.com>
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24. 04. 22, 11:25, Wan Jiabing wrote:
> Use if and else instead of if(A) and if (!A).
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>   drivers/tty/hvc/hvc_opal.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 84776bc641e6..2dafa0964c2a 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -344,14 +344,15 @@ void __init hvc_opal_init_early(void)
>   		opal = of_find_node_by_path("/ibm,opal/consoles");
>   		if (opal)
>   			pr_devel("hvc_opal: Found consoles in new location\n");
> -		if (!opal) {
> +		else {

This looks good, except missing braces as noted by Joe.

>   			opal = of_find_node_by_path("/ibm,opal");
>   			if (opal)
>   				pr_devel("hvc_opal: "
>   					 "Found consoles in old location\n");
> +			else
> +				return;

I am not sure this return is more obvious than the previous one. Rather 
the opposite, IMO.

>   		}
> -		if (!opal)
> -			return;
> +
>   		for_each_child_of_node(opal, np) {
>   			if (of_node_name_eq(np, "serial")) {
>   				stdout_node = np;

thanks,
-- 
js
suse labs

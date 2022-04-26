Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BC50F26C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 09:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnYSY2Hkbz3brH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 17:30:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.43; helo=mail-ed1-f43.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnYS84tJbz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 17:29:58 +1000 (AEST)
Received: by mail-ed1-f43.google.com with SMTP id g20so21210700edw.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 00:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hOlzS7teepghKhHO3I5ZYfaNXKKQM3quot1pS5vaaSA=;
 b=FJ4YTUcfI5SLhA3xg3fBPHlO9VRMvyyekfD9p3m3BbARZwizo3UWjUMpNAcMmCsh5x
 PyOMis9kfSttz3dA0lt2ReAJWsIDDjq77a7g4n217tWli5ox1oztS+6VNZEIR4zj5pF5
 Q0s3U9NljQBeE9xOGn6RO/g9dPDTc5zyL0oS2OZKvpkEKXvtH0ANAO+ZBMJdRnIG4NU5
 vIa1W9ZX7XDNXcSwW5NvcuQ7AVKwob0BERZ1bvK8IzWSFD/Re1pLNw98t2Ih3cnxEmze
 TIKBx83iZwAcPJF40O87So6BATbH4gn4dtsEiRBMmPb6IufvvAYJzjY7qtMdSjJoS3kC
 scUg==
X-Gm-Message-State: AOAM532S+iEiASLp/vqPZ71MugSyklyP1YbD8jfqzc47WuIBynmZIMPo
 Dm8xvpOlp5G8/k/8XuY5KAiM4b5AISU=
X-Google-Smtp-Source: ABdhPJwdtxQjyz2PID87gQkYXoDXvRITcke2EmvtcsG/Izql7n9Ce8e7NkkGkhbJN8TWTPJqnM2HvQ==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id
 i20-20020a05640242d400b004165caca9a0mr23253479edc.86.1650958194022; 
 Tue, 26 Apr 2022 00:29:54 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170906700a00b006efdb748e8dsm4433107ejj.88.2022.04.26.00.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:29:53 -0700 (PDT)
Message-ID: <47accf18-ca39-8b36-100e-a6dbfd8705fe@kernel.org>
Date: Tue, 26 Apr 2022 09:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] tty/hvc_opal: simplify if-if to if-else
Content-Language: en-US
To: Wan Jiabing <wanjiabing@vivo.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220426071041.168282-1-wanjiabing@vivo.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220426071041.168282-1-wanjiabing@vivo.com>
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

On 26. 04. 22, 9:10, Wan Jiabing wrote:
> Use if and else instead of if(A) and if (!A).

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
> Change log:
> v2:
> - add braces to the if block.
> ---
>   drivers/tty/hvc/hvc_opal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 84776bc641e6..794c7b18aa06 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -342,9 +342,9 @@ void __init hvc_opal_init_early(void)
>   		 * path, so we hard wire it
>   		 */
>   		opal = of_find_node_by_path("/ibm,opal/consoles");
> -		if (opal)
> +		if (opal) {
>   			pr_devel("hvc_opal: Found consoles in new location\n");
> -		if (!opal) {
> +		} else {
>   			opal = of_find_node_by_path("/ibm,opal");
>   			if (opal)
>   				pr_devel("hvc_opal: "


-- 
js
suse labs

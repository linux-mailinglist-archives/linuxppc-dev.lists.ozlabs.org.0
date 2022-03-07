Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7F4CEF32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 02:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBh6J1lf5z3bXq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 12:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nNPl9n/h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nNPl9n/h; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBh5b1yTpz2yws
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 12:41:52 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id t187so8024313pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Mar 2022 17:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0Fw2idvMV9mmhbkYq5zfFzJocfFBD0RDIL74FoXxZpY=;
 b=nNPl9n/hzDpRgVPn26lEdnQq42yce2vm+LJYINOXG4Vs6xI9QWUSqVepzjfR9TZ1ed
 3JTgKw+MqjeMZUlrH0uasq6gkOUuHplXIAsrKBsqYmVJ28s1c15VI0q6W+MR7AO8jQ3Y
 F6pEKgx41ApiPRuzcxufAqoXKew08qTvMuWTc4k9Wldy2yx3ILq26tJ/vDRJY5HwJpp8
 73Ct7R72BgxzjzKBQfaa5jnkKJNBaDHaiRNR/TXyJvMSGaqgIxRJKjv4sewudhBklo2G
 9tMgshuYE/uGY13Mik793WW3phc+CNc4tH0bCXvxJw6krtv1cTnFKM19muZv59RLOjPm
 k3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Fw2idvMV9mmhbkYq5zfFzJocfFBD0RDIL74FoXxZpY=;
 b=dpccjWuK6lhVE/WPL7RrII86j4w9vBuP6OZh/r0jGR8ibwm7FfD5ifMErExm9Ztkez
 zbigw0GyXPyc5RqYZmm8HRhgM80oUneyfaW9kAgZzpaW28hYv4q+9dfdYPcxb4oyb00h
 1WUcnnWXZ00KNgl7dCctFTNyFDTtaAWtLGboBKr5hFLaUA9hOGruKuttspQqDSlwEQVC
 ksGyScLBHYylBs+XCXvBxBYBtXUqP0SpZiNSv9fwRH3f1uLuouon4Ul7ZewaRuF9weV3
 Y/Ct+2nEYX1KfKAvQLY9yae/uMw06yDX8GGLWa+9K57z6FVfY4Q+8ka3r2kW8UMjuiAP
 OZcw==
X-Gm-Message-State: AOAM530g/DsChGFtduXIv4qTpZ6Zzi6nOh9uo8VEzLvmgyxSN/fnl2wE
 jhkOPgHX3f8jW9u0cczQBi1GwWOV3YV6Mg==
X-Google-Smtp-Source: ABdhPJzqZPGdtNsh38PDx/KkZI6yTkClYiDaRvbHiuNtDsuVA6cAjTc5vohHAo0NPZ+YnD4T8wMuRg==
X-Received: by 2002:a05:6a00:b90:b0:4f6:b88d:ec96 with SMTP id
 g16-20020a056a000b9000b004f6b88dec96mr10300678pfj.12.1646617309370; 
 Sun, 06 Mar 2022 17:41:49 -0800 (PST)
Received: from [10.11.37.162] ([103.84.139.54])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a637218000000b0037ffc63b98csm4614537pgc.65.2022.03.06.17.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 17:41:49 -0800 (PST)
Message-ID: <146301ab-e217-6984-1dd4-0d782328d7f0@gmail.com>
Date: Mon, 7 Mar 2022 09:41:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
Content-Language: en-US
To: christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, peng.hao2@zte.com.cn,
 wen.yang99@zte.com.cn
References: <20220223070223.26845-1-hbh25y@gmail.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220223070223.26845-1-hbh25y@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping?

On 2022/2/23 15:02, Hangyu Hua wrote:
> mpc8xx_pic_init() should return -ENOMEM instead of 0 when
> irq_domain_add_linear() return NULL. This cause mpc8xx_pics_init to continue
> executing even if mpc8xx_pic_host is NULL.
> 
> Fixes: cc76404feaed ("powerpc/8xx: Fix possible device node reference leak")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   arch/powerpc/platforms/8xx/pic.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
> index f2ba837249d6..04a6abf14c29 100644
> --- a/arch/powerpc/platforms/8xx/pic.c
> +++ b/arch/powerpc/platforms/8xx/pic.c
> @@ -153,6 +153,7 @@ int __init mpc8xx_pic_init(void)
>   	if (mpc8xx_pic_host == NULL) {
>   		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
>   		ret = -ENOMEM;
> +		goto out;
>   	}
>   
>   	ret = 0;

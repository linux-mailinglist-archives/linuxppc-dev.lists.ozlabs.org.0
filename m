Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5463DD11B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 09:25:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdV0K0j3qz30BX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 17:25:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.48; helo=mail-ej1-f48.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdV000TGmz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 17:25:19 +1000 (AEST)
Received: by mail-ej1-f48.google.com with SMTP id e19so29328614ejs.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Aug 2021 00:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WcetUWPb8culgJfYwcXyd4enV0COOIi+oGgXXHCJxs8=;
 b=F9F+P9HIitF2nx6blNgSeDlfB2MYKWDSvLc/H74vTbfAPiFtSs5C+xaFKg2VhppwwD
 ewrD/akPsJboa72PG1WqUxKLYdZjl1yKY4W4HDvSoF0XnaePC4K4NNaGpawotcePcjk/
 7QKh7RtXEDtJIsUobkoOAWY6Yy0G8QstRwERE4i5L8P8hEBcAaaCyo6QZv8V5ud2pjQ6
 UuN1XZJXCviksA8wBebJGLCjiuywEQWfRK0oMNyFkEuXe7P/MN/lmtPaD3edu+HvwGxJ
 UqP6CizLelNWSVNwLPODMSAd83GoyEY+SDMOHRCMSXlWWL9i4et03Lx5VV7cADI1EQnC
 LLeA==
X-Gm-Message-State: AOAM533BO3OjbSu2sxbM5Y7ZxUt+z6H9GHZGQ/qepjAep3czwdWeOCMk
 BBPh0i4DEj/sidV21+VgrKo=
X-Google-Smtp-Source: ABdhPJxWTIdE9MBJiFVNAsUjUXU9AE4QP/vAPTBU9gQDwWpXVj1nFXiA6JbVTS8aEqGldEf1vZCzFQ==
X-Received: by 2002:a17:906:394:: with SMTP id
 b20mr14197279eja.462.1627889114838; 
 Mon, 02 Aug 2021 00:25:14 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id i11sm5384121eds.72.2021.08.02.00.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 00:25:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] virtio-console: remove unnecessary kmemdup()
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de
References: <20210801051655.79048-1-xianting.tian@linux.alibaba.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <b5554967-a683-96ae-deb9-2d4980d33b41@kernel.org>
Date: Mon, 2 Aug 2021 09:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210801051655.79048-1-xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
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
Cc: osandov@fb.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

why is this 2/2? I seem (Lore neither) to find 1/2.

On 01. 08. 21, 7:16, Xianting Tian wrote:
> hvc framework will never pass stack memory to the put_chars() function,

Am I blind or missing something?

hvc_console_print(...)
{
   char c[N_OUTBUF]
...
   cons_ops[index]->put_chars(vtermnos[index], c, i);

The same here:

hvc_poll_put_char(..., char ch)
{
...
    n = hp->ops->put_chars(hp->vtermno, &ch, 1);

AFAICS both of them *pass* a pointer to stack variable.

> So the calling of kmemdup() is unnecessary, remove it.
> 
> Fixes: c4baad5029 ("virtio-console: avoid DMA from stack")

This patch doesn't "Fix" -- it reverts the commit. You should've CCed 
the author too.

> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>   drivers/char/virtio_console.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 7eaf303a7..4ed3ffb1d 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -1117,8 +1117,6 @@ static int put_chars(u32 vtermno, const char *buf, int count)
>   {
>   	struct port *port;
>   	struct scatterlist sg[1];
> -	void *data;
> -	int ret;
>   
>   	if (unlikely(early_put_chars))
>   		return early_put_chars(vtermno, buf, count);
> @@ -1127,14 +1125,8 @@ static int put_chars(u32 vtermno, const char *buf, int count)
>   	if (!port)
>   		return -EPIPE;
>   
> -	data = kmemdup(buf, count, GFP_ATOMIC);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	sg_init_one(sg, data, count);
> -	ret = __send_to_port(port, sg, 1, count, data, false);
> -	kfree(data);
> -	return ret;
> +	sg_init_one(sg, buf, count);
> +	return __send_to_port(port, sg, 1, count, (void *)buf, false);
>   }
>   
>   /*
> 


-- 
js
suse labs

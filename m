Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAE43AB8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 07:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdg0K63xQz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 16:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.48; helo=mail-wr1-f48.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdfzn69Gyz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 16:10:59 +1100 (AEDT)
Received: by mail-wr1-f48.google.com with SMTP id d10so12755386wrb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 22:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P3Zc6yeCZnILUVTPl/gZcYbGqf9vc97cwBNzsoT0q3g=;
 b=ap1nX7rZ52KHVQyYiScBQ+OLq89xGNPBfb4DqcCr5JDfAq+L+S8PGBQcC86SZXKlbA
 YafSoGNQzIeUPpDRLBxJoEko7AArem2SUmMvNTMondOw+KH/GUxiXD2sl/2s8GoebcWR
 2TSkH1UK5zYZxb84NnNenOLgBenW3WVBvTxEFNqk0IZc0MbuqtqrDw2KIa4JyS+miX+D
 V/Hrcjkw7ecNWHFr63Z7yJs0dN/AfzHj7C6BhVwwN2XLQ0JZP9dltKFIVYeNaMhaaP3/
 HH+brZCVs6Ii4YqCfuhO1aNBZN4C0hdAQPSxSWzo+etxTpf/kaaCxDOFgZx10QivE12H
 CJfQ==
X-Gm-Message-State: AOAM5317YLgJHVj6+ToHVbnXfdLp1R+RHAz5pDzYLP4e/z7T/5Jj2vvo
 l77LitrcwI+87CgIG0rBywI=
X-Google-Smtp-Source: ABdhPJx6PQGIVmdcNUmalhy4yPmH8boj2Cllr+IVnA7VjjuLDIUjtctTj8Wo0XiYE0gbxFgNFMuSzQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr28856932wrz.26.1635225055992; 
 Mon, 25 Oct 2021 22:10:55 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id n11sm8532947wrs.14.2021.10.25.22.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 22:10:55 -0700 (PDT)
Message-ID: <208f7a41-a9fa-630c-cb44-c37c503f3a72@kernel.org>
Date: Tue, 26 Oct 2021 07:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 2/3] tty: hvc: pass DMA capable memory to put_chars()
Content-Language: en-US
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20211015024658.1353987-1-xianting.tian@linux.alibaba.com>
 <20211015024658.1353987-3-xianting.tian@linux.alibaba.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211015024658.1353987-3-xianting.tian@linux.alibaba.com>
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
Cc: shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15. 10. 21, 4:46, Xianting Tian wrote:
> @@ -151,9 +142,11 @@ static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
>   static void hvc_console_print(struct console *co, const char *b,
>   			      unsigned count)
>   {
> -	char c[N_OUTBUF] __ALIGNED__;
> +	char *c;
>   	unsigned i = 0, n = 0;
>   	int r, donecr = 0, index = co->index;
> +	unsigned long flags;
> +	struct hvc_struct *hp;
>   
>   	/* Console access attempt outside of acceptable console range. */
>   	if (index >= MAX_NR_HVC_CONSOLES)
> @@ -163,6 +156,13 @@ static void hvc_console_print(struct console *co, const char *b,
>   	if (vtermnos[index] == -1)
>   		return;
>   
> +	hp = cons_hvcs[index];
> +	if (!hp)
> +		return;

You effectively make the console unusable until someone calls 
hvc_alloc() for this device, correct? This doesn't look right. Neither 
you describe this change of behaviour in the commit log.

regards,
-- 
js
suse labs

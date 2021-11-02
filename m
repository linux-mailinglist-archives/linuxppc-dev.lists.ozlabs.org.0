Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D24442726
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 07:34:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk0VP1cclz304t
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 17:34:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.54; helo=mail-wm1-f54.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk0Tv4xQ3z2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 17:33:38 +1100 (AEDT)
Received: by mail-wm1-f54.google.com with SMTP id z200so13870975wmc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Nov 2021 23:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/iqE7dO8WNGbpVJBxdR3E5i6Fo6FPuhTcPAq49hulYI=;
 b=OEs5QFD6MvveSv3LlxeE0cdeYhEoNXR1nzXDkZmhhyG4jiWMjiRa2cEPkA7gBbCVpW
 tzhe5m2tir9ssNZqTCAa0sBvXV1sG5E12/YavIglgMuHuAm+i1Qxh/nshVqVZhujG/TK
 rNxPiQMXULJyfQMmUg5AYm0hxtcjfV84xt2cQHHxSAphftw9YIqn0NZ/Fsfi5NGBUfo7
 OH7AEKHhXmtuENsNYfyUdhKMtWfPbsvT24vuOtnw8LXl1+fExA4W+49g8vbbcAnXTOWS
 SJsSUsOB9D+eRwuXtxDSSwucBRX9CiJaLgr110CCR9qv+9TDKMRjOi+Whc8D+jlxy4i/
 oExQ==
X-Gm-Message-State: AOAM532Dqgct9lzk3/EpmpucORpTPuC8KX34reQXsz26oqy2KnlQMCrS
 DInzrSWFZvCGBZPASwfYy44=
X-Google-Smtp-Source: ABdhPJyjbofYFZEFSkDZzkjyL5u0jq640dqJMdekotBbvTnBd2qavVtozXmUfGCQANkLkAw86c4ATQ==
X-Received: by 2002:a1c:9ad4:: with SMTP id c203mr4466452wme.23.1635834813759; 
 Mon, 01 Nov 2021 23:33:33 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id b197sm1454869wmb.24.2021.11.01.23.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 23:33:33 -0700 (PDT)
Message-ID: <55b28b16-33f4-2a69-b2f1-6781d0241b99@kernel.org>
Date: Tue, 2 Nov 2021 07:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v12 1/2] tty: hvc: pass DMA capable memory to put_chars()
Content-Language: en-US
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20211028150954.1356334-1-xianting.tian@linux.alibaba.com>
 <20211028150954.1356334-2-xianting.tian@linux.alibaba.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211028150954.1356334-2-xianting.tian@linux.alibaba.com>
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
Cc: sfr@canb.auug.org.au, shile.zhang@linux.alibaba.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28. 10. 21, 17:09, Xianting Tian wrote:
> As well known, hvc backend can register its opertions to hvc backend.
> the operations contain put_chars(), get_chars() and so on.
> 
> Some hvc backend may do dma in its operations. eg, put_chars() of
> virtio-console. But in the code of hvc framework, it may pass DMA
> incapable memory to put_chars() under a specific configuration, which
> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
> 1, c[] is on stack,
>     hvc_console_print():
>          char c[N_OUTBUF] __ALIGNED__;
>          cons_ops[index]->put_chars(vtermnos[index], c, i);
> 2, ch is on stack,
>     static void hvc_poll_put_char(,,char ch)
>     {
>          struct tty_struct *tty = driver->ttys[0];
>          struct hvc_struct *hp = tty->driver_data;
>          int n;
> 
>          do {
>                  n = hp->ops->put_chars(hp->vtermno, &ch, 1);
>          } while (n <= 0);
>     }
> 
> Commit c4baad5029 is just the fix to avoid DMA from stack memory, which
> is passed to virtio-console by hvc framework in above code. But I think
> the fix is aggressive, it directly uses kmemdup() to alloc new buffer
> from kmalloc area and do memcpy no matter the memory is in kmalloc area
> or not. But most importantly, it should better be fixed in the hvc
> framework, by changing it to never pass stack memory to the put_chars()
> function in the first place. Otherwise, we still face the same issue if
> a new hvc backend using dma added in the furture.
> 
> In this patch, add 'char cons_outbuf[]' as part of 'struct hvc_struct',
> so hp->cons_outbuf is no longer the stack memory, we can use it in above
> cases safely. We also add lock to protect cons_outbuf instead of using
> the global lock of hvc.
> 
> Introduce array cons_hvcs[] for hvc pointers next to the cons_ops[] and
> vtermnos[] arrays. With the array, we can easily find hvc's cons_outbuf
> and its lock.

Hi,

this is still overly complicated IMO. As I already noted in:
https://lore.kernel.org/all/5b728c71-a754-b3ef-4ad3-6e33db1b7647@kernel.org/

this:
=============
In fact, you need only a single char for the poll case
(hvc_poll_put_char), so hvc_struct needs to contain only c, not an array.

OTOH, you need c[N_OUTBUF] in the console case (hvc_console_print), but
not whole hvc_struct. So cons_hvcs should be an array of structs
composed of only the lock and the buffer.
=============

And I would do it even simpler now. One c[N_OUTBUF] buffer for all 
consoles and a single lock.

And "char c" in struct hvc_struct.

No need for the complex logic in hvc_console_print.

> Introduce array cons_early_outbuf[] to ensure the mechanism of early
> console still work normally.


thanks,
-- 
js
suse labs

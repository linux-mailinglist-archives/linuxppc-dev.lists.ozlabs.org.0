Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F563EF86E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 05:17:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqCkp5tR2z3cSn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 13:17:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqCkN4vzkz302V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 13:17:15 +1000 (AEST)
Received: by mail-ed1-f41.google.com with SMTP id g21so839068edw.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 20:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPc7urjlfbXi4JUqkG5U5x2Zz7cdVK7h03OfY0SFENs=;
 b=kzlA51HWykGi5lzBy4kzcXmC4xtFzQLc0gBlm5oUjEZUOTIQQF9xmA/ZUzp7t2O+gA
 fiL7YlrtRsdcfiEPuvyMZonm5/zhEGFN0lf+Yfi0oD1j54MQg2uC/I8EUYCf9aF5Ul4U
 Nl7XsjHwf6frGTmcfk0/TglzIhefpfDd000N7g2aTVepHvgIlgUTNv2zm5UqJn4Tv9tu
 s6Ld8Fg46aTR+WzHZMXDVUxtyy45BXBQ6DGxhOvxPhApRtakoloDOsGXJW7YQ+GNCN7Z
 YDDTBx4m7TnTC1sGX0eK6f2Bz1TsIOpQ39BwvzqZATflXH3Km8Mc6BvewdKtLmddlta4
 gt1w==
X-Gm-Message-State: AOAM532r6AEv/KBi6bfs0To46fWOcnVFEb8JrdYtade5SyTpFuvKk1Wf
 LzTUHRMxelFRc346Aenp30g=
X-Google-Smtp-Source: ABdhPJynahJkqFt5MHGBVC0PzthP4x/1xEfwbGX7Wy0iyDYy6rvF8qw+W9lUwtVW7NrWhqwQq8rFRA==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr7773117edt.237.1629256632601; 
 Tue, 17 Aug 2021 20:17:12 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id v13sm1424956ejx.24.2021.08.17.20.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 20:17:11 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210817132300.165014-1-xianting.tian@linux.alibaba.com>
 <20210817132300.165014-2-xianting.tian@linux.alibaba.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <5b728c71-a754-b3ef-4ad3-6e33db1b7647@kernel.org>
Date: Wed, 18 Aug 2021 05:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210817132300.165014-2-xianting.tian@linux.alibaba.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 17. 08. 21, 15:22, Xianting Tian wrote:
> As well known, hvc backend can register its opertions to hvc backend.
> the opertions contain put_chars(), get_chars() and so on.

"operations". And there too:

> Some hvc backend may do dma in its opertions. eg, put_chars() of
> virtio-console. But in the code of hvc framework, it may pass DMA
> incapable memory to put_chars() under a specific configuration, which
> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
> 1, c[] is on stack,
>     hvc_console_print():
> 	char c[N_OUTBUF] __ALIGNED__;
> 	cons_ops[index]->put_chars(vtermnos[index], c, i);
> 2, ch is on stack,
>     static void hvc_poll_put_char(,,char ch)
>     {
> 	struct tty_struct *tty = driver->ttys[0];
> 	struct hvc_struct *hp = tty->driver_data;
> 	int n;
> 
> 	do {
> 		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
> 	} while (n <= 0);
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
> We make 'char c[N_OUTBUF]' part of 'struct hvc_struct', so hp->c is no
> longer the stack memory. we can use it in above two cases.

In fact, you need only a single char for the poll case 
(hvc_poll_put_char), so hvc_struct needs to contain only c, not an array.

OTOH, you need c[N_OUTBUF] in the console case (hvc_console_print), but 
not whole hvc_struct. So cons_hvcs should be an array of structs 
composed of only the lock and the buffer.

Hum.

Or maybe rethink and take care of the console case by kmemdup and be 
done with that case? What problem do you have with allocating 16 bytes? 
It should be quite easy and really fast (lockless) in most cases. On the 
contrary, your solution has to take a spinlock to access the global buffer.

> Other fix is use L1_CACHE_BYTES as the alignment, use 'sizeof(long)' as
> dma alignment is wrong. And use struct_size() to calculate size of
> hvc_struct.

This ought to be in separate patches.

thanks,
-- 
js
suse labs

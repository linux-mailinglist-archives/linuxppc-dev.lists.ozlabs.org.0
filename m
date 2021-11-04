Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF233445389
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 14:07:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlP7X6GJwz3bWT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 00:07:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlP742tZjz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 00:07:08 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Uv1LNAc_1636031198; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Uv1LNAc_1636031198) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 04 Nov 2021 21:06:39 +0800
Subject: Re: [PATCH v12 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20211028150954.1356334-1-xianting.tian@linux.alibaba.com>
 <20211028150954.1356334-2-xianting.tian@linux.alibaba.com>
 <55b28b16-33f4-2a69-b2f1-6781d0241b99@kernel.org>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <7dde342a-c2b7-32fe-7410-e372c82a4a68@linux.alibaba.com>
Date: Thu, 4 Nov 2021 21:06:38 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <55b28b16-33f4-2a69-b2f1-6781d0241b99@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: sfr@canb.auug.org.au, shile.zhang@linux.alibaba.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/11/2 下午2:33, Jiri Slaby 写道:
> On 28. 10. 21, 17:09, Xianting Tian wrote:
>> As well known, hvc backend can register its opertions to hvc backend.
>> the operations contain put_chars(), get_chars() and so on.
>>
>> Some hvc backend may do dma in its operations. eg, put_chars() of
>> virtio-console. But in the code of hvc framework, it may pass DMA
>> incapable memory to put_chars() under a specific configuration, which
>> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
>> 1, c[] is on stack,
>>     hvc_console_print():
>>          char c[N_OUTBUF] __ALIGNED__;
>>          cons_ops[index]->put_chars(vtermnos[index], c, i);
>> 2, ch is on stack,
>>     static void hvc_poll_put_char(,,char ch)
>>     {
>>          struct tty_struct *tty = driver->ttys[0];
>>          struct hvc_struct *hp = tty->driver_data;
>>          int n;
>>
>>          do {
>>                  n = hp->ops->put_chars(hp->vtermno, &ch, 1);
>>          } while (n <= 0);
>>     }
>>
>> Commit c4baad5029 is just the fix to avoid DMA from stack memory, which
>> is passed to virtio-console by hvc framework in above code. But I think
>> the fix is aggressive, it directly uses kmemdup() to alloc new buffer
>> from kmalloc area and do memcpy no matter the memory is in kmalloc area
>> or not. But most importantly, it should better be fixed in the hvc
>> framework, by changing it to never pass stack memory to the put_chars()
>> function in the first place. Otherwise, we still face the same issue if
>> a new hvc backend using dma added in the furture.
>>
>> In this patch, add 'char cons_outbuf[]' as part of 'struct hvc_struct',
>> so hp->cons_outbuf is no longer the stack memory, we can use it in above
>> cases safely. We also add lock to protect cons_outbuf instead of using
>> the global lock of hvc.
>>
>> Introduce array cons_hvcs[] for hvc pointers next to the cons_ops[] and
>> vtermnos[] arrays. With the array, we can easily find hvc's cons_outbuf
>> and its lock.
>
> Hi,
>
> this is still overly complicated IMO. As I already noted in:
> https://lore.kernel.org/all/5b728c71-a754-b3ef-4ad3-6e33db1b7647@kernel.org/ 
>
>
> this:
> =============
> In fact, you need only a single char for the poll case
> (hvc_poll_put_char), so hvc_struct needs to contain only c, not an array.

I ever did so in v10, and Greg suggested:

So you have a lock for a character and a different one for a longer
string?  Why can they not just use the same lock?  Why are 2 needed at
all, can't you just use the first character of cons_outbuf[] instead?
Surely you do not have 2 sends happening at the same time, right?

https://lkml.org/lkml/2021/10/9/214 <https://lkml.org/lkml/2021/10/9/214>

So I change to use one outbuf.

>
> OTOH, you need c[N_OUTBUF] in the console case (hvc_console_print), but
> not whole hvc_struct. So cons_hvcs should be an array of structs
> composed of only the lock and the buffer.
It is ok for me.
> =============
>
> And I would do it even simpler now. One c[N_OUTBUF] buffer for all 
> consoles and a single lock.
>
> And "char c" in struct hvc_struct.
>
> No need for the complex logic in hvc_console_print.

So you will implement this?  I don't need to send further patches?

>
>> Introduce array cons_early_outbuf[] to ensure the mechanism of early
>> console still work normally.
>
>
> thanks,

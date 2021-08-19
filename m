Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF43F10E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 05:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqqKW5Dhbz3cXN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 13:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqqK42G9Mz30BD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 13:00:52 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UjuITCz_1629342041; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UjuITCz_1629342041) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 19 Aug 2021 11:00:42 +0800
Subject: Re: [PATCH v7 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210817132300.165014-1-xianting.tian@linux.alibaba.com>
 <20210817132300.165014-2-xianting.tian@linux.alibaba.com>
 <5b728c71-a754-b3ef-4ad3-6e33db1b7647@kernel.org>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <fff0dd41-92c6-e2ac-543f-cbd0a2e43683@linux.alibaba.com>
Date: Thu, 19 Aug 2021 11:00:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5b728c71-a754-b3ef-4ad3-6e33db1b7647@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/8/18 上午11:17, Jiri Slaby 写道:
> Hi,
>
> On 17. 08. 21, 15:22, Xianting Tian wrote:
>> As well known, hvc backend can register its opertions to hvc backend.
>> the opertions contain put_chars(), get_chars() and so on.
>
> "operations". And there too:
>
>> Some hvc backend may do dma in its opertions. eg, put_chars() of
>> virtio-console. But in the code of hvc framework, it may pass DMA
>> incapable memory to put_chars() under a specific configuration, which
>> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
>> 1, c[] is on stack,
>>     hvc_console_print():
>>     char c[N_OUTBUF] __ALIGNED__;
>>     cons_ops[index]->put_chars(vtermnos[index], c, i);
>> 2, ch is on stack,
>>     static void hvc_poll_put_char(,,char ch)
>>     {
>>     struct tty_struct *tty = driver->ttys[0];
>>     struct hvc_struct *hp = tty->driver_data;
>>     int n;
>>
>>     do {
>>         n = hp->ops->put_chars(hp->vtermno, &ch, 1);
>>     } while (n <= 0);
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
>> We make 'char c[N_OUTBUF]' part of 'struct hvc_struct', so hp->c is no
>> longer the stack memory. we can use it in above two cases.
>
> In fact, you need only a single char for the poll case 
> (hvc_poll_put_char), so hvc_struct needs to contain only c, not an array.
>
> OTOH, you need c[N_OUTBUF] in the console case (hvc_console_print), 
> but not whole hvc_struct. So cons_hvcs should be an array of structs 
> composed of only the lock and the buffer.
>
> Hum.
>
> Or maybe rethink and take care of the console case by kmemdup and be 
> done with that case? What problem do you have with allocating 16 
> bytes? It should be quite easy and really fast (lockless) in most 
> cases. On the contrary, your solution has to take a spinlock to access 
> the global buffer.

As I replyed before,  this issue may can be solved just by adjust the 
alignment to L1_CACHE_BYTES or at least 16:  
#define __ALIGNED__ __attribute__((__aligned__(L1_CACHE_BYTES)))

Then, c[16] won't cross the pages, that is to say c[16]'s physical 
address is continuous.  Could you comment this?

I submitted v8,  I found it still can't solve ths issue, even we create 
'char out_buf[N_OUTBUF]' and 'chat out_ch' be part of 'struct 
hvc_struct', and use it separately, we still need lock to protect each 
buf. When we invloced lock, it will impact the hvc performance.

So we can back to the original intention of this solution, just fix the 
kmemdup issue in virtio_console driver?


>
>> Other fix is use L1_CACHE_BYTES as the alignment, use 'sizeof(long)' as
>> dma alignment is wrong. And use struct_size() to calculate size of
>> hvc_struct.
>
> This ought to be in separate patches.
>
> thanks,

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2853F289E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 10:44:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrZtr63pkz3cVc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 18:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130;
 helo=out30-130.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrZtM71vDz2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 18:43:52 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0UkJj0o4_1629449013; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UkJj0o4_1629449013) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 20 Aug 2021 16:43:33 +0800
Subject: Re: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
To: Daniel Axtens <dja@axtens.net>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
 <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
 <87pmu8ehkk.fsf@linkitivity.dja.id.au>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <6e36640d-b55f-ece4-4cab-437ecec0964a@linux.alibaba.com>
Date: Fri, 20 Aug 2021 16:43:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87pmu8ehkk.fsf@linkitivity.dja.id.au>
Content-Type: text/plain; charset=gbk; format=flowed
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
Cc: shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


ÔÚ 2021/8/20 ÏÂÎç2:49, Daniel Axtens Ð´µÀ:
> Xianting Tian <xianting.tian@linux.alibaba.com> writes:
>
>> As well known, hvc backend driver(eg, virtio-console) can register its
>> operations to hvc framework. The operations can contain put_chars(),
>> get_chars() and so on.
>>
>> Some hvc backend may do dma in its operations. eg, put_chars() of
>> virtio-console. But in the code of hvc framework, it may pass DMA
>> incapable memory to put_chars() under a specific configuration, which
>> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
> We could also run into issues on powerpc where Andrew is working on
> adding vmap-stack but the opal hvc driver assumes that it is passed a
> buffer which is not in vmalloc space but in the linear mapping. So it
> would be good to fix this (or more clearly document what drivers can
> expect).
>
>> 1, c[] is on stack,
>>     hvc_console_print():
>> 	char c[N_OUTBUF] __ALIGNED__;
>> 	cons_ops[index]->put_chars(vtermnos[index], c, i);
>> 2, ch is on stack,
>>     static void hvc_poll_put_char(,,char ch)
>>     {
>> 	struct tty_struct *tty = driver->ttys[0];
>> 	struct hvc_struct *hp = tty->driver_data;
>> 	int n;
>>
>> 	do {
>> 		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
>> 	} while (n <= 0);
>>     }
>>
>> Commit c4baad5029 is just the fix to avoid DMA from stack memory, which
>> is passed to virtio-console by hvc framework in above code. But I think
>> the fix is aggressive, it directly uses kmemdup() to alloc new buffer
>> from kmalloc area and do memcpy no matter the memory is in kmalloc area
>> or not. But most importantly, it should better be fixed in the hvc
>> framework, by changing it to never pass stack memory to the put_chars()
>> function in the first place. Otherwise, we still face the same issue if
>> a new hvc backend using dma added in the future.
>>
>> In this patch, we make 'char out_buf[N_OUTBUF]' and 'chat out_ch' part
>> of 'struct hvc_struct', so both two buf are no longer the stack memory.
>> we can use it in above two cases separately.
>>
>> Introduce another array(cons_outbufs[]) for buffer pointers next to
>> the cons_ops[] and vtermnos[] arrays. With the array, we can easily find
>> the buffer, instead of traversing hp list.
>>
>> With the patch, we can remove the fix c4baad5029.
>>
>> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>> Reviewed-by: Shile Zhang <shile.zhang@linux.alibaba.com>
>>   struct hvc_struct {
>>   	struct tty_port port;
>>   	spinlock_t lock;
>>   	int index;
>>   	int do_wakeup;
>> -	char *outbuf;
>> -	int outbuf_size;
>>   	int n_outbuf;
>>   	uint32_t vtermno;
>>   	const struct hv_ops *ops;
>> @@ -48,6 +56,10 @@ struct hvc_struct {
>>   	struct work_struct tty_resize;
>>   	struct list_head next;
>>   	unsigned long flags;
>> +	char out_ch;
>> +	char out_buf[N_OUTBUF] __ALIGNED__;
>> +	int outbuf_size;
>> +	char outbuf[0] __ALIGNED__;
> I'm trying to understand this patch but I am finding it very difficult
> to understand what the difference between `out_buf` and `outbuf`
> (without the underscore) is supposed to be. `out_buf` is statically
> sized and the size of `outbuf` is supposed to depend on the arguments to
> hvc_alloc(), but I can't quite figure out what the roles of each one are
> and their names are confusingly similiar!
>
> I looked briefly at the older revisions of the series but it didn't make
> things much clearer.
>
> Could you give them clearer names?

thanks for the comments,

It is indeed not easy to understand by the name. I will change it to a 
proper name if we have next version patch.

Jiri Slaby is worring about the performance, because we need add two 
locks to protect 'out_ch' and 'out_buf' separately, the origin on-stack 
buffer is lockless.

I don't know whether this solution can be accepted, just waiting for 
Jiri's further commtents.

>
> Also, looking at Documentation/process/deprecated.rst, it looks like
> maybe we want to use a 'flexible array member' instead:
>
> .. note:: If you are using struct_size() on a structure containing a zero-length
>          or a one-element array as a trailing array member, please refactor such
>          array usage and switch to a `flexible array member
>          <#zero-length-and-one-element-arrays>`_ instead.
>
> I think we want:
thanks, we should use [], not [0].
>
>> +	char outbuf[] __ALIGNED__;
> Kind regards,
> Daniel

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D7B3EB486
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 13:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmLrq1cSsz3bnG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 21:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmLrJ0WkHz3015
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 21:27:27 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R601e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UitBNND_1628854029; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0UitBNND_1628854029) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 13 Aug 2021 19:27:10 +0800
Subject: Re: [PATCH v6 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210812094532.145497-1-xianting.tian@linux.alibaba.com>
 <20210812094532.145497-2-xianting.tian@linux.alibaba.com>
 <YRYeyeZ/22rR26u7@kroah.com>
From: Xianting TIan <xianting.tian@linux.alibaba.com>
Message-ID: <aca8a77c-f608-ef2f-5bcb-9411cec3e99d@linux.alibaba.com>
Date: Fri, 13 Aug 2021 19:27:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YRYeyeZ/22rR26u7@kroah.com>
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
Cc: arnd@arndb.de, amit@kernel.org, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/8/13 下午3:27, Greg KH 写道:
> On Thu, Aug 12, 2021 at 05:45:31PM +0800, Xianting Tian wrote:
>> As well known, hvc backend can register its opertions to hvc backend.
>> the opertions contain put_chars(), get_chars() and so on.
>>
>> Some hvc backend may do dma in its opertions. eg, put_chars() of
>> virtio-console. But in the code of hvc framework, it may pass DMA
>> incapable memory to put_chars() under a specific configuration, which
>> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
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
>> a new hvc backend using dma added in the furture.
>>
>> We make 'char c[N_OUTBUF]' part of 'struct hvc_struct', so hp->c is no
>> longer the stack memory. we can use it in above two cases.
>>
>> Other fix is use L1_CACHE_BYTES as the alignment, use 'sizeof(long)' as
>> dma alignment is wrong. And use struct_size() to calculate size of
>> hvc_struct.
>>
>> Introduce another array(cons_outbuf[]) for the hp->c pointers next to
>> the cons_ops[] and vtermnos[] arrays.
>>
>> With the patch, we can remove the fix c4baad5029.
>>
>> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>> Tested-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> As the build shows, you obviously did not test this code :(
>
> Also, no need to add a tested-by line as that should be implicit if you
> wrote and signed off on it.
>
> I am going to ask you to get some help from some other developers at
> your company, and get them to test and sign off on this series before
> sending it out again, as there seems to be a bit of a disconnect as to
> what is actually needed to do when sending a patch for us to review.
>
> That is now a requirement for us to be able to take your changes here.
>
> thanks,

Sorry for this.

I tested V1-V4,  But for V6, I take it for granted that there is no 
problem when I just switch to use array(cons_outbuf[]).  I indeed didn't 
test it:(

I will test it and find virtualization test expert to test again before 
sending next patch.

>
> greg k-h

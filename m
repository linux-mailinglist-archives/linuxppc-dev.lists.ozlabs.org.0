Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE642D580
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 10:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVNYv0y03z2ypR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 19:56:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131;
 helo=out30-131.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVNYN6glSz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 19:56:22 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Urmp48k_1634201765; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Urmp48k_1634201765) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 14 Oct 2021 16:56:06 +0800
Subject: Re: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
To: Greg KH <gregkh@linuxfoundation.org>
References: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
 <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
 <YWGD8y9VfBIQBu2h@kroah.com>
 <3516c58c-e8e6-2e5a-2bc8-ad80e2124d37@linux.alibaba.com>
 <YWJ7NuapWOZ4QirJ@kroah.com>
 <4dbeddb9-1068-d282-2758-55d0f788ea61@linux.alibaba.com>
 <YWftKQ3fTb8QlM6/@kroah.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <8225536f-8ecb-0678-f630-265652793a42@linux.alibaba.com>
Date: Thu, 14 Oct 2021 16:56:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YWftKQ3fTb8QlM6/@kroah.com>
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
Cc: arnd@arndb.de, amit@kernel.org, jirislaby@kernel.org,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/10/14 下午4:41, Greg KH 写道:
> On Thu, Oct 14, 2021 at 04:34:59PM +0800, Xianting Tian wrote:
>> 在 2021/10/10 下午1:33, Greg KH 写道:
>>> On Sat, Oct 09, 2021 at 11:45:23PM +0800, Xianting Tian wrote:
>>>> 在 2021/10/9 下午7:58, Greg KH 写道:
>>>>> Did you look at the placement using pahole as to how this structure now
>>>>> looks?
>>>> thanks for all your commnts. for this one, do you mean I need to remove the
>>>> blank line?  thanks
>>>>
>>> No, I mean to use the tool 'pahole' to see the structure layout that you
>>> just created and determine if it really is the best way to add these new
>>> fields, especially as you are adding huge buffers with odd alignment.
>> thanks,
>>
>> Based on your comments, I removed 'char outchar',  remian the position of
>> 'int outbuf_size' unchanged to keep outbuf_size and lock in the same cache
>> line.  Now hvc_struct change as below,
>>
>>   struct hvc_struct {
>>          struct tty_port port;
>>          spinlock_t lock;
>>          int index;
>>          int do_wakeup;
>> -       char *outbuf;
>>          int outbuf_size;
>>          int n_outbuf;
>>          uint32_t vtermno;
>> @@ -48,6 +57,16 @@ struct hvc_struct {
>>          struct work_struct tty_resize;
>>          struct list_head next;
>>          unsigned long flags;
>> +
>> +       /*
>> +        * the buf is used in hvc console api for putting chars,
>> +        * and also used in hvc_poll_put_char() for putting single char.
>> +        */
>> +       char cons_outbuf[N_OUTBUF] __ALIGNED__;
>> +       spinlock_t cons_outbuf_lock;
>> +
>> +       /* the buf is used for putting chars to tty */
>> +       char outbuf[] __ALIGNED__;
>>   };
>>
>> pahole for above hvc_struct as below,  is it ok for you?  do we need to pack
>> the hole? thanks
>>
>> struct hvc_struct {
>>      struct tty_port            port;                 /*     0 352 */
>>      /* --- cacheline 5 boundary (320 bytes) was 32 bytes ago --- */
>>      spinlock_t                 lock;                 /*   352 4 */
>>      int                        index;                /*   356 4 */
>>      int                        do_wakeup;            /*   360 4 */
>>      int                        outbuf_size;          /*   364 4 */
>>      int                        n_outbuf;             /*   368 4 */
>>      uint32_t                   vtermno;              /*   372 4 */
>>      const struct hv_ops  *     ops;                  /*   376 8 */
>>      /* --- cacheline 6 boundary (384 bytes) --- */
>>      int                        irq_requested;        /*   384 4 */
>>      int                        data;                 /*   388 4 */
>>      struct winsize             ws;                   /*   392 8 */
>>      struct work_struct         tty_resize;           /*   400 32 */
>>      struct list_head           next;                 /*   432 16 */
>>      /* --- cacheline 7 boundary (448 bytes) --- */
>>      long unsigned int          flags;                /*   448 8 */
>>
>>      /* XXX 56 bytes hole, try to pack */
>>
>>      /* --- cacheline 8 boundary (512 bytes) --- */
>>      char                       cons_outbuf[16];      /*   512 16 */
>>      spinlock_t                 cons_outbuf_lock;     /*   528 4 */
>>
>>      /* XXX 44 bytes hole, try to pack */
> Why not move the spinlock up above the cons_outbuf?  Will that not be a
> bit better?
thanks, I will move it avove cons_outbuf, and send v11 patches soon.
>
> Anyway, this is all fine, and much better than before, thanks.
>
> greg k-h

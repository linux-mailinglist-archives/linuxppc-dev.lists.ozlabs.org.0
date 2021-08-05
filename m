Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6153E13A6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 13:14:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgQxQ6ctCz3d81
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 21:14:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgQx60F1gz3cKv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 21:14:32 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R941e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Ui1z.hC_1628162053; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Ui1z.hC_1628162053) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 05 Aug 2021 19:14:13 +0800
Subject: Re: [PATCH v3 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org,
 amit@kernel.org, arnd@arndb.de, osandov@fb.com
References: <20210804025453.93543-1-xianting.tian@linux.alibaba.com>
 <0f26a1c3-53e8-9282-69e8-8d81a9cafc59@kernel.org>
 <f1b92c7d-0eaf-4eac-ecd2-fbb74fb63b52@kernel.org>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <202cf491-5cdd-999f-d556-a5ebd2b4e266@linux.alibaba.com>
Date: Thu, 5 Aug 2021 19:14:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f1b92c7d-0eaf-4eac-ecd2-fbb74fb63b52@kernel.org>
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


在 2021/8/5 下午4:09, Jiri Slaby 写道:
> On 05. 08. 21, 9:58, Jiri Slaby wrote:
>> Hi,
>>
>> On 04. 08. 21, 4:54, Xianting Tian wrote:
>>> @@ -933,6 +949,16 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, 
>>> int data,
>>>       hp->outbuf_size = outbuf_size;
>>>       hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
>
> This deserves cleanup too. Why is "outbuf" not "char outbuf[0] 
> __ALIGNED__" at the end of the structure? The allocation would be 
> easier (using struct_size()) and this line would be gone completely.
I will make the cleanup in v4.
>
>>> +    /*
>>> +     * hvc_con_outbuf is guaranteed to be aligned at least to the
>>> +     * size(N_OUTBUF) by kmalloc().
>>> +     */
>>> +    hp->hvc_con_outbuf = kzalloc(N_OUTBUF, GFP_KERNEL);
>>> +    if (!hp->hvc_con_outbuf)
>>> +        return ERR_PTR(-ENOMEM);
>>
>> This leaks hp, right?
>
> Actually, why don't you make
> char c[N_OUTBUF] __ALIGNED__;
>
> part of struct hvc_struct directly?
thanks, it a good idea, I will change it in v4.
>
>> BTW your 2 patches are still not threaded, that is hard to follow.
>>
>>> +
>>> +    spin_lock_init(&hp->hvc_con_lock);
>>> +
>>>       tty_port_init(&hp->port);
>>>       hp->port.ops = &hvc_port_ops;
>>
>> thanks,

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE03E1032
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 10:24:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgM8r1nxXz3dBh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 18:24:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgM8Q5LY0z2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 18:24:03 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R531e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Ui1Bj73_1628151838; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Ui1Bj73_1628151838) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 05 Aug 2021 16:23:58 +0800
Subject: Re: [PATCH v3 1/2] tty: hvc: pass DMA capable memory to put_chars()
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210804025453.93543-1-xianting.tian@linux.alibaba.com>
 <0f26a1c3-53e8-9282-69e8-8d81a9cafc59@kernel.org>
 <40f78d10-0a57-4620-e7e2-f806bd61abca@linux.alibaba.com>
 <YQue3tK98e6fAqwP@kroah.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <79af3486-4d65-7d3a-2603-f2a90954311f@linux.alibaba.com>
Date: Thu, 5 Aug 2021 16:23:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YQue3tK98e6fAqwP@kroah.com>
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
Cc: arnd@arndb.de, amit@kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2021/8/5 下午4:18, Greg KH 写道:
> On Thu, Aug 05, 2021 at 04:08:46PM +0800, Xianting Tian wrote:
>> 在 2021/8/5 下午3:58, Jiri Slaby 写道:
>>> Hi,
>>>
>>> On 04. 08. 21, 4:54, Xianting Tian wrote:
>>>> @@ -933,6 +949,16 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno,
>>>> int data,
>>>>        hp->outbuf_size = outbuf_size;
>>>>        hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
>>>>    +    /*
>>>> +     * hvc_con_outbuf is guaranteed to be aligned at least to the
>>>> +     * size(N_OUTBUF) by kmalloc().
>>>> +     */
>>>> +    hp->hvc_con_outbuf = kzalloc(N_OUTBUF, GFP_KERNEL);
>>>> +    if (!hp->hvc_con_outbuf)
>>>> +        return ERR_PTR(-ENOMEM);
>>> This leaks hp, right?
>>>
>>> BTW your 2 patches are still not threaded, that is hard to follow.
>> yes, thanks, I found the bug, I am preparing to do this in v4.
>>
>> It is the first time I send series patches(number >1), I checked the method
>> for sending series patch on LKML.org, I should send '0/2' which is the
>> history info for series patches.
> Please use 'git send-email' to send the full series all at once,
> otherwise it is hard to make the emails threaded "by hand" if you do not
> do so.
I got it, thanks for your guide:)
>
> thanks,
>
> greg k-h

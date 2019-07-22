Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31B709A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 21:25:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ss511x0rzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 05:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="FhOV+LY5"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ss3B2rZxzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 05:23:34 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 66F147F8B5;
 Mon, 22 Jul 2019 14:23:30 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1563823411; bh=NJ237PJwBHG909FugNecM+wY8J8bPkyB1eQtb7Qk4SY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FhOV+LY5uUnSDYv1fuAD9a51SN7QJ7IDXsxvPKWzsIE0pvlQ81cQc423h7u+4kpSe
 flhswf1aIkzuVVLwXeUZQlDz0qCg/yohIH5xFZnHxhBANnpO4sT7Qva43pDZtlAKe8
 cKa2LpXnReBdZeMw4oMnjyYwqQCJb7xep4gQKyP2E6RFU20PH9357x+GvB8WnWxYAX
 lqfj7mW7nuLl4PGDD/AvVxMQYvsOoSAhZ6qra2VJBo9C338A15+nhFUSD4MmBNpNQN
 ghgjubnTYazzUb/GGHz2Emr1QJplsQyBmyRZK5EuWaiMWYmrPDFhSrtmh/gXVfCSG+
 DbemDTdWlANvw==
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
 <CAK8P3a1ChtE10D=enp_a+isBCGgRW1nX6-0jChuAvTcUAWECBg@mail.gmail.com>
 <87ef2i6z99.fsf@concordia.ellerman.id.au>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <ff0c5578-1cb4-af29-ca40-ef2c6b246d2f@anastas.io>
Date: Mon, 22 Jul 2019 14:23:28 -0500
MIME-Version: 1.0
In-Reply-To: <87ef2i6z99.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/22/19 7:16 AM, Michael Ellerman wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
>> On Thu, Jul 18, 2019 at 11:52 AM Christoph Hellwig <hch@lst.de> wrote:
>>> On Thu, Jul 18, 2019 at 10:49:34AM +0200, Christoph Hellwig wrote:
>>>> On Thu, Jul 18, 2019 at 01:45:16PM +1000, Oliver O'Halloran wrote:
>>>>>> Other than m68k, mips, and arm64, everybody else that doesn't have
>>>>>> ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
>>>>>> I assume this behavior is acceptable on those architectures.
>>>>>
>>>>> It might be acceptable, but there's no reason to use pgport_noncached
>>>>> if the platform supports cache-coherent DMA.
>>>>>
>>>>> Christoph (+cc) made the change so maybe he saw something we're missing.
>>>>
>>>> I always found the forcing of noncached access even for coherent
>>>> devices a little odd, but this was inherited from the previous
>>>> implementation, which surprised me a bit as the different attributes
>>>> are usually problematic even on x86.  Let me dig into the history a
>>>> bit more, but I suspect the righ fix is to default to cached mappings
>>>> for coherent devices.
>>>
>>> Ok, some history:
>>>
>>> The generic dma mmap implementation, which we are effectively still
>>> using today was added by:
>>>
>>> commit 64ccc9c033c6089b2d426dad3c56477ab066c999
>>> Author: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Date:   Thu Jun 14 13:03:04 2012 +0200
>>>
>>>      common: dma-mapping: add support for generic dma_mmap_* calls
>>>
>>> and unconditionally uses pgprot_noncached in dma_common_mmap, which is
>>> then used as the fallback by dma_mmap_attrs if no ->mmap method is
>>> present.  At that point we already had the powerpc implementation
>>> that only uses pgprot_noncached for non-coherent mappings, and
>>> the arm one, which uses pgprot_writecombine if DMA_ATTR_WRITE_COMBINE
>>> is set and otherwise pgprot_dmacoherent, which seems to be uncached.
>>> Arm did support coherent platforms at that time, but they might have
>>> been an afterthought and not handled properly.
>>
>> Cache-coherent devices are still very rare on 32-bit ARM.
>>
>> Among the callers of dma_mmap_coherent(), almost all are in platform
>> specific device drivers that only ever run on noncoherent ARM SoCs,
>> which explains why nobody would have noticed problems.
>>
>> There is also a difference in behavior between ARM and PowerPC
>> when dealing with mismatched cacheability attributes: If the same
>> page is mapped as both cached and uncached to, this may
>> cause silent undefined behavior on ARM, while PowerPC should
>> enter a checkstop as soon as it notices.
> 
> On newer Power CPUs it's actually more like the ARM behaviour.
> 
> I don't know for sure that it will *never* checkstop but there are at
> least cases where it won't. There's some (not much) detail in the
> Power8/9 user manuals.

The issue was discovered due to sporadic checkstops on P9, so it
seems like it will happen at least sometimes.

> cheers

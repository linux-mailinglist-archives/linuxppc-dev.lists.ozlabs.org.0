Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6270D28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 01:11:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sy6W2zCLzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 09:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sy3T56qnzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 09:09:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45sy3P6Gzrz9s8m;
 Tue, 23 Jul 2019 09:09:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Shawn Anastasio <shawn@anastas.io>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
In-Reply-To: <ff0c5578-1cb4-af29-ca40-ef2c6b246d2f@anastas.io>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
 <CAK8P3a1ChtE10D=enp_a+isBCGgRW1nX6-0jChuAvTcUAWECBg@mail.gmail.com>
 <87ef2i6z99.fsf@concordia.ellerman.id.au>
 <ff0c5578-1cb4-af29-ca40-ef2c6b246d2f@anastas.io>
Date: Tue, 23 Jul 2019 09:09:04 +1000
Message-ID: <87blxl7jlb.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Shawn Anastasio <shawn@anastas.io> writes:
> On 7/22/19 7:16 AM, Michael Ellerman wrote:
>> Arnd Bergmann <arnd@arndb.de> writes:
>>> On Thu, Jul 18, 2019 at 11:52 AM Christoph Hellwig <hch@lst.de> wrote:
>>>> On Thu, Jul 18, 2019 at 10:49:34AM +0200, Christoph Hellwig wrote:
>>>>> On Thu, Jul 18, 2019 at 01:45:16PM +1000, Oliver O'Halloran wrote:
>>>>>>> Other than m68k, mips, and arm64, everybody else that doesn't have
>>>>>>> ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
>>>>>>> I assume this behavior is acceptable on those architectures.
>>>>>>
>>>>>> It might be acceptable, but there's no reason to use pgport_noncached
>>>>>> if the platform supports cache-coherent DMA.
>>>>>>
>>>>>> Christoph (+cc) made the change so maybe he saw something we're missing.
>>>>>
>>>>> I always found the forcing of noncached access even for coherent
>>>>> devices a little odd, but this was inherited from the previous
>>>>> implementation, which surprised me a bit as the different attributes
>>>>> are usually problematic even on x86.  Let me dig into the history a
>>>>> bit more, but I suspect the righ fix is to default to cached mappings
>>>>> for coherent devices.
>>>>
>>>> Ok, some history:
>>>>
>>>> The generic dma mmap implementation, which we are effectively still
>>>> using today was added by:
>>>>
>>>> commit 64ccc9c033c6089b2d426dad3c56477ab066c999
>>>> Author: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Date:   Thu Jun 14 13:03:04 2012 +0200
>>>>
>>>>      common: dma-mapping: add support for generic dma_mmap_* calls
>>>>
>>>> and unconditionally uses pgprot_noncached in dma_common_mmap, which is
>>>> then used as the fallback by dma_mmap_attrs if no ->mmap method is
>>>> present.  At that point we already had the powerpc implementation
>>>> that only uses pgprot_noncached for non-coherent mappings, and
>>>> the arm one, which uses pgprot_writecombine if DMA_ATTR_WRITE_COMBINE
>>>> is set and otherwise pgprot_dmacoherent, which seems to be uncached.
>>>> Arm did support coherent platforms at that time, but they might have
>>>> been an afterthought and not handled properly.
>>>
>>> Cache-coherent devices are still very rare on 32-bit ARM.
>>>
>>> Among the callers of dma_mmap_coherent(), almost all are in platform
>>> specific device drivers that only ever run on noncoherent ARM SoCs,
>>> which explains why nobody would have noticed problems.
>>>
>>> There is also a difference in behavior between ARM and PowerPC
>>> when dealing with mismatched cacheability attributes: If the same
>>> page is mapped as both cached and uncached to, this may
>>> cause silent undefined behavior on ARM, while PowerPC should
>>> enter a checkstop as soon as it notices.
>> 
>> On newer Power CPUs it's actually more like the ARM behaviour.
>> 
>> I don't know for sure that it will *never* checkstop but there are at
>> least cases where it won't. There's some (not much) detail in the
>> Power8/9 user manuals.
>
> The issue was discovered due to sporadic checkstops on P9, so it
> seems like it will happen at least sometimes.

Yeah true. I wasn't sure if that checkstop was actually caused by a
cached/uncached mismatch or something else, but looks like it was, from
the hostboot issue (https://github.com/open-power/hostboot/issues/180):

  12.47015|  Signature Description    : pu.ex:k0:n0:s0:p00:c0 (L2FIR[16]) Cache line inhibited hit cacheable space


So I'm not really sure how to square that with the documentation in the
user manual:

  If a caching-inhibited load instruction hits in the L1 data cache, the
  load data is serviced from the L1 data cache and no request is sent to
  the NCU.
  If a caching-inhibited store instruction hits in the L1 data cache,
  the store data is written to the L1 data cache and sent to the NCU.
  Note that the L1 data cache and L2 cache are no longer coherent.

I guess I'm either misinterpreting that section or there's some *other*
documentation somewhere I haven't found that says that it will also
checkstop.

cheers

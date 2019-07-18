Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B64F46D572
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 21:50:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qPrX1ZYlzDqBL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 05:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="Selwz7QA"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qPl26TWlzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 05:46:06 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4CFC57F92F;
 Thu, 18 Jul 2019 14:46:03 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1563479164; bh=tL0lLp+yfKoF5lqdV9tpr77mugeehISgo5OFacFo7c8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Selwz7QA7Bh7o1ZtCAbS6oaiKTyiycgO/O7JWUaLgDYNJf1foc+6cbNbPdsvjMBzC
 DYukHtYtJKzYE550WmtYULpA7TkRABAiHf1M6fCZWEPafzGzKjYq1urRhDknZYBxY4
 75tW2p7NDplo09JWYSx3VPf3zVfe5J/znLrZDpd8HGtt95icTijr8IYyEUQDpQDgf2
 mal11yvyjGZNts1CIcETP3vzoSR37G30ac/4xoCbozmdhMIpu7uoWmj5MvH4lMP8fO
 GvPqsPXgYAX2Z8C+BuDeQs6CF/Up7Jjwspj37Vaew0EOKqr1Y59YWmblATBjM33zuS
 Fx5khXqdICfDQ==
Subject: Re: [PATCH] powerpc/dma: Fix invalid DMA mmap behavior
To: Christoph Hellwig <hch@lst.de>, Oliver O'Halloran <oohall@gmail.com>
References: <20190717235437.12908-1-shawn@anastas.io>
 <8b6963ac-521a-5752-2cfb-bcd87cad9dc4@ozlabs.ru>
 <f9753335-b62c-67b4-84d7-7b67fe1b64ca@anastas.io>
 <CAOSf1CGA_fDH7aAqRkc4maJUByaX7adGcjyt3cj4KFsMJNnocA@mail.gmail.com>
 <20190718084934.GF24562@lst.de> <20190718095200.GA25744@lst.de>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <2da4fafe-93f2-4bf1-62e1-180a3ac800fa@anastas.io>
Date: Thu, 18 Jul 2019 14:46:00 -0500
MIME-Version: 1.0
In-Reply-To: <20190718095200.GA25744@lst.de>
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
 iommu@lists.linux-foundation.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/18/19 4:52 AM, Christoph Hellwig wrote:
> On Thu, Jul 18, 2019 at 10:49:34AM +0200, Christoph Hellwig wrote:
>> On Thu, Jul 18, 2019 at 01:45:16PM +1000, Oliver O'Halloran wrote:
>>>> Other than m68k, mips, and arm64, everybody else that doesn't have
>>>> ARCH_NO_COHERENT_DMA_MMAP set uses this default implementation, so
>>>> I assume this behavior is acceptable on those architectures.
>>>
>>> It might be acceptable, but there's no reason to use pgport_noncached
>>> if the platform supports cache-coherent DMA.
>>>
>>> Christoph (+cc) made the change so maybe he saw something we're missing.
>>
>> I always found the forcing of noncached access even for coherent
>> devices a little odd, but this was inherited from the previous
>> implementation, which surprised me a bit as the different attributes
>> are usually problematic even on x86.  Let me dig into the history a
>> bit more, but I suspect the righ fix is to default to cached mappings
>> for coherent devices.
> 
> Ok, some history:
> 
> The generic dma mmap implementation, which we are effectively still
> using today was added by:
> 
> commit 64ccc9c033c6089b2d426dad3c56477ab066c999
> Author: Marek Szyprowski <m.szyprowski@samsung.com>
> Date:   Thu Jun 14 13:03:04 2012 +0200
> 
>      common: dma-mapping: add support for generic dma_mmap_* calls
> 
> and unconditionally uses pgprot_noncached in dma_common_mmap, which is
> then used as the fallback by dma_mmap_attrs if no ->mmap method is
> present.  At that point we already had the powerpc implementation
> that only uses pgprot_noncached for non-coherent mappings, and
> the arm one, which uses pgprot_writecombine if DMA_ATTR_WRITE_COMBINE
> is set and otherwise pgprot_dmacoherent, which seems to be uncached.
> Arm did support coherent platforms at that time, but they might have
> been an afterthought and not handled properly.
> 
> So it migt have been that we were all wrong for that time and might
> have to fix it up.

Personally, I'm not a huge fan of an implicit default for something
inherently architecture-dependent like this at all. What I'd like to
see is a mechanism that forces architecture code to explicitly
opt in to the default pgprot settings if they don't provide an
implementation of arch_dma_mmap_pgprot. This could perhaps be done
by reversing ARCH_HAS_DMA_MMAP_PGPROT to something like
ARCH_USE_DEFAULT_DMA_MMAP_PGPROT.

This way as more systems are moved to use the common mmap code instead
of their ops->mmap, the people doing the refactoring have to make an
explicit decision about the pgprot settings to use. Such a configuration
would have likely prevented this situation with powerpc from happening.

That being said, if the default behavior doesn't make sense in the
general case it should probably be fixed as well.

Curious to hear some thoughts on this.

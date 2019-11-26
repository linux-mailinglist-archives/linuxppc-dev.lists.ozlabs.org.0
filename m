Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEEC10A630
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 22:48:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MyFl54wczDqnv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 08:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47MyBR6m1GzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 08:45:33 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F5431B;
 Tue, 26 Nov 2019 13:45:31 -0800 (PST)
Received: from [192.168.1.124] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37D3B3F52E;
 Tue, 26 Nov 2019 13:45:26 -0800 (PST)
Subject: Re: [PATCH v2] dma-mapping: treat dev->bus_dma_mask as a DMA limit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Nathan Chancellor <natechancellor@gmail.com>
References: <20191121092646.8449-1-nsaenzjulienne@suse.de>
 <20191123165108.GA15306@ubuntu-x2-xlarge-x86> <20191125074412.GA30595@lst.de>
 <0b851d0e-37c7-062e-c287-05f8c8a54c16@arm.com>
 <45feed391bbd95c46f64b31cf8817d4f773c8da1.camel@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <935d65b4-a28e-d7b9-7392-42fec71b5150@arm.com>
Date: Tue, 26 Nov 2019 21:45:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <45feed391bbd95c46f64b31cf8817d4f773c8da1.camel@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Paul Burton <paulburton@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-pci@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, iommu@lists.linux-foundation.org,
 Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-11-26 6:51 pm, Nicolas Saenz Julienne wrote:
> On Mon, 2019-11-25 at 16:33 +0000, Robin Murphy wrote:
>> On 25/11/2019 7:44 am, Christoph Hellwig wrote:
>>> On Sat, Nov 23, 2019 at 09:51:08AM -0700, Nathan Chancellor wrote:
>>>> Just as an FYI, this introduces a warning on arm32 allyesconfig for me:
>>>
>>> I think the dma_limit argument to iommu_dma_alloc_iova should be a u64
>>> and/or we need to use min_t and open code the zero exception.
>>>
>>> Robin, Nicolas - any opinions?
>>
>> Yeah, given that it's always held a mask I'm not entirely sure why it
>> was ever a dma_addr_t rather than a u64. Unless anyone else is desperate
>> to do it I'll get a cleanup patch ready for rc1.
> 
> Sounds good to me too
> 
> Robin, since I started the mess, I'll be happy to do it if it helps offloading
> some work from you.

No worries - your change only exposed my original weird decision ;)  On 
second look the patch was literally a trivial one-liner, so I've written 
it up already.

Cheers,
Robin.

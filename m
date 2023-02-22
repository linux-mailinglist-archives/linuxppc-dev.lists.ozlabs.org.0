Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20C69F4EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 13:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMGPX2mcjz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 23:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMGNx34R5z3bbS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 23:55:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C680139F;
	Wed, 22 Feb 2023 04:56:07 -0800 (PST)
Received: from [10.57.16.42] (unknown [10.57.16.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21063F703;
	Wed, 22 Feb 2023 04:55:22 -0800 (PST)
Message-ID: <a46e1840-89be-de8f-6a91-3e4a16fa17c2@arm.com>
Date: Wed, 22 Feb 2023 12:55:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/7] MIPS DMA coherence fixes
Content-Language: en-GB
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221175423.GA15247@lst.de>
 <A8AC22A0-E883-4D9B-A629-5A3721B976C5@flygoat.com>
 <ed2d7750-786d-82a1-5e79-1f216a682b20@arm.com>
 <34578218-DC7A-4C8B-A01A-AD64831CCB43@flygoat.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <34578218-DC7A-4C8B-A01A-AD64831CCB43@flygoat.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, paul.walmsley@sifive.com, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-02-21 19:55, Jiaxun Yang wrote:
> 
> 
>> 2023年2月21日 19:46，Robin Murphy <robin.murphy@arm.com> 写道：
>>
>> On 2023-02-21 18:15, Jiaxun Yang wrote:
>>>> 2023年2月21日 17:54，Christoph Hellwig <hch@lst.de> 写道：
>>>>
>>>> Can you explain the motivation here?  Also why riscv patches are at
>>>> the end of a mips fіxes series?
>>> Ah sorry for any confusion.
>>> So the main purpose of this patch is to fix MIPS’s broken per-device coherency.
>>> To be more precise, we want to be able to control the default coherency for all devices probed from
>>> devicetree in early boot code.
>>
>> Including the patch which actually does that would be helpful. As it is, patches 4-7 here just appear to be moving an option around for no practical effect.
> 
> Well the affect is default coherency of devicetree probed devices are now following dma_default_coherent
> instead of a static Kconfig option. For MIPS platform, dma_default_coherent will be determined by boot code.

"Will be" is the issue I'm getting at. We can't review some future 
promise of a patch, we can only review actual patches. And it's hard to 
meaningfully review preparatory patches for some change without the full 
context of that change.

Thanks,
Robin.

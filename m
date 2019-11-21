Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2839105366
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 14:42:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jgjb4vcKzDr44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 00:42:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47JgWY6pgrzDr3Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 00:33:59 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E35FBDA7;
 Thu, 21 Nov 2019 05:33:55 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187683F703;
 Thu, 21 Nov 2019 05:33:53 -0800 (PST)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Christoph Hellwig <hch@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
Date: Thu, 21 Nov 2019 13:33:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/11/2019 12:21 pm, Christian Zigotzky wrote:
> On 21 November 2019 at 01:16 pm, Christian Zigotzky wrote:
>> On 21 November 2019 at 08:29 am, Christoph Hellwig wrote:
>>> On Sat, Nov 16, 2019 at 08:06:05AM +0100, Christian Zigotzky wrote:
>>>> /*
>>>>   *  DMA addressing mode.
>>>>   *
>>>>   *  0 : 32 bit addressing for all chips.
>>>>   *  1 : 40 bit addressing when supported by chip.
>>>>   *  2 : 64 bit addressing when supported by chip,
>>>>   *      limited to 16 segments of 4 GB -> 64 GB max.
>>>>   */
>>>> #define   SYM_CONF_DMA_ADDRESSING_MODE 
>>>> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
>>>>
>>>> Cyrus config:
>>>>
>>>> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
>>>>
>>>> I will configure “0 : 32 bit addressing for all chips” for the RC8. 
>>>> Maybe this is the solution.
>>> 0 means you are going to do bounce buffering a lot, which seems
>>> generally like a bad idea.
>>>
>>> But why are we talking about the sym53c8xx driver now?  The last issue
>>> you reported was about video4linux allocations.
>>>
>> Both drivers have the same problem. They don't work if we have more 
>> than 3.5GB RAM. I try to find a solution until you have a good 
>> solution. I have already a solution for V4L but I still need one for 
>> the sym53c8xx driver.
> OK, you mean that "0" is a bad idea but maybe it works until you have a 
> solution. ;-)

Is this on the same machine with the funny non-power-of-two bus_dma_mask 
as your other report? If so, does Nicolas' latest patch[1] help at all?

Robin.

[1] 
https://lore.kernel.org/linux-iommu/20191121092646.8449-1-nsaenzjulienne@suse.de/T/#u

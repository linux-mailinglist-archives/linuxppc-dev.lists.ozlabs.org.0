Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835569E87C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 20:42:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqS573KQz3bjx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 06:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 355 seconds by postgrey-1.36 at boromir; Wed, 22 Feb 2023 06:41:42 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqRV5tvWz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 06:41:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D5931650;
	Tue, 21 Feb 2023 11:35:54 -0800 (PST)
Received: from [10.57.13.181] (unknown [10.57.13.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0C13F703;
	Tue, 21 Feb 2023 11:35:09 -0800 (PST)
Message-ID: <54f204eb-79b5-5c1c-fffb-696939644d8c@arm.com>
Date: Tue, 21 Feb 2023 19:35:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/7] dma-mapping: Always provide dma_default_coherent
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221124613.2859-5-jiaxun.yang@flygoat.com>
 <20230221175813.GC15247@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230221175813.GC15247@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-02-21 17:58, Christoph Hellwig wrote:
> On Tue, Feb 21, 2023 at 12:46:10PM +0000, Jiaxun Yang wrote:
>> dma_default_coherent can be useful for determine default coherency
>> even on arches without noncoherent support.
> 
> How?

Indeed, "default" is conceptually meaningless when there is no possible 
alternative :/

Robin.

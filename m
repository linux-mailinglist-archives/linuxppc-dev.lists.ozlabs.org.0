Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C52C75D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 15:08:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CvKR3M4CzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 23:08:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=thunder.leizhen@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CvH835NvzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 23:06:08 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9196F290A5DB12249000;
 Tue, 28 May 2019 21:06:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.23.164) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Tue, 28 May 2019
 21:05:52 +0800
Subject: Re: [PATCH v7 1/1] iommu: enhance IOMMU dma mode build options
To: Joerg Roedel <joro@8bytes.org>
References: <20190520135947.14960-1-thunder.leizhen@huawei.com>
 <20190520135947.14960-2-thunder.leizhen@huawei.com>
 <20190527142140.GH8420@8bytes.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <5CED322E.20102@huawei.com>
Date: Tue, 28 May 2019 21:05:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20190527142140.GH8420@8bytes.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.23.164]
X-CFilter-Loop: Reflected
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
Cc: linux-ia64 <linux-ia64@vger.kernel.org>,
 Sebastian Ott <sebott@linux.ibm.com>, linux-doc <linux-doc@vger.kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, x86 <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Will Deacon <will.deacon@arm.com>, John Garry <john.garry@huawei.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Gerald
 Schaefer <gerald.schaefer@de.ibm.com>, Tony Luck <tony.luck@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/5/27 22:21, Joerg Roedel wrote:
> Hi Zhen Lei,
> 
> On Mon, May 20, 2019 at 09:59:47PM +0800, Zhen Lei wrote:
>>  arch/ia64/kernel/pci-dma.c                |  2 +-
>>  arch/powerpc/platforms/powernv/pci-ioda.c |  3 ++-
>>  arch/s390/pci/pci_dma.c                   |  2 +-
>>  arch/x86/kernel/pci-dma.c                 |  7 ++---
>>  drivers/iommu/Kconfig                     | 44 ++++++++++++++++++++++++++-----
>>  drivers/iommu/amd_iommu_init.c            |  3 ++-
>>  drivers/iommu/intel-iommu.c               |  2 +-
>>  drivers/iommu/iommu.c                     |  3 ++-
>>  8 files changed, 48 insertions(+), 18 deletions(-)
> 
> This needs Acks from the arch maintainers of ia64, powerpc, s390 and
> x86, at least.
> 
> It is easier for them if you split it up into the Kconfig change and
> separete patches per arch and per iommu driver. Then collect the Acks on
> the individual patches.

OK, thanks. I will do it tomorrow.

> 
> Thanks,
> 
> 	Joerg
> 
> .
> 

-- 
Thanks!
BestRegards


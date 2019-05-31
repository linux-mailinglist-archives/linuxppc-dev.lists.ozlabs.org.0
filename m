Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B630CC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 12:44:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fh0F5dsmzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 20:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=john.garry@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fgyr4wM5zDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 20:43:14 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9228C33A72539724796A;
 Fri, 31 May 2019 18:43:10 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 31 May 2019 18:42:59 +0800
Subject: Re: [PATCH v8 1/7] iommu: enhance IOMMU default DMA mode build options
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, "Jean-Philippe
 Brucker" <jean-philippe.brucker@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will.deacon@arm.com>, Joerg Roedel
 <joro@8bytes.org>, "Jonathan Corbet" <corbet@lwn.net>, linux-doc
 <linux-doc@vger.kernel.org>, Sebastian Ott <sebott@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@de.ibm.com>, "Martin Schwidefsky"
 <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "Michael Ellerman" <mpe@ellerman.id.au>, Tony Luck
 <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, David Woodhouse
 <dwmw2@infradead.org>, iommu <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, x86 <x86@kernel.org>,
 linux-ia64 <linux-ia64@vger.kernel.org>
References: <20190530034831.4184-1-thunder.leizhen@huawei.com>
 <20190530034831.4184-2-thunder.leizhen@huawei.com>
 <645bd526-4eb0-4a36-2dda-023f009247ab@huawei.com>
 <030bafab-58f5-8bb1-0533-2977d6e138b2@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <55d0e30c-5bca-41fc-5bf0-4366dc387afd@huawei.com>
Date: Fri, 31 May 2019 11:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <030bafab-58f5-8bb1-0533-2977d6e138b2@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.202.227.238]
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
Cc: Linuxarm <linuxarm@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>> -config IOMMU_DEFAULT_PASSTHROUGH
>>> -    bool "IOMMU passthrough by default"
>>> +choice
>>> +    prompt "IOMMU default DMA mode"
>>>      depends on IOMMU_API
>>> -        help
>>> -      Enable passthrough by default, removing the need to pass in
>>> -      iommu.passthrough=on or iommu=pt through command line. If this
>>> -      is enabled, you can still disable with iommu.passthrough=off
>>> -      or iommu=nopt depending on the architecture.
>>> +    default IOMMU_DEFAULT_STRICT
>>> +    help
>>> +      This option allows IOMMU DMA mode to be chose at build time, to
>>
>> As before:
>> /s/chose/chosen/, /s/allows IOMMU/allows an IOMMU/
> I'm sorry that the previous version was not modified.
>
>>
>>> +      override the default DMA mode of each ARCHs, removing the need to
>>
>> Again, as before:
>> ARCHs should be singular
> OK
>
>>
>>> +      pass in kernel parameters through command line. You can still use
>>> +      ARCHs specific boot options to override this option again.

*

>>> +
>>> +config IOMMU_DEFAULT_PASSTHROUGH
>>> +    bool "passthrough"
>>> +    help
>>> +      In this mode, the DMA access through IOMMU without any addresses
>>> +      translation. That means, the wrong or illegal DMA access can not
>>> +      be caught, no error information will be reported.
>>>
>>>        If unsure, say N here.
>>>
>>> +config IOMMU_DEFAULT_LAZY
>>> +    bool "lazy"
>>> +    help
>>> +      Support lazy mode, where for every IOMMU DMA unmap operation, the
>>> +      flush operation of IOTLB and the free operation of IOVA are deferred.
>>> +      They are only guaranteed to be done before the related IOVA will be
>>> +      reused.
>>
>> why no advisory on how to set if unsure?
> Because the LAZY and STRICT have their own advantages and disadvantages.
>
> Should I say: If unsure, keep the default。

Maybe. So you could put this in the help for the choice, * above, and 
remove the advisory on IOMMU_DEFAULT_PASSTHROUGH.

However the maintainer may have a different view.

Thanks,
John

>
>>
>>> +
>>> +config IOMMU_DEFAULT_STRICT
>>> +    bool "strict"
>>> +    help
>>> +      For every IOMMU DMA unmap operation, the flush operation of IOTLB and
>>> +      the free operation of IOVA are guaranteed to be done in the unmap
>>> +      function.
>>> +
>>> +      This mode is safer than the two above, but it maybe slower in some
>>> +      high performace scenarios.
>>
>> and here?


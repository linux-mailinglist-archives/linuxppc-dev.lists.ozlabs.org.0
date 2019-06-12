Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A4B41C39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:29:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nxml0642zDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=thunder.leizhen@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nxjg3D9HzDqyZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:27:02 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 81C41E146AD85FC4BB65;
 Wed, 12 Jun 2019 14:26:54 +0800 (CST)
Received: from [127.0.0.1] (10.133.215.186) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 12 Jun 2019 14:26:46 +0800
Subject: Re: [PATCH v8 2/7] x86/dma: use IS_ENABLED() to simplify the code
To: Borislav Petkov <bp@alien8.de>
References: <20190530034831.4184-1-thunder.leizhen@huawei.com>
 <20190530034831.4184-3-thunder.leizhen@huawei.com>
 <20190612051624.GF32652@zn.tnic>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <bd743433-73e9-3cf1-c159-4371abebd989@huawei.com>
Date: Wed, 12 Jun 2019 14:26:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612051624.GF32652@zn.tnic>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.215.186]
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
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Will Deacon <will.deacon@arm.com>, John Garry <john.garry@huawei.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Tony Luck <tony.luck@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/6/12 13:16, Borislav Petkov wrote:
> On Thu, May 30, 2019 at 11:48:26AM +0800, Zhen Lei wrote:
>> This patch removes the ifdefs around CONFIG_IOMMU_DEFAULT_PASSTHROUGH to
>> improve readablity.
> 
> Avoid having "This patch" or "This commit" in the commit message. It is
> tautologically useless.

OK, thanks.

> 
> Also, do
> 
> $ git grep 'This patch' Documentation/process
> 
> for more details.
> 
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  arch/x86/kernel/pci-dma.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
>> index dcd272dbd0a9330..9f2b19c35a060df 100644
>> --- a/arch/x86/kernel/pci-dma.c
>> +++ b/arch/x86/kernel/pci-dma.c
>> @@ -43,11 +43,8 @@
>>   * It is also possible to disable by default in kernel config, and enable with
>>   * iommu=nopt at boot time.
>>   */
>> -#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
>> -int iommu_pass_through __read_mostly = 1;
>> -#else
>> -int iommu_pass_through __read_mostly;
>> -#endif
>> +int iommu_pass_through __read_mostly =
>> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
> 
> Let that line stick out.

OK, I will merge them on the same line.

> 
> Thx.
> 


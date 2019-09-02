Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8834FA4F1B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 08:13:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MKXc3kG9zDqbG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 16:13:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MKVp1g6TzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 16:12:18 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 906792FE466809629DAD;
 Mon,  2 Sep 2019 14:12:15 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Sep 2019
 14:12:05 +0800
Subject: Re: [PATCH v2 8/9] mips: numa: check the node id consistently for
 mips ip27
To: Paul Burton <paul.burton@mips.com>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-9-git-send-email-linyunsheng@huawei.com>
 <20190831154547.qzh6j4jwg5o5y4db@pburton-laptop>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <0290a79f-008a-a789-8545-1141c96c1023@huawei.com>
Date: Mon, 2 Sep 2019 14:11:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190831154547.qzh6j4jwg5o5y4db@pburton-laptop>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
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
Cc: "dalias@libc.org" <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>,
 "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>,
 "cai@lca.pw" <cai@lca.pw>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "x86@kernel.org" <x86@kernel.org>, "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "jhogan@kernel.org" <jhogan@kernel.org>,
 "nfont@linux.vnet.ibm.com" <nfont@linux.vnet.ibm.com>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
 "bp@alien8.de" <bp@alien8.de>, "luto@kernel.org" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rth@twiddle.net" <rth@twiddle.net>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ralf@linux-mips.org" <ralf@linux-mips.org>,
 "tbogendoerfer@suse.de" <tbogendoerfer@suse.de>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/8/31 23:45, Paul Burton wrote:
> Hi Yunsheng,
> 
> On Sat, Aug 31, 2019 at 01:58:22PM +0800, Yunsheng Lin wrote:
>> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
>> of proximity domain is optional, as below:
>>
>> This optional object is used to describe proximity domain
>> associations within a machine. _PXM evaluates to an integer
>> that identifies a device as belonging to a Proximity Domain
>> defined in the System Resource Affinity Table (SRAT).
>>
>> Since mips ip27 uses hub_data instead of node_to_cpumask_map,
>> this patch checks node id with the below case before returning
>> &hub_data(node)->h_cpus:
>> 1. if node_id >= MAX_COMPACT_NODES, return cpu_none_mask
>> 2. if node_id < 0, return cpu_online_mask
>> 3. if hub_data(node) is NULL, return cpu_online_mask
>>
>> [1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> 
> Similar to David's comment on the sparc patch, these systems don't use
> ACPI so I don't see from your commit message why this change would be
> relevant.
> 
> This same comment applies to patch 9 too.

Thanks for pointing out.

MIPS's NUMA node id is also defined by DT?


> 
> Thanks,
>     Paul
> 
>>
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> ---
>>  arch/mips/include/asm/mach-ip27/topology.h | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
>> index 965f079..914a55a 100644
>> --- a/arch/mips/include/asm/mach-ip27/topology.h
>> +++ b/arch/mips/include/asm/mach-ip27/topology.h
>> @@ -15,9 +15,18 @@ struct cpuinfo_ip27 {
>>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
>>  
>>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
>> -#define cpumask_of_node(node)	((node) == -1 ?				\
>> -				 cpu_all_mask :				\
>> -				 &hub_data(node)->h_cpus)
>> +
>> +static inline const struct cpumask *cpumask_of_node(int node)
>> +{
>> +	if (node >= MAX_COMPACT_NODES)
>> +		return cpu_none_mask;
>> +
>> +	if (node < 0 || !hub_data(node))
>> +		return cpu_online_mask;
>> +
>> +	return &hub_data(node)->h_cpus;
>> +}
>> +
>>  struct pci_bus;
>>  extern int pcibus_to_node(struct pci_bus *);
>>  
>> -- 
>> 2.8.1
>>
> 
> .
> 


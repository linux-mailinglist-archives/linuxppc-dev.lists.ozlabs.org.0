Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA8BC7B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 14:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d0Rl154YzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 22:12:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d0NR6pt5zDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 22:09:11 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 12F97ADB92CD75EEB565;
 Tue, 24 Sep 2019 20:09:07 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Sep 2019
 20:09:06 +0800
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Peter Zijlstra <peterz@infradead.org>
References: <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
 <20190924092551.GK2369@hirez.programming.kicks-ass.net>
 <c816abbe-155b-504b-cef1-6413f7cdd20c@huawei.com>
 <20190924112811.GK2332@hirez.programming.kicks-ass.net>
 <8cff8350-311e-3817-0c42-b6f98de589a3@huawei.com>
 <20190924115804.GO2349@hirez.programming.kicks-ass.net>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <10df14fd-ef26-cac5-1f4d-75546cb93964@huawei.com>
Date: Tue, 24 Sep 2019 20:09:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190924115804.GO2349@hirez.programming.kicks-ass.net>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, x86@kernel.org,
 rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
 mingo@redhat.com, jeffrey.t.kirsher@intel.com, jhogan@kernel.org,
 mattst88@gmail.com, linux-mips@vger.kernel.org, len.brown@intel.com,
 gor@linux.ibm.com, anshuman.khandual@arm.com, gregkh@linuxfoundation.org,
 bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/9/24 19:58, Peter Zijlstra wrote:
> On Tue, Sep 24, 2019 at 07:44:28PM +0800, Yunsheng Lin wrote:
>> From [1], there is a lot of devices with node id of NUMA_NO_NODE with the
>> FW_BUG.
>>
>> [1] https://lore.kernel.org/lkml/5a188e2b-6c07-a9db-fbaa-561e9362d3ba@huawei.com/
> 
> So aside of all the software devices which we can (and really should)
> fix; these:
> 
> 26.470076]  pci0000:00: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 26.815436]  pci0000:7b: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 27.004447]  pci0000:7a: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 27.236797]  pci0000:78: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 27.505833]  pci0000:7c: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 28.056452]  pci0000:74: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 28.470018]  pci0000:80: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 28.726411]  pci0000:bb: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 28.916656]  pci0000:ba: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 29.152839]  pci0000:b8: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 29.425808]  pci0000:bc: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 29.718593]  pci0000:b4: has invalid NUMA node(-1), default node of 0 now selected. Readjust it by writing to sysfs numa_node or contact your vendor for updates.
> 
> look like actual problems. How can PCI devices not have a node assigned?

The above PCI devices do not have a node assigned because I downgraded
the bios to a older version that has not implemented the "Proximity Domain"
feature specified by APCI, which is optional feature, so the bios denied
that it is a bug of the bios.

> 
> .
> 


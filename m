Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA57DA4386
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 11:00:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46L9Kc5cLxzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 19:00:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46L9GZ3yjJzDrBq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 18:57:42 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B80689698DBCC816583C;
 Sat, 31 Aug 2019 16:57:36 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Sat, 31 Aug 2019
 16:57:29 +0800
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently for
 sparc64
To: David Miller <davem@davemloft.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
 <20190830.235337.570776316111294728.davem@davemloft.net>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <0195eb73-99ae-fec2-3e11-2cb9e6677926@huawei.com>
Date: Sat, 31 Aug 2019 16:57:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190830.235337.570776316111294728.davem@davemloft.net>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 heiko.carstens@de.ibm.com, linuxarm@huawei.com, jiaxun.yang@flygoat.com,
 linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org,
 cai@lca.pw, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 x86@kernel.org, rppt@linux.ibm.com, borntraeger@de.ibm.com,
 dledford@redhat.com, mingo@redhat.com, jeffrey.t.kirsher@intel.com,
 jhogan@kernel.org, nfont@linux.vnet.ibm.com, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/8/31 14:53, David Miller wrote:
> From: Yunsheng Lin <linyunsheng@huawei.com>
> Date: Sat, 31 Aug 2019 13:58:21 +0800
> 
>> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
>> of proximity domain is optional, as below:
> 
> What in the world does the ACPI spec have to do with sparc64 NUMA
> node ID checking?

I am not sure I understand your question fully here.

Here is my issue when the bios does not implement the proximity domain
of a device because the feature is optional according to the ACPI spec,
the dev_to_node(dev) return -1, which causes out of bound access when
using the value to get the device's cpu mask by calling cpumask_of_node.

Did you mean sparc64 system does not has ACPI, the device's node id will
not specified by ACPI, so the ACPI is unrelated here?

Or did you mean the commit log is not clear enough to justify the change?

Or did you mean this problem should be fixed in somewhere else?

Any detail advice and suggestion will be very helpful, thanks.

> 
> .
> 


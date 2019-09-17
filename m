Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1DB4B59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:56:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xdm93CwszF2FN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 19:56:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xdjs40DlzF1wF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 19:54:07 +1000 (AEST)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4B34EC0AB5070CFC522D;
 Tue, 17 Sep 2019 17:54:01 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 17 Sep 2019
 17:53:58 +0800
Subject: Re: [PATCH v5] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Michal Hocko <mhocko@kernel.org>
References: <1568640481-133352-1-git-send-email-linyunsheng@huawei.com>
 <87pnjzsd8f.fsf@mpe.ellerman.id.au>
 <d748aae4-4d48-6f8a-2f6d-67fad5224ba9@huawei.com>
 <20190917093655.GA1872@dhcp22.suse.cz>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <07c78b6c-277e-eec0-a6cd-46beab1f1547@huawei.com>
Date: Tue, 17 Sep 2019 17:53:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190917093655.GA1872@dhcp22.suse.cz>
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
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, catalin.marinas@arm.com, jhogan@kernel.org,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, bp@alien8.de,
 luto@kernel.org, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, rafael@kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019/9/17 17:36, Michal Hocko wrote:
> On Tue 17-09-19 14:20:11, Yunsheng Lin wrote:
>> On 2019/9/17 13:28, Michael Ellerman wrote:
>>> Yunsheng Lin <linyunsheng@huawei.com> writes:
> [...]
>>>> But we cannot really copy the page allocator logic. Simply because the
>>>> page allocator doesn't enforce the near node affinity. It just picks it
>>>> up as a preferred node but then it is free to fallback to any other numa
>>>> node. This is not the case here and node_to_cpumask_map will only restrict
>>>> to the particular node's cpus which would have really non deterministic
>>>> behavior depending on where the code is executed. So in fact we really
>>>> want to return cpu_online_mask for NUMA_NO_NODE.
>>>>
>>>> Some arches were already NUMA_NO_NODE aware, but they return cpu_all_mask,
>>>> which should be identical with cpu_online_mask when those arches do not
>>>> support cpu hotplug, this patch also changes them to return cpu_online_mask
>>>> in order to be consistent and use NUMA_NO_NODE instead of "-1".
>>>
>>> Except some of those arches *do* support CPU hotplug, powerpc and sparc
>>> at least. So switching from cpu_all_mask to cpu_online_mask is a
>>> meaningful change.
>>
>> Yes, thanks for pointing out.
>>
>>>
>>> That doesn't mean it's wrong, but you need to explain why it's the right
>>> change.
>>
>> How about adding the below to the commit log:
>> Even if some of the arches do support CPU hotplug, it does not make sense
>> to return the cpu that has been hotplugged.
>>
>> Any suggestion?
> 
> Again, for the third time, I believe. Make it a separate patch please.
> There is absolutely no reason to conflate those two things.

Ok, thanks.
Will make the cpu_all_mask -> cpu_online_mask change a separate patch.

Also, do you think it is better to resend this as individual patches for each arch
or have all these changes in a single patch? I am not sure which is the common
practice for a multi-arches changes like this.

> 


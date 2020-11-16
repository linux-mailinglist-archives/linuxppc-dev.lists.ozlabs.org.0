Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2862C2B43AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 13:28:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZSyp0DlwzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 23:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZSsV318GzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 23:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=q1IFv/m2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZSsR5QWrz9sPB;
 Mon, 16 Nov 2020 23:23:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605529406;
 bh=JZfZsxZUVNPQQeLbY0jOvxZFvZQB5g1uNnYprCYR1ss=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=q1IFv/m21aK+HiNYRwaeyoKKpCTrsXfn0T1MYPY3POGU6mrWjWaFU3DD9Yc/ZTIhL
 lFqyuneeFy7VdZuu5ik0v04PJtASEaAUEsSDdf5F1KAJezbKNASuMZj4xoMmQ7y3+2
 b1Qcdv8tw1UcZ6e/drmMtKeXIJeN2m5HBeYJTMFb2ABIgpKwPxU04KPnm/3/zgNnXF
 DmGWrgG4VW2DLios3SikTpEXVCkbHViXgJ6HWK9F0V2fgXEs3Vva0zF1Sj6eESuKMW
 rk9MN/qQbN1EY1Q5DADLchwRx/gs/YUQQRYKIdCb5P7Tlty/XNTCAofOFn6i+yXLwL
 ExCatmLw9OdBg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: Fix memleak when cpus node
 not exist
In-Reply-To: <a00f4a44-6f38-306f-a24f-4e3565deefc2@linux.ibm.com>
References: <20201110123029.3767459-1-zhangxiaoxu5@huawei.com>
 <87ft5hjocy.fsf@linux.ibm.com>
 <a00f4a44-6f38-306f-a24f-4e3565deefc2@linux.ibm.com>
Date: Mon, 16 Nov 2020 23:23:23 +1100
Message-ID: <878sb14hj8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 11/10/20 6:08 AM, Nathan Lynch wrote:
>> Zhang Xiaoxu <zhangxiaoxu5@huawei.com> writes:
>>> From: zhangxiaoxu <zhangxiaoxu5@huawei.com>
>>>
>>> If the cpus nodes not exist, we lost to free the 'cpu_drcs', which
>>> will leak memory.
>>>
>>> Fixes: a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error path")
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: zhangxiaoxu <zhangxiaoxu5@huawei.com>
>>> ---
>>>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>>> index f2837e33bf5d..4bb1c9f2bb11 100644
>>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>>> @@ -743,6 +743,7 @@ static int dlpar_cpu_add_by_count(u32 cpus_to_add)
>>>  	parent = of_find_node_by_path("/cpus");
>>>  	if (!parent) {
>>>  		pr_warn("Could not find CPU root node in device tree\n");
>>> +		kfree(cpu_drcs);
>>>  		return -1;
>>>  	}
>> 
>> Thanks for finding this.
>> 
>> a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error
>> path") was posted in Sept 2019 but was not applied until July 2020:
>> 
>> https://lore.kernel.org/linuxppc-dev/20190919231633.1344-1-nathanl@linux.ibm.com/
>> 
>> Here is that change as posted; note the function context is
>> find_dlpar_cpus_to_add(), not dlpar_cpu_add_by_count():
>> 
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -726,7 +726,6 @@ static int find_dlpar_cpus_to_add(u32 *cpu_drcs, u32 cpus_to_add)
>>  	parent = of_find_node_by_path("/cpus");
>>  	if (!parent) {
>>  		pr_warn("Could not find CPU root node in device tree\n");
>> -		kfree(cpu_drcs);
>>  		return -1;
>>  	}
>> 
>> Meanwhile b015f6bc9547dbc056edde7177c7868ca8629c4c ("powerpc/pseries: Add
>> cpu DLPAR support for drc-info property") was posted in Nov 2019 and
>> committed a few days later:
>> 
>> https://lore.kernel.org/linux-pci/1573449697-5448-4-git-send-email-tyreld@linux.ibm.com/
>> 
>> This change reorganized the same code, removing
>> find_dlpar_cpus_to_add(), and it had the effect of fixing the same
>> issue.
>> 
>> However git apparently allowed the older change to still apply on top of
>> this (changing a function different from the one in the original
>> patch!), leading to a real bug.
>
> Yikes, not sure how that happened without either the committer massaging the
> patch to apply, or the line location and context matching exactly.

git-am won't apply it, but patch does. I often have to fall back to
using patch when things don't apply, so that's presumably what happened
here. I try to manually check the result is correct but I obviously
didn't do a good job here.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503544A437
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 02:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp9rd4SYMz2ymv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 12:49:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JU84i/45;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JU84i/45;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JU84i/45; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JU84i/45; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp9qy0KRKz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 12:48:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636422522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UI3rwFkH6oCG+j4AMBi8JeiyUYzUPY+0hxiIJnayN0=;
 b=JU84i/45skiz5ocNAaU4RL7vezujRjIOb6JydmfihYCWvGYuPPcMOzc2mdXPEz9/sD3MwD
 A7RjTbUo2zARaNWjs8vx1uyWxx61jBYGvHuCT7BvQRTLbZznvtZZp/NIq0/odFkrOPsdTV
 ps0tgXnd+e2n8tcq0ScdAMbfxBYz5yQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636422522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UI3rwFkH6oCG+j4AMBi8JeiyUYzUPY+0hxiIJnayN0=;
 b=JU84i/45skiz5ocNAaU4RL7vezujRjIOb6JydmfihYCWvGYuPPcMOzc2mdXPEz9/sD3MwD
 A7RjTbUo2zARaNWjs8vx1uyWxx61jBYGvHuCT7BvQRTLbZznvtZZp/NIq0/odFkrOPsdTV
 ps0tgXnd+e2n8tcq0ScdAMbfxBYz5yQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-R1mBA4eyNSimkZqyPbVFDg-1; Mon, 08 Nov 2021 20:48:37 -0500
X-MC-Unique: R1mBA4eyNSimkZqyPbVFDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F0C918414A0;
 Tue,  9 Nov 2021 01:48:35 +0000 (UTC)
Received: from [10.22.16.6] (unknown [10.22.16.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9FB19C59;
 Tue,  9 Nov 2021 01:48:33 +0000 (UTC)
Message-ID: <75415cd5-4e17-68b8-1587-a7417555c863@redhat.com>
Date: Mon, 8 Nov 2021 20:48:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc/pseries/cpuhp: Use alloc_cpumask_var() in
 pseries_cpu_hotplug_init()
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211108164751.65565-1-longman@redhat.com>
 <875yt2jlhm.fsf@linux.ibm.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <875yt2jlhm.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/8/21 18:06, Nathan Lynch wrote:
> Waiman Long <longman@redhat.com> writes:
>
>> It was found that the following warning message could be printed out when
>> booting the kernel on PowerPC systems that support LPAR:
>>
>> [    0.129584] WARNING: CPU: 0 PID: 1 at mm/memblock.c:1451 memblock_alloc_internal+0x5c/0x104
>> [    0.129593] Modules linked in:
>> [    0.129598] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-11.el9.ppc64le+debug #1
>> [    0.129605] NIP:  c000000002040134 LR: c00000000204011c CTR: c0000000020241a8
>> [    0.129610] REGS: c000000005637760 TRAP: 0700   Not tainted  (5.14.0-11.el9.ppc64le+debug)
>> [    0.129616] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000222  XER: 00000002
>> [    0.129635] CFAR: c0000000004d1cf4 IRQMASK: 0
>> [    0.129635] GPR00: c00000000204011c c000000005637a00 c000000002c94d00 0000000000000001
>> [    0.129635] GPR04: 0000000000000080 0000000000000000 0000000000000000 ffffffffffffffff
>> [    0.129635] GPR08: 0000000000000000 0000000000000003 c00000000205ac64 0000000000080000
>> [    0.129635] GPR12: 0000000000000000 c0000000049d0000 c000000000013078 0000000000000000
>> [    0.129635] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    0.129635] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    0.129635] GPR24: c000000002003808 c00000000146f7b8 0000000000000000 0000000000000100
>> [    0.129635] GPR28: c000000002d7cf80 0000000000000000 0000000000000008 0000000000000000
>> [    0.129710] NIP [c000000002040134] memblock_alloc_internal+0x5c/0x104
>> [    0.129717] LR [c00000000204011c] memblock_alloc_internal+0x44/0x104
>> [    0.129723] Call Trace:
>> [    0.129726] [c000000005637a00] [c000000005637a40] 0xc000000005637a40 (unreliable)
>> [    0.129735] [c000000005637a60] [c0000000020404d8] memblock_alloc_try_nid+0x94/0xcc
>> [    0.129743] [c000000005637af0] [c00000000205ac64] alloc_bootmem_cpumask_var+0x4c/0x9c
>> [    0.129751] [c000000005637b60] [c0000000020242e0] __machine_initcall_pseries_pseries_cpu_hotplug_init+0x138/0x1d8
>> [    0.129760] [c000000005637bf0] [c000000000012404] do_one_initcall+0xa4/0x4f0
>> [    0.129768] [c000000005637cd0] [c000000002005358] do_initcalls+0x140/0x18c
>> [    0.129776] [c000000005637d80] [c0000000020055b8] kernel_init_freeable+0x178/0x1d0
>> [    0.129783] [c000000005637db0] [c0000000000130a0] kernel_init+0x30/0x190
>> [    0.129790] [c000000005637e10] [c00000000000cef4] ret_from_kernel_thread+0x5c/0x64
>>
>> The warning is printed in memblock_alloc_internal() because the slab
>> has been initialized when the initcalls are being processed.
> Looks like CONFIG_CPUMASK_OFFSTACK=y is necessary for the warning to
> trigger... guess that explains how it's escaped notice.
>
>> To
>> avoid the warning, change alloc_bootmem_cpumask_var() call in
>> pseries_cpu_hotplug_init() to alloc_cpumask_var() instead. Also
>> change cpumask_or() to cpumask_copy() or we will have to use
>> zalloc_cpumask_var().
> Makes sense.
>
>
>> Fixes: bd1dd4c5f528 ("powerpc/pseries: Prevent free CPU ids being reused on another node")
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> index 5ab44600c8d3..e8e08d916b16 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -864,12 +864,12 @@ static int __init pseries_cpu_hotplug_init(void)
>>   	/* Processors can be added/removed only on LPAR */
>>   	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>>   		for_each_node(node) {
>> -			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
>> +			alloc_cpumask_var(&node_recorded_ids_map[node],
>> +					  GFP_KERNEL|GFP_NOWAIT);
> This isn't atomic context, so GFP_KERNEL alone should be used.
>
> Otherwise this change looks right to me.

I added GFP_NOWAIT because the kzalloc_node() call from 
memblock_alloc_internal() uses GFP_NOWAIT. That makes sense as you don't 
want to wait in an initcall. Anyway, that shouldn't really matter as 
there should be enough free memory at bootup time to satisfy the request 
without waiting. So GFP_NOWAIT may not be necessary.

Cheers,
Longman


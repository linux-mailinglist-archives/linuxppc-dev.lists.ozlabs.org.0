Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F37948943
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 08:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdNK61fM4z3dHM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 16:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdNJg63f9z3cG5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 16:12:46 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WdNCH54YVzQp91;
	Tue,  6 Aug 2024 14:08:11 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B2B014022E;
	Tue,  6 Aug 2024 14:12:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 14:12:35 +0800
Message-ID: <aabefd31-918c-461d-8333-cdb5f87c351c@huawei.com>
Date: Tue, 6 Aug 2024 14:12:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5.10] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, <dennis@kernel.org>,
	<tj@kernel.org>, <cl@linux.com>, <benh@kernel.crashing.org>,
	<paulus@samba.org>, <christophe.leroy@csgroup.eu>, <mahesh@linux.ibm.com>,
	<gregkh@linuxfoundation.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
References: <20240805114544.1552341-1-ruanjinjie@huawei.com>
 <87frrii66q.fsf@mail.lhotse>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87frrii66q.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100008.china.huawei.com (7.221.188.57)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2024/8/6 13:14, Michael Ellerman wrote:
> Hi Jinjie Ruan,
> 
> If you want to submit this as a stable backport you need to send it
> To: stable@vger.kernel.org.
> 
> Jinjie Ruan <ruanjinjie@huawei.com> writes:
>> From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> 
> Although it's somewhat modified, this is still a backport of an upstream
> commit, so it should include the following line:
> 
>   [ Upstream commit 0db880fc865ffb522141ced4bfa66c12ab1fbb70 ]

Thank you very much! I'll resend it.

> 
>> nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
>> crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
>> interrupt handler) if percpu allocation comes from vmalloc area.
>>
>> Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
>> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
>> percpu allocation is from the embedded first chunk. However with
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
>> allocation can come from the vmalloc area.
>>
>> With kernel command line "percpu_alloc=page" we can force percpu allocation
>> to come from vmalloc area and can see kernel crash in machine_check_early:
>>
>> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
>> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
>> [    1.215719] --- interrupt: 200
>> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
>> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
>> [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8
>>
>> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
>> first chunk is not embedded.
>>
>> CVE-2024-42126
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Tested-by: Shirisha Ganta <shirisha@linux.ibm.com>
>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> Link: https://msgid.link/20240410043006.81577-1-mahesh@linux.ibm.com
>> [ Conflicts in arch/powerpc/include/asm/interrupt.h
>>   because machine_check_early() has been refactored. ]
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/powerpc/include/asm/percpu.h | 10 ++++++++++
>>  arch/powerpc/kernel/mce.c         | 14 +++++++++++---
>>  arch/powerpc/kernel/setup_64.c    |  2 ++
>>  3 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
>> index 8e5b7d0b851c..634970ce13c6 100644
>> --- a/arch/powerpc/include/asm/percpu.h
>> +++ b/arch/powerpc/include/asm/percpu.h
>> @@ -15,6 +15,16 @@
>>  #endif /* CONFIG_SMP */
>>  #endif /* __powerpc64__ */
>>  
>> +#if defined(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && defined(CONFIG_SMP)
>> +#include <linux/jump_label.h>
>> +DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
>> +
>> +#define percpu_first_chunk_is_paged	\
>> +		(static_key_enabled(&__percpu_first_chunk_is_paged.key))
>> +#else
>> +#define percpu_first_chunk_is_paged	false
>> +#endif /* CONFIG_PPC64 && CONFIG_SMP */
>> +
>>  #include <asm-generic/percpu.h>
>>  
>>  #include <asm/paca.h>
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index 63702c0badb9..259343040e1b 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -594,8 +594,15 @@ long notrace machine_check_early(struct pt_regs *regs)
>>  	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
>>  
>>  	this_cpu_set_ftrace_enabled(0);
>> -	/* Do not use nmi_enter/exit for pseries hpte guest */
>> -	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
>> +	/*
>> +	 * Do not use nmi_enter/exit for pseries hpte guest
>> +	 *
>> +	 * Likewise, do not use it in real mode if percpu first chunk is not
>> +	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
>> +	 * are chances where percpu allocation can come from vmalloc area.
>> +	 */
>> +	if ((radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR)) &&
>> +	    !percpu_first_chunk_is_paged)
>>  		nmi_enter();
>>  
>>  	hv_nmi_check_nonrecoverable(regs);
>> @@ -606,7 +613,8 @@ long notrace machine_check_early(struct pt_regs *regs)
>>  	if (ppc_md.machine_check_early)
>>  		handled = ppc_md.machine_check_early(regs);
>>  
>> -	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
>> +	if ((radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR)) &&
>> +	    !percpu_first_chunk_is_paged)
>>  		nmi_exit();
>>  
>>  	this_cpu_set_ftrace_enabled(ftrace_enabled);
>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>> index 3f8426bccd16..899d87de0165 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -824,6 +824,7 @@ static int pcpu_cpu_distance(unsigned int from, unsigned int to)
>>  
>>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>>  EXPORT_SYMBOL(__per_cpu_offset);
>> +DEFINE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
>>  
>>  static void __init pcpu_populate_pte(unsigned long addr)
>>  {
>> @@ -903,6 +904,7 @@ void __init setup_per_cpu_areas(void)
>>  	if (rc < 0)
>>  		panic("cannot initialize percpu area (err=%d)", rc);
>>  
>> +	static_key_enable(&__percpu_first_chunk_is_paged.key);
>>  	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
>>  	for_each_possible_cpu(cpu) {
>>                  __per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
> 
> This looks reasonable to me, though I haven't tested it, I assume you
> have done so.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> cheers
> 

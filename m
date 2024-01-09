Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE0827DDA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 05:34:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RKY9TECa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8J3l2KFXz3byT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 15:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RKY9TECa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8J2x6r11z2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 15:33:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4093753J029279;
	Tue, 9 Jan 2024 04:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=U7qiKuCI8exiddaQyeaVTTJJ+FYYqjQz8FrfFjWKOU4=;
 b=RKY9TECaVGHT/CJDMdJ+2BHV/8+mE57UEisvd5evnOfDQirHo2TDgMXyhKFvw2lpXl63
 Nvphp4AbI7EASgdgfxJluQ7Z4M/fX0dx+W2QgSIOitDXoS6KRCuSQf2u4sI6z9eTUDYB
 +RwapF8v/i9+CNQ8aZi1nOwQc5it7ceEuQMqU1QcG4PS6pyX9lRbNuuHGllGkzvfdJ6J
 oADGaQuYJhHsGFAel+zUfh2M+6wBmg7BahGPmPdL4KxclNh6OwqcDShsNfs9VmGFsAiM
 Hlu2cPEDs9VCXoEBEy18LiE19XNrP4So0NFEKXRoKpMulA8q1FV7f9n00rVXUMWMZuo4 sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgwy01fft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 04:33:11 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4094TPYE031916;
	Tue, 9 Jan 2024 04:33:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vgwy01fes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 04:33:10 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4092r9oe022799;
	Tue, 9 Jan 2024 04:33:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfhjycm4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 04:33:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4094X6w520644116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 04:33:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F226220043;
	Tue,  9 Jan 2024 04:33:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A5CB20040;
	Tue,  9 Jan 2024 04:33:03 +0000 (GMT)
Received: from [9.43.111.32] (unknown [9.43.111.32])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Jan 2024 04:33:03 +0000 (GMT)
Message-ID: <79e4d797-99a0-4bbe-b644-1c1fa3693dd1@linux.ibm.com>
Date: Tue, 9 Jan 2024 10:03:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20231017022806.4523-1-piliu@redhat.com>
 <20231017022806.4523-3-piliu@redhat.com>
 <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
 <40ab9119-fa6c-4211-98b8-478a84d46e64@linux.ibm.com>
 <CAF+s44Q-Sb1ibdyM0SU3Wkf4JwbO5b353H7aV1xTyCx95ar=SA@mail.gmail.com>
 <4fb48637-be68-4e53-bb8a-f0988c03819b@linux.ibm.com>
In-Reply-To: <4fb48637-be68-4e53-bb8a-f0988c03819b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JBrYKqvgenYaM8lmgfCJ7Fe9YZ5XST_j
X-Proofpoint-GUID: xlq5KBAaWWHR30d5pZxqBVx5raNjoJnh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_02,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090029
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
Cc: Pingfan Liu <piliu@redhat.com>, Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/01/24 9:57 am, Hari Bathini wrote:
> Hi Michael,
> 

Sorry, Michael.
I am just about getting back to work and I spoke too soon.
You already seem to have posted a set with the approach you had in mind:

   https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=388350

Thanks
Hari

> I am fine with either approach. I was trying to address your concerns
> in my way. Looking for your inputs here on how to go about this now..
> 
> On 29/11/23 7:00 am, Pingfan Liu wrote:
>> Hi Hari,
>>
>>
>> On Mon, Nov 27, 2023 at 12:30 PM Hari Bathini <hbathini@linux.ibm.com> 
>> wrote:
>>>
>>> Hi Pingfan, Michael,
>>>
>>> On 17/10/23 4:03 pm, Hari Bathini wrote:
>>>>
>>>>
>>>> On 17/10/23 7:58 am, Pingfan Liu wrote:
>>>>> *** Idea ***
>>>>> For kexec -p, the boot cpu can be not the cpu0, this causes the 
>>>>> problem
>>>>> of allocating memory for paca_ptrs[]. However, in theory, there is no
>>>>> requirement to assign cpu's logical id as its present sequence in the
>>>>> device tree. But there is something like cpu_first_thread_sibling(),
>>>>> which makes assumption on the mapping inside a core. Hence partially
>>>>> loosening the mapping, i.e. unbind the mapping of core while keep the
>>>>> mapping inside a core.
>>>>>
>>>>> *** Implement ***
>>>>> At this early stage, there are plenty of memory to utilize. Hence, 
>>>>> this
>>>>> patch allocates interim memory to link the cpu info on a list, then
>>>>> reorder cpus by changing the list head. As a result, there is a rotate
>>>>> shift between the sequence number in dt and the cpu logical number.
>>>>>
>>>>> *** Result ***
>>>>> After this patch, a boot-cpu's logical id will always be mapped 
>>>>> into the
>>>>> range [0,threads_per_core).
>>>>>
>>>>> Besides this, at this phase, all threads in the boot core are 
>>>>> forced to
>>>>> be onlined. This restriction will be lifted in a later patch with
>>>>> extra effort.
>>>>>
>>>>> Signed-off-by: Pingfan Liu <piliu@redhat.com>
>>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>>>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>>> Cc: Wen Xiong <wenxiong@us.ibm.com>
>>>>> Cc: Baoquan He <bhe@redhat.com>
>>>>> Cc: Ming Lei <ming.lei@redhat.com>
>>>>> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>>>> Cc: kexec@lists.infradead.org
>>>>> To: linuxppc-dev@lists.ozlabs.org
>>>>
>>>> Thanks for working on this, Pingfan.
>>>> Looks good to me.
>>>>
>>>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>>>>
>>>
>>> On second thoughts, probably better off with no impact for
>>> bootcpu < nr_cpu_ids case and changing only two cores logical
>>> numbering otherwise. Something like the below (Please share
>>> your thoughts):
>>>
>>
>> I am afraid that it may not be as ideal as it looks, considering the
>> following factors:
>> -1. For the case of 'bootcpu < nr_cpu_ids', crash can happen evenly
>> across any cpu in the system, which seriously undermines the
>> protection intended here (Under the most optimistic scenario, there is
>> a 50% chance of success)
>>
>> -2. For the re-ordering of logical numbering, IMHO, if there is
>> concern that re-ordering will break something, the partial re-ordering
>> can not avoid that.  We ought to spot probable hazards so as to ease
>> worries.
>>
>>
>> Thanks,
>>
>> Pingfan
>>
>>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>>> index ec82f5bda908..78a8312aa8c4 100644
>>> --- a/arch/powerpc/kernel/prom.c
>>> +++ b/arch/powerpc/kernel/prom.c
>>> @@ -76,7 +76,9 @@ u64 ppc64_rma_size;
>>>    unsigned int boot_cpu_node_count __ro_after_init;
>>>    #endif
>>>    static phys_addr_t first_memblock_size;
>>> +#ifdef CONFIG_SMP
>>>    static int __initdata boot_cpu_count;
>>> +#endif
>>>
>>>    static int __init early_parse_mem(char *p)
>>>    {
>>> @@ -357,6 +359,25 @@ static int __init early_init_dt_scan_cpus(unsigned
>>> long node,
>>>                          fdt_boot_cpuid_phys(initial_boot_params)) {
>>>                          found = boot_cpu_count;
>>>                          found_thread = i;
>>> +                       /*
>>> +                        * Map boot-cpu logical id into the range
>>> +                        * of [0, thread_per_core) if it can't be
>>> +                        * accommodated within nr_cpu_ids.
>>> +                        */
>>> +                       if (i != boot_cpu_count && boot_cpu_count >= 
>>> nr_cpu_ids) {
>>> +                               boot_cpuid = i;
>>> +                               DBG("Logical CPU number for boot CPU 
>>> changed from %d to %d\n",
>>> +                                   boot_cpu_count, i);
>>> +                       } else {
>>> +                               boot_cpuid = boot_cpu_count;
>>> +                       }
>>> +
>>> +                       /* Ensure boot thread is acconted for in 
>>> nr_cpu_ids */
>>> +                       if (boot_cpuid >= nr_cpu_ids) {
>>> +                               set_nr_cpu_ids(boot_cpuid + 1);
>>> +                               DBG("Adjusted nr_cpu_ids to %u, to 
>>> include boot CPU.\n",
>>> +                                   nr_cpu_ids);
>>> +                       }
>>>                  }
>>>    #ifdef CONFIG_SMP
>>>                  /* logical cpu id is always 0 on UP kernels */
>>> @@ -368,9 +389,8 @@ static int __init early_init_dt_scan_cpus(unsigned
>>> long node,
>>>          if (found < 0)
>>>                  return 0;
>>>
>>> -       DBG("boot cpu: logical %d physical %d\n", found,
>>> +       DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
>>>              be32_to_cpu(intserv[found_thread]));
>>> -       boot_cpuid = found;
>>>
>>>          boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
>>>
>>> diff --git a/arch/powerpc/kernel/setup-common.c
>>> b/arch/powerpc/kernel/setup-common.c
>>> index b7b733474b60..f7179525c774 100644
>>> --- a/arch/powerpc/kernel/setup-common.c
>>> +++ b/arch/powerpc/kernel/setup-common.c
>>> @@ -409,6 +409,12 @@ static void __init cpu_init_thread_core_maps(int 
>>> tpc)
>>>
>>>    u32 *cpu_to_phys_id = NULL;
>>>
>>> +struct interrupt_server_node {
>>> +       bool    avail;
>>> +       int     len;
>>> +       __be32 intserv[];
>>> +};
>>> +
>>>    /**
>>>     * setup_cpu_maps - initialize the following cpu maps:
>>>     *                  cpu_possible_mask
>>> @@ -429,9 +435,13 @@ u32 *cpu_to_phys_id = NULL;
>>>     */
>>>    void __init smp_setup_cpu_maps(void)
>>>    {
>>> +       struct interrupt_server_node *core0_node = NULL, *bt_node = 
>>> NULL;
>>> +       int orig_boot_cpu = -1, orig_boot_thread = -1;
>>> +       bool found_boot_cpu = false;
>>>          struct device_node *dn;
>>> -       int cpu = 0;
>>>          int nthreads = 1;
>>> +       int cpu = 0;
>>> +       int j, len;
>>>
>>>          DBG("smp_setup_cpu_maps()\n");
>>>
>>> @@ -442,9 +452,9 @@ void __init smp_setup_cpu_maps(void)
>>>                        __func__, nr_cpu_ids * sizeof(u32), 
>>> __alignof__(u32));
>>>
>>>          for_each_node_by_type(dn, "cpu") {
>>> +               bool avail, skip = false;
>>>                  const __be32 *intserv;
>>>                  __be32 cpu_be;
>>> -               int j, len;
>>>
>>>                  DBG("  * %pOF...\n", dn);
>>>
>>> @@ -466,29 +476,121 @@ void __init smp_setup_cpu_maps(void)
>>>
>>>                  nthreads = len / sizeof(int);
>>>
>>> -               for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>>> -                       bool avail;
>>> +               avail = of_device_is_available(dn);
>>> +               if (!avail)
>>> +                       avail = !of_property_match_string(dn,
>>> +                                       "enable-method", "spin-table");
>>> +
>>> +               for (j = 0; (cpu == 0 || !found_boot_cpu) && j < 
>>> nthreads; j++) {
>>> +                       if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
>>> +                               found_boot_cpu = true;
>>> +                               if (cpu == 0)
>>> +                                       break;
>>> +
>>> +                               /* Original logical CPU number of 
>>> thread0 in boot core */
>>> +                               orig_boot_cpu = cpu;
>>> +                               orig_boot_thread = j;
>>> +                               bt_node = 
>>> memblock_alloc(sizeof(struct interrupt_server_node) + len,
>>> +                                               __alignof__(u32));
>>> +                               if (!bt_node)
>>> +                                       panic("%s: Failed to allocate 
>>> %zu bytes align=0x%zx\n",
>>> +                                               __func__,
>>> +                                               sizeof(struct 
>>> interrupt_server_node) + len,
>>> +                                               __alignof__(u32));
>>> +                               bt_node->len = len;
>>> +                               memcpy(bt_node->intserv, intserv, len);
>>> +                               bt_node->avail = avail;
>>> +                               skip = true;
>>> +                               break;
>>> +                       }
>>> +               }
>>>
>>> +               /*
>>> +                * Boot CPU not on core0.
>>> +                * Hold off adding core0 until boot core is found as 
>>> core0
>>> +                * may have to be replaced with boot core if boot 
>>> core can
>>> +                * not be accommodated within nr_cpu_ids with its 
>>> original
>>> +                * logical CPU numbering.
>>> +                */
>>> +               if (cpu == 0 && !found_boot_cpu) {
>>> +                       core0_node = memblock_alloc(sizeof(struct 
>>> interrupt_server_node) + len,
>>> +                                       __alignof__(u32));
>>> +                       if (!core0_node)
>>> +                               panic("%s: Failed to allocate %zu 
>>> bytes align=0x%zx\n",
>>> +                                       __func__,
>>> +                                       sizeof(struct 
>>> interrupt_server_node) + len,
>>> +                                       __alignof__(u32));
>>> +                       core0_node->len = len;
>>> +                       memcpy(core0_node->intserv, intserv, len);
>>> +                       core0_node->avail = avail;
>>> +                       skip = true;
>>> +               }
>>> +
>>> +               if (skip) {
>>> +                       /* Assumes same number of threads for all 
>>> cores */
>>> +                       cpu += nthreads;
>>> +                       continue;
>>> +               }
>>> +
>>> +               for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>>>                          DBG("    thread %d -> cpu %d (hard id %d)\n",
>>>                              j, cpu, be32_to_cpu(intserv[j]));
>>>
>>> -                       avail = of_device_is_available(dn);
>>> -                       if (!avail)
>>> -                               avail = !of_property_match_string(dn,
>>> -                                               "enable-method", 
>>> "spin-table");
>>> -
>>>                          set_cpu_present(cpu, avail);
>>>                          set_cpu_possible(cpu, true);
>>>                          cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
>>>                          cpu++;
>>>                  }
>>>
>>> -               if (cpu >= nr_cpu_ids) {
>>> +               if (found_boot_cpu && cpu >= nr_cpu_ids) {
>>>                          of_node_put(dn);
>>>                          break;
>>>                  }
>>>          }
>>>
>>> +       /*
>>> +        * Boot CPU not on core0.
>>> +        *
>>> +        * If nr_cpu_ids does not accommodate the original logical CPU
>>> numbering for
>>> +        * boot CPU core, use logical CPU numbers 0 to nthreads for 
>>> boot CPU core.
>>> +        * Note that boot cpu is already assigned with logical CPU 
>>> number
>>> somewhere
>>> +        * between 0 to nthreads (depending on the boot thread within 
>>> the core) in
>>> +        * early_init_dt_scan_cpus() for this case.
>>> +        *
>>> +        * Otherwise, stick with the original logical CPU numbering.
>>> +        */
>>> +       if (bt_node) {
>>> +               int core0_cpu;
>>> +
>>> +               if (orig_boot_cpu + orig_boot_thread >= nr_cpu_ids) {
>>> +                       cpu = 0;
>>> +                       core0_cpu = orig_boot_cpu;
>>> +               } else {
>>> +                       cpu = orig_boot_cpu;
>>> +                       core0_cpu = 0;
>>> +               }
>>> +
>>> +               for (j = 0; j < nthreads && core0_cpu < nr_cpu_ids; 
>>> j++) {
>>> +                       DBG("    thread %d -> cpu %d (hard id %d)\n",
>>> +                           j, core0_cpu, 
>>> be32_to_cpu(core0_node->intserv[j]));
>>> +
>>> +                       set_cpu_present(core0_cpu, core0_node->avail);
>>> +                       set_cpu_possible(core0_cpu, true);
>>> +                       cpu_to_phys_id[core0_cpu] = 
>>> be32_to_cpu(core0_node->intserv[j]);
>>> +                       core0_cpu++;
>>> +               }
>>> +
>>> +               for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>>> +                       DBG("    thread %d -> cpu %d (hard id %d)\n",
>>> +                           j, cpu, be32_to_cpu(bt_node->intserv[j]));
>>> +
>>> +                       set_cpu_present(cpu, bt_node->avail);
>>> +                       set_cpu_possible(cpu, true);
>>> +                       cpu_to_phys_id[cpu] = 
>>> be32_to_cpu(bt_node->intserv[j]);
>>> +                       cpu++;
>>> +               }
>>> +       }
>>> +
>>>          /* If no SMT supported, nthreads is forced to 1 */
>>>          if (!cpu_has_feature(CPU_FTR_SMT)) {
>>>                  DBG("  SMT disabled ! nthreads forced to 1\n");
>>>
>>
> 
> Thanks
> Hari

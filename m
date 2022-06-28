Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B652C55E569
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:44:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXS6W500Fz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:44:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJcci7U+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJcci7U+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXS5n3rl4z3bwk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:43:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SEXHgo016770;
	Tue, 28 Jun 2022 14:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tQ14woL4xGmXCeED2f7uTKBo9iuU4PWVJ55qOQBV9LI=;
 b=dJcci7U+ObsIz8AemrUFrH4YvrbiE56iRkRJ/h5lljino9v5yVafyB9Bmo65FbEcA03F
 /v14r2hd76UV87O28Cjb9rvtATfh0x04ZUBl0zpixgXJ8wOEb966qbXyNjKvJdGB2DGH
 zy25EgHlgmprhc9OZQHsPJhEMAMc+MECVZhoowKF4pusKO/sBGk6rUaBU3p13I6Gs+Aq
 IXfxmKbzjMxfbwVYMCmkYffrAfvesHzy8ecny/xJ+y/RNtAwTjB2Hgh541jif+XVRKmg
 YkVbqLRYBT2miQUrzl4BS0QZ2MANWK6IzHXgFNXRPC42Ey6gwGxl4CJ3n1O7sP6p5sMa dQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h01tjd2s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 14:43:41 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25SEawx4020955;
	Tue, 28 Jun 2022 14:43:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gwt08w17h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 14:43:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25SEhh0F30278050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 14:43:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB27C52052;
	Tue, 28 Jun 2022 14:43:36 +0000 (GMT)
Received: from [9.43.29.251] (unknown [9.43.29.251])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 42E7452050;
	Tue, 28 Jun 2022 14:43:35 +0000 (GMT)
Message-ID: <d5205edf-adf9-5c6b-9db4-b43705c2055e@linux.ibm.com>
Date: Tue, 28 Jun 2022 20:13:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V2] powerpc/memhotplug: Add add_pages override for PPC
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20220627072708.75662-1-aneesh.kumar@linux.ibm.com>
 <87a69x3q0n.fsf@mpe.ellerman.id.au>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87a69x3q0n.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OPVZ2qpzkf2iBYGdpZoh-XcOsnR-TUer
X-Proofpoint-ORIG-GUID: OPVZ2qpzkf2iBYGdpZoh-XcOsnR-TUer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280061
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/28/22 6:26 PM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> With commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
>> the kernel now validate the addr against high_memory value. This results
>> in the below BUG_ON with dax pfns.
>>
>> [  635.798741][T26531] kernel BUG at mm/page_alloc.c:5521!
>> 1:mon> e
>> cpu 0x1: Vector: 700 (Program Check) at [c000000007287630]
>>     pc: c00000000055ed48: free_pages.part.0+0x48/0x110
>>     lr: c00000000053ca70: tlb_finish_mmu+0x80/0xd0
>>     sp: c0000000072878d0
>>    msr: 800000000282b033
>>   current = 0xc00000000afabe00
>>   paca    = 0xc00000037ffff300   irqmask: 0x03   irq_happened: 0x05
>>     pid   = 26531, comm = 50-landscape-sy
>> kernel BUG at :5521!
>> Linux version 5.19.0-rc3-14659-g4ec05be7c2e1 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #625 SMP Thu Jun 23 00:35:43 CDT 2022
>> 1:mon> t
>> [link register   ] c00000000053ca70 tlb_finish_mmu+0x80/0xd0
>> [c0000000072878d0] c00000000053ca54 tlb_finish_mmu+0x64/0xd0 (unreliable)
>> [c000000007287900] c000000000539424 exit_mmap+0xe4/0x2a0
>> [c0000000072879e0] c00000000019fc1c mmput+0xcc/0x210
>> [c000000007287a20] c000000000629230 begin_new_exec+0x5e0/0xf40
>> [c000000007287ae0] c00000000070b3cc load_elf_binary+0x3ac/0x1e00
>> [c000000007287c10] c000000000627af0 bprm_execve+0x3b0/0xaf0
>> [c000000007287cd0] c000000000628414 do_execveat_common.isra.0+0x1e4/0x310
>> [c000000007287d80] c00000000062858c sys_execve+0x4c/0x60
>> [c000000007287db0] c00000000002c1b0 system_call_exception+0x160/0x2c0
>> [c000000007287e10] c00000000000c53c system_call_common+0xec/0x250
>>
>> The fix is to make sure we update high_memory on memory hotplug.
>> This is similar to what x86 does in commit 3072e413e305 ("mm/memory_hotplug: introduce add_pages")
>>
>> Fixes: ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>  
> ...
> 
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index 52b77684acda..2a63920c369d 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -105,6 +105,36 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
>>  	vm_unmap_aliases();
>>  }
>>  
>> +/*
>> + * After memory hotplug the variables max_pfn, max_low_pfn and high_memory need
>> + * updating.
>> + */
>> +static void update_end_of_memory_vars(u64 start, u64 size)
>> +{
>> +	unsigned long end_pfn = PFN_UP(start + size);
>> +
>> +	if (end_pfn > max_pfn) {
>> +		max_pfn = end_pfn;
>> +		max_low_pfn = end_pfn;
>> +		high_memory = (void *)__va(max_pfn * PAGE_SIZE - 1) + 1;
>> +	}
>> +}
>> +
>> +int __ref add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>> +		    struct mhp_params *params)
>> +{
>> +	int ret;
>> +
>> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
>> +	WARN_ON_ONCE(ret);
> 
> What's the justification for making this a WARN_ON_ONCE(), and then
> continuing to update the variables anyway?
> 
> I realise that's what x86 does, but it seems kind of wrong.
> 
>

That is copy paste bug from my side. I guess we should skip updating vars on __add_pages failure.
WARN_ON_ONCE() was done as part of fe8b868eccb9f85a0e231e35f0abac5b39bac801. The original code 
did print a WARN all the time. So the above commit made it conditional. Later in ea0854170c95245a258b386c7a9314399c949fe0
the return value was never checked. So the error path is not handled there at all. 

we should do 

if (!ret) update_end_of_memory_vars(...); 

Do you want a v3 with the changes? 

-aneesh



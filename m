Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE322260D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:44:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xpY2gGKzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:44:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6x081R1lzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 00:07:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GE2c5K053591; Thu, 16 Jul 2020 10:07:09 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvm8x0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 10:07:09 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GE6JLi003344;
 Thu, 16 Jul 2020 14:07:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 327q2y2hdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 14:07:07 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06GE75PH55640514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 14:07:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64A8FAE053;
 Thu, 16 Jul 2020 14:07:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11598AE051;
 Thu, 16 Jul 2020 14:07:04 +0000 (GMT)
Received: from [9.85.88.232] (unknown [9.85.88.232])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 14:07:03 +0000 (GMT)
Subject: Re: [PATCH] pseries: Fix 64 bit logical memory block panic
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200715000820.1255764-1-anton@ozlabs.org>
 <87d04x3q6m.fsf@linux.ibm.com>
 <20200716013030.GA4076912@thinks.paulus.ozlabs.org>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <f2b90495-dbfc-ec99-1ea1-c32d74e6ba21@linux.ibm.com>
Date: Thu, 16 Jul 2020 19:37:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716013030.GA4076912@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_06:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160105
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/16/20 7:00 AM, Paul Mackerras wrote:
> On Wed, Jul 15, 2020 at 06:12:25PM +0530, Aneesh Kumar K.V wrote:
>> Anton Blanchard <anton@ozlabs.org> writes:
>>
>>> Booting with a 4GB LMB size causes us to panic:
>>>
>>>    qemu-system-ppc64: OS terminated: OS panic:
>>>        Memory block size not suitable: 0x0
>>>
>>> Fix pseries_memory_block_size() to handle 64 bit LMBs.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Anton Blanchard <anton@ozlabs.org>
>>> ---
>>>   arch/powerpc/platforms/pseries/hotplug-memory.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>> index 5ace2f9a277e..6574ac33e887 100644
>>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>> @@ -27,7 +27,7 @@ static bool rtas_hp_event;
>>>   unsigned long pseries_memory_block_size(void)
>>>   {
>>>   	struct device_node *np;
>>> -	unsigned int memblock_size = MIN_MEMORY_BLOCK_SIZE;
>>> +	uint64_t memblock_size = MIN_MEMORY_BLOCK_SIZE;
>>>   	struct resource r;
>>>   
>>>   	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
>>
>> We need similar changes at more places?
>>
>> modified   arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -85,7 +85,7 @@ extern unsigned int mmu_base_pid;
>>   /*
>>    * memory block size used with radix translation.
>>    */
>> -extern unsigned int __ro_after_init radix_mem_block_size;
>> +extern unsigned long __ro_after_init radix_mem_block_size;
>>   
>>   #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
>>   #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
>> modified   arch/powerpc/include/asm/drmem.h
>> @@ -21,7 +21,7 @@ struct drmem_lmb {
>>   struct drmem_lmb_info {
>>   	struct drmem_lmb        *lmbs;
>>   	int                     n_lmbs;
>> -	u32                     lmb_size;
>> +	u64                     lmb_size;
>>   };
>>   
>>   extern struct drmem_lmb_info *drmem_info;
>> modified   arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -34,7 +34,7 @@
>>   
>>   unsigned int mmu_pid_bits;
>>   unsigned int mmu_base_pid;
>> -unsigned int radix_mem_block_size __ro_after_init;
>> +unsigned long radix_mem_block_size __ro_after_init;
> 
> These changes look fine.
> 
>>   static __ref void *early_alloc_pgtable(unsigned long size, int nid,
>>   			unsigned long region_start, unsigned long region_end)
>> modified   arch/powerpc/mm/drmem.c
>> @@ -268,14 +268,15 @@ static void __init __walk_drmem_v2_lmbs(const __be32 *prop, const __be32 *usm,
>>   void __init walk_drmem_lmbs_early(unsigned long node,
>>   			void (*func)(struct drmem_lmb *, const __be32 **))
>>   {
>> +	const __be64 *lmb_prop;
>>   	const __be32 *prop, *usm;
>>   	int len;
>>   
>> -	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
>> -	if (!prop || len < dt_root_size_cells * sizeof(__be32))
>> +	lmb_prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
>> +	if (!lmb_prop || len < sizeof(__be64))
>>   		return;
>>   
>> -	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
>> +	drmem_info->lmb_size = be64_to_cpup(lmb_prop);
> 
> This particular change shouldn't be necessary.  We already have
> dt_mem_next_cell() returning u64, and it knows how to combine two
> cells to give a u64 (for dt_root_size_cells == 2).


agreed. I added it here because in another patch i was confused about 
the usage of dt_root_size_cells. We don't generally use that in other 
device tree parsing code. I will move that to a separate patch as cleanup.

> 
>>   	usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
>>   
>> @@ -296,19 +297,19 @@ void __init walk_drmem_lmbs_early(unsigned long node,
>>   
>>   static int __init init_drmem_lmb_size(struct device_node *dn)
>>   {
>> -	const __be32 *prop;
>> +	const __be64 *prop;
>>   	int len;
>>   
>>   	if (drmem_info->lmb_size)
>>   		return 0;
>>   
>>   	prop = of_get_property(dn, "ibm,lmb-size", &len);
>> -	if (!prop || len < dt_root_size_cells * sizeof(__be32)) {
>> +	if (!prop || len < sizeof(__be64)) {
>>   		pr_info("Could not determine LMB size\n");
>>   		return -1;
>>   	}
>>   
>> -	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
>> +	drmem_info->lmb_size = be64_to_cpup(prop);
> 
> Same comment here.
> 

-aneesh

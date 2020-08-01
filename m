Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF02351CB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 12:56:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJh0B6KK0zDqTV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 20:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJgyF4gmxzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Aug 2020 20:54:26 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 071AWipj009926; Sat, 1 Aug 2020 06:53:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32n4j1tj4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 06:53:31 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 071AineF032275;
 Sat, 1 Aug 2020 06:53:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32n4j1tj43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 06:53:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 071AoAw0031317;
 Sat, 1 Aug 2020 10:53:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32n01809gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Aug 2020 10:53:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 071ArONv53215310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 Aug 2020 10:53:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E75411C04A;
 Sat,  1 Aug 2020 10:53:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5269A11C04C;
 Sat,  1 Aug 2020 10:53:16 +0000 (GMT)
Received: from [9.102.1.22] (unknown [9.102.1.22])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  1 Aug 2020 10:53:16 +0000 (GMT)
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
To: Mike Rapoport <rppt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org> <87d04d5hda.fsf@mpe.ellerman.id.au>
 <20200801101854.GD534153@kernel.org>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <bb86fb93-4d52-6b58-0914-eab45b74c028@linux.ibm.com>
Date: Sat, 1 Aug 2020 16:23:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801101854.GD534153@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-01_07:2020-07-31,
 2020-08-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008010079
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 01/08/20 3:48 pm, Mike Rapoport wrote:
> On Thu, Jul 30, 2020 at 10:15:13PM +1000, Michael Ellerman wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> fadump_reserve_crash_area() reserves memory from a specified base address
>>> till the end of the RAM.
>>>
>>> Replace iteration through the memblock.memory with a single call to
>>> memblock_reserve() with appropriate  that will take care of proper memory
>>                                       ^
>>                                       parameters?
>>> reservation.
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>>> ---
>>>   arch/powerpc/kernel/fadump.c | 20 +-------------------
>>>   1 file changed, 1 insertion(+), 19 deletions(-)
>>
>> I think this looks OK to me, but I don't have a setup to test it easily.
>> I've added Hari to Cc who might be able to.
>>
>> But I'll give you an ack in the hope that it works :)
> 
> Actually, I did some digging in the git log and the traversal was added
> there on purpose by the commit b71a693d3db3 ("powerpc/fadump: exclude
> memory holes while reserving memory in second kernel")

I was about to comment on the same :)
memblock_reserve() was being used until we ran into the issue talked 
about in the above commit...

> Presuming this is still reqruired I'm going to drop this patch and will

Yeah, it is still required..

> simply replace for_each_memblock() with for_each_mem_range() in v2.

Sounds right.

>   
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>>
>>
>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>> index 78ab9a6ee6ac..2446a61e3c25 100644
>>> --- a/arch/powerpc/kernel/fadump.c
>>> +++ b/arch/powerpc/kernel/fadump.c
>>> @@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
>>>   /* Preserve everything above the base address */
>>>   static void __init fadump_reserve_crash_area(u64 base)
>>>   {
>>> -	struct memblock_region *reg;
>>> -	u64 mstart, msize;
>>> -
>>> -	for_each_memblock(memory, reg) {
>>> -		mstart = reg->base;
>>> -		msize  = reg->size;
>>> -
>>> -		if ((mstart + msize) < base)
>>> -			continue;
>>> -
>>> -		if (mstart < base) {
>>> -			msize -= (base - mstart);
>>> -			mstart = base;
>>> -		}
>>> -
>>> -		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
>>> -			(msize >> 20), mstart);
>>> -		memblock_reserve(mstart, msize);
>>> -	}
>>> +	memblock_reserve(base, memblock_end_of_DRAM() - base);
>>>   }
>>>   
>>>   unsigned long __init arch_reserved_kernel_pages(void)
>>> -- 
>>> 2.26.2
> 

Thanks
Hari

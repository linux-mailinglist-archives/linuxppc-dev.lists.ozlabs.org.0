Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6873134947
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 18:26:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tGPF09MVzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 04:26:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=207.54.116.67; helo=ale.deltatee.com;
 envelope-from=logang@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deltatee.com
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tGGl1667zDqV1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 04:20:31 +1100 (AEDT)
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
 helo=[192.168.11.155])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1ipF00-0004MS-Qh; Wed, 08 Jan 2020 10:20:05 -0700
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20200107205959.7575-1-logang@deltatee.com>
 <20200107205959.7575-7-logang@deltatee.com>
 <a5501f2a-ff8d-cea2-1540-1a70ea6bc2d2@redhat.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <9226e0e4-832b-d873-f433-f29a7853f11e@deltatee.com>
Date: Wed, 8 Jan 2020 10:20:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <a5501f2a-ff8d-cea2-1540-1a70ea6bc2d2@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: borntraeger@de.ibm.com, gor@linux.ibm.com,
 heiko.carstens@de.ibm.com, ebadger@gigaio.com, peterz@infradead.org,
 luto@kernel.org, dave.hansen@linux.intel.com, bp@alien8.de, mingo@redhat.com,
 tglx@linutronix.de, benh@kernel.crashing.org, will@kernel.org,
 catalin.marinas@arm.com, hch@lst.de, akpm@linux-foundation.org,
 mhocko@kernel.org, dan.j.williams@intel.com, linux-mm@kvack.org,
 platform-driver-x86@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-ia64@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_FREE autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 6/8] s390/mm: Thread pgprot_t through vmem_add_mapping()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Eric Badger <ebadger@gigaio.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2020-01-08 5:43 a.m., David Hildenbrand wrote:
> On 07.01.20 21:59, Logan Gunthorpe wrote:
>> In prepartion to support a pgprot_t argument for arch_add_memory().
>>
>> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
>> ---
>>  arch/s390/include/asm/pgtable.h |  3 ++-
>>  arch/s390/mm/extmem.c           |  3 ++-
>>  arch/s390/mm/init.c             |  2 +-
>>  arch/s390/mm/vmem.c             | 10 +++++-----
>>  4 files changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
>> index 7b03037a8475..e667a1a96879 100644
>> --- a/arch/s390/include/asm/pgtable.h
>> +++ b/arch/s390/include/asm/pgtable.h
>> @@ -1640,7 +1640,8 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
>>  
>>  #define kern_addr_valid(addr)   (1)
>>  
>> -extern int vmem_add_mapping(unsigned long start, unsigned long size);
>> +extern int vmem_add_mapping(unsigned long start, unsigned long size,
>> +			    pgprot_t prot);
>>  extern int vmem_remove_mapping(unsigned long start, unsigned long size);
>>  extern int s390_enable_sie(void);
>>  extern int s390_enable_skey(void);
>> diff --git a/arch/s390/mm/extmem.c b/arch/s390/mm/extmem.c
>> index fd0dae9d10f4..6cf7029a7b35 100644
>> --- a/arch/s390/mm/extmem.c
>> +++ b/arch/s390/mm/extmem.c
>> @@ -313,7 +313,8 @@ __segment_load (char *name, int do_nonshared, unsigned long *addr, unsigned long
>>  		goto out_free;
>>  	}
>>  
>> -	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1);
>> +	rc = vmem_add_mapping(seg->start_addr, seg->end - seg->start_addr + 1,
>> +			      PAGE_KERNEL);
>>  
>>  	if (rc)
>>  		goto out_free;
>> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
>> index a0c88c1c9ad0..ef19522ddad2 100644
>> --- a/arch/s390/mm/init.c
>> +++ b/arch/s390/mm/init.c
>> @@ -277,7 +277,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>  	if (WARN_ON_ONCE(modifiers->altmap))
>>  		return -EINVAL;
>>  
>> -	rc = vmem_add_mapping(start, size);
>> +	rc = vmem_add_mapping(start, size, PAGE_KERNEL);
>>  	if (rc)
>>  		return rc;
>>  
>> diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
>> index b403fa14847d..8a5e95f184a2 100644
>> --- a/arch/s390/mm/vmem.c
>> +++ b/arch/s390/mm/vmem.c
>> @@ -66,7 +66,7 @@ pte_t __ref *vmem_pte_alloc(void)
>>  /*
>>   * Add a physical memory range to the 1:1 mapping.
>>   */
>> -static int vmem_add_mem(unsigned long start, unsigned long size)
>> +static int vmem_add_mem(unsigned long start, unsigned long size, pgprot_t prot)
>>  {
>>  	unsigned long pgt_prot, sgt_prot, r3_prot;
>>  	unsigned long pages4k, pages1m, pages2g;
>> @@ -79,7 +79,7 @@ static int vmem_add_mem(unsigned long start, unsigned long size)
>>  	pte_t *pt_dir;
>>  	int ret = -ENOMEM;
>>  
>> -	pgt_prot = pgprot_val(PAGE_KERNEL);
>> +	pgt_prot = pgprot_val(prot);
>>  	sgt_prot = pgprot_val(SEGMENT_KERNEL);
>>  	r3_prot = pgprot_val(REGION3_KERNEL);
> 
> So, if we map as huge/gigantic pages, the protection would be discarded?
> That looks wrong.
> 
> s390x does not support ZONE_DEVICE yet. Maybe simply bail out for s390x
> as you do for sh to make your life easier?

Yeah, ok, makes sense to me; I'll change it for v3.

Logan

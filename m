Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523F95628
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 06:38:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CJ2b14DyzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:38:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CJ0r0ymdzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 14:36:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K4aV8M066068
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:36:56 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug9purkkj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:36:56 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 20 Aug 2019 05:36:53 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 05:36:52 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7K4appQ40173910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 04:36:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25F165204E;
 Tue, 20 Aug 2019 04:36:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 862135204F;
 Tue, 20 Aug 2019 04:36:50 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DC579A010C;
 Tue, 20 Aug 2019 14:36:47 +1000 (AEST)
Subject: Re: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Tue, 20 Aug 2019 14:36:47 +1000
In-Reply-To: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082004-0016-0000-0000-000002A09009
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082004-0017-0000-0000-00003300BCEC
Message-Id: <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=937 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200047
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-08-16 at 15:52 +0000, Christophe Leroy wrote:
> Resulting code (8xx with 16 bytes per cacheline and 16k pages)
> 
> 0000016c <__flush_dcache_icache_phys>:
>  16c:	54 63 00 22 	rlwinm  r3,r3,0,0,17
>  170:	7d 20 00 a6 	mfmsr   r9
>  174:	39 40 04 00 	li      r10,1024
>  178:	55 28 07 34 	rlwinm  r8,r9,0,28,26
>  17c:	7c 67 1b 78 	mr      r7,r3
>  180:	7d 49 03 a6 	mtctr   r10
>  184:	7d 00 01 24 	mtmsr   r8
>  188:	4c 00 01 2c 	isync
>  18c:	7c 00 18 6c 	dcbst   0,r3
>  190:	38 63 00 10 	addi    r3,r3,16
>  194:	42 00 ff f8 	bdnz    18c <__flush_dcache_icache_phys+0x20>
>  198:	7c 00 04 ac 	hwsync
>  19c:	7d 49 03 a6 	mtctr   r10
>  1a0:	7c 00 3f ac 	icbi    0,r7
>  1a4:	38 e7 00 10 	addi    r7,r7,16
>  1a8:	42 00 ff f8 	bdnz    1a0 <__flush_dcache_icache_phys+0x34>
>  1ac:	7c 00 04 ac 	hwsync
>  1b0:	7d 20 01 24 	mtmsr   r9
>  1b4:	4c 00 01 2c 	isync
>  1b8:	4e 80 00 20 	blr
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  This patch is on top of Alastair's series "powerpc: convert cache
> asm to C"
>  Patch 3 of that series should touch __flush_dcache_icache_phys and
> this
>  patch could come just after patch 3.
> 
>  arch/powerpc/include/asm/cacheflush.h |  8 +++++
>  arch/powerpc/mm/mem.c                 | 55
> ++++++++++++++++++++++++++++-------
>  2 files changed, 53 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cacheflush.h
> b/arch/powerpc/include/asm/cacheflush.h
> index 1826bf2cc137..bf4f2dc4eb76 100644
> --- a/arch/powerpc/include/asm/cacheflush.h
> +++ b/arch/powerpc/include/asm/cacheflush.h
> @@ -47,6 +47,14 @@ void flush_icache_user_range(struct vm_area_struct
> *vma,
>  				    struct page *page, unsigned long
> addr,
>  				    int len);
>  void flush_dcache_icache_page(struct page *page);
> +#if defined(CONFIG_PPC32) && !defined(CONFIG_BOOKE)
> +void __flush_dcache_icache_phys(unsigned long physaddr);
> +#else
> +static inline void __flush_dcache_icache_phys(unsigned long
> physaddr)
> +{
> +	BUG();
> +}
> +#endif
>  
>  /**
>   * flush_dcache_range(): Write any modified data cache blocks out to
> memory and invalidate them.
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 43be99de7c9a..43009f9227c4 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -402,6 +402,50 @@ void flush_dcache_page(struct page *page)
>  }
>  EXPORT_SYMBOL(flush_dcache_page);
>  
> +#if defined(CONFIG_PPC32) && !defined(CONFIG_BOOKE)
> +void __flush_dcache_icache_phys(unsigned long physaddr)
> +{
> +	unsigned long bytes = l1_dcache_bytes();
> +	unsigned long nb = PAGE_SIZE / bytes;
> +	unsigned long addr = physaddr & PAGE_MASK;
> +	unsigned long msr, msr0;
> +	unsigned long loop1 = addr, loop2 = addr;
> +
> +	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
> +		/* For a snooping icache, we still need a dummy icbi to
> purge all the
> +		 * prefetched instructions from the ifetch buffers. We
> also need a sync
> +		 * before the icbi to order the the actual stores to
> memory that might
> +		 * have modified instructions with the icbi.
> +		 */
> +		mb(); /* sync */
> +		icbi((void *)addr);
> +		mb(); /* sync */
> +		isync();
> +		return;
> +	}
> +	msr0 = mfmsr();
> +	msr = msr0 & ~MSR_DR;
> +	asm volatile(
> +	    "	mtctr %2;"
> +	    "	mtmsr %3;"
> +	    "	isync;"
> +	    "0:	dcbst	0, %0;"
> +	    "	addi	%0, %0, %4;"
> +	    "	bdnz	0b;"
> +	    "	sync;"
> +	    "	mtctr %2;"
> +	    "1:	icbi	0, %1;"
> +	    "	addi	%1, %1, %4;"
> +	    "	bdnz	1b;"
> +	    "	sync;"
> +	    "	mtmsr %5;"
> +	    "	isync;"
> +	    : "+r" (loop1), "+r" (loop2)
> +	    : "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
> +	    : "ctr", "memory");
> +}
> +#endif
> +
>  void flush_dcache_icache_page(struct page *page)
>  {
>  #ifdef CONFIG_HUGETLB_PAGE
> @@ -419,16 +463,7 @@ void flush_dcache_icache_page(struct page *page)
>  		__flush_dcache_icache(start);
>  		kunmap_atomic(start);
>  	} else {
> -		unsigned long msr = mfmsr();
> -
> -		/* Clear the DR bit so that we operate on physical
> -		 * rather than virtual addresses
> -		 */
> -		mtmsr(msr & ~(MSR_DR));
> -
> -		__flush_dcache_icache((void *)physaddr);
> -
> -		mtmsr(msr);
> +		__flush_dcache_icache_phys(page_to_pfn(page) <<
> PAGE_SHIFT);
>  	}
>  #endif
>  }


Thanks Christophe,

I'm trying a somewhat different approach that requires less knowledge
of assembler. Handling of CPU_FTR_COHERENT_ICACHE is outside this
function. The code below is not a patch as my tree is a bit messy,
sorry:

/**
 * flush_dcache_icache_phys() - Flush a page by it's physical address
 * @addr: the physical address of the page
 */
static void flush_dcache_icache_phys(unsigned long addr)
{
	register unsigned long msr;
	register unsigned long dlines = PAGE_SIZE >> l1_dcache_shift();
	register unsigned long dbytes = l1_dcache_bytes();
	register unsigned long ilines = PAGE_SIZE >> l1_icache_shift();
	register unsigned long ibytes = l1_icache_bytes();
	register unsigned long i;
	register unsigned long address = addr;

	/*
	 * Clear the DR bit so that we operate on physical
	 * rather than virtual addresses
	 */
	msr = mfmsr();
	mtmsr(msr & ~(MSR_DR));

	/* Write out the data cache */
	for (i = 0; i < dlines; i++, address += dbytes)
		dcbst((void *)address);

	/* Invalidate the instruction cache */
	address = addr;
	for (i = 0; i < ilines; i++, address += ibytes)
		icbi((void *)address);

	mtmsr(msr);
}

void test_flush_phys(unsigned long addr)
{
	flush_dcache_icache_phys(addr);
}


This gives the following assembler (using pmac32_defconfig):
000003cc <test_flush_phys>:
 3cc:   94 21 ff f0     stwu    r1,-16(r1)
 3d0:   7d 00 00 a6     mfmsr   r8
 3d4:   55 09 07 34     rlwinm  r9,r8,0,28,26
 3d8:   7d 20 01 24     mtmsr   r9
 3dc:   39 20 00 80     li      r9,128
 3e0:   7d 29 03 a6     mtctr   r9
 3e4:   39 43 10 00     addi    r10,r3,4096
 3e8:   7c 69 1b 78     mr      r9,r3
 3ec:   7c 00 48 6c     dcbst   0,r9
 3f0:   39 29 00 20     addi    r9,r9,32
 3f4:   42 00 ff f8     bdnz    3ec <test_flush_phys+0x20>
 3f8:   7c 00 1f ac     icbi    0,r3
 3fc:   38 63 00 20     addi    r3,r3,32
 400:   7f 8a 18 40     cmplw   cr7,r10,r3
 404:   40 9e ff f4     bne     cr7,3f8 <test_flush_phys+0x2c>
 408:   7d 00 01 24     mtmsr   r8
 40c:   38 21 00 10     addi    r1,r1,16
 410:   4e 80 00 20     blr


-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819


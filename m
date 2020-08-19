Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A3424A48E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 19:01:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWvDt5qkYzDqx4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 03:01:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=u3oU6dNp; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWvBn1Xn5zDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 02:59:06 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07JGwK0C031096;
 Wed, 19 Aug 2020 16:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6pLb/h0CV327//KVUAS9lIFwkTuGnu3mrBkQ5d32t7I=;
 b=u3oU6dNpCvXrI5mUqoC05u45d5VW6lwqlvMaV0FwwtkZvpXmsBsfAtO4PpR6xG+SYDda
 G+PY38RnCfPmCwxN1cACApeEM3/FUEtEtCd1jmtshzX2M26mHb1bcZm7YsS3e50V/XZm
 sPXrncfTLevUjAUqkJUGQfy5UoYGBf4pwWwLvdoGNtj7/G6ECAiRIwSEfk/ud2NiUMwQ
 w8MH7rMm1LFQ0rzu1/trHuruYfI2KJnn/sMUMTK04hIt73FOh/MyfC7/Xpf+lOoP1Yj4
 Nkz+dwMW3KAGVxvcDzUmSmDzQTO6sgz4x4C7b9bf894qQwqwvwJI/UzUIBST/mqiZOR4 xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 32x74rbtr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Aug 2020 16:58:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07JGwLr8058475;
 Wed, 19 Aug 2020 16:58:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 32xs9pg6js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 16:58:52 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07JGwlQK007545;
 Wed, 19 Aug 2020 16:58:47 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Aug 2020 09:58:47 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 90AEB6A0109; Wed, 19 Aug 2020 13:00:01 -0400 (EDT)
Date: Wed, 19 Aug 2020 13:00:01 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere
 in memory
Message-ID: <20200819170001.GC25497@char.us.oracle.com>
References: <20200818221126.391073-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818221126.391073-1-bauerman@linux.ibm.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9718
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=2 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9718
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=2 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190141
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
Cc: linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 18, 2020 at 07:11:26PM -0300, Thiago Jung Bauermann wrote:
> POWER secure guests (i.e., guests which use the Protection Execution
> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
> they don't need the SWIOTLB memory to be in low addresses since the
> hypervisor doesn't have any addressing limitation.
> 
> This solves a SWIOTLB initialization problem we are seeing in secure guests
> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
> memory, which leaves no space for SWIOTLB in low addresses.
> 
> To do this, we use mostly the same code as swiotlb_init(), but allocate the
> buffer using memblock_alloc() instead of memblock_alloc_low().
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>


> ---
>  arch/powerpc/include/asm/svm.h       |  4 ++++
>  arch/powerpc/mm/mem.c                |  6 +++++-
>  arch/powerpc/platforms/pseries/svm.c | 26 ++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
> 
> Changes from v2:
> - Panic if unable to allocate buffer, as suggested by Christoph.
> 
> Changes from v1:
> - Open-code swiotlb_init() in arch-specific code, as suggested by
>   Christoph.
> 
> diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
> index 85580b30aba4..7546402d796a 100644
> --- a/arch/powerpc/include/asm/svm.h
> +++ b/arch/powerpc/include/asm/svm.h
> @@ -15,6 +15,8 @@ static inline bool is_secure_guest(void)
>  	return mfmsr() & MSR_S;
>  }
>  
> +void __init svm_swiotlb_init(void);
> +
>  void dtl_cache_ctor(void *addr);
>  #define get_dtl_cache_ctor()	(is_secure_guest() ? dtl_cache_ctor : NULL)
>  
> @@ -25,6 +27,8 @@ static inline bool is_secure_guest(void)
>  	return false;
>  }
>  
> +static inline void svm_swiotlb_init(void) {}
> +
>  #define get_dtl_cache_ctor() NULL
>  
>  #endif /* CONFIG_PPC_SVM */
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index c2c11eb8dcfc..0f21bcb16405 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -50,6 +50,7 @@
>  #include <asm/swiotlb.h>
>  #include <asm/rtas.h>
>  #include <asm/kasan.h>
> +#include <asm/svm.h>
>  
>  #include <mm/mmu_decl.h>
>  
> @@ -290,7 +291,10 @@ void __init mem_init(void)
>  	 * back to to-down.
>  	 */
>  	memblock_set_bottom_up(true);
> -	swiotlb_init(0);
> +	if (is_secure_guest())
> +		svm_swiotlb_init();
> +	else
> +		swiotlb_init(0);
>  #endif
>  
>  	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
> diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
> index 40c0637203d5..81085eb8f225 100644
> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/mm.h>
> +#include <linux/memblock.h>
>  #include <asm/machdep.h>
>  #include <asm/svm.h>
>  #include <asm/swiotlb.h>
> @@ -34,6 +35,31 @@ static int __init init_svm(void)
>  }
>  machine_early_initcall(pseries, init_svm);
>  
> +/*
> + * Initialize SWIOTLB. Essentially the same as swiotlb_init(), except that it
> + * can allocate the buffer anywhere in memory. Since the hypervisor doesn't have
> + * any addressing limitation, we don't need to allocate it in low addresses.
> + */
> +void __init svm_swiotlb_init(void)
> +{
> +	unsigned char *vstart;
> +	unsigned long bytes, io_tlb_nslabs;
> +
> +	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
> +	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
> +
> +	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
> +
> +	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
> +		return;
> +
> +	if (io_tlb_start)
> +		memblock_free_early(io_tlb_start,
> +				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
> +	panic("SVM: Cannot allocate SWIOTLB buffer");
> +}
> +
>  int set_memory_encrypted(unsigned long addr, int numpages)
>  {
>  	if (!PAGE_ALIGNED(addr))

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFC108AFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 10:34:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M2152hptzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 20:34:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rppt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M1yp5M77zDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 20:32:14 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP9RghZ112085
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 04:32:10 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wfju7u04n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 04:32:10 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <rppt@linux.ibm.com>;
 Mon, 25 Nov 2019 09:32:08 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 25 Nov 2019 09:32:04 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAP9W37i46334404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 09:32:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44DFAAE058;
 Mon, 25 Nov 2019 09:32:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22A35AE045;
 Mon, 25 Nov 2019 09:32:02 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.137])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Nov 2019 09:32:02 +0000 (GMT)
Date: Mon, 25 Nov 2019 11:32:00 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
 <20191125073923.GA30168@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125073923.GA30168@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19112509-0012-0000-0000-0000036BE3F5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112509-0013-0000-0000-000021A78322
Message-Id: <20191125093159.GA23118@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_02:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911250087
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, paulus@samba.org,
 mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 25, 2019 at 08:39:23AM +0100, Christoph Hellwig wrote:
> On Sat, Nov 23, 2019 at 12:42:27PM +0100, Christian Zigotzky wrote:
> > Hello Christoph,
> >
> > Please find attached the dmesg of your Git kernel.
> 
> Thanks.  It looks like on your platform the swiotlb buffer isn't
> actually addressable based on the bus dma mask limit, which is rather
> interesting.  swiotlb_init uses memblock_alloc_low to allocate the
> buffer, and I'll need some help from Mike and the powerpc maintainers
> to figure out how that select where to allocate the buffer from, and
> how we can move it to a lower address.  My gut feeling would be to try
> to do what arm64 does and define a new ARCH_LOW_ADDRESS_LIMIT, preferably
> without needing too much arch specific magic.

Presuming the problem is relevant for all CoreNet boards something like
this could work:
 
diff --git a/arch/powerpc/include/asm/dma.h b/arch/powerpc/include/asm/dma.h
index 1b4f0254868f..7c6cfeeaff52 100644
--- a/arch/powerpc/include/asm/dma.h
+++ b/arch/powerpc/include/asm/dma.h
@@ -347,5 +347,11 @@ extern int isa_dma_bridge_buggy;
 #define isa_dma_bridge_buggy	(0)
 #endif
 
+#ifdef CONFIG_CORENET_GENERIC
+extern phys_addr_t ppc_dma_phys_limit;
+#define ARCH_LOW_ADDRESS_LIMIT	(ppc_dma_phys_limit - 1)
+#endif
+
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_DMA_H */
diff --git a/arch/powerpc/platforms/85xx/common.c b/arch/powerpc/platforms/85xx/common.c
index fe0606439b5a..346b436b6d3f 100644
--- a/arch/powerpc/platforms/85xx/common.c
+++ b/arch/powerpc/platforms/85xx/common.c
@@ -126,3 +126,7 @@ void __init mpc85xx_qe_par_io_init(void)
 	}
 }
 #endif
+
+#ifdef CONFIG_CORENET_GENERIC
+phys_addr_t ppc_dma_phys_limit = 0xffffffffUL;
+#endif
diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 7ee2c6628f64..673bcbdc7c75 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -64,7 +64,7 @@ void __init corenet_gen_setup_arch(void)
 	mpc85xx_smp_init();
 
 	swiotlb_detect_4g();
-
+	ppc_dma_phys_limit = 0x0fffffffUL;
 	pr_info("%s board\n", ppc_md.name);
 
 	mpc85xx_qe_init();

> As a quick hack can you try this patch on top of the tree from Friday?
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index f491690d54c6..e3f95c362922 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -344,7 +344,7 @@ static inline int memblock_get_region_node(const struct memblock_region *r)
>  #define MEMBLOCK_LOW_LIMIT 0
>  
>  #ifndef ARCH_LOW_ADDRESS_LIMIT
> -#define ARCH_LOW_ADDRESS_LIMIT  0xffffffffUL
> +#define ARCH_LOW_ADDRESS_LIMIT  0x0fffffffUL
>  #endif
>  
>  phys_addr_t memblock_phys_alloc_range(phys_addr_t size, phys_addr_t align,

-- 
Sincerely yours,
Mike.


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5812F36BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:15:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478BQ92dN1zF6bR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 05:14:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478BCF16mVzF6GD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 05:05:28 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA7HlanR115867
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 Nov 2019 13:05:26 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w4qcf29fc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2019 13:05:25 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 7 Nov 2019 18:05:22 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Nov 2019 18:05:15 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA7I5D3Q65798194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Nov 2019 18:05:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4970E4C04E;
 Thu,  7 Nov 2019 18:05:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26B9E4C04A;
 Thu,  7 Nov 2019 18:05:12 +0000 (GMT)
Received: from pic2.home (unknown [9.145.15.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Nov 2019 18:05:12 +0000 (GMT)
Subject: Re: [PATCH 06/10] ocxl: Add functions to map/unmap LPC memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-7-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 7 Nov 2019 19:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025044721.16617-7-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110718-0020-0000-0000-000003837FF8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110718-0021-0000-0000-000021D9B598
Message-Id: <127f1885-df07-2a23-976e-f97c6ff8e2b2@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=908 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911070165
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/10/2019 à 06:47, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Add functions to map/unmap LPC memory
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   drivers/misc/ocxl/config.c        |  4 +++
>   drivers/misc/ocxl/core.c          | 50 +++++++++++++++++++++++++++++++
>   drivers/misc/ocxl/ocxl_internal.h |  3 ++
>   include/misc/ocxl.h               | 18 +++++++++++
>   4 files changed, 75 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index c8e19bfb5ef9..fb0c3b6f8312 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -568,6 +568,10 @@ static int read_afu_lpc_memory_info(struct pci_dev *dev,
>   		afu->special_purpose_mem_size =
>   			total_mem_size - lpc_mem_size;
>   	}
> +
> +	dev_info(&dev->dev, "Probed LPC memory of %#llx bytes and special purpose memory of %#llx bytes\n",
> +		afu->lpc_mem_size, afu->special_purpose_mem_size);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> index 2531c6cf19a0..5554f5ce4b9e 100644
> --- a/drivers/misc/ocxl/core.c
> +++ b/drivers/misc/ocxl/core.c
> @@ -210,6 +210,55 @@ static void unmap_mmio_areas(struct ocxl_afu *afu)
>   	release_fn_bar(afu->fn, afu->config.global_mmio_bar);
>   }
>   
> +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu)
> +{
> +	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> +
> +	if ((afu->config.lpc_mem_size + afu->config.special_purpose_mem_size) == 0)
> +		return 0;
> +
> +	afu->lpc_base_addr = ocxl_link_lpc_map(afu->fn->link, dev);
> +	if (afu->lpc_base_addr == 0)
> +		return -EINVAL;
> +
> +	if (afu->config.lpc_mem_size) {
> +		afu->lpc_res.start = afu->lpc_base_addr + afu->config.lpc_mem_offset;
> +		afu->lpc_res.end = afu->lpc_res.start + afu->config.lpc_mem_size - 1;
> +	}
> +
> +	if (afu->config.special_purpose_mem_size) {
> +		afu->special_purpose_res.start = afu->lpc_base_addr +
> +						 afu->config.special_purpose_mem_offset;
> +		afu->special_purpose_res.end = afu->special_purpose_res.start +
> +					       afu->config.special_purpose_mem_size - 1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ocxl_afu_map_lpc_mem);


We should use EXPORT_SYMBOL_GPL().

ok, so we're unmapping the lpc memory implicitly when calling 
ocxl_function_close() and therefore don't really need to export 
(ocxl_)unmap_lpc_mem(). I guess that's fine and easy enough to add if 
one day somebody has the need to unmap without closing.


> +
> +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu)
> +{
> +	return &afu->lpc_res;
> +}
> +EXPORT_SYMBOL(ocxl_afu_lpc_mem);
> +
> +static void unmap_lpc_mem(struct ocxl_afu *afu)
> +{
> +	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> +
> +	if (afu->lpc_res.start || afu->special_purpose_res.start) {
> +		void *link = afu->fn->link;
> +
> +		ocxl_link_lpc_release(link, dev);
> +
> +		afu->lpc_res.start = 0;
> +		afu->lpc_res.end = 0;
> +		afu->special_purpose_res.start = 0;
> +		afu->special_purpose_res.end = 0;
> +	}
> +}
> +
>   static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>   {
>   	int rc;
> @@ -251,6 +300,7 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>   
>   static void deconfigure_afu(struct ocxl_afu *afu)
>   {
> +	unmap_lpc_mem(afu);
>   	unmap_mmio_areas(afu);
>   	reclaim_afu_pasid(afu);
>   	reclaim_afu_actag(afu);
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 20b417e00949..9f4b47900e62 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -52,6 +52,9 @@ struct ocxl_afu {
>   	void __iomem *global_mmio_ptr;
>   	u64 pp_mmio_start;
>   	void *private;
> +	u64 lpc_base_addr; /* Covers both LPC & special purpose memory */
> +	struct resource lpc_res;
> +	struct resource special_purpose_res;
>   };
>   
>   enum ocxl_context_status {
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 06dd5839e438..6f7c02f0d5e3 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -212,6 +212,24 @@ int ocxl_irq_set_handler(struct ocxl_context *ctx, int irq_id,
>   
>   // AFU Metadata
>   
> +/**
> + * Map the LPC system & special purpose memory for an AFU
> + *
> + * Do not call this during device discovery, as there may me multiple
> + * devices on a link, and the memory is mapped for the whole link, not
> + * just one device. It should only be called after all devices have
> + * registered their memory on the link.


If we were supporting more than one AFU-carrying functions, we would 
need to rework this, as functions could come and go and the total range 
could be dynamic (even the max address of the range could increase, if a 
function is updated with an AFU with a bigger LPC size). But we don't 
support multiple AFU-carrying functions, so current implementation is 
fine. And simple.

   Fred


> + *
> + * afu: The AFU that has the LPC memory to map
> + */
> +extern int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu);
> +
> +/**
> + * Get the physical address range of LPC memory for an AFU
> + * afu: The AFU associated with the LPC memory
> + */
> +extern struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu);
> +
>   /**
>    * Get a pointer to the config for an AFU
>    *
> 


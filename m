Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914516EC04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 18:03:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rlcb34RDzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 04:03:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RlZd4HR2zDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:01:29 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PGwraV098986
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 12:01:27 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb1qe14ft-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 12:01:26 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 25 Feb 2020 17:01:22 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Feb 2020 17:01:15 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01PH1De953936252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Feb 2020 17:01:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2D3642049;
 Tue, 25 Feb 2020 17:01:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67F5742042;
 Tue, 25 Feb 2020 17:01:12 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Feb 2020 17:01:12 +0000 (GMT)
Subject: Re: [PATCH v3 07/27] ocxl: Add functions to map/unmap LPC memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-8-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 25 Feb 2020 18:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-8-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022517-0012-0000-0000-0000038A3168
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022517-0013-0000-0000-000021C6D4AF
Message-Id: <ae0dfe17-ced9-8ba8-3769-1955797dfbef@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_06:2020-02-25,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250126
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2020 à 04:27, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Add functions to map/unmap LPC memory
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---


It looks ok to me.
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   drivers/misc/ocxl/core.c          | 51 +++++++++++++++++++++++++++++++
>   drivers/misc/ocxl/ocxl_internal.h |  3 ++
>   include/misc/ocxl.h               | 21 +++++++++++++
>   3 files changed, 75 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> index 2531c6cf19a0..75ff14e3882a 100644
> --- a/drivers/misc/ocxl/core.c
> +++ b/drivers/misc/ocxl/core.c
> @@ -210,6 +210,56 @@ static void unmap_mmio_areas(struct ocxl_afu *afu)
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
> +	if (afu->config.lpc_mem_size > 0) {
> +		afu->lpc_res.start = afu->lpc_base_addr + afu->config.lpc_mem_offset;
> +		afu->lpc_res.end = afu->lpc_res.start + afu->config.lpc_mem_size - 1;
> +	}
> +
> +	if (afu->config.special_purpose_mem_size > 0) {
> +		afu->special_purpose_res.start = afu->lpc_base_addr +
> +						 afu->config.special_purpose_mem_offset;
> +		afu->special_purpose_res.end = afu->special_purpose_res.start +
> +					       afu->config.special_purpose_mem_size - 1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ocxl_afu_map_lpc_mem);
> +
> +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu)
> +{
> +	return &afu->lpc_res;
> +}
> +EXPORT_SYMBOL_GPL(ocxl_afu_lpc_mem);
> +
> +static void unmap_lpc_mem(struct ocxl_afu *afu)
> +{
> +	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> +
> +	if (afu->lpc_res.start || afu->special_purpose_res.start) {
> +		void *link = afu->fn->link;
> +
> +		// only release the link when the the last consumer calls release
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
> @@ -251,6 +301,7 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>   
>   static void deconfigure_afu(struct ocxl_afu *afu)
>   {
> +	unmap_lpc_mem(afu);
>   	unmap_mmio_areas(afu);
>   	reclaim_afu_pasid(afu);
>   	reclaim_afu_actag(afu);
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index d0c8c4838f42..ce0cac1da416 100644
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
> index 357ef1aadbc0..d8b0b4d46bfb 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -203,6 +203,27 @@ int ocxl_irq_set_handler(struct ocxl_context *ctx, int irq_id,
>   
>   // AFU Metadata
>   
> +/**
> + * ocxl_afu_map_lpc_mem() - Map the LPC system & special purpose memory for an AFU
> + * Do not call this during device discovery, as there may me multiple
> + * devices on a link, and the memory is mapped for the whole link, not
> + * just one device. It should only be called after all devices have
> + * registered their memory on the link.
> + *
> + * @afu: The AFU that has the LPC memory to map
> + *
> + * Returns 0 on success, negative on failure
> + */
> +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu);
> +
> +/**
> + * ocxl_afu_lpc_mem() - Get the physical address range of LPC memory for an AFU
> + * @afu: The AFU associated with the LPC memory
> + *
> + * Returns a pointer to the resource struct for the physical address range
> + */
> +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu);
> +
>   /**
>    * ocxl_afu_config() - Get a pointer to the config for an AFU
>    * @afu: a pointer to the AFU to get the config for
> 


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA536135BB1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 15:50:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tptw6svSzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 01:50:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tprm6mQczDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 01:48:24 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009EgJA5035389
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Jan 2020 09:48:22 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xe1snk719-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 09:48:22 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 9 Jan 2020 14:48:18 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 Jan 2020 14:48:11 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 009Em93M37421252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jan 2020 14:48:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7305EA404D;
 Thu,  9 Jan 2020 14:48:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5228DA4051;
 Thu,  9 Jan 2020 14:48:08 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jan 2020 14:48:08 +0000 (GMT)
Subject: Re: [PATCH v2 06/27] ocxl: Tally up the LPC memory on a link & allow
 it to be mapped
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-7-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 9 Jan 2020 15:48:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203034655.51561-7-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010914-0012-0000-0000-0000037BF294
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010914-0013-0000-0000-000021B81440
Message-Id: <a2f93729-038e-9fcb-2cf0-53739ae19147@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 suspectscore=2 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001090129
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/12/2019 à 04:46, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Tally up the LPC memory on an OpenCAPI link & allow it to be mapped
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   drivers/misc/ocxl/core.c          | 10 ++++++
>   drivers/misc/ocxl/link.c          | 60 +++++++++++++++++++++++++++++++
>   drivers/misc/ocxl/ocxl_internal.h | 33 +++++++++++++++++
>   3 files changed, 103 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> index b7a09b21ab36..2531c6cf19a0 100644
> --- a/drivers/misc/ocxl/core.c
> +++ b/drivers/misc/ocxl/core.c
> @@ -230,8 +230,18 @@ static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct pci_dev *dev)
>   	if (rc)
>   		goto err_free_pasid;
>   
> +	if (afu->config.lpc_mem_size || afu->config.special_purpose_mem_size) {
> +		rc = ocxl_link_add_lpc_mem(afu->fn->link, afu->config.lpc_mem_offset,
> +					   afu->config.lpc_mem_size +
> +					   afu->config.special_purpose_mem_size);
> +		if (rc)
> +			goto err_free_mmio;
> +	}
> +
>   	return 0;
>   
> +err_free_mmio:
> +	unmap_mmio_areas(afu);
>   err_free_pasid:
>   	reclaim_afu_pasid(afu);
>   err_free_actag:
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 58d111afd9f6..d8503f0dc6ec 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -84,6 +84,11 @@ struct ocxl_link {
>   	int dev;
>   	atomic_t irq_available;
>   	struct spa *spa;
> +	struct mutex lpc_mem_lock;
> +	u64 lpc_mem_sz; /* Total amount of LPC memory presented on the link */
> +	u64 lpc_mem;
> +	int lpc_consumers;
> +
>   	void *platform_data;
>   };
>   static struct list_head links_list = LIST_HEAD_INIT(links_list);
> @@ -396,6 +401,8 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
>   	if (rc)
>   		goto err_spa;
>   
> +	mutex_init(&link->lpc_mem_lock);
> +
>   	/* platform specific hook */
>   	rc = pnv_ocxl_spa_setup(dev, link->spa->spa_mem, PE_mask,
>   				&link->platform_data);
> @@ -711,3 +718,56 @@ void ocxl_link_free_irq(void *link_handle, int hw_irq)
>   	atomic_inc(&link->irq_available);
>   }
>   EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
> +
> +int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size)
> +{
> +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +
> +	// Check for overflow
> +	if (offset > (offset + size))
> +		return -EINVAL;
> +
> +	mutex_lock(&link->lpc_mem_lock);
> +	link->lpc_mem_sz = max(link->lpc_mem_sz, offset + size);
> +
> +	mutex_unlock(&link->lpc_mem_lock);
> +
> +	return 0;
> +}
> +
> +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
> +{
> +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +	u64 lpc_mem;
> +
> +	mutex_lock(&link->lpc_mem_lock);
> +	if (link->lpc_mem) {
> +		lpc_mem = link->lpc_mem;
> +
> +		link->lpc_consumers++;
> +		mutex_unlock(&link->lpc_mem_lock);
> +		return lpc_mem;
> +	}
> +
> +	link->lpc_mem = pnv_ocxl_platform_lpc_setup(pdev, link->lpc_mem_sz);
> +	if (link->lpc_mem)
> +		link->lpc_consumers++;


So if we fail to setup the lpc access in opal, we don't increment 
link->lpc_consumers and we shouldn't call ocxl_link_lpc_release(). Is 
that always true? Risk is to trigger the warning in 
ocxl_link_lpc_release(). So maybe we should check link->lpc_mem first in 
ocxl_link_lpc_release() and exit early if no memory is mapped. It would 
probably avoid hitting the WARN on an error path for example.

    Fred


> +	lpc_mem = link->lpc_mem;
> +	mutex_unlock(&link->lpc_mem_lock);
> +
> +	return lpc_mem;
> +}
> +
> +void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev)
> +{
> +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> +
> +	mutex_lock(&link->lpc_mem_lock);
> +	WARN_ON(--link->lpc_consumers < 0);
> +	if (link->lpc_consumers == 0) {
> +		pnv_ocxl_platform_lpc_release(pdev);
> +		link->lpc_mem = 0;
> +	}
> +
> +	mutex_unlock(&link->lpc_mem_lock);
> +}
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 97415afd79f3..20b417e00949 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -141,4 +141,37 @@ int ocxl_irq_offset_to_id(struct ocxl_context *ctx, u64 offset);
>   u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
>   void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
>   
> +/**
> + * ocxl_link_add_lpc_mem() - Increment the amount of memory required by an OpenCAPI link
> + *
> + * @link_handle: The OpenCAPI link handle
> + * @offset: The offset of the memory to add
> + * @size: The amount of memory to increment by
> + *
> + * Return 0 on success, negative on overflow
> + */
> +int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size);
> +
> +/**
> + * ocxl_link_lpc_map() - Map the LPC memory for an OpenCAPI device
> + *
> + * Since LPC memory belongs to a link, the whole LPC memory available
> + * on the link bust be mapped in order to make it accessible to a device.
> + *
> + * @link_handle: The OpenCAPI link handle
> + * @pdev: A device that is on the link
> + */
> +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
> +
> +/**
> + * ocxl_link_lpc_release() - Release the LPC memory device for an OpenCAPI device
> + *
> + * Offlines LPC memory on an OpenCAPI link for a device. If this is the
> + * last device on the link to release the memory, unmap it from the link.
> + *
> + * @link_handle: The OpenCAPI link handle
> + * @pdev: A device that is on the link
> + */
> +void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev);
> +
>   #endif /* _OCXL_INTERNAL_H_ */
> 


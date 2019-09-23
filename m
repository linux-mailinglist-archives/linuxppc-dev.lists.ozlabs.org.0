Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A80BB2EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 13:41:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cMq90gCMzDqLk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 21:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cMn84mgHzDqGQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 21:39:55 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NBWvOS084140
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 07:39:52 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v6tkxejq7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 07:39:52 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 23 Sep 2019 12:39:49 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Sep 2019 12:39:46 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NBdivK28442818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 11:39:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADBDFAE055;
 Mon, 23 Sep 2019 11:39:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 138E7AE053;
 Mon, 23 Sep 2019 11:39:44 +0000 (GMT)
Received: from bali.tls.ibm.com (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 11:39:44 +0000 (GMT)
Subject: Re: [PATCH 4/5] ocxl: Add functions to map/unmap LPC memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190917014307.30485-1-alastair@au1.ibm.com>
 <20190917014307.30485-5-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Mon, 23 Sep 2019 13:39:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190917014307.30485-5-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092311-0008-0000-0000-00000319EAFC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092311-0009-0000-0000-00004A3879C8
Message-Id: <b790c190-4800-6e2a-0d2b-e89f04d14dd9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230117
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>




> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 2874811a4398..9e303a5f4d85 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -738,7 +738,7 @@ int ocxl_link_add_lpc_mem(void *link_handle, u64 size)
>   }
>   EXPORT_SYMBOL_GPL(ocxl_link_add_lpc_mem);
>   
> -u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
> +u64 ocxl_link_lpc_online(void *link_handle, struct pci_dev *pdev)
>   {
>   	struct ocxl_link *link = (struct ocxl_link *) link_handle;
>   

A bit of a nitpick, but is there any specific reason to rename with 
"online" suffix? I'm discovering it myself, but with memory hotplug, 
"onlining" seems to refer to the second, a.k.a logical memory hotplug 
phase (as described in Documentation/admin-guide/mm/memory-hotplug.rst). 
We'll need to worry about it, but the function here is really doing the 
first phase, a.k.a physical memory hotplug.

   Fred


> @@ -759,7 +759,7 @@ u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
>   	return link->lpc_mem;
>   }
>   
> -void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev)
> +void ocxl_link_lpc_offline(void *link_handle, struct pci_dev *pdev)
>   {
>   	struct ocxl_link *link = (struct ocxl_link *) link_handle;
>   
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index db2647a90fc8..5656a4aab5b7 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -52,6 +52,12 @@ struct ocxl_afu {
>   	void __iomem *global_mmio_ptr;
>   	u64 pp_mmio_start;
>   	void *private;
> +	u64 lpc_base_addr; /* Covers both LPC & special purpose memory */
> +	struct bin_attribute attr_global_mmio;
> +	struct bin_attribute attr_lpc_mem;
> +	struct resource lpc_res;
> +	struct bin_attribute attr_special_purpose_mem;
> +	struct resource special_purpose_res;
>   };
>   
>   enum ocxl_context_status {
> @@ -170,7 +176,7 @@ extern u64 ocxl_link_get_lpc_mem_sz(void *link_handle);
>    * @link_handle: The OpenCAPI link handle
>    * @pdev: A device that is on the link
>    */
> -u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
> +u64 ocxl_link_lpc_online(void *link_handle, struct pci_dev *pdev);
>   
>   /**
>    * Release the LPC memory device for an OpenCAPI device
> @@ -181,6 +187,6 @@ u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
>    * @link_handle: The OpenCAPI link handle
>    * @pdev: A device that is on the link
>    */
> -void ocxl_link_lpc_release(void *link_handle, struct pci_dev *pdev);
> +void ocxl_link_lpc_offline(void *link_handle, struct pci_dev *pdev);
>   
>   #endif /* _OCXL_INTERNAL_H_ */
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 06dd5839e438..a1897737908d 100644
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
> + *
> + * afu: The AFU that has the LPC memory to map
> + */
> +extern int ocxl_map_lpc_mem(struct ocxl_afu *afu);
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


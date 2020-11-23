Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E22C0360
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 11:37:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfk9Y664SzDqPG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 21:37:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bHMnNVmu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfk7P3n91zDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 21:35:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ANAW9ck051306
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 05:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Tk3BxU3WYROMkPxEk1YOcq+AWHJIXvlJZLdQ4YPNkCk=;
 b=bHMnNVmuTzB+qfrHCbJM/ekaVv77rqs6/ENabgkew58cttCnAA9Mnx01Iledqda4DS27
 dd321eDM8fwkjjQrgbpzSyiMG9rtepKGxPSmtu9N7Ejrbjd49BIg7l7ZGdrG8kiuF2xR
 ahfpdPBdIDdWn1LYyCtAGvTfZuyEjF6MPn33s29ZMQB4gGEq8E3tf7B1oT45KDxX3COW
 lb/R3OnzGCbgjM/lnncNh+8ueWtS00Zac4nZ2UBPrrxzH/W5cOuGQlm6YM/ZkVZQSjzv
 7wvF8CmnwDj3O9Q8wOkzWi3PT0o4NOuB+5NdWDg8eRr/7XEJ2m9KJkAHiuLQM3VXM7Hk zA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xvnhs53p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 05:35:09 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ANAMDao028163
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 10:35:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8acq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 10:35:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ANAZ5f54391618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 10:35:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F9C552069;
 Mon, 23 Nov 2020 10:35:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.86.73])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3639052052;
 Mon, 23 Nov 2020 10:35:05 +0000 (GMT)
Subject: Re: [PATCH V2 1/5] ocxl: Assign a register set to a Logical Partition
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
 <20201120173241.59229-2-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <37ae4bba-c260-c3c5-dd9f-c4e91e86a023@linux.ibm.com>
Date: Mon, 23 Nov 2020 11:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120173241.59229-2-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230068
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/11/2020 18:32, Christophe Lombard wrote:
> Platform specific function to assign a register set to a Logical Partition.
> The "ibm,mmio-atsd" property, provided by the firmware, contains the 16
> base ATSD physical addresses (ATSD0 through ATSD15) of the set of MMIO
> registers (XTS MMIO ATSDx LPARID/AVA/launch/status register).
> 
> For the time being, the ATSD0 set of registers is used by default.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/pnv-ocxl.h   |  3 ++
>   arch/powerpc/platforms/powernv/ocxl.c | 48 +++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index d37ededca3ee..3f38aed7100c 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -28,4 +28,7 @@ int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **p
>   void pnv_ocxl_spa_release(void *platform_data);
>   int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
> 
> +int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
> +		      uint64_t lpcr, void __iomem **arva);
> +void pnv_ocxl_unmap_lpar(void __iomem **arva);
>   #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index ecdad219d704..bc20cf867900 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -483,3 +483,51 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>   	return rc;
>   }
>   EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
> +
> +int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
> +		      uint64_t lpcr, void __iomem **arva)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> +	struct pnv_phb *phb = hose->private_data;
> +	u64 mmio_atsd;
> +	int rc;
> +
> +	/* ATSD physical address.
> +	 * ATSD LAUNCH register: write access initiates a shoot down to
> +	 * initiate the TLB Invalidate command.
> +	 */
> +	rc = of_property_read_u64_index(hose->dn, "ibm,mmio-atsd",
> +					0, &mmio_atsd);
> +	if (rc) {
> +		dev_info(&dev->dev, "No available ATSD found\n");
> +		return rc;
> +	}
> +
> +	/* Assign a register set to a Logical Partition and MMIO ATSD
> +	 * LPARID register to the required value.
> +	 */
> +	if (mmio_atsd)


If we don't have the "ibm,mmio-atsd", i.e on P9, then we've already 
exited above. So why not consider mmio_atsd as an error?


> +		rc = opal_npu_map_lpar(phb->opal_id, pci_dev_id(dev),
> +				       lparid, lpcr);
> +	if (rc) {
> +		dev_err(&dev->dev, "Error mapping device to LPAR: %d\n", rc);
> +		return rc;
> +	}
> +
> +	if (mmio_atsd) {


Same here


> +		*arva = ioremap(mmio_atsd, 24);
> +		if (!(*arva)) {
> +			dev_warn(&dev->dev, "ioremap failed - mmio_atsd: %#llx\n", mmio_atsd);
> +			rc = -ENOMEM;
> +		}
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_map_lpar);
> +
> +void pnv_ocxl_unmap_lpar(void __iomem **arva)


The arva argument doesn't need to be a double pointer. Void * is enough.

   Fred


> +{
> +	iounmap(*arva);
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_unmap_lpar);
> 

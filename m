Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81D2C416E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:53:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch2RK4nfFzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:53:33 +1100 (AEDT)
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
 header.s=pp1 header.b=tZN5Lnrw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2JH0fgvzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:47:26 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APDW1bh066917
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 08:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KyUoQ/GEPhEL7Juktqgh0TaJjbGaAB2J5pSLxfIXpwU=;
 b=tZN5LnrwI7TOiuOiUUUdJgCm3aymivf+uG3vhIF9/VtOurXE+ZlBc3VlLB92nOaONH7k
 4vM+r+3T5DLoBuV4zrVOvDnvfRkTgD6YJAo43V6dxj+dpaZEcvAzYIr0ts6gP72QQfX8
 ZlrI7Iq/AUnnX5tKWikel9BpjeKs8YxjVlj2Ayc6KXN7G1m76ES+4sf77yjmzXwIvr62
 zjkNyjAJ5TORBuR/0JApjhKCufbBjn41Z2Vp29TgBNx9rCRJdvP+Oqpn9oDhTzIO73PI
 l360XmGcK4PWyW0m/j8G72lDe9jmcFxvNPAnDfbfxekz5l+TqZ5iqEoe4BEOu670TSdk 7Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351q2uaes1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 08:47:23 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APDgsfe024637
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 13:47:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8cptw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 13:47:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0APDlILU64881080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 13:47:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2DAA4055;
 Wed, 25 Nov 2020 13:47:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A8C3A4051;
 Wed, 25 Nov 2020 13:47:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.70.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 13:47:18 +0000 (GMT)
Subject: Re: [PATCH V3 1/5] ocxl: Assign a register set to a Logical Partition
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
References: <20201124095838.18665-1-clombard@linux.vnet.ibm.com>
 <20201124095838.18665-2-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <2c6a4ce0-1507-310a-69a6-21f3b2b7e8f2@linux.ibm.com>
Date: Wed, 25 Nov 2020 14:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124095838.18665-2-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250080
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



On 24/11/2020 10:58, Christophe Lombard wrote:
> Platform specific function to assign a register set to a Logical Partition.
> The "ibm,mmio-atsd" property, provided by the firmware, contains the 16
> base ATSD physical addresses (ATSD0 through ATSD15) of the set of MMIO
> registers (XTS MMIO ATSDx LPARID/AVA/launch/status register).
> 
> For the time being, the ATSD0 set of registers is used by default.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---


Looks good, thanks for the updates!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   arch/powerpc/include/asm/pnv-ocxl.h   |  3 ++
>   arch/powerpc/platforms/powernv/ocxl.c | 45 +++++++++++++++++++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index d37ededca3ee..60c3c74427d9 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -28,4 +28,7 @@ int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **p
>   void pnv_ocxl_spa_release(void *platform_data);
>   int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
> 
> +int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
> +		      uint64_t lpcr, void __iomem **arva);
> +void pnv_ocxl_unmap_lpar(void __iomem *arva);
>   #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index ecdad219d704..57fc1062677b 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -483,3 +483,48 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
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
> +	rc = opal_npu_map_lpar(phb->opal_id, pci_dev_id(dev),
> +			       lparid, lpcr);
> +	if (rc) {
> +		dev_err(&dev->dev, "Error mapping device to LPAR: %d\n", rc);
> +		return rc;
> +	}
> +
> +	*arva = ioremap(mmio_atsd, 24);
> +	if (!(*arva)) {
> +		dev_warn(&dev->dev, "ioremap failed - mmio_atsd: %#llx\n", mmio_atsd);
> +		rc = -ENOMEM;
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_map_lpar);
> +
> +void pnv_ocxl_unmap_lpar(void __iomem *arva)
> +{
> +	iounmap(arva);
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_unmap_lpar);
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74977146B2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 10:47:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yGb16SvZzDqJT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 18:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yGYV1plTzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 18:46:20 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x468gHRJ001486
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 04:46:16 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2saggeu5v4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 04:46:16 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 6 May 2019 09:46:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 09:46:12 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x468kCYf50856188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 08:46:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F33D45204E;
 Mon,  6 May 2019 08:46:11 +0000 (GMT)
Received: from [9.145.9.21] (unknown [9.145.9.21])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AA8E752054;
 Mon,  6 May 2019 08:46:11 +0000 (GMT)
Subject: Re: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190426124917.23789-1-hch@lst.de>
 <20190426124917.23789-2-hch@lst.de>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Mon, 6 May 2019 10:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426124917.23789-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050608-0008-0000-0000-000002E3B9CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050608-0009-0000-0000-000022503109
Message-Id: <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060076
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

The PCI p2p and tunnel code is used by the Mellanox CX5 driver, at least 
their latest, out of tree version, which is used for CORAL. My 
understanding is that they'll upstream it at some point, though I don't 
know what their schedule is like.

   Fred


Le 26/04/2019 à 14:49, Christoph Hellwig a écrit :
> This function has never been used since it has been added to the tree.
> We also now have proper PCIe P2P APIs in the core kernel, and any new
> P2P support should be using those.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/powerpc/include/asm/opal.h            |  2 -
>   arch/powerpc/include/asm/pnv-pci.h         |  2 -
>   arch/powerpc/platforms/powernv/opal-call.c |  1 -
>   arch/powerpc/platforms/powernv/pci.c       | 74 ----------------------
>   arch/powerpc/platforms/powernv/pci.h       |  5 --
>   5 files changed, 84 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index a55b01c90bb1..16c67f4eeb71 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -279,8 +279,6 @@ int64_t opal_xive_allocate_irq(uint32_t chip_id);
>   int64_t opal_xive_free_irq(uint32_t girq);
>   int64_t opal_xive_sync(uint32_t type, uint32_t id);
>   int64_t opal_xive_dump(uint32_t type, uint32_t id);
> -int64_t opal_pci_set_p2p(uint64_t phb_init, uint64_t phb_target,
> -			uint64_t desc, uint16_t pe_number);
>   
>   int64_t opal_imc_counters_init(uint32_t type, uint64_t address,
>   							uint64_t cpu_pir);
> diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
> index 630eb8b1b7ed..9fcb0bc462c6 100644
> --- a/arch/powerpc/include/asm/pnv-pci.h
> +++ b/arch/powerpc/include/asm/pnv-pci.h
> @@ -26,8 +26,6 @@ extern int pnv_pci_get_presence_state(uint64_t id, uint8_t *state);
>   extern int pnv_pci_get_power_state(uint64_t id, uint8_t *state);
>   extern int pnv_pci_set_power_state(uint64_t id, uint8_t state,
>   				   struct opal_msg *msg);
> -extern int pnv_pci_set_p2p(struct pci_dev *initiator, struct pci_dev *target,
> -			   u64 desc);
>   
>   extern int pnv_pci_enable_tunnel(struct pci_dev *dev, uint64_t *asnind);
>   extern int pnv_pci_disable_tunnel(struct pci_dev *dev);
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index daad8c45c8e7..a89f0e31b468 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -267,7 +267,6 @@ OPAL_CALL(opal_npu_map_lpar,			OPAL_NPU_MAP_LPAR);
>   OPAL_CALL(opal_imc_counters_init,		OPAL_IMC_COUNTERS_INIT);
>   OPAL_CALL(opal_imc_counters_start,		OPAL_IMC_COUNTERS_START);
>   OPAL_CALL(opal_imc_counters_stop,		OPAL_IMC_COUNTERS_STOP);
> -OPAL_CALL(opal_pci_set_p2p,			OPAL_PCI_SET_P2P);
>   OPAL_CALL(opal_get_powercap,			OPAL_GET_POWERCAP);
>   OPAL_CALL(opal_set_powercap,			OPAL_SET_POWERCAP);
>   OPAL_CALL(opal_get_power_shift_ratio,		OPAL_GET_POWER_SHIFT_RATIO);
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index ef9448a907c6..8d28f2932c3b 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -38,7 +38,6 @@
>   #include "powernv.h"
>   #include "pci.h"
>   
> -static DEFINE_MUTEX(p2p_mutex);
>   static DEFINE_MUTEX(tunnel_mutex);
>   
>   int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
> @@ -861,79 +860,6 @@ void pnv_pci_dma_bus_setup(struct pci_bus *bus)
>   	}
>   }
>   
> -int pnv_pci_set_p2p(struct pci_dev *initiator, struct pci_dev *target, u64 desc)
> -{
> -	struct pci_controller *hose;
> -	struct pnv_phb *phb_init, *phb_target;
> -	struct pnv_ioda_pe *pe_init;
> -	int rc;
> -
> -	if (!opal_check_token(OPAL_PCI_SET_P2P))
> -		return -ENXIO;
> -
> -	hose = pci_bus_to_host(initiator->bus);
> -	phb_init = hose->private_data;
> -
> -	hose = pci_bus_to_host(target->bus);
> -	phb_target = hose->private_data;
> -
> -	pe_init = pnv_ioda_get_pe(initiator);
> -	if (!pe_init)
> -		return -ENODEV;
> -
> -	/*
> -	 * Configuring the initiator's PHB requires to adjust its
> -	 * TVE#1 setting. Since the same device can be an initiator
> -	 * several times for different target devices, we need to keep
> -	 * a reference count to know when we can restore the default
> -	 * bypass setting on its TVE#1 when disabling. Opal is not
> -	 * tracking PE states, so we add a reference count on the PE
> -	 * in linux.
> -	 *
> -	 * For the target, the configuration is per PHB, so we keep a
> -	 * target reference count on the PHB.
> -	 */
> -	mutex_lock(&p2p_mutex);
> -
> -	if (desc & OPAL_PCI_P2P_ENABLE) {
> -		/* always go to opal to validate the configuration */
> -		rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id,
> -				      desc, pe_init->pe_number);
> -
> -		if (rc != OPAL_SUCCESS) {
> -			rc = -EIO;
> -			goto out;
> -		}
> -
> -		pe_init->p2p_initiator_count++;
> -		phb_target->p2p_target_count++;
> -	} else {
> -		if (!pe_init->p2p_initiator_count ||
> -			!phb_target->p2p_target_count) {
> -			rc = -EINVAL;
> -			goto out;
> -		}
> -
> -		if (--pe_init->p2p_initiator_count == 0)
> -			pnv_pci_ioda2_set_bypass(pe_init, true);
> -
> -		if (--phb_target->p2p_target_count == 0) {
> -			rc = opal_pci_set_p2p(phb_init->opal_id,
> -					      phb_target->opal_id, desc,
> -					      pe_init->pe_number);
> -			if (rc != OPAL_SUCCESS) {
> -				rc = -EIO;
> -				goto out;
> -			}
> -		}
> -	}
> -	rc = 0;
> -out:
> -	mutex_unlock(&p2p_mutex);
> -	return rc;
> -}
> -EXPORT_SYMBOL_GPL(pnv_pci_set_p2p);
> -
>   struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
>   {
>   	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 8e36da379252..fbec1c76d7a7 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -78,9 +78,6 @@ struct pnv_ioda_pe {
>   	struct pnv_ioda_pe	*master;
>   	struct list_head	slaves;
>   
> -	/* PCI peer-to-peer*/
> -	int			p2p_initiator_count;
> -
>   	/* Link in list of PE#s */
>   	struct list_head	list;
>   };
> @@ -171,8 +168,6 @@ struct pnv_phb {
>   	/* PHB and hub diagnostics */
>   	unsigned int		diag_data_size;
>   	u8			*diag_data;
> -
> -	int p2p_target_count;
>   };
>   
>   extern struct pci_ops pnv_pci_ops;
> 


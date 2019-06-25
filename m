Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2A8526F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 10:43:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y07D505czDqNX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 18:43:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.46.122; helo=8.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 609 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Jun 2019 18:41:57 AEST
Received: from 8.mo173.mail-out.ovh.net (8.mo173.mail-out.ovh.net
 [46.105.46.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y05K6Vy4zDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 18:41:53 +1000 (AEST)
Received: from player158.ha.ovh.net (unknown [10.109.143.18])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id DCE9110A816
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 10:26:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 6000D71B0092;
 Tue, 25 Jun 2019 08:26:05 +0000 (UTC)
Subject: Re: [PATCH 1/4] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190625081512.16704-1-hch@lst.de>
 <20190625081512.16704-2-hch@lst.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <113fb518-0f5a-8ced-8391-abe48869a0cb@kaod.org>
Date: Tue, 25 Jun 2019 10:26:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625081512.16704-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15755561823041391383
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christoph,

On 25/06/2019 10:15, Christoph Hellwig wrote:
> This function has never been used anywhere in the kernel tree since it
> was added to the tree.  We also now have proper PCIe P2P APIs in the core
> kernel, and any new P2P support should be using those.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/opal.h            |  7 --
>  arch/powerpc/include/asm/pnv-pci.h         |  2 -
>  arch/powerpc/platforms/powernv/opal-call.c |  1 -
>  arch/powerpc/platforms/powernv/pci.c       | 74 ----------------------
>  arch/powerpc/platforms/powernv/pci.h       |  5 --
>  5 files changed, 89 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 4cc37e708bc7..7b0bc104a89c 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -280,13 +280,6 @@ int64_t opal_xive_allocate_irq(uint32_t chip_id);
>  int64_t opal_xive_free_irq(uint32_t girq);
>  int64_t opal_xive_sync(uint32_t type, uint32_t id);
>  int64_t opal_xive_dump(uint32_t type, uint32_t id);
> -int64_t opal_xive_get_queue_state(uint64_t vp, uint32_t prio,
> -				  __be32 *out_qtoggle,
> -				  __be32 *out_qindex);
> -int64_t opal_xive_set_queue_state(uint64_t vp, uint32_t prio,
> -				  uint32_t qtoggle,
> -				  uint32_t qindex);
> -int64_t opal_xive_get_vp_state(uint64_t vp, __be64 *out_w01);


This hunk seems unrelated.

These OPAL calls are new. They are used by the XIVE KVM device 
to get/set the interrupt controller state of a guest. 


>  int64_t opal_pci_set_p2p(uint64_t phb_init, uint64_t phb_target,
>  			uint64_t desc, uint16_t pe_number);

I suppose this is the one ^ you wanted to remove.

Cheers,

C. 



>  
> diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
> index 630eb8b1b7ed..9fcb0bc462c6 100644
> --- a/arch/powerpc/include/asm/pnv-pci.h
> +++ b/arch/powerpc/include/asm/pnv-pci.h
> @@ -26,8 +26,6 @@ extern int pnv_pci_get_presence_state(uint64_t id, uint8_t *state);
>  extern int pnv_pci_get_power_state(uint64_t id, uint8_t *state);
>  extern int pnv_pci_set_power_state(uint64_t id, uint8_t state,
>  				   struct opal_msg *msg);
> -extern int pnv_pci_set_p2p(struct pci_dev *initiator, struct pci_dev *target,
> -			   u64 desc);
>  
>  extern int pnv_pci_enable_tunnel(struct pci_dev *dev, uint64_t *asnind);
>  extern int pnv_pci_disable_tunnel(struct pci_dev *dev);
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index 36c8fa3647a2..29ca523c1c79 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -273,7 +273,6 @@ OPAL_CALL(opal_npu_map_lpar,			OPAL_NPU_MAP_LPAR);
>  OPAL_CALL(opal_imc_counters_init,		OPAL_IMC_COUNTERS_INIT);
>  OPAL_CALL(opal_imc_counters_start,		OPAL_IMC_COUNTERS_START);
>  OPAL_CALL(opal_imc_counters_stop,		OPAL_IMC_COUNTERS_STOP);
> -OPAL_CALL(opal_pci_set_p2p,			OPAL_PCI_SET_P2P);
>  OPAL_CALL(opal_get_powercap,			OPAL_GET_POWERCAP);
>  OPAL_CALL(opal_set_powercap,			OPAL_SET_POWERCAP);
>  OPAL_CALL(opal_get_power_shift_ratio,		OPAL_GET_POWER_SHIFT_RATIO);
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index ef9448a907c6..8d28f2932c3b 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -38,7 +38,6 @@
>  #include "powernv.h"
>  #include "pci.h"
>  
> -static DEFINE_MUTEX(p2p_mutex);
>  static DEFINE_MUTEX(tunnel_mutex);
>  
>  int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
> @@ -861,79 +860,6 @@ void pnv_pci_dma_bus_setup(struct pci_bus *bus)
>  	}
>  }
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
>  struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
>  {
>  	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index be26ab3d99e0..4f11c077af62 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -79,9 +79,6 @@ struct pnv_ioda_pe {
>  	struct pnv_ioda_pe	*master;
>  	struct list_head	slaves;
>  
> -	/* PCI peer-to-peer*/
> -	int			p2p_initiator_count;
> -
>  	/* Link in list of PE#s */
>  	struct list_head	list;
>  };
> @@ -172,8 +169,6 @@ struct pnv_phb {
>  	/* PHB and hub diagnostics */
>  	unsigned int		diag_data_size;
>  	u8			*diag_data;
> -
> -	int p2p_target_count;
>  };
>  
>  extern struct pci_ops pnv_pci_ops;
> 


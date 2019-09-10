Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B4AE1BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 02:58:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S6944KrPzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:58:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S67W61ZDzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:57:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A0v5Sh115630
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 20:57:08 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux1528u8c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 20:57:08 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 01:57:06 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 01:57:03 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A0v2Wc54853642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 00:57:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 081F75204F;
 Tue, 10 Sep 2019 00:57:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 66E855204E;
 Tue, 10 Sep 2019 00:57:01 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BD7C0A01D3;
 Tue, 10 Sep 2019 10:56:58 +1000 (AEST)
Subject: Re: [PATCH 04/11] powerpc/powernv/ioda: Release opencapi device
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 10:56:58 +1000
In-Reply-To: <20190909154600.19917-5-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-5-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091000-0012-0000-0000-00000349330C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091000-0013-0000-0000-0000218394E5
Message-Id: <05ebc83c696cd3c5e65d64e76132371af2fb81d5.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100005
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
Cc: groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-09-09 at 17:45 +0200, Frederic Barrat wrote:
> With hotplug, an opencapi device can now go away. It needs to be
> released, mostly to clean up its PE state. We were previously not
> defining any device callback. We can reuse the standard PCI release
> callback, it does a bit too much for an opencapi device, but it's
> harmless, and only needs minor tuning.
> 
> Also separate the undo of the PELT-V code in a separate function, it
> is not needed for NPU devices and it improves a bit the readability
> of
> the code.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 59 +++++++++++++++----
> ----
>  1 file changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c
> b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 06ce7ddaa0cf..e5895c05efae 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -188,7 +188,7 @@ static void pnv_ioda_free_pe(struct pnv_ioda_pe
> *pe)
>  	unsigned int pe_num = pe->pe_number;
>  
>  	WARN_ON(pe->pdev);
> -	WARN_ON(pe->npucomp); /* NPUs are not supposed to be freed */
> +	WARN_ON(pe->npucomp); /* NPUs for nvlink are not supposed to be
> freed */
>  	kfree(pe->npucomp);
>  	memset(pe, 0, sizeof(struct pnv_ioda_pe));
>  	clear_bit(pe_num, phb->ioda.pe_alloc);
> @@ -777,6 +777,34 @@ static int pnv_ioda_set_peltv(struct pnv_phb
> *phb,
>  	return 0;
>  }
>  
> +static void pnv_ioda_unset_peltv(struct pnv_phb *phb,
> +				 struct pnv_ioda_pe *pe,
> +				 struct pci_dev *parent)
> +{
> +	int64_t rc;
> +
> +	while (parent) {
> +		struct pci_dn *pdn = pci_get_pdn(parent);
> +
> +		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
> +			rc = opal_pci_set_peltv(phb->opal_id, pdn-
> >pe_number,
> +						pe->pe_number,
> +						OPAL_REMOVE_PE_FROM_DOM
> AIN);
> +			/* XXX What to do in case of error ? */

Can we take the opportunity to address this comment?

> +		}
> +		parent = parent->bus->self;
> +	}
> +
> +	opal_pci_eeh_freeze_clear(phb->opal_id, pe->pe_number,
> +				  OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
> +
> +	/* Disassociate PE in PELT */
> +	rc = opal_pci_set_peltv(phb->opal_id, pe->pe_number,
> +				pe->pe_number,
> OPAL_REMOVE_PE_FROM_DOMAIN);
> +	if (rc)
> +		pe_warn(pe, "OPAL error %lld remove self from PELTV\n",
> rc);
> +}
> +
>  static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct
> pnv_ioda_pe *pe)
>  {
>  	struct pci_dev *parent;
> @@ -827,25 +855,13 @@ static int pnv_ioda_deconfigure_pe(struct
> pnv_phb *phb, struct pnv_ioda_pe *pe)
>  	for (rid = pe->rid; rid < rid_end; rid++)
>  		phb->ioda.pe_rmap[rid] = IODA_INVALID_PE;
>  
> -	/* Release from all parents PELT-V */
> -	while (parent) {
> -		struct pci_dn *pdn = pci_get_pdn(parent);
> -		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
> -			rc = opal_pci_set_peltv(phb->opal_id, pdn-
> >pe_number,
> -						pe->pe_number,
> OPAL_REMOVE_PE_FROM_DOMAIN);
> -			/* XXX What to do in case of error ? */
> -		}
> -		parent = parent->bus->self;
> -	}
> -
> -	opal_pci_eeh_freeze_clear(phb->opal_id, pe->pe_number,
> -				  OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
> +	/*
> +	 * Release from all parents PELT-V. NPUs don't have a PELTV
> +	 * table
> +	 */
> +	if (phb->type != PNV_PHB_NPU_NVLINK && phb->type !=
> PNV_PHB_NPU_OCAPI)
> +		pnv_ioda_unset_peltv(phb, pe, parent);
>  
> -	/* Disassociate PE in PELT */
> -	rc = opal_pci_set_peltv(phb->opal_id, pe->pe_number,
> -				pe->pe_number,
> OPAL_REMOVE_PE_FROM_DOMAIN);
> -	if (rc)
> -		pe_warn(pe, "OPAL error %lld remove self from PELTV\n",
> rc);
>  	rc = opal_pci_set_pe(phb->opal_id, pe->pe_number, pe->rid,
>  			     bcomp, dcomp, fcomp, OPAL_UNMAP_PE);
>  	if (rc)
> @@ -3540,6 +3556,8 @@ static void pnv_ioda_release_pe(struct
> pnv_ioda_pe *pe)
>  	case PNV_PHB_IODA2:
>  		pnv_pci_ioda2_release_pe_dma(pe);
>  		break;
> +	case PNV_PHB_NPU_OCAPI:
> +		break;
>  	default:
>  		WARN_ON(1);
>  	}
> @@ -3592,7 +3610,7 @@ static void pnv_pci_release_device(struct
> pci_dev *pdev)
>  	pe = &phb->ioda.pe_array[pdn->pe_number];
>  	pdn->pe_number = IODA_INVALID_PE;
>  
> -	WARN_ON(--pe->device_count < 0);
> +	WARN_ON((pe->flags != PNV_IODA_PE_DEV) && (--pe->device_count <
> 0));
>  	if (pe->device_count == 0)
>  		pnv_ioda_release_pe(pe);
>  }
> @@ -3641,6 +3659,7 @@ static const struct pci_controller_ops
> pnv_npu_ioda_controller_ops = {
>  
>  static const struct pci_controller_ops
> pnv_npu_ocapi_ioda_controller_ops = {
>  	.enable_device_hook	= pnv_ocapi_enable_device_hook,
> +	.release_device		= pnv_pci_release_device,
>  	.window_alignment	= pnv_pci_window_alignment,
>  	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
>  	.shutdown		= pnv_pci_ioda_shutdown,
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819


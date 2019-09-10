Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFBAE1D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 03:08:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S6P22YqzzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:08:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S6H56hQSzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 11:03:45 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A12UA8022678
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 21:03:42 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ux1hu8dyr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 21:03:42 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 02:03:39 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 02:03:36 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A13YRi30933026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 01:03:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55AB55205F;
 Tue, 10 Sep 2019 01:03:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B4C5F52051;
 Tue, 10 Sep 2019 01:03:33 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2B356A01D3;
 Tue, 10 Sep 2019 11:03:32 +1000 (AEST)
Subject: Re: [PATCH 10/11] pci/hotplug/pnv-php: Wrap warnings in macro
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 11:03:32 +1000
In-Reply-To: <20190909154600.19917-11-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-11-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091001-0012-0000-0000-0000034933CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091001-0013-0000-0000-0000218395A7
Message-Id: <77fb63f474e692e69e2c7e45aca31fd1c176f485.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100006
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
> An opencapi slot doesn't have an associated bridge device. It's not
> needed for operation, but any warning is displayed through pci_warn()
> which uses the pci_dev struct of the assocated bridge device. So wrap
> those warning so that a different trace mechanism can be used if it's
> an opencapi slot.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 51 +++++++++++++++++++------------
> ----
>  1 file changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c
> b/drivers/pci/hotplug/pnv_php.c
> index 5ca51d67db4b..d01a8595bc5c 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -18,6 +18,9 @@
>  #define DRIVER_AUTHOR	"Gavin Shan, IBM Corporation"
>  #define DRIVER_DESC	"PowerPC PowerNV PCI Hotplug Driver"
>  
> +#define SLOT_WARN(sl, x...) \
> +	((sl)->pdev ? pci_warn((sl)->pdev, x) : dev_warn(&(sl)->bus-
> >dev, x))
> +
>  struct pnv_php_event {
>  	bool			added;
>  	struct pnv_php_slot	*php_slot;
> @@ -265,7 +268,7 @@ static int pnv_php_add_devtree(struct
> pnv_php_slot *php_slot)
>  
>  	ret = pnv_pci_get_device_tree(php_slot->dn->phandle, fdt1,
> 0x10000);
>  	if (ret) {
> -		pci_warn(php_slot->pdev, "Error %d getting FDT blob\n",
> ret);
> +		SLOT_WARN(php_slot, "Error %d getting FDT blob\n",
> ret);
>  		goto free_fdt1;
>  	}
>  
> @@ -279,7 +282,7 @@ static int pnv_php_add_devtree(struct
> pnv_php_slot *php_slot)
>  	dt = of_fdt_unflatten_tree(fdt, php_slot->dn, NULL);
>  	if (!dt) {
>  		ret = -EINVAL;
> -		pci_warn(php_slot->pdev, "Cannot unflatten FDT\n");
> +		SLOT_WARN(php_slot, "Cannot unflatten FDT\n");
>  		goto free_fdt;
>  	}
>  
> @@ -289,15 +292,15 @@ static int pnv_php_add_devtree(struct
> pnv_php_slot *php_slot)
>  	ret = pnv_php_populate_changeset(&php_slot->ocs, php_slot->dn);
>  	if (ret) {
>  		pnv_php_reverse_nodes(php_slot->dn);
> -		pci_warn(php_slot->pdev, "Error %d populating
> changeset\n",
> -			 ret);
> +		SLOT_WARN(php_slot, "Error %d populating changeset\n",
> +			  ret);
>  		goto free_dt;
>  	}
>  
>  	php_slot->dn->child = NULL;
>  	ret = of_changeset_apply(&php_slot->ocs);
>  	if (ret) {
> -		pci_warn(php_slot->pdev, "Error %d applying
> changeset\n", ret);
> +		SLOT_WARN(php_slot, "Error %d applying changeset\n",
> ret);
>  		goto destroy_changeset;
>  	}
>  
> @@ -337,10 +340,10 @@ int pnv_php_set_slot_power_state(struct
> hotplug_slot *slot,
>  	if (ret > 0) {
>  		if (be64_to_cpu(msg.params[1]) != php_slot->dn->phandle
> 	||
>  		    be64_to_cpu(msg.params[2]) != state) {
> -			pci_warn(php_slot->pdev, "Wrong msg (%lld,
> %lld, %lld)\n",
> -				 be64_to_cpu(msg.params[1]),
> -				 be64_to_cpu(msg.params[2]),
> -				 be64_to_cpu(msg.params[3]));
> +			SLOT_WARN(php_slot, "Wrong msg (%lld, %lld,
> %lld)\n",
> +				  be64_to_cpu(msg.params[1]),
> +				  be64_to_cpu(msg.params[2]),
> +				  be64_to_cpu(msg.params[3]));
>  			return -ENOMSG;
>  		}
>  		if (be64_to_cpu(msg.params[3]) != OPAL_SUCCESS) {
> @@ -359,8 +362,8 @@ int pnv_php_set_slot_power_state(struct
> hotplug_slot *slot,
>  	return ret;
>  
>  error:
> -	pci_warn(php_slot->pdev, "Error %d powering %s\n",
> -		 ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on" :
> "off");
> +	SLOT_WARN(php_slot, "Error %d powering %s\n",
> +		  ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on" :
> "off");
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(pnv_php_set_slot_power_state);
> @@ -378,8 +381,8 @@ static int pnv_php_get_power_state(struct
> hotplug_slot *slot, u8 *state)
>  	 */
>  	ret = pnv_pci_get_power_state(php_slot->id, &power_state);
>  	if (ret) {
> -		pci_warn(php_slot->pdev, "Error %d getting power
> status\n",
> -			 ret);
> +		SLOT_WARN(php_slot, "Error %d getting power status\n",
> +			  ret);
>  	} else {
>  		*state = power_state;
>  	}
> @@ -402,7 +405,7 @@ static int pnv_php_get_adapter_state(struct
> hotplug_slot *slot, u8 *state)
>  		*state = presence;
>  		ret = 0;
>  	} else {
> -		pci_warn(php_slot->pdev, "Error %d getting presence\n",
> ret);
> +		SLOT_WARN(php_slot, "Error %d getting presence\n",
> ret);
>  	}
>  
>  	return ret;
> @@ -637,7 +640,7 @@ static int pnv_php_register_slot(struct
> pnv_php_slot *php_slot)
>  	ret = pci_hp_register(&php_slot->slot, php_slot->bus,
>  			      php_slot->slot_no, php_slot->name);
>  	if (ret) {
> -		pci_warn(php_slot->pdev, "Error %d registering slot\n",
> ret);
> +		SLOT_WARN(php_slot, "Error %d registering slot\n",
> ret);
>  		return ret;
>  	}
>  
> @@ -690,7 +693,7 @@ static int pnv_php_enable_msix(struct
> pnv_php_slot *php_slot)
>  	/* Enable MSIx */
>  	ret = pci_enable_msix_exact(pdev, &entry, 1);
>  	if (ret) {
> -		pci_warn(pdev, "Error %d enabling MSIx\n", ret);
> +		SLOT_WARN(php_slot, "Error %d enabling MSIx\n", ret);
>  		return ret;
>  	}
>  
> @@ -734,8 +737,9 @@ static irqreturn_t pnv_php_interrupt(int irq,
> void *data)
>  		   (sts & PCI_EXP_SLTSTA_PDC)) {
>  		ret = pnv_pci_get_presence_state(php_slot->id,
> &presence);
>  		if (ret) {
> -			pci_warn(pdev, "PCI slot [%s] error %d getting
> presence (0x%04x), to retry the operation.\n",
> -				 php_slot->name, ret, sts);
> +			SLOT_WARN(php_slot,
> +				  "PCI slot [%s] error %d getting
> presence (0x%04x), to retry the operation.\n",
> +				  php_slot->name, ret, sts);
>  			return IRQ_HANDLED;
>  		}
>  
> @@ -764,8 +768,9 @@ static irqreturn_t pnv_php_interrupt(int irq,
> void *data)
>  	 */
>  	event = kzalloc(sizeof(*event), GFP_ATOMIC);
>  	if (!event) {
> -		pci_warn(pdev, "PCI slot [%s] missed hotplug event
> 0x%04x\n",
> -			 php_slot->name, sts);
> +		SLOT_WARN(php_slot,
> +			  "PCI slot [%s] missed hotplug event
> 0x%04x\n",
> +			  php_slot->name, sts);
>  		return IRQ_HANDLED;
>  	}
>  
> @@ -789,7 +794,7 @@ static void pnv_php_init_irq(struct pnv_php_slot
> *php_slot, int irq)
>  	/* Allocate workqueue */
>  	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot-
> >name);
>  	if (!php_slot->wq) {
> -		pci_warn(pdev, "Cannot alloc workqueue\n");
> +		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
>  		pnv_php_disable_irq(php_slot, true);
>  		return;
>  	}
> @@ -813,7 +818,7 @@ static void pnv_php_init_irq(struct pnv_php_slot
> *php_slot, int irq)
>  			  php_slot->name, php_slot);
>  	if (ret) {
>  		pnv_php_disable_irq(php_slot, true);
> -		pci_warn(pdev, "Error %d enabling IRQ %d\n", ret, irq);
> +		SLOT_WARN(php_slot, "Error %d enabling IRQ %d\n", ret,
> irq);
>  		return;
>  	}
>  
> @@ -849,7 +854,7 @@ static void pnv_php_enable_irq(struct
> pnv_php_slot *php_slot)
>  
>  	ret = pci_enable_device(pdev);
>  	if (ret) {
> -		pci_warn(pdev, "Error %d enabling device\n", ret);
> +		SLOT_WARN(php_slot, "Error %d enabling device\n", ret);
>  		return;
>  	}
>  

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B32CBF73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:20:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmLjW1M4XzDr75
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 01:20:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DI7R9HAa; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmLf96f4MzDr5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 01:17:53 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2E3MuR037913; Wed, 2 Dec 2020 09:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VDnWuaYpm67Mz/peHaO8NVoktWlzPFJVb5hIFR1u2pE=;
 b=DI7R9HAaSG/eu8+kPcy2ixP6Tyh0uiwriQZPNDGR9fViORgqYuARIGKdF2TX6/BWif0X
 yqGjvQiR5BGUIHEwT6qsTdINopx2idpjnbuxQfPWZ+gazbQpSDJni7/Mr2NrhJv+9Lt5
 b/V9SpMLLIREllse5Qo4sdFgtGi/C13Q4guehHt252GCrFqz6jteSU/bQY8pynuMZMk3
 Bw07ve2jIQGtcpqL6u/ZmTpLaNTpsaK8V85QDia5WUnE+Rku7+jI/QMxk0AXLJ+YtjnX
 aY7q89PGjMILzq0Cre7CZdkRKTNOj/Pt0GUuvYueYhAXtTVL93dydBT1sdkC5G8JAQdh lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355y6d5a8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 09:17:41 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B2E3Qqb038249;
 Wed, 2 Dec 2020 09:17:41 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355y6d5a83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 09:17:41 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2E8fHn029717;
 Wed, 2 Dec 2020 14:17:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 354fpdb1wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 14:17:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2EHbGc7275238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 14:17:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46A754203F;
 Wed,  2 Dec 2020 14:17:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C68942047;
 Wed,  2 Dec 2020 14:17:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.84.146])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 14:17:37 +0000 (GMT)
Subject: Re: [PATCH kernel v3] powerpc/pci: Remove LSI mappings on device
 teardown
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20201202005222.5477-1-aik@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <917ccb07-8cc2-e0af-cd29-6f1d10fb2358@linux.ibm.com>
Date: Wed, 2 Dec 2020 15:17:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202005222.5477-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_06:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=25 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020085
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/12/2020 01:52, Alexey Kardashevskiy wrote:
> From: Oliver O'Halloran <oohall@gmail.com>
> 
> When a passthrough IO adapter is removed from a pseries machine using hash
> MMU and the XIVE interrupt mode, the POWER hypervisor expects the guest OS
> to clear all page table entries related to the adapter. If some are still
> present, the RTAS call which isolates the PCI slot returns error 9001
> "valid outstanding translations" and the removal of the IO adapter fails.
> This is because when the PHBs are scanned, Linux maps automatically the
> INTx interrupts in the Linux interrupt number space but these are never
> removed.
> 
> This problem can be fixed by adding the corresponding unmap operation when
> the device is removed. There's no pcibios_* hook for the remove case, but
> the same effect can be achieved using a bus notifier.
> 
> Because INTx are shared among PHBs (and potentially across the system),
> this adds tracking of virq to unmap them only when the last user is gone.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> [aik: added refcounter]
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


Looks ok to me.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


> Changes:
> v3:
> * free @vi on error path
> 
> v2:
> * added refcounter
> ---
>   arch/powerpc/kernel/pci-common.c | 82 ++++++++++++++++++++++++++++++--
>   1 file changed, 78 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index be108616a721..2b555997b295 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -353,6 +353,55 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>   	return NULL;
>   }
>   
> +struct pci_intx_virq {
> +	int virq;
> +	struct kref kref;
> +	struct list_head list_node;
> +};
> +
> +static LIST_HEAD(intx_list);
> +static DEFINE_MUTEX(intx_mutex);
> +
> +static void ppc_pci_intx_release(struct kref *kref)
> +{
> +	struct pci_intx_virq *vi = container_of(kref, struct pci_intx_virq, kref);
> +
> +	list_del(&vi->list_node);
> +	irq_dispose_mapping(vi->virq);
> +	kfree(vi);
> +}
> +
> +static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct pci_dev *pdev = to_pci_dev(data);
> +
> +	if (action == BUS_NOTIFY_DEL_DEVICE) {
> +		struct pci_intx_virq *vi;
> +
> +		mutex_lock(&intx_mutex);
> +		list_for_each_entry(vi, &intx_list, list_node) {
> +			if (vi->virq == pdev->irq) {
> +				kref_put(&vi->kref, ppc_pci_intx_release);
> +				break;
> +			}
> +		}
> +		mutex_unlock(&intx_mutex);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block ppc_pci_unmap_irq_notifier = {
> +	.notifier_call = ppc_pci_unmap_irq_line,
> +};
> +
> +static int ppc_pci_register_irq_notifier(void)
> +{
> +	return bus_register_notifier(&pci_bus_type, &ppc_pci_unmap_irq_notifier);
> +}
> +arch_initcall(ppc_pci_register_irq_notifier);
> +
>   /*
>    * Reads the interrupt pin to determine if interrupt is use by card.
>    * If the interrupt is used, then gets the interrupt line from the
> @@ -361,6 +410,12 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>   static int pci_read_irq_line(struct pci_dev *pci_dev)
>   {
>   	int virq;
> +	struct pci_intx_virq *vi, *vitmp;
> +
> +	/* Preallocate vi as rewind is complex if this fails after mapping */
> +	vi = kzalloc(sizeof(struct pci_intx_virq), GFP_KERNEL);
> +	if (!vi)
> +		return -1;
>   
>   	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
>   
> @@ -377,12 +432,12 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>   		 * function.
>   		 */
>   		if (pci_read_config_byte(pci_dev, PCI_INTERRUPT_PIN, &pin))
> -			return -1;
> +			goto error_exit;
>   		if (pin == 0)
> -			return -1;
> +			goto error_exit;
>   		if (pci_read_config_byte(pci_dev, PCI_INTERRUPT_LINE, &line) ||
>   		    line == 0xff || line == 0) {
> -			return -1;
> +			goto error_exit;
>   		}
>   		pr_debug(" No map ! Using line %d (pin %d) from PCI config\n",
>   			 line, pin);
> @@ -394,14 +449,33 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>   
>   	if (!virq) {
>   		pr_debug(" Failed to map !\n");
> -		return -1;
> +		goto error_exit;
>   	}
>   
>   	pr_debug(" Mapped to linux irq %d\n", virq);
>   
>   	pci_dev->irq = virq;
>   
> +	mutex_lock(&intx_mutex);
> +	list_for_each_entry(vitmp, &intx_list, list_node) {
> +		if (vitmp->virq == virq) {
> +			kref_get(&vitmp->kref);
> +			kfree(vi);
> +			vi = NULL;
> +			break;
> +		}
> +	}
> +	if (vi) {
> +		vi->virq = virq;
> +		kref_init(&vi->kref);
> +		list_add_tail(&vi->list_node, &intx_list);
> +	}
> +	mutex_unlock(&intx_mutex);
> +
>   	return 0;
> +error_exit:
> +	kfree(vi);
> +	return -1;
>   }
>   
>   /*
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7752C9E5C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 10:51:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clcn64q0YzDqwy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 20:51:22 +1100 (AEDT)
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
 header.s=pp1 header.b=RItunUaQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClclC54cYzDqkj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 20:49:43 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B19WQCc094948; Tue, 1 Dec 2020 04:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tkI5kPWtpwnQjXJpjarPDXvCXTlUEpf8aYZ386KM2uk=;
 b=RItunUaQPxGNH52pI+LjY2zlIBV0dNfE3Lm/zLBWmc2TO8QcCXUF1YN7wv2Csex4QjQe
 9cReDMF/IyNjFgfcaxeb1dY7T3ee1819ehcpPieKbJyZ/9u/byn8NA3JRqsNPAdXcAV5
 7/ejaeRRL214hqEucKpXMCe0FghCUwsW5K98NXpYyfRRzCcGxpUHU/VLr1CmnMVvE4ED
 S+iRx+ewdUqioe2kLWgBdP5F/YXCbrOx0giC7bzhW/ArcbrWqwiToQhgizM5WhieA1Sg
 TgmQBlz7P3ySsPbSxBJk7x31KfYO4I/vVSNx3KoIagkpOafVpg2oNmWSFZL1GUnrI5dv 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355a79phwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 04:49:38 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B19aeV9114638;
 Tue, 1 Dec 2020 04:49:38 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355a79phve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 04:49:37 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B19nVHD028391;
 Tue, 1 Dec 2020 09:49:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 353dth9htg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 09:49:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B19nXpI53084504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 09:49:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BC474C046;
 Tue,  1 Dec 2020 09:49:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4210C4C040;
 Tue,  1 Dec 2020 09:49:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.180.21])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 09:49:33 +0000 (GMT)
Subject: Re: [PATCH kernel v2] powerpc/pci: Remove LSI mappings on device
 teardown
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20201201073919.5600-1-aik@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <8bdea1c0-4b2f-e716-4df3-5eb95667144b@linux.ibm.com>
Date: Tue, 1 Dec 2020 10:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201073919.5600-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_01:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=25
 impostorscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010061
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



On 01/12/2020 08:39, Alexey Kardashevskiy wrote:
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
> 
> 
> Doing this in the generic irq code is just too much for my small brain :-/
> 
> 
> ---
>   arch/powerpc/kernel/pci-common.c | 71 ++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index be108616a721..0acf17f17253 100644
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


Seems ok to me as the failure is unexpected.
But then we need to free that memory on all the error paths below.

   Fred




> +	vi = kzalloc(sizeof(struct pci_intx_virq), GFP_KERNEL);
> +	if (!vi)
> +		return -1;
>   
>   	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
>   
> @@ -401,6 +456,22 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
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
>   }
>   
> 

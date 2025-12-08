Return-Path: <linuxppc-dev+bounces-14684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA5CAD092
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 13:04:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ0yY4Rj9z2yRm;
	Mon, 08 Dec 2025 23:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765195461;
	cv=none; b=TXYkP9nyfXrcgC04QEyukFtNm4wZY5oG5WRV/stwTpV8sN744WEWYknLblNYMviUF7PT4yD7Gfl2EF0vzbCaBAwGkkJ+P4g+3kbcF7QcpAcrux0iD5VfRpevPklHGWGEWRwKyf6qXZ7O3aI6PNBs0IAUJHje2qaOxtckands9EEN96diPBEU7YzI3dGaviFd4aJm4eEh9yY8XMXZD8CJHfJgQWV8aTWIU/U7g4eMtyOoWoy+nkcU8bTYw2H3zRT2Jg12NGF9HoH2eUHy9dxc/XUYSaY9P7UH0UPx5sYZmp0DtjHnAoYtioqa147BxNY19fVYR8BE7Z/fhnzmcPcR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765195461; c=relaxed/relaxed;
	bh=CoidJu2EhvRlkwjaI7PHpsehWNHfCR2sn4rI4xnDmGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bnt5woA1pN7bDDg2BmrjkWoGRSHadgRuykXSHp7S0oj5fSd5wrya/YeLXP+pDDwKzyD1qwGMIWmvkbmiOvBDx43SsvdxZsVf6cVEa3jD8/eCLmHSpGCDiMzTUrcr9Te+F7rnabQ7Kf5FKXFk+n/T3jCG8fo7lSQi4dnDDzQypNuq207jMer4jpgEYQECdNS5Z88YpxaquBO8IcZsbNS9yNMF2RZByxzwB23HQQmkrhfVM/m/WvLfDIHdBPDgQ6mWfNTriUFIN053ERLg+LnxdRq+mOSD64KlTcxN0f8KvITtOVxUJrywZX+NQeJezZqYcreT5U6xExEk+cuUecIRRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GMxj1IWW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GMxj1IWW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ0yX2Srqz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 23:04:19 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B87M1J9002462;
	Mon, 8 Dec 2025 12:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CoidJu
	2EhvRlkwjaI7PHpsehWNHfCR2sn4rI4xnDmGA=; b=GMxj1IWW1YPAWtjZTwD1qt
	VksAIVArCpYpv7WLCUGW9NjPE5L14aOXHcVkSKbEZ9MgWG9kG0g9+eYy6NgfF42q
	7nowOHMfjXAJIbAnxjncsY3vhe7OfCe5UMncNiWTvrg8u1TKFXiat3Ms2QjwNZDr
	Drik8leNJLcTso+/2FO+P3E0Liv6VsyqkZOBvzbjAPRbwEVQRcH+rhI+Lpt199gx
	whBUTU+erfoe4/nTMXpO6jAO6pT+xJZDcX8/3VgdImQ0vU6ZcBa1L1xlTahlH9tt
	xZvnrWBILzSHUyvOpLVa/CtLNtK0EWcet7flVGBhJ/UZhzJfHivXtQNezI1574ew
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc617k5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 12:03:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B8Bx4AR011734;
	Mon, 8 Dec 2025 12:03:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc617k56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 12:03:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B88gm4M026836;
	Mon, 8 Dec 2025 12:03:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw1h0w49u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 12:03:53 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B8C3qjO28115676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 12:03:52 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 445DE5805F;
	Mon,  8 Dec 2025 12:03:52 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D70A5805D;
	Mon,  8 Dec 2025 12:03:47 +0000 (GMT)
Received: from [9.111.12.154] (unknown [9.111.12.154])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 12:03:47 +0000 (GMT)
Message-ID: <d142f044-a560-4b59-8dd8-5568d5b9d21f@linux.ibm.com>
Date: Mon, 8 Dec 2025 17:33:45 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] powerpc: per device MSI irq domain
To: Nam Cao <namcao@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
        maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
References: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
 <87qztawmiv.fsf@yellow.woof>
 <f82d1224-509f-446c-8dee-13e28429b52b@linux.ibm.com>
 <87jyyzisjj.fsf@yellow.woof>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <87jyyzisjj.fsf@yellow.woof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX61lzKONr8L8F
 nzbxymAX1RGhmbjFkxXy9PXTyx4GxXBG8GJkqYBnqw4WU1SCy0/ifPjKylrUhIIiIoMrLNqSBS8
 4MMRL+/Bsvdt3eW126ZUSxf5IPPCwqE4dDbAo+XGJtXJovF+rkAJzvna/83J6NEp6GHOYRVVXlq
 Um4QDRDoZ6V3t/mFPcjbZEsoAMkVySfGTiZMbE6Bo34TO9+CJQkbNCcUu6vHgIMSas8L/vSYwVT
 G/eHmf972pXoG0Qv4skUDpJN4roDxWkC7FyF+stLDc6SSKMeF5PtF0tvuWWJmgr3VINICuDE2zB
 vSgBMVQ1+kL/0HoLorYP2I62Naxnu7Om8o5LzhQDFIUcWd0wd/3tnHAxN3UE0uHRl/nYODAVbIi
 tzd2k9TSj1PR6I7rw6994J3dO2wrUQ==
X-Proofpoint-GUID: mryY5zkz90Bo9rKz5B6O8YJNo0EYrllN
X-Proofpoint-ORIG-GUID: _OPcE70Abm_vWWH6I8Ls5wdhySfyXFKB
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=6936beab cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zBSMDy8UAAAA:20 a=VnNF1IyMAAAA:8 a=xQyKCaC3UOGe2k87NGwA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/6/25 8:08 PM, Nam Cao wrote:
> Nilay Shroff <nilay@linux.ibm.com> writes:
>> Yes you can find the architecture document here: 
>> https://github.com/linuxppc/public-docs/blob/main/LoPAPR/LoPAR-20200812.pdf
>>
>> You may refer section 7 in the above document, which describes RTAS API.
> 
> Thank you, that helped a lot.
> 
> Can you please confirm that the below diff fixes the problem? It brings
> back the "fallback" thing that you mentioned.
> 
> Best regards,
> Nam
> 
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a82aaa786e9e..8898a968a59b 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -19,6 +19,11 @@
>  
>  #include "pseries.h"
>  
> +struct pseries_msi_device {
> +	unsigned int msi_quota;
> +	unsigned int msi_used;
> +};
> +
>  static int query_token, change_token;
>  
>  #define RTAS_QUERY_FN		0
> @@ -433,8 +438,26 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
>  	struct msi_domain_info *info = domain->host_data;
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	int type = (info->flags & MSI_FLAG_PCI_MSIX) ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
> +	int ret;
> +
> +	struct pseries_msi_device *pseries_dev __free(kfree)
> +		= kmalloc(sizeof(*pseries_dev), GFP_KERNEL);
> +	if (!pseries_dev)
> +		return -ENOMEM;
> +
> +	ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
> +	if (ret > 0) {
> +		nvec = ret;
> +		ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
> +	}
> +	if (ret < 0)
> +		return ret;
>  
> -	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
> +	pseries_dev->msi_quota = nvec;
> +	pseries_dev->msi_used = 0;
> +
> +	arg->scratchpad[0].ptr = no_free_ptr(pseries_dev);
> +	return 0;
>  }
>  
>  /*
> @@ -443,9 +466,13 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
>   */
>  static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
>  {
> +	struct pseries_msi_device *pseries_dev = arg->scratchpad[0].ptr;
>  	struct pci_dev *pdev = to_pci_dev(domain->dev);
>  
>  	rtas_disable_msi(pdev);
> +
> +	WARN_ON(pseries_dev->msi_used);
> +	kfree(pseries_dev);
>  }
>  
>  static void pseries_msi_shutdown(struct irq_data *d)
> @@ -546,12 +573,18 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>  				    unsigned int nr_irqs, void *arg)
>  {
>  	struct pci_controller *phb = domain->host_data;
> +	struct pseries_msi_device *pseries_dev;
>  	msi_alloc_info_t *info = arg;
>  	struct msi_desc *desc = info->desc;
>  	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
>  	int hwirq;
>  	int i, ret;
>  
> +	pseries_dev = info->scratchpad[0].ptr;
> +
> +	if (pseries_dev->msi_used + nr_irqs > pseries_dev->msi_quota)
> +		return -ENOSPC;
> +
>  	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_index);
>  	if (hwirq < 0) {
>  		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
> @@ -567,9 +600,10 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>  			goto out;
>  
>  		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> -					      &pseries_msi_irq_chip, domain->host_data);
> +					      &pseries_msi_irq_chip, pseries_dev);
>  	}
>  
> +	pseries_dev->msi_used++;
>  	return 0;
>  
>  out:
> @@ -582,9 +616,11 @@ static void pseries_irq_domain_free(struct irq_domain *domain, unsigned int virq
>  				    unsigned int nr_irqs)
>  {
>  	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> -	struct pci_controller *phb = irq_data_get_irq_chip_data(d);
> +	struct pseries_msi_device *pseries_dev = irq_data_get_irq_chip_data(d);
> +	struct pci_controller *phb = domain->host_data;
>  
>  	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
> +	pseries_dev->msi_used -= nr_irqs;
>  	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>  }
>  

Thnaks for the patch! I tested it on my system and I confirmed that
this patch fixes the bug reported earlier. That said, if you're
planning to send a formal patch upstream with the above change then
please feel free to add,

Acked-by: Nilay Shroff <nilay@inux.ibm.com>


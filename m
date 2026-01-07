Return-Path: <linuxppc-dev+bounces-15385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8ACFE468
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 15:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmVhM01Y2z2yFh;
	Thu, 08 Jan 2026 01:26:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767795970;
	cv=none; b=JQiqtXoOB9/nyUsMyYhLgMnYmxkyArMQFdxfTncvFmUzQnZ0wCXa8D8fe0O4sZStEWbvstGZMygWZGYYh7cxQ/XWy2eNJP1AvjAAbKGPmaLf6eKPBwLvWtmuixXeqAJa0ZFRjIFOBgTOr5TA9+nrOb6wJW22a/RP/5XUpQ+p5Y8v4iXxEWRo8U6sCGjghRfFA1zviIiAgEG6rA+pvrq2evPzMA/3EiPDYYWpOLsv+dZmegdgJmpWdk16wJEBlsX6LD1C6e9eDJmetLH74uymGZXcrmNDc5dizz4//UwwulJaeDvTOKT2Qds6p+QsmNji9WILRapRAfbPCBlMvbpYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767795970; c=relaxed/relaxed;
	bh=JWyHqh0cbDpqwkYQwJwz2YOUGHQ98e9j1ks+F+GVVmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRDbX2BC1QpTzaSORp/w2/1lFW3gbgHlANEE0zLRToyHpUV1Fo60S8TIcUdgaClfvVBJB2l3C3XjsimAbgQKyNITjHCFl2xA89MGMNrOpWob1B/97AxChrZQlHd7gXgVYDlOU8c9xQao3dExo6Ml/vfPGdIV3VBvbntdSeEHBX8xKmkcWLeiU9aLxvLxQfIAAhNiCmKB/mc4JyPnvqRpLl21kh3e2NFH34IjE/5tt0/BMtRJmsreUOTrYC/kxrQTeERT8zDqs1sJugwCZmjWqj6ZY4ha8F57VoqGIqxbCRhQIq2xn9LIgSUAGyiB0NI7U1mQ7UTgM/1MWP2PKKROQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxiffGlr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OxiffGlr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmVhD3r40z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 01:26:04 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 607EKEbd016642;
	Wed, 7 Jan 2026 14:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JWyHqh
	0cbDpqwkYQwJwz2YOUGHQ98e9j1ks+F+GVVmM=; b=OxiffGlr0ulcQeNaRhIB5I
	KJevXDrykTyGvGb8oh7u3TMqxrO8wSojZkzOeLZwQp3qy8P/icyzmxIGairK6aHT
	DKULFawFfxSAypdsubTAYNreOnoxaeUqG+e8ESzSrtB0wdQ7tNntotOx1/CBcFOR
	inlziGFIy/VairHPQE7pqCJ/TlN5v7rg/AYfEVpfLuJkxZtEnCyzFBJJMIE23IX2
	+1RvEifLn1nAerEzfl5c30QHDTb2FpED7VHsz6QIMWDVARD0an9dHluO4g01LfDb
	JnmyPZjXAGKhNVjP1xBx7H7DawQZnMsSZIoWtAHYsoRnbuP5s5HbU66JiTHE03Bg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk8fb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 14:25:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 607EBFoh011138;
	Wed, 7 Jan 2026 14:25:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk8fb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 14:25:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 607C09WP005264;
	Wed, 7 Jan 2026 14:25:45 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfexk9e1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 14:25:45 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 607EPhDD30081540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 14:25:43 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 710FD58043;
	Wed,  7 Jan 2026 14:25:43 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02CE058053;
	Wed,  7 Jan 2026 14:25:38 +0000 (GMT)
Received: from [9.111.20.18] (unknown [9.111.20.18])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 14:25:37 +0000 (GMT)
Message-ID: <1fda7021-ec31-40ed-bfd8-e0e9b657662f@linux.ibm.com>
Date: Wed, 7 Jan 2026 19:55:35 +0530
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
Subject: Re: [PATCH v2] powerpc/pseries: Fix MSI-X allocation failure when
 quota is exceeded
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thomas Gleixner <tglx@linutronix.de>, maz@kernel.org,
        gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260107100230.1466093-1-namcao@linutronix.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20260107100230.1466093-1-namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=695e6cea cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=zwuvnbuwBpirbEp69l4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: r-9MBfHGL3XoHCVF5R9Qs5_jkm7TC-BC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDExMCBTYWx0ZWRfXztqz+xZmX+/C
 D+TIHiCmy25+0M4v9ObRPDf15giyJ4ZxQxF2Lo/xWzRf2HoUV2So33ToOIUiop3pHbks+hJM44R
 4eNRNvUURtR67HSFCXcLHNvOC8GoB/liLxWcKV8tc3c09bkoDuJXSLuCfYEzuO2zufl9fzL20xU
 W2S12lOrQppMrKq1ah44xPu6wNOatqeq7pnWltYwjm7OFPsTVLXx/K5vVkRiilLir+lzuI8ZRJm
 d3kYWHZMIhnCFM0lR1H2AdCG96s2XAgfGJQa9Pwgauzf1vNhiNXxu2QbGkZ6U1KBnrZU2e22VGz
 WXp4B80vFsK0P97FzZYpsTYWKYeF6/pjFWzWO6AUms2zG+p8T/19gEEVsAbPMqJ7Ca496vgovMA
 pUEn8mZa8JLtYtG6ArS92OP0BrnY9G92ADQgXPKQ+oiduCK0Mq7/iB5m54ylIDtZEYsimjhGNFI
 plbWtpo7u98dS1TCVKA==
X-Proofpoint-GUID: ZiQACeOSl4pDbMqbBy8nv-oApTDhYEly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070110
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 1/7/26 3:32 PM, Nam Cao wrote:
> Nilay reported that since commit daaa574aba6f ("powerpc/pseries/msi: Switch
> to msi_create_parent_irq_domain()"), the NVMe driver cannot enable MSI-X
> when the device's MSI-X table size is larger than the firmware's MSI quota
> for the device.
> 
> This is because the commit changes how rtas_prepare_msi_irqs() is called:
> 
>   - Before, it is called when interrupts are allocated at the global
>     interrupt domain with nvec_in being the number of allocated interrupts.
>     rtas_prepare_msi_irqs() can return a positive number and the allocation
>     will be retried.
> 
>   - Now, it is called at the creation of per-device interrupt domain with
>     nvec_in being the number of interrupts that the device supports. If
>     rtas_prepare_msi_irqs() returns positive, domain creation just fails.
> 
> For Nilay's NVMe driver case, rtas_prepare_msi_irqs() returns a positive
> number (the quota). This causes per-device interrupt domain creation to
> fail and thus the NVMe driver cannot enable MSI-X.
> 
> Rework to make this scenario works again:
> 
>   - pseries_msi_ops_prepare() only prepares as many interrupts as the quota
>     permit.
> 
>   - pseries_irq_domain_alloc() fails if the device's quota is exceeded.
> 
> Now, if the quota is exceeded, pseries_msi_ops_prepare() will only prepare
> as allowed by the quota. If device drivers attempt to allocate more
> interrupts than the quota permits, pseries_irq_domain_alloc() will return
> an error code and msi_handle_pci_fail() will allow device drivers a retry.
> 
> Reported-by: Nilay Shroff <nilay@linux.ibm.com>
> Closes: https://lore.kernel.org/linuxppc-dev/6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com/
> Fixes: daaa574aba6f ("powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Acked-by: Nilay Shroff <nilay@linux.ibm.com>
> Cc: stable@vger.kernel.org
> ---
> v2:
>   - change pseries_msi_ops_prepare()'s allocation logic to match the
>     original logic in __pci_enable_msix_range()
> 
>   - fix up Nilay's email address
> ---
>  arch/powerpc/platforms/pseries/msi.c | 44 ++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a82aaa786e9e..edc30cda5dbc 100644
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
> @@ -433,8 +438,28 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
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
> +	while (1) {
> +		ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
> +		if (!ret)
> +			break;
> +		else if (ret > 0)
> +			nvec = ret;
> +		else
> +			return ret;
> +	}
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
> @@ -443,9 +468,13 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
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
> @@ -546,12 +575,18 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
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
> @@ -567,9 +602,10 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
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
> @@ -582,9 +618,11 @@ static void pseries_irq_domain_free(struct irq_domain *domain, unsigned int virq
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

I just tested this change on my system using the latest mainline kernel and it works
well for me. So with that, please fell free to add,

Tested-by: Nilay Shroff <nilay@linux.ibm.com>



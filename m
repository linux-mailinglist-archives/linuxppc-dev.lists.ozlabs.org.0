Return-Path: <linuxppc-dev+bounces-15338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59753CF90E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 16:27:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlw5V4YQwz2y7c;
	Wed, 07 Jan 2026 02:27:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767713246;
	cv=none; b=m4mOvsA2fEMHCISmgupeuuFpyx1/tH8j7VxepKdb5jsQz6XOer2Oh6HO2DatCz09XR3GAs1E5MUbsMJEHsVn0FY1E+d1hectmur+rhJgiNb3QKX4Og3HDrOPiTL3A51yd4p7yCc1iveI4u6KIXcSw1DCijzSxDe+fAOSTBUL5BpIk0Sdyse5fHC/tASO2zphA0ewQSQ1/hqjUZAsNIIqv4WQFlmS8n8TyG9OVGIJ3B1UCGoEX/xfssur995v5PPtUMAbCyMURHkUr2U7+VGR5P52Xo0kuqQJTJO4cxz3ofgow8Vp38hJfmpZHJjupr3o/1PoLee2wpfGZVEHEzPi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767713246; c=relaxed/relaxed;
	bh=R3g1xdqsIydOVlsHzRFif8qmfkih+keWqJLyycvi8Go=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VIiAtOflZiUtsrKlp/IkrdC3GzJ7e+HQktMxdS3TFalMbBt3cSnL5ZFy/cI72jVbirijbePvI5FNV43wMFwowR3LoYgrr2rYoWK09oPQQrj/YadQrO4PTi+tQInofHXbzQPY0+ggP8+nK+9QcFzwv258Ym7Xb8OjiHSGI4DtVUMbH3I37qrWso2g3ohhOs0sDJyTy64kQvX6h+aPJlF08Otgvoyvfj1fgL6TA429HB4SKmcbhg+yrW/+GiaOZNskFLBFdVsYqGzzydzYbsBc5llWZY3kAy0dgObYVXuPFnt1XT+KuH2CSKKBijJq4hMsxuljNwgUos8lHYigxr0dSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R9v2x7ws; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R9v2x7ws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlw5T3dNKz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 02:27:25 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606EGmkn022322;
	Tue, 6 Jan 2026 15:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R3g1xd
	qsIydOVlsHzRFif8qmfkih+keWqJLyycvi8Go=; b=R9v2x7wsqVOdvLw6M7BwEM
	//YttWBi078+fVSanTSVyExh1aXqULPlpRf/OdpIX1p8xcToQtIlKRkb4OSeBrSv
	q8issTKG4UXPILbe1gKThNBgbk6Q/VDXQj8vXweOGsAVHSsg7JV//lVAKCbIKkyu
	TunDVuzWANEVXM3hyornt5G6ve8/6SvFf+8un+hMkEubF848K3f/2kU+rVJIEQ8l
	shaKAeV4PgGM2oVfzgL2zDQJ8cEfw4IOE29IYL7XHoiU/mhC01COxWpcIbFKWUDU
	CCgVUmCcWQGeSsyGsPyg4I52eCL2bX787bRq5MFmdEXtF+Fvta0ApVBpNQ05CqFg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk3x5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:27:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 606FR9Na008086;
	Tue, 6 Jan 2026 15:27:09 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4berhk3x5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:27:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 606DjbnK012590;
	Tue, 6 Jan 2026 15:27:08 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bffnjbvjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:27:08 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 606FR6RR14352938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 15:27:07 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC92458065;
	Tue,  6 Jan 2026 15:27:06 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61B715805D;
	Tue,  6 Jan 2026 15:27:02 +0000 (GMT)
Received: from [9.111.89.66] (unknown [9.111.89.66])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jan 2026 15:27:01 +0000 (GMT)
Message-ID: <c0718b2d-a4dc-4945-a372-4b0344ef5e29@linux.ibm.com>
Date: Tue, 6 Jan 2026 20:57:00 +0530
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
From: Nilay Shroff <nilay@linux.ibm.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
        maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
References: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
 <87qztawmiv.fsf@yellow.woof>
 <f82d1224-509f-446c-8dee-13e28429b52b@linux.ibm.com>
 <87jyyzisjj.fsf@yellow.woof>
 <d142f044-a560-4b59-8dd8-5568d5b9d21f@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <d142f044-a560-4b59-8dd8-5568d5b9d21f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=695d29ce cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zBSMDy8UAAAA:20 a=VnNF1IyMAAAA:8 a=y8B_DGwhVr09_50C0i0A:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: T-he1FnJzzqg4phReKg4bzM3STccA1xO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzMyBTYWx0ZWRfX8oy90sD77top
 bpYz3SSh7aBAg7m6speZoxDe+hx9KVUpd5+QOZA02d9hdpunnBaUfX1Uwy4Gm3To7VGWSNXcR53
 SmsZti9WMkjQkvpttVLVgecZlLJjkZh/+l3b5NJvf5JzjDYW/kxkpNV/i2raHZdxZnwwP7Kd4S4
 tFnVwHdDCpm/WUQhyW4ePmQR6gAD7Sq9WZbTe+kRs/NKw9FxsDbYrnfu+XRSQlg1mJEfGBRfUSX
 3ixzNK+KLNX6ryc0Cvm7zKv9CwXVxnJOT6QXLF3XTtvtK5GFzB0pZ9vzNaKPx+RZwKIYa3Q5fm1
 W4cTJclYOiUdsq96A2elsx0+8mQlKWgQaphLzEs88IkvaaYPzuH3heFhvFbMm14NivI6Rr6vkBL
 vp6HzRXg+85BTEQ/bwOtNsg+s4Uy04jjZWUi0iRphWyQSNhy5quc9m9yE+qHV8BfTxTddVYpqv4
 s2YlVj7FzJXOd6xW8Gg==
X-Proofpoint-GUID: 95H2nWNGk-xWNoArZlOYRH4Wg05f9LEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060133
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Nam,

A gentle ping on this one...

I just rebased to the latest kernel and found that this patch is not 
yet made to the upstream. So may I ask you to submit this change now 
formally to the upstream?

Thanks,
--Nilay

On 12/8/25 5:33 PM, Nilay Shroff wrote:
> 
> 
> On 12/6/25 8:08 PM, Nam Cao wrote:
>> Nilay Shroff <nilay@linux.ibm.com> writes:
>>> Yes you can find the architecture document here: 
>>> https://github.com/linuxppc/public-docs/blob/main/LoPAPR/LoPAR-20200812.pdf
>>>
>>> You may refer section 7 in the above document, which describes RTAS API.
>>
>> Thank you, that helped a lot.
>>
>> Can you please confirm that the below diff fixes the problem? It brings
>> back the "fallback" thing that you mentioned.
>>
>> Best regards,
>> Nam
>>
>> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
>> index a82aaa786e9e..8898a968a59b 100644
>> --- a/arch/powerpc/platforms/pseries/msi.c
>> +++ b/arch/powerpc/platforms/pseries/msi.c
>> @@ -19,6 +19,11 @@
>>  
>>  #include "pseries.h"
>>  
>> +struct pseries_msi_device {
>> +	unsigned int msi_quota;
>> +	unsigned int msi_used;
>> +};
>> +
>>  static int query_token, change_token;
>>  
>>  #define RTAS_QUERY_FN		0
>> @@ -433,8 +438,26 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
>>  	struct msi_domain_info *info = domain->host_data;
>>  	struct pci_dev *pdev = to_pci_dev(dev);
>>  	int type = (info->flags & MSI_FLAG_PCI_MSIX) ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
>> +	int ret;
>> +
>> +	struct pseries_msi_device *pseries_dev __free(kfree)
>> +		= kmalloc(sizeof(*pseries_dev), GFP_KERNEL);
>> +	if (!pseries_dev)
>> +		return -ENOMEM;
>> +
>> +	ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
>> +	if (ret > 0) {
>> +		nvec = ret;
>> +		ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
>> +	}
>> +	if (ret < 0)
>> +		return ret;
>>  
>> -	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
>> +	pseries_dev->msi_quota = nvec;
>> +	pseries_dev->msi_used = 0;
>> +
>> +	arg->scratchpad[0].ptr = no_free_ptr(pseries_dev);
>> +	return 0;
>>  }
>>  
>>  /*
>> @@ -443,9 +466,13 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
>>   */
>>  static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
>>  {
>> +	struct pseries_msi_device *pseries_dev = arg->scratchpad[0].ptr;
>>  	struct pci_dev *pdev = to_pci_dev(domain->dev);
>>  
>>  	rtas_disable_msi(pdev);
>> +
>> +	WARN_ON(pseries_dev->msi_used);
>> +	kfree(pseries_dev);
>>  }
>>  
>>  static void pseries_msi_shutdown(struct irq_data *d)
>> @@ -546,12 +573,18 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>>  				    unsigned int nr_irqs, void *arg)
>>  {
>>  	struct pci_controller *phb = domain->host_data;
>> +	struct pseries_msi_device *pseries_dev;
>>  	msi_alloc_info_t *info = arg;
>>  	struct msi_desc *desc = info->desc;
>>  	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
>>  	int hwirq;
>>  	int i, ret;
>>  
>> +	pseries_dev = info->scratchpad[0].ptr;
>> +
>> +	if (pseries_dev->msi_used + nr_irqs > pseries_dev->msi_quota)
>> +		return -ENOSPC;
>> +
>>  	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_index);
>>  	if (hwirq < 0) {
>>  		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
>> @@ -567,9 +600,10 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>>  			goto out;
>>  
>>  		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
>> -					      &pseries_msi_irq_chip, domain->host_data);
>> +					      &pseries_msi_irq_chip, pseries_dev);
>>  	}
>>  
>> +	pseries_dev->msi_used++;
>>  	return 0;
>>  
>>  out:
>> @@ -582,9 +616,11 @@ static void pseries_irq_domain_free(struct irq_domain *domain, unsigned int virq
>>  				    unsigned int nr_irqs)
>>  {
>>  	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>> -	struct pci_controller *phb = irq_data_get_irq_chip_data(d);
>> +	struct pseries_msi_device *pseries_dev = irq_data_get_irq_chip_data(d);
>> +	struct pci_controller *phb = domain->host_data;
>>  
>>  	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
>> +	pseries_dev->msi_used -= nr_irqs;
>>  	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>>  }
>>  
> 
> Thnaks for the patch! I tested it on my system and I confirmed that
> this patch fixes the bug reported earlier. That said, if you're
> planning to send a formal patch upstream with the above change then
> please feel free to add,
> 
> Acked-by: Nilay Shroff <nilay@inux.ibm.com>





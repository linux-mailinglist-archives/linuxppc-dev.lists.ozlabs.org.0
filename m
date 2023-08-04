Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C577704E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 17:36:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cq9UvFLM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHVF820htz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 01:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cq9UvFLM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHVD90Gg0z2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 01:35:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 374FWwrf013079;
	Fri, 4 Aug 2023 15:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pbIVn2CezDbmgGmfk7WYJ+jwIKMrow+ePBjLJ5CTgPg=;
 b=Cq9UvFLMd6C1mH+FoTGZRqcgS8YumKuKScJdsY12qkPGqAM7lfO2QZ1nV99MWtXKP6gM
 0yaKmSjYOBbUy9NEsaX+CSuWSerJAEI/Pu808w7MlwRcdTXP5urk8ehEGwXsfsqn9++l
 PqASV6jWN6Jvt39Qr+fvkzo74q6b/ME4FrGhA9wHlm4Jfb+G+6pYM6kGdv3ha0IYNd4c
 UIiJpS5MfIqTqcvQeCPOauYE7Ab71+BbKhRasSBPCIHXvf1qajWPPb1bnbZTstj2VqG8
 62ZAmyhf6xjRGGj3n/6we5vaPJVkBIsZHQyIM72tCir9XRUqNmpDq2jF7uJ82BfvCuTe Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s942r836j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 15:35:25 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 374FXs6o015959;
	Fri, 4 Aug 2023 15:35:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s942r835w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 15:35:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 374E1Nb7022076;
	Fri, 4 Aug 2023 15:35:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s8kp2xvhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 15:35:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 374FZM9B44696016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Aug 2023 15:35:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B11420043;
	Fri,  4 Aug 2023 15:35:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1205020040;
	Fri,  4 Aug 2023 15:35:22 +0000 (GMT)
Received: from [9.171.3.214] (unknown [9.171.3.214])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  4 Aug 2023 15:35:21 +0000 (GMT)
Message-ID: <27662531-2970-d706-3254-908dc44a4852@linux.ibm.com>
Date: Fri, 4 Aug 2023 17:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] powerpc/powernv/pci: use pci_dev_id() to simplify the
 code
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, joel@jms.id.au
References: <20230804080435.191196-1-wangxiongfeng2@huawei.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20230804080435.191196-1-wangxiongfeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pHMcFTHgGAI3Js7_bW34jS71sMBactRQ
X-Proofpoint-ORIG-GUID: KsmUAOtGzRx6ti25ZSCpobSH8Ztu5p3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_15,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308040139
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
Cc: linuxppc-dev@lists.ozlabs.org, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/08/2023 10:04, Xiongfeng Wang wrote:
> PCI core API pci_dev_id() can be used to get the BDF number for a pci
> device. We don't need to compose it mannually. Use pci_dev_id() to
> simplify the code a little bit.
> 
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> ---

LGTM
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred

>   arch/powerpc/platforms/powernv/pci-ioda.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index cb637827bc58..28fac4770073 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -997,14 +997,14 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
>   	struct pnv_ioda_pe *pe;
>   
>   	/* Check if the BDFN for this device is associated with a PE yet */
> -	pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
> +	pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
>   	if (!pe) {
>   		/* VF PEs should be pre-configured in pnv_pci_sriov_enable() */
>   		if (WARN_ON(pdev->is_virtfn))
>   			return;
>   
>   		pnv_pci_configure_bus(pdev->bus);
> -		pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
> +		pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
>   		pci_info(pdev, "Configured PE#%x\n", pe ? pe->pe_number : 0xfffff);
>   
>   
> @@ -2526,7 +2526,7 @@ static struct iommu_group *pnv_pci_device_group(struct pci_controller *hose,
>   	if (WARN_ON(!phb))
>   		return ERR_PTR(-ENODEV);
>   
> -	pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
> +	pe = pnv_pci_bdfn_to_pe(phb, pci_dev_id(pdev));
>   	if (!pe)
>   		return ERR_PTR(-ENODEV);
>   

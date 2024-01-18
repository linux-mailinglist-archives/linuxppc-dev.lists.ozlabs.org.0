Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D0831F07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 19:19:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iy/szvMp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG9xY1379z3cPN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 05:19:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iy/szvMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG9wf41Nqz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 05:18:26 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40II8JXq021800;
	Thu, 18 Jan 2024 18:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=aIcKKTU+QirKqOun0MRgYF/3tJJGnvawvYpmF0cYKMY=;
 b=iy/szvMpeVVyN2CUDbIgRiRbbmeuzuxTaHmsGe6pY1Ag3+dlf/bdDHXf++X/BvbPNNBK
 05IhtSpnOAQdBlC4vd2gCaAg22Cd6knO5E0q5jtj3I4q3U7BI5GTbVtDFmF7rlbjy18e
 epMy8EbbyxzNM1d8VVveFDgf5TcHLeu+ag70mo1s/yPF8ouDCfwICBs1V9XVdhQBH9cd
 gRE+rdSXaYOyKzygpDwTw8qSVUBUbPSW/c96mrNN1GQPfdjFJc7gvpTJaTE6MI58sL7e
 4qGA5IYpCSXlhUUodxRNrhIDx9wgovPSG1RSlig4dwtgW7SBEJOZScDDrjzzNNSQTRg2 cw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vq90e07jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 18:18:19 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40IH9nOn000630;
	Thu, 18 Jan 2024 18:18:18 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm4ut54j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 18:18:18 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40IIIHnX14287610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jan 2024 18:18:18 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4E0B58052;
	Thu, 18 Jan 2024 18:18:17 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F87658045;
	Thu, 18 Jan 2024 18:18:17 +0000 (GMT)
Received: from localhost (unknown [9.61.184.220])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jan 2024 18:18:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Gaurav Batra <gbatra@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/pseries/iommu: DLPAR ADD of pci device doesn't
 completely initialize pci_controller structure
In-Reply-To: <20240110225351.47153-1-gbatra@linux.ibm.com>
References: <20240110225351.47153-1-gbatra@linux.ibm.com>
Date: Thu, 18 Jan 2024 12:18:17 -0600
Message-ID: <87le8ma4k6.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: siysqofmWN1bLwaCfeOZwK2C3eO-74BB
X-Proofpoint-ORIG-GUID: siysqofmWN1bLwaCfeOZwK2C3eO-74BB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=963 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401180133
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gaurav,

A couple minor comments below.

Gaurav Batra <gbatra@linux.ibm.com> writes:
> diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
> index ce2b1b5eebdd..55a2ba36e9c4 100644
> --- a/arch/powerpc/include/asm/ppc-pci.h
> +++ b/arch/powerpc/include/asm/ppc-pci.h
> @@ -29,6 +29,9 @@ void *pci_traverse_device_nodes(struct device_node *start,
>  				void *(*fn)(struct device_node *, void *),
>  				void *data);
>  extern void pci_devs_phb_init_dynamic(struct pci_controller *phb);
> +extern void pci_register_device_dynamic(struct pci_controller *phb);
> +extern void pci_unregister_device_dynamic(struct pci_controller *phb);
> +
>  
>  /* From rtas_pci.h */
>  extern void init_pci_config_tokens (void);
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index ebe259bdd462..342739fe74c4 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1388,6 +1388,21 @@ static const struct attribute_group *spapr_tce_iommu_groups[] = {
>  	NULL,
>  };
>  
> +void pci_register_device_dynamic(struct pci_controller *phb)
> +{
> +	iommu_device_sysfs_add(&phb->iommu, phb->parent,
> +				spapr_tce_iommu_groups, "iommu-phb%04x",
> +				phb->global_number);
> +	iommu_device_register(&phb->iommu, &spapr_tce_iommu_ops,
> +				phb->parent);
> +}
> +
> +void pci_unregister_device_dynamic(struct pci_controller *phb)
> +{
> +	iommu_device_unregister(&phb->iommu);
> +	iommu_device_sysfs_remove(&phb->iommu);
> +}
> +
>  /*
>   * This registers IOMMU devices of PHBs. This needs to happen
>   * after core_initcall(iommu_init) + postcore_initcall(pci_driver_init) and
> diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
> index 4ba824568119..ec70ca435b7e 100644
> --- a/arch/powerpc/platforms/pseries/pci_dlpar.c
> +++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
> @@ -35,6 +35,8 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
>  
>  	pseries_msi_allocate_domains(phb);
>  
> +	pci_register_device_dynamic(phb);
> +
>  	/* Create EEH devices for the PHB */
>  	eeh_phb_pe_create(phb);
>  
> @@ -76,6 +78,8 @@ int remove_phb_dynamic(struct pci_controller *phb)
>  		}
>  	}
>  
> +	pci_unregister_device_dynamic(phb);
> +
>  	pseries_msi_free_domains(phb);
>  
>  	/* Keep a reference so phb isn't freed yet */
> --

The change overall looks correct to me, but:

1. I don't think the new functions should use the "pci_" prefix; that
   should probably be reserved for code in the core PCI subsystem. Some
   existing code in arch/powerpc/kernel/iommu.c uses "ppc_iommu_" and
   "spapr_tce_", maybe one of those would work instead?

2. Your pci_register_device_dynamic() duplicates code from
   spapr_tce_setup_phb_iommus_initcall():

        list_for_each_entry(hose, &hose_list, list_node) {
                iommu_device_sysfs_add(&hose->iommu, hose->parent,
                                       spapr_tce_iommu_groups, "iommu-phb%04x",
                                       hose->global_number);
                iommu_device_register(&hose->iommu, &spapr_tce_iommu_ops,
                                      hose->parent);
        }

  Can the loop body be factored into a common function that can be
  used in both paths?

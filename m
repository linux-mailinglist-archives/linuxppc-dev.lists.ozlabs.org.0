Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278EAE1A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 02:22:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S5Mk1MMNzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:22:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S5L264TKzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:21:14 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A07a4r112374
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 20:21:09 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uv86vgxbq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 20:21:09 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 01:21:06 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 01:21:02 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A0L0l241680970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 00:21:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A50142042;
 Tue, 10 Sep 2019 00:21:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 424AE42041;
 Tue, 10 Sep 2019 00:21:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 00:21:00 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C04EFA01D3;
 Tue, 10 Sep 2019 10:20:56 +1000 (AEST)
Subject: Re: [PATCH 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 10:20:56 +1000
In-Reply-To: <20190909154600.19917-2-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-2-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091000-4275-0000-0000-000003639D8B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091000-4276-0000-0000-00003875EF2D
Message-Id: <02d7bbc21e915012efe3c0178a4c0327cb016822.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=909 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100000
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
> Taking a reference on the pci_dev structure was required with initial
> commit 184cd4a3b962 ("powerpc/powernv: PCI support for p7IOC under
> OPAL v2"), where we were storing the pci_dev in the pci_dn structure.
> 
> However, the pci_dev was later removed from the pci_dn structure, but
> the reference was kept. See commit 902bdc57451c
> ("powerpc/powernv/idoa:
> Remove unnecessary pcidev from pci_dn").
> 
> The pnv_ioda_pe structure life cycle is the same as the pci_dev
> structure, the PE is freed when the device is released. So we don't
> need a reference for the pci_dev stored in the PE, otherwise the
> pci_dev will never be released. Which is not really a surprise as the
> comment (removed here as no longer needed) was stating as much.
> 
> Fixes: 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary pcidev
> from pci_dn")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c
> b/arch/powerpc/platforms/powernv/pci-ioda.c
> index d8080558d020..92767f006f20 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1062,14 +1062,6 @@ static struct pnv_ioda_pe
> *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  		return NULL;
>  	}
>  
> -	/* NOTE: We get only one ref to the pci_dev for the pdn, not
> for the
> -	 * pointer in the PE data structure, both should be destroyed
> at the
> -	 * same time. However, this needs to be looked at more closely
> again
> -	 * once we actually start removing things (Hotplug, SR-IOV,
> ...)
> -	 *
> -	 * At some point we want to remove the PDN completely anyways
> -	 */
> -	pci_dev_get(dev);
>  	pdn->pe_number = pe->pe_number;
>  	pe->flags = PNV_IODA_PE_DEV;
>  	pe->pdev = dev;
> @@ -1084,7 +1076,6 @@ static struct pnv_ioda_pe
> *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  		pnv_ioda_free_pe(pe);
>  		pdn->pe_number = IODA_INVALID_PE;
>  		pe->pdev = NULL;
> -		pci_dev_put(dev);
>  		return NULL;
>  	}
>  
> @@ -1228,7 +1219,7 @@ static struct pnv_ioda_pe
> *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
>  			 */
>  			dev_info(&npu_pdev->dev,
>  				"Associating to existing PE %x\n",
> pe_num);
> -			pci_dev_get(npu_pdev);
> +			pci_dev_get(npu_pdev); // still needed after
> 902bdc57451c ?
>  			npu_pdn = pci_get_pdn(npu_pdev);
>  			rid = npu_pdev->bus->number << 8 | npu_pdn-
> >devfn;
>  			npu_pdn->pe_number = pe_num;

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819


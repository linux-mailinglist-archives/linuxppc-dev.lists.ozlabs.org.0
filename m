Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CCDAE1B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 02:40:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S5lj2dQMzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:40:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S5k16yvszDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 10:38:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A0SJtW146673
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 20:38:31 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uwwnvx3rb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 20:38:30 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 01:38:29 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 01:38:26 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A0cPV056426718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 00:38:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BB31A4051;
 Tue, 10 Sep 2019 00:38:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B8DFA4040;
 Tue, 10 Sep 2019 00:38:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 00:38:24 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A9FC1A01D3;
 Tue, 10 Sep 2019 10:38:21 +1000 (AEST)
Subject: Re: [PATCH 03/11] powerpc/powernv/ioda: set up PE on opencapi
 device when enabling
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 10:38:21 +1000
In-Reply-To: <20190909154600.19917-4-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-4-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091000-0028-0000-0000-0000039A2A85
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091000-0029-0000-0000-0000245C8B8F
Message-Id: <523a5d07ba7b85e0f541ab3e6aede4343efb0e20.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100001
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
> The PE for an opencapi device was set as part of a late PHB fixup
> operation, when creating the PHB. To use the PCI hotplug framework,
> this is not going to work, as the PHB stays the same, it's only the
> devices underneath which are updated. For regular PCI devices, it is
> done as part of the reconfiguration of the bridge, but for opencapi
> PHBs, we don't have an intermediate bridge. So let's define the PE
> when the device is enabled. PEs are meaningless for opencapi, the NPU
> doesn't define them and opal is not doing anything with them.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 31 +++++++++++++++++--
> ----
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c
> b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 3dbbf5365c1c..06ce7ddaa0cf 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1260,8 +1260,6 @@ static void pnv_pci_ioda_setup_PEs(void)
>  {
>  	struct pci_controller *hose;
>  	struct pnv_phb *phb;
> -	struct pci_bus *bus;
> -	struct pci_dev *pdev;
>  	struct pnv_ioda_pe *pe;
>  
>  	list_for_each_entry(hose, &hose_list, list_node) {
> @@ -1273,11 +1271,6 @@ static void pnv_pci_ioda_setup_PEs(void)
>  			if (phb->model == PNV_PHB_MODEL_NPU2)
>  				WARN_ON_ONCE(pnv_npu2_init(hose));
>  		}
> -		if (phb->type == PNV_PHB_NPU_OCAPI) {
> -			bus = hose->bus;
> -			list_for_each_entry(pdev, &bus->devices,
> bus_list)
> -				pnv_ioda_setup_dev_PE(pdev);
> -		}
>  	}
>  	list_for_each_entry(hose, &hose_list, list_node) {
>  		phb = hose->private_data;
> @@ -3385,6 +3378,28 @@ static bool pnv_pci_enable_device_hook(struct
> pci_dev *dev)
>  	return true;
>  }
>  
> +static bool pnv_ocapi_enable_device_hook(struct pci_dev *dev)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> +	struct pnv_phb *phb = hose->private_data;
> +	struct pci_dn *pdn;
> +	struct pnv_ioda_pe *pe;
> +
> +	if (!phb->initialized)
> +		return true;
> +
> +	pdn = pci_get_pdn(dev);
> +	if (!pdn)
> +		return false;
> +
> +	if (pdn->pe_number == IODA_INVALID_PE) {
> +		pe = pnv_ioda_setup_dev_PE(dev);
> +		if (!pe)
> +			return false;
> +	}
> +	return true;
> +}
> +
>  static long pnv_pci_ioda1_unset_window(struct iommu_table_group
> *table_group,
>  				       int num)
>  {
> @@ -3625,7 +3640,7 @@ static const struct pci_controller_ops
> pnv_npu_ioda_controller_ops = {
>  };
>  
>  static const struct pci_controller_ops
> pnv_npu_ocapi_ioda_controller_ops = {
> -	.enable_device_hook	= pnv_pci_enable_device_hook,
> +	.enable_device_hook	= pnv_ocapi_enable_device_hook,
>  	.window_alignment	= pnv_pci_window_alignment,
>  	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
>  	.shutdown		= pnv_pci_ioda_shutdown,

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819


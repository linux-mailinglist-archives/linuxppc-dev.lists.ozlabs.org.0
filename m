Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F70C09C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 18:45:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fyN42gpBzDqvw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 02:45:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fyKt2ZmFzDr09
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 02:43:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RGgxb5086580
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 12:43:36 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v9mphu8du-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 12:43:35 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 27 Sep 2019 17:43:34 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 17:43:32 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8RGh2kN39584018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 16:43:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A276DA4059;
 Fri, 27 Sep 2019 16:43:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CFC7A404D;
 Fri, 27 Sep 2019 16:43:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 16:43:30 +0000 (GMT)
Received: from [9.81.204.240] (unknown [9.81.204.240])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DB68AA010A;
 Sat, 28 Sep 2019 02:43:23 +1000 (AEST)
Subject: Re: [PATCH 03/11] powerpc/powernv/ioda: set up PE on opencapi device
 when enabling
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-4-fbarrat@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 27 Sep 2019 18:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909154600.19917-4-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092716-0020-0000-0000-000003725D59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092716-0021-0000-0000-000021C82F5D
Message-Id: <710b4968-52a8-6339-4f3e-899ad4c75fa0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270146
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
Cc: groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/9/19 5:45 pm, Frederic Barrat wrote:
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

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>


> ---
>   arch/powerpc/platforms/powernv/pci-ioda.c | 31 +++++++++++++++++------
>   1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 3dbbf5365c1c..06ce7ddaa0cf 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1260,8 +1260,6 @@ static void pnv_pci_ioda_setup_PEs(void)
>   {
>   	struct pci_controller *hose;
>   	struct pnv_phb *phb;
> -	struct pci_bus *bus;
> -	struct pci_dev *pdev;
>   	struct pnv_ioda_pe *pe;
>   
>   	list_for_each_entry(hose, &hose_list, list_node) {
> @@ -1273,11 +1271,6 @@ static void pnv_pci_ioda_setup_PEs(void)
>   			if (phb->model == PNV_PHB_MODEL_NPU2)
>   				WARN_ON_ONCE(pnv_npu2_init(hose));
>   		}
> -		if (phb->type == PNV_PHB_NPU_OCAPI) {
> -			bus = hose->bus;
> -			list_for_each_entry(pdev, &bus->devices, bus_list)
> -				pnv_ioda_setup_dev_PE(pdev);
> -		}
>   	}
>   	list_for_each_entry(hose, &hose_list, list_node) {
>   		phb = hose->private_data;
> @@ -3385,6 +3378,28 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
>   	return true;
>   }
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
>   static long pnv_pci_ioda1_unset_window(struct iommu_table_group *table_group,
>   				       int num)
>   {
> @@ -3625,7 +3640,7 @@ static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
>   };
>   
>   static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
> -	.enable_device_hook	= pnv_pci_enable_device_hook,
> +	.enable_device_hook	= pnv_ocapi_enable_device_hook,
>   	.window_alignment	= pnv_pci_window_alignment,
>   	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
>   	.shutdown		= pnv_pci_ioda_shutdown,
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited


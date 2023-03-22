Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F36C4B17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 13:50:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhSxy19lRz3ch8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 23:50:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FMiU67FR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FMiU67FR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhSwz0k9Pz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 23:49:54 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MCiQVo020110;
	Wed, 22 Mar 2023 12:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QyzQXCkVHmt1nPKdC5kGVV+jLeQu+3n9NQRiSw/g54Q=;
 b=FMiU67FRR4mDujj/A8o0AGVQgl9fS1e6mlOQlG5Cq9LBbFAwD2meFnweqOF0Gh/9Bvzz
 p3TMfWUet1MHzVflMC0OBsOEXq/3XtXGnoQky1nGVWyo/9+KmuFJBVmHlpspxfmGZBYm
 VDvDp0+vQ193pwEPg4gpoC4w+WC6oSH9xR4qGNYtzaysvJR7eNufas93QUjaGXrai98Q
 zFp5YZWcJ2AHEyFOmkP6Te7wFi0AK41mW6GHB3zuEvDUMeamiLfMbpdlmSSQso22J1vG
 D4+zFVg/TBslJVLtUZqzMS5sUzwwP7OdaE92+xo9svYriMoPlXLBmSZaWIovQ5bAMMO/ 1g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg1xjg45a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 12:49:45 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M9B58X015095;
	Wed, 22 Mar 2023 12:49:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3pd4x6cye9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 12:49:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32MCneek18874964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 12:49:40 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B8B720043;
	Wed, 22 Mar 2023 12:49:40 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CA5620040;
	Wed, 22 Mar 2023 12:49:38 +0000 (GMT)
Received: from [9.43.64.146] (unknown [9.43.64.146])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Mar 2023 12:49:38 +0000 (GMT)
Message-ID: <c6225890-9603-767e-21f6-7d2bc83bdd18@linux.ibm.com>
Date: Wed, 22 Mar 2023 18:19:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] powerpc/iommu: Fix notifiers being shared by PCI and VIO
 buses
Content-Language: en-US
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20230322035322.328709-1-ruscur@russell.cc>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230322035322.328709-1-ruscur@russell.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GTVbOl-NYxTlJG1fKjm1V2PqjecuF0Ie
X-Proofpoint-GUID: GTVbOl-NYxTlJG1fKjm1V2PqjecuF0Ie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_08,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220091
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/03/23 9:23 am, Russell Currey wrote:
> fail_iommu_setup() registers the fail_iommu_bus_notifier struct to both
> PCI and VIO buses.  struct notifier_block is a linked list node, so this
> causes any notifiers later registered to either bus type to also be
> registered to the other since they share the same node.
> 
> This causes issues in (at least) the vgaarb code, which registers a
> notifier for PCI buses.  pci_notify() ends up being called on a vio
> device, converted with to_pci_dev() even though it's not a PCI device,
> and finally makes a bad access in vga_arbiter_add_pci_device() as
> discovered with KASAN:
> 
>   BUG: KASAN: slab-out-of-bounds in vga_arbiter_add_pci_device+0x60/0xe00
>   Read of size 4 at addr c000000264c26fdc by task swapper/0/1
> 
>   Call Trace:
>   [c000000263607520] [c000000010f7023c] dump_stack_lvl+0x1bc/0x2b8 (unreliable)
>   [c000000263607560] [c00000000f142a64] print_report+0x3f4/0xc60
>   [c000000263607640] [c00000000f142144] kasan_report+0x244/0x698
>   [c000000263607740] [c00000000f1460e8] __asan_load4+0xe8/0x250
>   [c000000263607760] [c00000000ff4b850] vga_arbiter_add_pci_device+0x60/0xe00
>   [c000000263607850] [c00000000ff4c678] pci_notify+0x88/0x444
>   [c0000002636078b0] [c00000000e94dfc4] notifier_call_chain+0x104/0x320
>   [c000000263607950] [c00000000e94f050] blocking_notifier_call_chain+0xa0/0x140
>   [c000000263607990] [c0000000100cb3b8] device_add+0xac8/0x1d30
>   [c000000263607aa0] [c0000000100ccd98] device_register+0x58/0x80
>   [c000000263607ad0] [c00000000e84247c] vio_register_device_node+0x9ac/0xce0
>   [c000000263607ba0] [c0000000126c95d8] vio_bus_scan_register_devices+0xc4/0x13c
>   [c000000263607bd0] [c0000000126c96e4] __machine_initcall_pseries_vio_device_init+0x94/0xf0
>   [c000000263607c00] [c00000000e69467c] do_one_initcall+0x12c/0xaa8
>   [c000000263607cf0] [c00000001268b8a8] kernel_init_freeable+0xa48/0xba8
>   [c000000263607dd0] [c00000000e695f24] kernel_init+0x64/0x400
>   [c000000263607e50] [c00000000e68e0e4] ret_from_kernel_thread+0x5c/0x64
> 
> Fix this by creating separate notifier_block structs for each bus type.
> 
> Fixes: d6b9a81b2a45 ("powerpc: IOMMU fault injection")
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>


Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
>   arch/powerpc/kernel/iommu.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index ee95937bdaf1..6f1117fe3870 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -171,17 +171,26 @@ static int fail_iommu_bus_notify(struct notifier_block *nb,
>   	return 0;
>   }
>   
> -static struct notifier_block fail_iommu_bus_notifier = {
> +/*
> + * PCI and VIO buses need separate notifier_block structs, since they're linked
> + * list nodes.  Sharing a notifier_block would mean that any notifiers later
> + * registered for PCI buses would also get called by VIO buses and vice versa.
> + */
> +static struct notifier_block fail_iommu_pci_bus_notifier = {
> +	.notifier_call = fail_iommu_bus_notify
> +};
> +
> +static struct notifier_block fail_iommu_vio_bus_notifier = {
>   	.notifier_call = fail_iommu_bus_notify
>   };
>   
>   static int __init fail_iommu_setup(void)
>   {
>   #ifdef CONFIG_PCI
> -	bus_register_notifier(&pci_bus_type, &fail_iommu_bus_notifier);
> +	bus_register_notifier(&pci_bus_type, &fail_iommu_pci_bus_notifier);
>   #endif
>   #ifdef CONFIG_IBMVIO
> -	bus_register_notifier(&vio_bus_type, &fail_iommu_bus_notifier);
> +	bus_register_notifier(&vio_bus_type, &fail_iommu_vio_bus_notifier);
>   #endif
>   
>   	return 0;

-- 
Thanks and Regards
R.Nageswara Sastry

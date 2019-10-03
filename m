Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB7C997C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 10:06:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kQYr3GlczDqZC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 18:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kQWq4nrxzDqXQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 18:04:23 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9381wi9090012
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 3 Oct 2019 04:04:19 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdd25r755-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Oct 2019 04:04:18 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Thu, 3 Oct 2019 09:04:16 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Oct 2019 09:04:15 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9384EwD51249250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 08:04:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16CC34C044;
 Thu,  3 Oct 2019 08:04:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 471214C040;
 Thu,  3 Oct 2019 08:04:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.126.30.142])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 08:04:13 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: Add functionality to check PERF_EVENTS
 config option
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20191001092113.17826-1-kjain@linux.ibm.com>
From: maddy <maddy@linux.vnet.ibm.com>
Date: Thu, 3 Oct 2019 13:34:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191001092113.17826-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19100308-4275-0000-0000-0000036D96EC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100308-4276-0000-0000-000038809C21
Message-Id: <a83a7daa-779b-037c-c5ab-3901fe3f9802@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030079
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
Cc: anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/1/19 2:51 PM, Kajol Jain wrote:
> Perf is the primary interface to program performance monitoring
> unit (pmu) and collect counter data in system.
> But currently pmu register files are created in the
> /sys/devices/system/cpu/cpu* without checking CONFIG_PERF_EVENTS
> option. These includes PMC* and MMCR* sprs.
> Patch ties sysfs pmu spr file creation with CONFIG_PERF_EVENTS options.
>
> Tested this patch with enable/disable CONFIG_PERF_EVENTS option
> in powernv and pseries machines.
> Also did compilation testing with book3s_32.config.


Title of the patch should be

powerpc/kernel/sysfs: Add PERF_EVENT config option check to PMU SPRs

Rest looks fine.

Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>


> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   arch/powerpc/kernel/sysfs.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index e2147d7c9e72..263023cc6308 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -456,16 +456,21 @@ static ssize_t __used \
>
>   #if defined(CONFIG_PPC64)
>   #define HAS_PPC_PMC_CLASSIC	1
> +#if defined(CONFIG_PERF_EVENTS)
>   #define HAS_PPC_PMC_IBM		1
> +#endif
>   #define HAS_PPC_PMC_PA6T	1
>   #elif defined(CONFIG_PPC_BOOK3S_32)
>   #define HAS_PPC_PMC_CLASSIC	1
> +#if defined(CONFIG_PERF_EVENTS)
>   #define HAS_PPC_PMC_IBM		1
>   #define HAS_PPC_PMC_G4		1
>   #endif
> +#endif
>
>
>   #ifdef HAS_PPC_PMC_CLASSIC
> +#ifdef HAS_PPC_PMC_IBM
>   SYSFS_PMCSETUP(mmcr0, SPRN_MMCR0);
>   SYSFS_PMCSETUP(mmcr1, SPRN_MMCR1);
>   SYSFS_PMCSETUP(pmc1, SPRN_PMC1);
> @@ -484,6 +489,10 @@ SYSFS_PMCSETUP(pmc7, SPRN_PMC7);
>   SYSFS_PMCSETUP(pmc8, SPRN_PMC8);
>
>   SYSFS_PMCSETUP(mmcra, SPRN_MMCRA);
> +#endif /* CONFIG_PPC64 */
> +#endif /* HAS_PPC_PMC_IBM */
> +
> +#ifdef CONFIG_PPC64
>   SYSFS_SPRSETUP(purr, SPRN_PURR);
>   SYSFS_SPRSETUP(spurr, SPRN_SPURR);
>   SYSFS_SPRSETUP(pir, SPRN_PIR);
> @@ -494,7 +503,9 @@ SYSFS_SPRSETUP(tscr, SPRN_TSCR);
>     enable write when needed with a separate function.
>     Lets be conservative and default to pseries.
>   */
> +#ifdef HAS_PPC_PMC_IBM
>   static DEVICE_ATTR(mmcra, 0600, show_mmcra, store_mmcra);
> +#endif /* HAS_PPC_PMC_IBM */
>   static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
>   static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
>   static DEVICE_ATTR(pir, 0400, show_pir, NULL);
> @@ -605,12 +616,14 @@ static void sysfs_create_dscr_default(void)
>   #endif /* CONFIG_PPC64 */
>
>   #ifdef HAS_PPC_PMC_PA6T
> +#ifdef HAS_PPC_PMC_IBM
>   SYSFS_PMCSETUP(pa6t_pmc0, SPRN_PA6T_PMC0);
>   SYSFS_PMCSETUP(pa6t_pmc1, SPRN_PA6T_PMC1);
>   SYSFS_PMCSETUP(pa6t_pmc2, SPRN_PA6T_PMC2);
>   SYSFS_PMCSETUP(pa6t_pmc3, SPRN_PA6T_PMC3);
>   SYSFS_PMCSETUP(pa6t_pmc4, SPRN_PA6T_PMC4);
>   SYSFS_PMCSETUP(pa6t_pmc5, SPRN_PA6T_PMC5);
> +#endif /* HAS_PPC_PMC_IBM */
>   #ifdef CONFIG_DEBUG_MISC
>   SYSFS_SPRSETUP(hid0, SPRN_HID0);
>   SYSFS_SPRSETUP(hid1, SPRN_HID1);
> @@ -648,7 +661,6 @@ static struct device_attribute ibm_common_attrs[] = {
>   	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
>   	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
>   };
> -#endif /* HAS_PPC_PMC_G4 */
>
>   #ifdef HAS_PPC_PMC_G4
>   static struct device_attribute g4_common_attrs[] = {
> @@ -670,9 +682,11 @@ static struct device_attribute classic_pmc_attrs[] = {
>   	__ATTR(pmc8, 0600, show_pmc8, store_pmc8),
>   #endif
>   };
> +#endif /* HAS_PPC_PMC_IBM */
>
>   #ifdef HAS_PPC_PMC_PA6T
>   static struct device_attribute pa6t_attrs[] = {
> +#ifdef HAS_PPC_PMC_IBM
>   	__ATTR(mmcr0, 0600, show_mmcr0, store_mmcr0),
>   	__ATTR(mmcr1, 0600, show_mmcr1, store_mmcr1),
>   	__ATTR(pmc0, 0600, show_pa6t_pmc0, store_pa6t_pmc0),
> @@ -681,6 +695,7 @@ static struct device_attribute pa6t_attrs[] = {
>   	__ATTR(pmc3, 0600, show_pa6t_pmc3, store_pa6t_pmc3),
>   	__ATTR(pmc4, 0600, show_pa6t_pmc4, store_pa6t_pmc4),
>   	__ATTR(pmc5, 0600, show_pa6t_pmc5, store_pa6t_pmc5),
> +#endif /* HAS_PPC_PMC_IBM */
>   #ifdef CONFIG_DEBUG_MISC
>   	__ATTR(hid0, 0600, show_hid0, store_hid0),
>   	__ATTR(hid1, 0600, show_hid1, store_hid1),
> @@ -769,8 +784,10 @@ static int register_cpu_online(unsigned int cpu)
>   			device_create_file(s, &pmc_attrs[i]);
>
>   #ifdef CONFIG_PPC64
> +#ifdef HAS_PPC_PMC_IBM
>   	if (cpu_has_feature(CPU_FTR_MMCRA))
>   		device_create_file(s, &dev_attr_mmcra);
> +#endif
>
>   	if (cpu_has_feature(CPU_FTR_PURR)) {
>   		if (!firmware_has_feature(FW_FEATURE_LPAR))
> @@ -858,8 +875,10 @@ static int unregister_cpu_online(unsigned int cpu)
>   			device_remove_file(s, &pmc_attrs[i]);
>
>   #ifdef CONFIG_PPC64
> +#ifdef HAS_PPC_PMC_IBM
>   	if (cpu_has_feature(CPU_FTR_MMCRA))
>   		device_remove_file(s, &dev_attr_mmcra);
> +#endif
>
>   	if (cpu_has_feature(CPU_FTR_PURR))
>   		device_remove_file(s, &dev_attr_purr);


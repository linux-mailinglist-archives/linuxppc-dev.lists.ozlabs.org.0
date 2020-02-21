Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6284168426
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 17:52:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PHYm5wGtzDqjL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 03:52:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PHWb60tYzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 03:50:19 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LGnGEu061540; Fri, 21 Feb 2020 11:50:14 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubr85t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 11:50:14 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LGnvN9019789;
 Fri, 21 Feb 2020 16:50:13 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 2y68976cmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 16:50:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LGoDpv48628042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 16:50:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8FDC2805C;
 Fri, 21 Feb 2020 16:50:12 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4E4B28059;
 Fri, 21 Feb 2020 16:50:12 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 16:50:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/5] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
In-Reply-To: <1582262314-8319-5-git-send-email-ego@linux.vnet.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-5-git-send-email-ego@linux.vnet.ibm.com>
Date: Fri, 21 Feb 2020 10:50:12 -0600
Message-ID: <87eeunubp7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_05:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=2 spamscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=939 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002210127
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 80a676d..5b4b450 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -19,6 +19,7 @@
>  #include <asm/smp.h>
>  #include <asm/pmc.h>
>  #include <asm/firmware.h>
> +#include <asm/idle.h>
>  #include <asm/svm.h>
>  
>  #include "cacheinfo.h"
> @@ -733,6 +734,42 @@ static void create_svm_file(void)
>  }
>  #endif /* CONFIG_PPC_SVM */
>  
> +static void read_idle_purr(void *val)
> +{
> +	u64 *ret = (u64 *)val;

No cast from void* needed.


> +
> +	*ret = read_this_idle_purr();
> +}
> +
> +static ssize_t idle_purr_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct cpu *cpu = container_of(dev, struct cpu, dev);
> +	u64 val;
> +
> +	smp_call_function_single(cpu->dev.id, read_idle_purr, &val, 1);
> +	return sprintf(buf, "%llx\n", val);
> +}
> +static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
> +
> +static void read_idle_spurr(void *val)
> +{
> +	u64 *ret = (u64 *)val;
> +
> +	*ret = read_this_idle_spurr();
> +}
> +
> +static ssize_t idle_spurr_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct cpu *cpu = container_of(dev, struct cpu, dev);
> +	u64 val;
> +
> +	smp_call_function_single(cpu->dev.id, read_idle_spurr, &val, 1);
> +	return sprintf(buf, "%llx\n", val);
> +}
> +static DEVICE_ATTR(idle_spurr, 0400, idle_spurr_show, NULL);

It's regrettable that we have to wake up potentially idle CPUs in order
to derive correct idle statistics for them, but I suppose the main user
(lparstat) of these interfaces already is causing this to happen by
polling the existing per-cpu purr and spurr attributes.

So now lparstat will incur at minimum four syscalls and four IPIs per
CPU per polling interval -- one for each of purr, spurr, idle_purr and
idle_spurr. Correct?

At some point it's going to make sense to batch sampling of remote CPUs'
SPRs.


>  static int register_cpu_online(unsigned int cpu)
>  {
>  	struct cpu *c = &per_cpu(cpu_devices, cpu);
> @@ -794,10 +831,15 @@ static int register_cpu_online(unsigned int cpu)
>  		if (!firmware_has_feature(FW_FEATURE_LPAR))
>  			add_write_permission_dev_attr(&dev_attr_purr);
>  		device_create_file(s, &dev_attr_purr);
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			device_create_file(s, &dev_attr_idle_purr);
>  	}
>  
> -	if (cpu_has_feature(CPU_FTR_SPURR))
> +	if (cpu_has_feature(CPU_FTR_SPURR)) {
>  		device_create_file(s, &dev_attr_spurr);
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			device_create_file(s, &dev_attr_idle_spurr);
> +	}
>  
>  	if (cpu_has_feature(CPU_FTR_DSCR))
>  		device_create_file(s, &dev_attr_dscr);
> @@ -879,11 +921,17 @@ static int unregister_cpu_online(unsigned int cpu)
>  	if (cpu_has_feature(CPU_FTR_MMCRA))
>  		device_remove_file(s, &dev_attr_mmcra);
>  
> -	if (cpu_has_feature(CPU_FTR_PURR))
> +	if (cpu_has_feature(CPU_FTR_PURR)) {
>  		device_remove_file(s, &dev_attr_purr);
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			device_remove_file(s, &dev_attr_idle_purr);
> +	}
>  
> -	if (cpu_has_feature(CPU_FTR_SPURR))
> +	if (cpu_has_feature(CPU_FTR_SPURR)) {
>  		device_remove_file(s, &dev_attr_spurr);
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			device_remove_file(s, &dev_attr_idle_spurr);
> +	}
>  
>  	if (cpu_has_feature(CPU_FTR_DSCR))
>  		device_remove_file(s, &dev_attr_dscr);

The cpu register/unregister stuff here looks correct.

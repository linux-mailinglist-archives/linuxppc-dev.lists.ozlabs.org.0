Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD739176F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 05:52:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hObqHj5k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W877g260Sz3cNc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 13:52:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hObqHj5k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W876y0MCYz30Vv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 13:51:53 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q2vIS0023120;
	Wed, 26 Jun 2024 03:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=t
	OXpr5u5VIi0cwAx1I6WP278NppMzelWS9OIFqP9r+M=; b=hObqHj5kWbjoRZu5w
	37QlB4mGK5wIG1CDkEkoC/VPp1z0pO0tbP/oSPhzXACyHka8hQnqtZKmtzYawiXj
	FRgyVNg2CKydlYkw+5JILejT+yTL81fK7IOC5Qa4wKkBdqQiAXOn0+Jcovcq0RLQ
	wERqRhL+IQCpJP3enFW8y+eZ7CxWLGCNO+vbcANtBywvC31kb/v5p20AyzMhKzkg
	mF1mkLxCyHhqEpSMkwT0mqUETz7ZT4oRAWTtm4mFWRgO7jMxWnNRbfQ066xN43sF
	O9zW+lY8JCYoFQolJ4fU8zVlPHb7/XGc7zlaWhABUPU50LEQQjWoqg1sU6xJl/cm
	7vXdQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4008wnr9n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:51:44 +0000 (GMT)
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q3piZV005804;
	Wed, 26 Jun 2024 03:51:44 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4008wnr9n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:51:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45Q0mH5B008184;
	Wed, 26 Jun 2024 03:51:42 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9b0t9a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:51:42 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45Q3pdpH35062172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 03:51:41 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86A5B58056;
	Wed, 26 Jun 2024 03:51:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9523458052;
	Wed, 26 Jun 2024 03:51:36 +0000 (GMT)
Received: from [9.204.206.229] (unknown [9.204.206.229])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jun 2024 03:51:36 +0000 (GMT)
Message-ID: <431655d2-ab6c-48ff-a163-152f6a09cd80@linux.ibm.com>
Date: Wed, 26 Jun 2024 09:21:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powerpc/pseries: Export hardware trace macro dump via
 debugfs
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, mpe@ellerman.id.au
References: <20240620174614.53751-1-maddy@linux.ibm.com>
 <20240620174614.53751-2-maddy@linux.ibm.com> <87msnd5st9.fsf@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87msnd5st9.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q_kDc6qHkiamGcqtUauFoiieSTsfvCQI
X-Proofpoint-GUID: 9TQq9oOIBg1Nrx-d5QBPHRwzq-EXm4Zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260025
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/22/24 1:10 PM, Ritesh Harjani (IBM) wrote:
> This is a generic review and I haven't looked into the PAPR spec for
> htmdump hcall and it's interface.

Sure

> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>
>> This patch adds debugfs interface to export Hardware Trace Macro (HTM)
>> function data in a LPAR. New hypervisor call "H_HTM" has been
>> defined to setup, configure, control and dump the HTM data.
>> This patch supports only dumping of HTM data in a LPAR.
>> New debugfs folder called "htmdump" has been added under
>> /sys/kernel/debug/arch path which contains files need to
>> pass required parameters for the H_HTM dump function. New Kconfig
>> option called "CONFIG_HTMDUMP" has been in platform/pseries for the same.
>>
>> With patch series applied and booted, list of files in debugfs path
>>
>> # pwd
>> /sys/kernel/debug/powerpc/htmdump
>> # ls
>> coreindexonchip  htmtype  nodalchipindex  nodeindex  trace
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/Kconfig   |   8 ++
>>   arch/powerpc/platforms/pseries/Makefile  |   1 +
>>   arch/powerpc/platforms/pseries/htmdump.c | 130 +++++++++++++++++++++++
>>   3 files changed, 139 insertions(+)
>>   create mode 100644 arch/powerpc/platforms/pseries/htmdump.c
>>
>> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
>> index afc0f6a61337..46c0ea605e33 100644
>> --- a/arch/powerpc/platforms/pseries/Kconfig
>> +++ b/arch/powerpc/platforms/pseries/Kconfig
>> @@ -128,6 +128,14 @@ config CMM
>>   	  will be reused for other LPARs. The interface allows firmware to
>>   	  balance memory across many LPARs.
>>
>> +config HTMDUMP
>> +	tristate "PHYP HTM data dumper"
> Not sure if we can make machine_device_initcall() as a tristate?
> Did we try compiling it as a module?
>
> It we would like to keep this as a module - then why not use module_init
> call and then make it depend upon...

I will make it as bool and add depends as suggested.

>
> depends on PPC_PSERIES && DEBUG_FS (??)
>
>> +	default y
> and then since this is mostly a debug trace facility, then we need not enable
> it by default right?

Yes, we want this to be there, it is up to hypervisor whether to permit 
the hcalls.

>
>> +	help
>> +	  Select this option, if you want to enable the kernel debugfs
>> +	  interface to dump the Hardware Trace Macro (HTM) function data
>> +	  in the LPAR.
>> +
>>   config HV_PERF_CTRS
>>   	bool "Hypervisor supplied PMU events (24x7 & GPCI)"
>>   	default y
>> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
>> index 7bf506f6b8c8..3f3e3492e436 100644
>> --- a/arch/powerpc/platforms/pseries/Makefile
>> +++ b/arch/powerpc/platforms/pseries/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_HVC_CONSOLE)	+= hvconsole.o
>>   obj-$(CONFIG_HVCS)		+= hvcserver.o
>>   obj-$(CONFIG_HCALL_STATS)	+= hvCall_inst.o
>>   obj-$(CONFIG_CMM)		+= cmm.o
>> +obj-$(CONFIG_HTMDUMP)		+= htmdump.o
>>   obj-$(CONFIG_IO_EVENT_IRQ)	+= io_event_irq.o
>>   obj-$(CONFIG_LPARCFG)		+= lparcfg.o
>>   obj-$(CONFIG_IBMVIO)		+= vio.o
>> diff --git a/arch/powerpc/platforms/pseries/htmdump.c b/arch/powerpc/platforms/pseries/htmdump.c
>> new file mode 100644
>> index 000000000000..540cdb7e069c
>> --- /dev/null
>> +++ b/arch/powerpc/platforms/pseries/htmdump.c
>> @@ -0,0 +1,130 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) IBM Corporation, 2024
>> + */
>> +
>> +#define pr_fmt(fmt) "htmdump: " fmt
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/string.h>
>> +#include <linux/init.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/fs.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/slab.h>
>> +#include <linux/memory.h>
>> +#include <linux/memory_hotplug.h>
>> +#include <linux/numa.h>
>> +#include <linux/memblock.h>
>> +#include <asm/machdep.h>
>> +#include <asm/plpar_wrappers.h>
> Do we need all of the above?
> e.g. slab, memory_hotplug etc are not needed IMO.
>
> Maybe only?
>
> #include <asm/hvcall.h>
> #include <asm/io.h>
> #include <asm/machdep.h>
> #include <asm/plpar_wrappers.h>
>
> #include <linux/debugfs.h>
> #include <linux/module.h>
>
> (module.h depending upon if we make it module_init())
>
Yeah, my bad, Should have handled this. will fix it in v2

>> +
>> +/* This enables us to keep track of the memory removed from each node. */
>> +struct htmdump_entry {
>> +	void *buf;
>> +	struct dentry *dir;
>> +	char name[16];
>> +};
>> +
>> +static u32 nodeindex = 0;
>> +static u32 nodalchipindex = 0;
>> +static u32 coreindexonchip = 0;
>> +static u32 htmtype = 0;
>> +
>> +#define BUFFER_SIZE PAGE_SIZE
>> +
>> +static ssize_t htmdump_read(struct file *filp, char __user *ubuf,
>> +			     size_t count, loff_t *ppos)
>> +{
>> +	struct htmdump_entry *ent = filp->private_data;
>> +	unsigned long page, read_size, available;
>> +	loff_t offset;
>> +	long rc;
>> +
>> +	page = ALIGN_DOWN(*ppos, BUFFER_SIZE);
>> +	offset = (*ppos) % BUFFER_SIZE;
>> +
>> +	rc = htm_get_dump_hardware(nodeindex, nodalchipindex, coreindexonchip,
>> +				   htmtype, virt_to_phys(ent->buf), BUFFER_SIZE, page);
>> +
>> +	switch(rc) {
>> +	case H_SUCCESS:
>> +	case H_PARTIAL:
>> +		break;
>> +	case H_NOT_AVAILABLE:
>> +		return 0;
>> +	case H_BUSY:
>> +	case H_LONG_BUSY_ORDER_1_MSEC:
>> +	case H_LONG_BUSY_ORDER_10_MSEC:
>> +	case H_LONG_BUSY_ORDER_100_MSEC:
>> +	case H_LONG_BUSY_ORDER_1_SEC:
>> +	case H_LONG_BUSY_ORDER_10_SEC:
>> +	case H_LONG_BUSY_ORDER_100_SEC:
>> +	case H_PARAMETER:
>> +	case H_P2:
>> +	case H_P3:
>> +	case H_P4:
>> +	case H_P5:
>> +	case H_P6:
>> +	case H_STATE:
>> +	case H_AUTHORITY:
>> +		return -EINVAL;
>> +	}
>> +
>> +	available = BUFFER_SIZE - offset;
>> +	read_size = min(count, available);
>> +	*ppos += read_size;
>> +	return simple_read_from_buffer(ubuf, count, &offset, ent->buf, available);
>> +}
>> +
>> +static const struct file_operations htmdump_fops = {
>> +	.llseek = default_llseek,
>> +	.read	= htmdump_read,
>> +	.open	= simple_open,
>> +};
>> +
>> +static struct dentry *htmdump_debugfs_dir;
>> +
>> +static int htmdump_init_debugfs(void)
>> +{
>> +	struct htmdump_entry *ent;
>> +
>> +	ent = kcalloc(1, sizeof(struct htmdump_entry), GFP_KERNEL);
>> +	if (!ent) {
>> +		pr_err("Failed to allocate ent\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ent->buf = kmalloc(BUFFER_SIZE, GFP_KERNEL);
>> +	if (!ent->buf) {
>> +		pr_err("Failed to allocate htmdump buf\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	pr_debug("%s: ent:%lx buf:%lx\n",
>> +			__func__, (long unsigned int)ent, (long unsigned int)ent->buf);
>> +
>> +	htmdump_debugfs_dir = debugfs_create_dir("htmdump",
>> +						  arch_debugfs_dir);
>> +
>> +	debugfs_create_u32("nodeindex", 0600,
>> +			htmdump_debugfs_dir, &nodeindex);
>> +	debugfs_create_u32("nodalchipindex", 0600,
>> +			htmdump_debugfs_dir, &nodalchipindex);
>> +	debugfs_create_u32("coreindexonchip", 0600,
>> +			htmdump_debugfs_dir, &coreindexonchip);
>> +	debugfs_create_u32("htmtype", 0600,
>> +			htmdump_debugfs_dir, &htmtype);
> minor nit: For all of the above. S_IRUSR | S_IWUSR instead of 0600.
>
>> +	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, ent, &htmdump_fops);
> maybe S_IRUSR instead of 0400.
>
> (makes it more readable).

ok will check and changes.

Thanks for the review comments.

Maddy


>
>> +
>> +	return 0;
>> +}
>> +
>> +static int htmdump_init(void)
> maybe put it into __init section?
>
>> +{
>> +	if (htmdump_init_debugfs())
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +machine_device_initcall(pseries, htmdump_init);
>> --
>> 2.45.2

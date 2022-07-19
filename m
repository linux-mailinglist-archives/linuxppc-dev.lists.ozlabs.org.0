Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55157A6F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 21:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnT1C33W4z3dBJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 05:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QL+ECp1g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=erichte@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QL+ECp1g;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnT0W4Y1Pz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 05:09:30 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JIu5m4027771;
	Tue, 19 Jul 2022 19:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hauMh6ypNwxwQwvjBt+AMlNitGE/fH59g5GbW/HDYpE=;
 b=QL+ECp1gKBmiJWs3VwsP6FwhEuEySedbDzjjjMz5liwWdY5y2fE8lgiRLuXMXrhjtqpg
 iBeCYh1kRBsvjsWZl4KP2XbZoxvss6q1PIVVwRRstTffBlVoB+SgekPqRTv4ybPJhHss
 rWTWK1p9fE9mXAM/QSeAHfFR1Y4dp58piP8UYjXxQTcrhqo8usQg9bSPXNBkW609UyfU
 ySjJmiYcMClTJRl1TxrZAW9tUeESy7Rhm4JXBqUhkR7J8nEHAnvoExmycxHOhobzjE4h
 1IvF+irpKBCmegFNXKJN0//eOSP+6NtaztyfyNE0k55v45I9Gv6gGzodjWLlog7Gjfff UQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3he2ayrf7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Jul 2022 19:09:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26JJ9LAR006238;
	Tue, 19 Jul 2022 19:09:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3hbmy8uexh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Jul 2022 19:09:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26JJ9WDT22348246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Jul 2022 19:09:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B4BB4C040;
	Tue, 19 Jul 2022 19:09:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CBF84C046;
	Tue, 19 Jul 2022 19:09:19 +0000 (GMT)
Received: from [9.160.101.12] (unknown [9.160.101.12])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 19 Jul 2022 19:09:18 +0000 (GMT)
Message-ID: <60820d8d-f608-1c4b-d8c9-48b876c3fec4@linux.ibm.com>
Date: Tue, 19 Jul 2022 14:09:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220713005947.459967-1-nayna@linux.ibm.com>
 <20220713005947.459967-2-nayna@linux.ibm.com>
From: Eric Richter <erichte@linux.ibm.com>
In-Reply-To: <20220713005947.459967-2-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KpfgdDjE21MOI16oC0kdJ1ivzVvyI3dg
X-Proofpoint-GUID: KpfgdDjE21MOI16oC0kdJ1ivzVvyI3dg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_06,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207190078
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
Cc: George Wilson <gcwilson@linux.ibm.com>, Paul Mackerras <paulus@samba.org>, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/12/22 7:59 PM, Nayna Jain wrote:
> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
> for each LPAR with individually managed access controls to store
> sensitive information securely. It provides a new set of hypervisor
> calls for Linux kernel to access PKS storage.
> 
> Define PLPKS driver using H_CALL interface to access PKS storage.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h             |   9 +
>  arch/powerpc/include/asm/plpks.h              |  90 ++++
>  arch/powerpc/platforms/pseries/Kconfig        |  13 +
>  arch/powerpc/platforms/pseries/Makefile       |   2 +
>  arch/powerpc/platforms/pseries/plpks/Makefile |   7 +
>  arch/powerpc/platforms/pseries/plpks/plpks.c  | 509 ++++++++++++++++++
>  6 files changed, 630 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/plpks.h
>  create mode 100644 arch/powerpc/platforms/pseries/plpks/Makefile
>  create mode 100644 arch/powerpc/platforms/pseries/plpks/plpks.c
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index d92a20a85395..24b661b0717c 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -97,6 +97,7 @@
>  #define H_OP_MODE	-73
>  #define H_COP_HW	-74
>  #define H_STATE		-75
> +#define H_IN_USE	-77
>  #define H_UNSUPPORTED_FLAG_START	-256
>  #define H_UNSUPPORTED_FLAG_END		-511
>  #define H_MULTI_THREADS_ACTIVE	-9005
> @@ -321,6 +322,14 @@
>  #define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_HEALTH            0x400
>  #define H_SCM_PERFORMANCE_STATS 0x418
> +#define H_PKS_GET_CONFIG	0x41C
> +#define H_PKS_SET_PASSWORD	0x420
> +#define H_PKS_GEN_PASSWORD	0x424
> +#define H_PKS_WRITE_OBJECT	0x42C
> +#define H_PKS_GEN_KEY		0x430
> +#define H_PKS_READ_OBJECT	0x434
> +#define H_PKS_REMOVE_OBJECT	0x438
> +#define H_PKS_CONFIRM_OBJECT_FLUSHED	0x43C
>  #define H_RPT_INVALIDATE	0x448
>  #define H_SCM_FLUSH		0x44C
>  #define H_GET_ENERGY_SCALE_INFO	0x450
> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
> new file mode 100644
> index 000000000000..cf60e53e1f15
> --- /dev/null
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * Platform keystore for pseries LPAR(PLPKS).
> + */
> +
> +#ifndef _PSERIES_PLPKS_H
> +#define _PSERIES_PLPKS_H
> +
> +#include <linux/types.h>
> +#include <linux/list.h>
> +
> +#define OSSECBOOTAUDIT 0x40000000
> +#define OSSECBOOTENFORCE 0x20000000
> +#define WORLDREADABLE 0x08000000
> +#define SIGNEDUPDATE 0x01000000
> +
> +#define PLPKS_VAR_LINUX	0x01
> +#define PLPKS_VAR_COMMON	0x04
> +
> +struct plpks_var {
> +	char *component;
> +	u8 os;
> +	u8 *name;
> +	u16 namelen;
> +	u32 policy;
> +	u16 datalen;
> +	u8 *data;
> +};
> +
> +struct plpks_var_name {
> +	u16 namelen;
> +	u8  *name;
> +};
> +
> +struct plpks_var_name_list {
> +	u32 varcount;
> +	struct plpks_var_name varlist[];
> +};
> +
> +struct plpks_config {
> +	u8 version;
> +	u8 flags;
> +	u32 rsvd0;
> +	u16 maxpwsize;
> +	u16 maxobjlabelsize;
> +	u16 maxobjsize;
> +	u32 totalsize;
> +	u32 usedspace;
> +	u32 supportedpolicies;
> +	u64 rsvd1;
> +} __packed;
> +
> +/**
> + * Successful return from this API  implies PKS is available.
> + * This is used to initialize kernel driver and user interfaces.
> + */
> +struct plpks_config *plpks_get_config(void);
> +
> +/**
> + * Writes the specified var and its data to PKS.
> + * Any caller of PKS driver should present a valid component type for
> + * their variable.
> + */
> +int plpks_write_var(struct plpks_var var);
> +
> +/**
> + * Removes the specified var and its data from PKS.
> + */
> +int plpks_remove_var(char *component, u8 varos,
> +		     struct plpks_var_name vname);
> +
> +/**
> + * Returns the data for the specified os variable.
> + */
> +int plpks_read_os_var(struct plpks_var *var);
> +
> +/**
> + * Returns the data for the specified firmware variable.
> + */
> +int plpks_read_fw_var(struct plpks_var *var);
> +
> +/**
> + * Returns the data for the specified bootloader variable.
> + */
> +int plpks_read_bootloader_var(struct plpks_var *var);
> +
> +#endif
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index f7fd91d153a4..de6efe5d18c2 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -142,6 +142,19 @@ config IBMEBUS
>  	help
>  	  Bus device driver for GX bus based adapters.
> 
> +config PSERIES_PLPKS
> +	depends on PPC_PSERIES
> +	tristate "Support for the Platform Key Storage"
> +	help
> +	  PowerVM provides an isolated Platform Keystore(PKS) storage
> +	  allocation for each LPAR with individually managed access
> +	  controls to store sensitive information securely. It can be
> +	  used to store asymmetric public keys or secrets as required
> +	  by different usecases. Select this config to enable
> +	  operating system interface to hypervisor to access this space.
> +
> +	  If unsure, select N.
> +
>  config PAPR_SCM
>  	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
>  	tristate "Support for the PAPR Storage Class Memory interface"
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 7aaff5323544..d6a9209e08c0 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -37,3 +37,5 @@ obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
>  # nothing that operates in real mode is safe for KASAN
>  KASAN_SANITIZE_ras.o := n
>  KASAN_SANITIZE_kexec.o := n
> +
> +obj-$(CONFIG_PSERIES_PLPKS)      += plpks/
> diff --git a/arch/powerpc/platforms/pseries/plpks/Makefile b/arch/powerpc/platforms/pseries/plpks/Makefile
> new file mode 100644
> index 000000000000..e651ace920db
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2022 IBM Corporation
> +# Author: Nayna Jain <nayna@linux.ibm.com>
> +#
> +
> +obj-$(CONFIG_PSERIES_PLPKS)  += plpks.o
> diff --git a/arch/powerpc/platforms/pseries/plpks/plpks.c b/arch/powerpc/platforms/pseries/plpks/plpks.c
> new file mode 100644
> index 000000000000..463ce93f9066
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks/plpks.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * POWER LPAR Platform KeyStore (PLPKS)
> + * Copyright (C) 2022 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * Provides access to variables stored in Power LPAR Platform KeyStore(PLPKS).
> + */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <asm/hvcall.h>
> +#include <asm/plpks.h>
> +#include <asm/unaligned.h>
> +#include <asm/machdep.h>
> +
> +#define MODULE_VERS "1.0"
> +#define MODULE_NAME "pseries-plpks"
> +
> +#define PKS_FW_OWNER   0x1
> +#define PKS_BOOTLOADER_OWNER   0x2
> +#define PKS_OS_OWNER   0x3
> +
> +#define MAX_LABEL_ATTR_SIZE 16
> +#define MAX_NAME_SIZE 239
> +#define MAX_DATA_SIZE 4000
> +
> +#define PKS_FLUSH_MAX_TIMEOUT	5000	//msec
> +#define PKS_FLUSH_SLEEP		10	//msec
> +#define PKS_FLUSH_SLEEP_RANGE	400
> +
> +static bool configset;
> +static struct plpks_config *config;
> +static u8 *ospassword;
> +static u16 ospasswordlength;
> +
> +struct plpks_auth {
> +	u8 version;
> +	u8 consumer;
> +	__be64 rsvd0;
> +	__be32 rsvd1;
> +	__be16 passwordlength;
> +	u8 password[];
> +} __packed __aligned(16);
> +
> +struct label_attr {
> +	u8 prefix[8];
> +	u8 version;
> +	u8 os;
> +	u8 length;
> +	u8 reserved[5];
> +};
> +
> +struct label {
> +	struct label_attr attr;
> +	u8 name[MAX_NAME_SIZE];
> +};
> +
> +static int pseries_status_to_err(int rc)
> +{
> +	int err;
> +
> +	switch (rc) {
> +	case H_SUCCESS:
> +		err = 0;
> +		break;
> +	case H_FUNCTION:
> +		err = -ENXIO;
> +		break;
> +	case H_P2:
> +	case H_P3:
> +	case H_P4:
> +	case H_P5:
> +	case H_P6:
> +		err = -EINVAL;
> +		break;
> +	case H_NOT_FOUND:
> +		err = -ENOENT;
> +		break;
> +	case H_BUSY:
> +		err = -EBUSY;
> +		break;
> +	case H_AUTHORITY:
> +		err = -EPERM;
> +		break;
> +	case H_NO_MEM:
> +		err = -ENOMEM;
> +		break;
> +	case H_RESOURCE:
> +		err = -EEXIST;
> +		break;
> +	case H_TOO_BIG:
> +		err = -EFBIG;
> +		break;
> +	default:
> +		err = -EINVAL;
> +	}
> +
> +	return err;
> +}
> +
> +static int plpks_gen_password(void)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	u8 consumer = PKS_OS_OWNER;
> +	int rc;
> +
> +	ospassword = kzalloc(config->maxpwsize, GFP_KERNEL);

This unconditionally allocates over ospassword -- while this function shouldn't
be called twice, it might be a good idea to place a check here anyway.

> +	if (!ospassword)
> +		return -ENOMEM;
> +
> +	ospasswordlength = config->maxpwsize;
> +	rc = plpar_hcall(H_PKS_GEN_PASSWORD,
> +			 retbuf,
> +			 consumer,
> +			 0,
> +			 virt_to_phys(ospassword),
> +			 config->maxpwsize);

Since this hcall can return an error (as we discussed off-list, returns H_IN_USE
if it is called again without a reboot), perhaps move the assignment to ospassword
after this call succeeds.

> +
> +	return pseries_status_to_err(rc);
> +}
> +
> +static int construct_auth(u8 consumer, struct plpks_auth **auth)
> +{
> +	pr_debug("max password size is %u\n", config->maxpwsize);
> +
> +	if (!auth || consumer > 3)
> +		return -EINVAL;
> +
> +	*auth = kmalloc(struct_size(*auth, password, config->maxpwsize),
> +			GFP_KERNEL);
> +	if (!*auth)
> +		return -ENOMEM;
> +
> +	(*auth)->version = 1;
> +	(*auth)->consumer = consumer;
> +	(*auth)->rsvd0 = 0;
> +	(*auth)->rsvd1 = 0;
> +	if (consumer == PKS_FW_OWNER || consumer == PKS_BOOTLOADER_OWNER) {
> +		pr_debug("consumer is bootloader or firmware\n");
> +		(*auth)->passwordlength = 0;
> +		return 0;
> +	}
> +
> +	(*auth)->passwordlength = (__force __be16)ospasswordlength;
> +
> +	memcpy((*auth)->password, ospassword,
> +	       flex_array_size(*auth, password,
> +	       (__force u16)((*auth)->passwordlength)));
> +	(*auth)->passwordlength = cpu_to_be16((__force u16)((*auth)->passwordlength));
> +
> +	return 0;
> +}
> +
> +/**
> + * Label is combination of label attributes + name.
> + * Label attributes are used internally by kernel and not exposed to the user.
> + */
> +static int construct_label(char *component, u8 varos, u8 *name, u16 namelen, u8 **label)
> +{
> +	int varlen;
> +	int len = 0;
> +	int llen = 0;
> +	int i;
> +	int rc = 0;
> +	u8 labellength = MAX_LABEL_ATTR_SIZE;
> +
> +	if (!label)
> +		return -EINVAL;
> +
> +	varlen = namelen + sizeof(struct label_attr);
> +	*label = kzalloc(varlen, GFP_KERNEL);
> +
> +	if (!*label)
> +		return -ENOMEM;
> +
> +	if (component) {
> +		len = strlen(component);
> +		memcpy(*label, component, len);

Is component a known size, or checked elsewhere to know this won't overrun?

> +	}
> +	llen = len;
> +
> +	if (component)
> +		len = 8 - strlen(component);
> +	else
> +		len = 8;
> +
> +	memset(*label + llen, 0, len);
> +	llen = llen + len;
> +
> +	((*label)[llen]) = 0;
> +	llen = llen + 1;
> +
> +	memcpy(*label + llen, &varos, 1);
> +	llen = llen + 1;
> +
> +	memcpy(*label + llen, &labellength, 1);
> +	llen = llen + 1;
> +
> +	memset(*label + llen, 0, 5);
> +	llen = llen + 5;
> +
> +	memcpy(*label + llen, name, namelen);
> +	llen = llen + namelen;
> +
> +	for (i = 0; i < llen; i++)
> +		pr_debug("%c", (*label)[i]);
> +
> +	rc = llen;
> +	return rc;
> +}
> +
> +static int _plpks_get_config(void)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	int rc;
> +	size_t size = sizeof(struct plpks_config);
> +
> +	config = kzalloc(size, GFP_KERNEL);
> +	if (!config)
> +		return -ENOMEM;
> +
> +	rc = plpar_hcall(H_PKS_GET_CONFIG,
> +			 retbuf,
> +			 virt_to_phys(config),
> +			 size);
> +
> +	if (rc != H_SUCCESS)
> +		return pseries_status_to_err(rc);
> +
> +	config->rsvd0 = be32_to_cpu((__force __be32)config->rsvd0);
> +	config->maxpwsize = be16_to_cpu((__force __be16)config->maxpwsize);
> +	config->maxobjlabelsize = be16_to_cpu((__force __be16)config->maxobjlabelsize);
> +	config->maxobjsize = be16_to_cpu((__force __be16)config->maxobjsize);
> +	config->totalsize = be32_to_cpu((__force __be32)config->totalsize);
> +	config->usedspace = be32_to_cpu((__force __be32)config->usedspace);
> +	config->supportedpolicies = be32_to_cpu((__force __be32)config->supportedpolicies);
> +	config->rsvd1 = be64_to_cpu((__force __be64)config->rsvd1);
> +
> +	configset = true;
> +
> +	return 0;
> +}
> +
> +static int plpks_confirm_object_flushed(u8 *label, u16 labellen)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	int rc;
> +	u64 timeout = 0;
> +	struct plpks_auth *auth;
> +	u8 status;
> +	int i;
> +
> +	rc = construct_auth(PKS_OS_OWNER, &auth);
> +	if (rc)
> +		return rc;
> +
> +	for (i = 0; i < labellen; i++)
> +		pr_debug("%02x ", label[i]);
> +
> +	do {
> +		rc = plpar_hcall(H_PKS_CONFIRM_OBJECT_FLUSHED,
> +				 retbuf,
> +				 virt_to_phys(auth),
> +				 virt_to_phys(label),
> +				 labellen);
> +
> +		status = retbuf[0];
> +		if (rc) {
> +			pr_info("rc is %d, status is %d\n", rc, status);
> +			if (rc == H_NOT_FOUND && status == 1)
> +				rc = 0;
> +			break;
> +		}
> +
> +		pr_debug("rc is %d, status is %d\n", rc, status);
> +
> +		if (!rc && status == 1)
> +			break;
> +
> +		usleep_range(PKS_FLUSH_SLEEP, PKS_FLUSH_SLEEP + PKS_FLUSH_SLEEP_RANGE);
> +		timeout = timeout + PKS_FLUSH_SLEEP;
> +		pr_debug("timeout is %llu\n", timeout);
> +
> +	} while (timeout < PKS_FLUSH_MAX_TIMEOUT);
> +
> +	rc = pseries_status_to_err(rc);
> +
> +	kfree(auth);
> +
> +	return rc;
> +}
> +
> +int plpks_write_var(struct plpks_var var)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	int rc;
> +	u8 *label;
> +	u16 varlen;
> +	u8 *data = var.data;
> +	struct plpks_auth *auth;
> +
> +	if (!var.component || !data || var.datalen <= 0 ||
> +	    var.namelen > MAX_NAME_SIZE ||
> +	    var.datalen > MAX_DATA_SIZE)
> +		return -EINVAL;
> +
> +	if (var.policy & SIGNEDUPDATE)
> +		return -EINVAL;
> +
> +	rc = construct_auth(PKS_OS_OWNER, &auth);
> +	if (rc)
> +		return rc;
> +
> +	rc = construct_label(var.component, var.os, var.name, var.namelen,
> +			     &label);
> +	if (rc <= 0)
> +		goto out;
> +
> +	varlen =  rc;
> +	pr_debug("Name to be written is of label size %d\n", varlen);
> +	rc = plpar_hcall(H_PKS_WRITE_OBJECT,
> +			 retbuf,
> +			 virt_to_phys(auth),
> +			 virt_to_phys(label),
> +			 varlen,
> +			 var.policy,
> +			 virt_to_phys(data),
> +			 var.datalen);
> +
> +	if (!rc)
> +		rc = plpks_confirm_object_flushed(label, varlen);
> +
> +	rc = pseries_status_to_err(rc);
> +	kfree(label);
> +
> +out:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(plpks_write_var);
> +
> +int plpks_remove_var(char *component, u8 varos, struct plpks_var_name vname)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	int rc;
> +	u8 *label;
> +	u16 varlen;
> +	struct plpks_auth *auth;
> +
> +	if (!component || vname.namelen > MAX_NAME_SIZE)
> +		return -EINVAL;
> +
> +	rc = construct_auth(PKS_OS_OWNER, &auth);
> +	if (rc)
> +		return rc;
> +
> +	rc = construct_label(component, varos, vname.name, vname.namelen, &label);
> +	if (rc <= 0)
> +		goto out;
> +
> +	varlen = rc;
> +	pr_debug("Name to be written is of label size %d\n", varlen);
> +	rc = plpar_hcall(H_PKS_REMOVE_OBJECT,
> +			 retbuf,
> +			 virt_to_phys(auth),
> +			 virt_to_phys(label),
> +			 varlen);
> +
> +	if (!rc)
> +		rc = plpks_confirm_object_flushed(label, varlen);
> +
> +	rc = pseries_status_to_err(rc);
> +	kfree(label);
> +
> +out:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(plpks_remove_var);
> +
> +static int plpks_read_var(u8 consumer, struct plpks_var *var)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	int rc;
> +	u16 outlen = config->maxobjsize;
> +	u8 *label;
> +	u8 *out;

Minor nit: there are three labels in this function with the name "out",
might be clearer to rename this variable to something like "output" instead.

> +	u16 varlen;
> +	struct plpks_auth *auth;
> +
> +	if (var->namelen > MAX_NAME_SIZE)
> +		return -EINVAL;
> +
> +	rc = construct_auth(PKS_OS_OWNER, &auth);
> +	if (rc)
> +		return rc;
> +
> +	rc = construct_label(var->component, var->os, var->name, var->namelen,
> +			     &label);
> +	if (rc <= 0)
> +		goto out;
> +
> +	varlen = rc;
> +	pr_debug("Name to be written is of label size %d\n", varlen);
> +	out = kzalloc(outlen, GFP_KERNEL);
> +	if (!out)
> +		goto out1;
> +
> +	rc = plpar_hcall(H_PKS_READ_OBJECT,
> +			 retbuf,
> +			 virt_to_phys(auth),
> +			 virt_to_phys(label),
> +			 varlen,
> +			 virt_to_phys(out),
> +			 outlen);
> +
> +	if (rc != H_SUCCESS) {
> +		pr_err("Failed to read %d\n", rc);
> +		rc = pseries_status_to_err(rc);
> +		goto out2;
> +	}
> +
> +	if (var->datalen == 0 || var->datalen > retbuf[0])
> +		var->datalen = retbuf[0];
> +
> +	var->data = kzalloc(var->datalen, GFP_KERNEL);
> +	if (!var->data) {
> +		rc = -ENOMEM;
> +		goto out2;
> +	}
> +	var->policy = retbuf[1];
> +
> +	memcpy(var->data, out, var->datalen);
> +
> +out2:
> +	kfree(out);
> +
> +out1:
> +	kfree(label);
> +
> +out:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +
> +int plpks_read_os_var(struct plpks_var *var)
> +{
> +	return plpks_read_var(PKS_OS_OWNER, var);
> +}
> +EXPORT_SYMBOL(plpks_read_os_var);
> +
> +int plpks_read_fw_var(struct plpks_var *var)
> +{
> +	return plpks_read_var(PKS_FW_OWNER, var);
> +}
> +EXPORT_SYMBOL(plpks_read_fw_var);
> +
> +int plpks_read_bootloader_var(struct plpks_var *var)
> +{
> +	return plpks_read_var(PKS_BOOTLOADER_OWNER, var);
> +}
> +EXPORT_SYMBOL(plpks_read_bootloader_var);
> +
> +struct plpks_config *plpks_get_config(void)
> +{
> +	if (!configset) {
> +		if (_plpks_get_config())
> +			return NULL;
> +	}
> +
> +	return config;
> +}
> +EXPORT_SYMBOL(plpks_get_config);
> +
> +static __init int pseries_plpks_init(void)
> +{
> +	int rc = 0;
> +
> +	rc = _plpks_get_config();
> +
> +	if (rc) {
> +		pr_err("Error initializing plpks\n");
> +		return rc;
> +	}
> +
> +	rc = plpks_gen_password();
> +	if (rc) {
> +		if (rc == H_IN_USE) {
> +			rc = 0;
> +		} else {
> +			pr_err("Failed setting password %d\n", rc);
> +			rc = pseries_status_to_err(rc);
> +			return rc;
> +		}
> +	}
> +
> +	pr_info("POWER LPAR Platform Keystore initialized successfully\n");
> +
> +	return rc;
> +}
> +arch_initcall(pseries_plpks_init);

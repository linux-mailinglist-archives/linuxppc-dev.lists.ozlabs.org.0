Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863257BB6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 18:30:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp1QW3nKpz3c6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 02:30:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGeCeQZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGeCeQZb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp1Pl17Qgz2xkX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 02:29:46 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KGRp0f024073;
	Wed, 20 Jul 2022 16:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : reply-to :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=VDnYPUMi32fMj6VX1VcLu6goRHxLJPYUo8IzkVNs+dU=;
 b=iGeCeQZb/eWAQOtlafG0eaftdyUsBRRN7KQbH4UZsoZgAqH4E4dFc1usZmNoa+xhNQSo
 RLOxvUEYw59VYmuxgF2MagcWwuCcgfS0eYjooB+613Txif8S+FEAA4glvOQNK6oKzw9V
 KoPgePshKltTA12uXAC5sz4t0HVxEJxAjA0vYDrsZZ02V/QFjfCBptQdX+RwS07CK7WI
 vTipEXzBQ99+Q1T0OH0i8yPN7ph+EDD+AXqHll/zlgDBOURzXk7iEXKwkCwitHHOlkeJ
 4YiDHxgqfQYWWv1ijYa16W2vPHfbWFQ1tXhxSIUdFTdUHqipCvLHBAsTHDrU/Xf/oNXZ 5A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hen8901pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 16:29:43 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26KGLjYP002124;
	Wed, 20 Jul 2022 16:29:42 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma02wdc.us.ibm.com with ESMTP id 3hbmy9jr09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 16:29:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26KGTdHN40698284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Jul 2022 16:29:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A017805E;
	Wed, 20 Jul 2022 16:29:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CC1E7805C;
	Wed, 20 Jul 2022 16:29:38 +0000 (GMT)
Received: from [9.65.226.132] (unknown [9.65.226.132])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Wed, 20 Jul 2022 16:29:38 +0000 (GMT)
Message-ID: <4aca8069-d0c6-1546-7f02-16b18924f316@linux.ibm.com>
Date: Wed, 20 Jul 2022 13:29:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220713005947.459967-1-nayna@linux.ibm.com>
 <20220713005947.459967-2-nayna@linux.ibm.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220713005947.459967-2-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y83OftL1Y5-msRht5e3Oy9CNXiDhVero
X-Proofpoint-GUID: y83OftL1Y5-msRht5e3Oy9CNXiDhVero
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_10,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207200066
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
Reply-To: muriloo@linux.ibm.com
Cc: George Wilson <gcwilson@linux.ibm.com>, Paul Mackerras <paulus@samba.org>, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Nayna.

Some comments below.

On 7/12/22 21:59, Nayna Jain wrote:
> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
> for each LPAR with individually managed access controls to store
> sensitive information securely. It provides a new set of hypervisor
> calls for Linux kernel to access PKS storage.

I think it would be nice to have some consistency as to spaces before
acronymous, e.g.: "Keystore(PKS)" vs. "Keystore (PKS)". The same could
be applied to "Keystore" vs. "KeyStore" vs. "Key Storage".

>
> Define PLPKS driver using H_CALL interface to access PKS storage.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/hvcall.h             |   9 +
>   arch/powerpc/include/asm/plpks.h              |  90 ++++
>   arch/powerpc/platforms/pseries/Kconfig        |  13 +
>   arch/powerpc/platforms/pseries/Makefile       |   2 +
>   arch/powerpc/platforms/pseries/plpks/Makefile |   7 +
>   arch/powerpc/platforms/pseries/plpks/plpks.c  | 509 ++++++++++++++++++
>   6 files changed, 630 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/plpks.h
>   create mode 100644 arch/powerpc/platforms/pseries/plpks/Makefile
>   create mode 100644 arch/powerpc/platforms/pseries/plpks/plpks.c
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index d92a20a85395..24b661b0717c 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -97,6 +97,7 @@
>   #define H_OP_MODE	-73
>   #define H_COP_HW	-74
>   #define H_STATE		-75
> +#define H_IN_USE	-77
>   #define H_UNSUPPORTED_FLAG_START	-256
>   #define H_UNSUPPORTED_FLAG_END		-511
>   #define H_MULTI_THREADS_ACTIVE	-9005
> @@ -321,6 +322,14 @@
>   #define H_SCM_UNBIND_ALL        0x3FC
>   #define H_SCM_HEALTH            0x400
>   #define H_SCM_PERFORMANCE_STATS 0x418
> +#define H_PKS_GET_CONFIG	0x41C
> +#define H_PKS_SET_PASSWORD	0x420
> +#define H_PKS_GEN_PASSWORD	0x424
> +#define H_PKS_WRITE_OBJECT	0x42C
> +#define H_PKS_GEN_KEY		0x430
> +#define H_PKS_READ_OBJECT	0x434
> +#define H_PKS_REMOVE_OBJECT	0x438
> +#define H_PKS_CONFIRM_OBJECT_FLUSHED	0x43C
>   #define H_RPT_INVALIDATE	0x448
>   #define H_SCM_FLUSH		0x44C
>   #define H_GET_ENERGY_SCALE_INFO	0x450
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
>   	help
>   	  Bus device driver for GX bus based adapters.
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
>   config PAPR_SCM
>   	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
>   	tristate "Support for the PAPR Storage Class Memory interface"
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 7aaff5323544..d6a9209e08c0 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -37,3 +37,5 @@ obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
>   # nothing that operates in real mode is safe for KASAN
>   KASAN_SANITIZE_ras.o := n
>   KASAN_SANITIZE_kexec.o := n
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

Shouldn't we handle other platform return codes, e.g.: H_STATE,
H_IN_USE?

> +
> +static int plpks_gen_password(void)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = {0};
> +	u8 consumer = PKS_OS_OWNER;
> +	int rc;
> +
> +	ospassword = kzalloc(config->maxpwsize, GFP_KERNEL);
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

The rc value will never be H_IN_USE here because
pseries_status_to_err() is called within plpks_gen_password() before
returning and the plpar_hcall() return code is not propagated. You
will get -EINVAL here if plpar_hcall() returned H_IN_USE.

I think we could enhance the error handling to print messages like
"PKS not supported", "PKS access blocked due to partition state", and
"PKS password already in use". I bet these messages will help
troubleshooting issues.

> +			rc = 0;
> +		} else {
> +			pr_err("Failed setting password %d\n", rc);
> +			rc = pseries_status_to_err(rc);

Here, pseries_status_to_err() is called again (it was already called
within plpks_gen_password()). After calling it twice, the rc will
always be -EINVAL here, won't it?

> +			return rc;
> +		}
> +	}
> +
> +	pr_info("POWER LPAR Platform Keystore initialized successfully\n");
> +
> +	return rc;
> +}
> +arch_initcall(pseries_plpks_init);

--
Murilo


-- 
Murilo

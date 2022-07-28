Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C445847B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 23:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv3lc464xz2ypH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 07:32:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PPCBn/Pi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PPCBn/Pi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltt2f46rQz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 00:15:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SDrhYt018714;
	Thu, 28 Jul 2022 14:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=Stx0WxxGncDn6pKdbmZvztIz58xwy8SRLdOlvp41D5k=;
 b=PPCBn/PiK8sCcf6hL6KYqPIIIxwpJtLkpCQDzn3pwnumYL7vm/Z3EchgtyBaeicTVvj4
 /iN9FdxRLMCRtL2PsuGvSkiQh24uRjBe+TQhxOBATEe33tymx4mg2L5VbXHLiSjdNimJ
 MAYiOHYmb5y9YsDbVadafijaEG+nAEo3jabZBXlZlokdKkeJKz0mjyBu4JDbowd98nCV
 6ckidYyOG9vvypkmKv4boRGVkakXWem2aOjas971qHqmyIRZA6k3KIGB38/bwPjCO5f+
 9wcbXBjjmCz+LfVpueUnvyU68FBDl2dbOrqia5DRdmCySGmBS2+8RhnteTnZdyB93UiA GA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkur80ya2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Jul 2022 14:14:56 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26SDt3dr027566;
	Thu, 28 Jul 2022 14:14:55 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hkur80y9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Jul 2022 14:14:55 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26SE5LWs004683;
	Thu, 28 Jul 2022 14:14:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma04dal.us.ibm.com with ESMTP id 3hg98a7u2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Jul 2022 14:14:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26SEErvU20447942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Jul 2022 14:14:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A02A6A04D;
	Thu, 28 Jul 2022 14:14:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CFBE6A047;
	Thu, 28 Jul 2022 14:14:52 +0000 (GMT)
Received: from sig-9-77-138-167.ibm.com (unknown [9.77.138.167])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 28 Jul 2022 14:14:52 +0000 (GMT)
Message-ID: <93b6798994a2389d5b15e3c24aceda717fdbd2fe.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: define driver for Platform
 KeyStore
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 28 Jul 2022 09:14:51 -0500
In-Reply-To: <20220723113048.521744-2-nayna@linux.ibm.com>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
	 <20220723113048.521744-2-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HbahUz6zM1j7IZrsD0MjHUDc6SAPJwID
X-Proofpoint-ORIG-GUID: M66MHqfJGPCnBSgP_Q8BPpCM-trYNPQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207280063
X-Mailman-Approved-At: Fri, 29 Jul 2022 07:32:08 +1000
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: erichte@linux.ibm.com, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Tested-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>

On Sat, 2022-07-23 at 07:30 -0400, Nayna Jain wrote:
> PowerVM provides an isolated Platform Keystore(PKS) storage
> allocation
> for each LPAR with individually managed access controls to store
> sensitive information securely. It provides a new set of hypervisor
> calls for Linux kernel to access PKS storage.
> 
> Define POWER LPAR Platform KeyStore(PLPKS) driver using H_CALL
> interface
> to access PKS storage.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h       |  11 +
>  arch/powerpc/platforms/pseries/Kconfig  |  13 +
>  arch/powerpc/platforms/pseries/Makefile |   1 +
>  arch/powerpc/platforms/pseries/plpks.c  | 460
> ++++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/plpks.h  |  71 ++++
>  5 files changed, 556 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/plpks.c
>  create mode 100644 arch/powerpc/platforms/pseries/plpks.h
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h
> b/arch/powerpc/include/asm/hvcall.h
> index d92a20a85395..9f707974af1a 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -79,6 +79,7 @@
>  #define H_NOT_ENOUGH_RESOURCES -44
>  #define H_R_STATE       -45
>  #define H_RESCINDED     -46
> +#define H_P1		-54
>  #define H_P2		-55
>  #define H_P3		-56
>  #define H_P4		-57
> @@ -97,6 +98,8 @@
>  #define H_OP_MODE	-73
>  #define H_COP_HW	-74
>  #define H_STATE		-75
> +#define H_IN_USE	-77
> +#define H_ABORTED	-78
>  #define H_UNSUPPORTED_FLAG_START	-256
>  #define H_UNSUPPORTED_FLAG_END		-511
>  #define H_MULTI_THREADS_ACTIVE	-9005
> @@ -321,6 +324,14 @@
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
> diff --git a/arch/powerpc/platforms/pseries/Kconfig
> b/arch/powerpc/platforms/pseries/Kconfig
> index f7fd91d153a4..c4a6d4083a7a 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -142,6 +142,19 @@ config IBMEBUS
>  	help
>  	  Bus device driver for GX bus based adapters.
> 
> +config PSERIES_PLPKS
> +	depends on PPC_PSERIES
> +	bool "Support for the Platform Key Storage"
> +	help
> +	  PowerVM provides an isolated Platform Keystore(PKS) storage
> +	  allocation for each LPAR with individually managed access
> +	  controls to store sensitive information securely. It can be
> +	  used to store asymmetric public keys or secrets as required
> +	  by different usecases. Select this config to enable
> +	  operating system interface to hypervisor to access this
> space.
> +
> +	  If unsure, select N.
> +
>  config PAPR_SCM
>  	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
>  	tristate "Support for the PAPR Storage Class Memory interface"
> diff --git a/arch/powerpc/platforms/pseries/Makefile
> b/arch/powerpc/platforms/pseries/Makefile
> index 7aaff5323544..14e143b946a3 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
>  obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
>  obj-$(CONFIG_PPC_SVM)		+= svm.o
>  obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
> +obj-$(CONFIG_PSERIES_PLPKS) += plpks.o
> 
>  obj-$(CONFIG_SUSPEND)		+= suspend.o
>  obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
> diff --git a/arch/powerpc/platforms/pseries/plpks.c
> b/arch/powerpc/platforms/pseries/plpks.c
> new file mode 100644
> index 000000000000..52aaa2894606
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -0,0 +1,460 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * POWER LPAR Platform KeyStore(PLPKS)
> + * Copyright (C) 2022 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + * Provides access to variables stored in Power LPAR Platform
> KeyStore(PLPKS).
> + */
> +
> +#define pr_fmt(fmt) "plpks: " fmt
> +
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <asm/hvcall.h>
> +
> +#include "plpks.h"
> +
> +#define PKS_FW_OWNER	     0x1
> +#define PKS_BOOTLOADER_OWNER 0x2
> +#define PKS_OS_OWNER	     0x3
> +
> +#define LABEL_VERSION	    0
> +#define MAX_LABEL_ATTR_SIZE 16
> +#define MAX_NAME_SIZE	    239
> +#define MAX_DATA_SIZE	    4000
> +
> +#define PKS_FLUSH_MAX_TIMEOUT 5000 //msec
> +#define PKS_FLUSH_SLEEP	      10 //msec
> +#define PKS_FLUSH_SLEEP_RANGE 400
> +
> +static u8 *ospassword;
> +static u16 ospasswordlength;
> +
> +// Retrieved with H_PKS_GET_CONFIG
> +static u16 maxpwsize;
> +static u16 maxobjsize;
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
> +	size_t size;
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
> +	case H_P1:
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
> +	case H_STATE:
> +		err = -EIO;
> +		break;
> +	case H_R_STATE:
> +		err = -EIO;
> +		break;
> +	case H_IN_USE:
> +		err = -EEXIST;
> +		break;
> +	case H_ABORTED:
> +		err = -EINTR;
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
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	u8 *password, consumer = PKS_OS_OWNER;
> +	int rc;
> +
> +	password = kzalloc(maxpwsize, GFP_KERNEL);
> +	if (!password)
> +		return -ENOMEM;
> +
> +	rc = plpar_hcall(H_PKS_GEN_PASSWORD, retbuf, consumer, 0,
> +			 virt_to_phys(password), maxpwsize);
> +
> +	if (!rc) {
> +		ospasswordlength = maxpwsize;
> +		ospassword = kzalloc(maxpwsize, GFP_KERNEL);
> +		if (!ospassword) {
> +			kfree(password);
> +			return -ENOMEM;
> +		}
> +		memcpy(ospassword, password, ospasswordlength);
> +	} else {
> +		if (rc == H_IN_USE) {
> +			pr_warn("Password is already set for POWER LPAR
> Platform KeyStore\n");
> +			rc = 0;
> +		} else {
> +			goto out;
> +		}
> +	}
> +out:
> +	kfree(password);
> +
> +	return pseries_status_to_err(rc);
> +}
> +
> +static struct plpks_auth *construct_auth(u8 consumer)
> +{
> +	struct plpks_auth *auth;
> +
> +	if (consumer > PKS_OS_OWNER)
> +		return ERR_PTR(-EINVAL);
> +
> +	auth = kmalloc(struct_size(auth, password, maxpwsize),
> GFP_KERNEL);
> +	if (!auth)
> +		return ERR_PTR(-ENOMEM);
> +
> +	auth->version = 1;
> +	auth->consumer = consumer;
> +	auth->rsvd0 = 0;
> +	auth->rsvd1 = 0;
> +
> +	if (consumer == PKS_FW_OWNER || consumer ==
> PKS_BOOTLOADER_OWNER) {
> +		auth->passwordlength = 0;
> +		return auth;
> +	}
> +
> +	memcpy(auth->password, ospassword, ospasswordlength);
> +
> +	auth->passwordlength = cpu_to_be16(ospasswordlength);
> +
> +	return auth;
> +}
> +
> +/**
> + * Label is combination of label attributes + name.
> + * Label attributes are used internally by kernel and not exposed to
> the user.
> + */
> +static struct label *construct_label(char *component, u8 varos, u8
> *name,
> +				     u16 namelen)
> +{
> +	struct label *label;
> +	size_t slen;
> +
> +	if (!name || namelen > MAX_NAME_SIZE)
> +		return ERR_PTR(-EINVAL);
> +
> +	slen = strlen(component);
> +	if (component && slen > sizeof(label->attr.prefix))
> +		return ERR_PTR(-EINVAL);
> +
> +	label = kzalloc(sizeof(*label), GFP_KERNEL);
> +	if (!label)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (component)
> +		memcpy(&label->attr.prefix, component, slen);
> +
> +	label->attr.version = LABEL_VERSION;
> +	label->attr.os = varos;
> +	label->attr.length = MAX_LABEL_ATTR_SIZE;
> +	memcpy(&label->name, name, namelen);
> +
> +	label->size = sizeof(struct label_attr) + namelen;
> +
> +	return label;
> +}
> +
> +static int _plpks_get_config(void)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	struct {
> +		u8 version;
> +		u8 flags;
> +		__be32 rsvd0;
> +		__be16 maxpwsize;
> +		__be16 maxobjlabelsize;
> +		__be16 maxobjsize;
> +		__be32 totalsize;
> +		__be32 usedspace;
> +		__be32 supportedpolicies;
> +		__be64 rsvd1;
> +	} __packed config;
> +	size_t size;
> +	int rc;
> +
> +	size = sizeof(config);
> +
> +	rc = plpar_hcall(H_PKS_GET_CONFIG, retbuf,
> virt_to_phys(&config), size);
> +
> +	if (rc != H_SUCCESS)
> +		return pseries_status_to_err(rc);
> +
> +	maxpwsize = be16_to_cpu(config.maxpwsize);
> +	maxobjsize = be16_to_cpu(config.maxobjsize);
> +
> +	return 0;
> +}
> +
> +static int plpks_confirm_object_flushed(struct label *label,
> +					struct plpks_auth *auth)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	u64 timeout = 0;
> +	u8 status;
> +	int rc;
> +
> +	do {
> +		rc = plpar_hcall(H_PKS_CONFIRM_OBJECT_FLUSHED, retbuf,
> +				 virt_to_phys(auth),
> virt_to_phys(label),
> +				 label->size);
> +
> +		status = retbuf[0];
> +		if (rc) {
> +			if (rc == H_NOT_FOUND && status == 1)
> +				rc = 0;
> +			break;
> +		}
> +
> +		if (!rc && status == 1)
> +			break;
> +
> +		usleep_range(PKS_FLUSH_SLEEP,
> +			     PKS_FLUSH_SLEEP + PKS_FLUSH_SLEEP_RANGE);
> +		timeout = timeout + PKS_FLUSH_SLEEP;
> +	} while (timeout < PKS_FLUSH_MAX_TIMEOUT);
> +
> +	rc = pseries_status_to_err(rc);
> +
> +	return rc;
> +}
> +
> +int plpks_write_var(struct plpks_var var)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	struct plpks_auth *auth;
> +	struct label *label;
> +	int rc;
> +
> +	if (!var.component || !var.data || var.datalen <= 0 ||
> +	    var.namelen > MAX_NAME_SIZE || var.datalen > MAX_DATA_SIZE)
> +		return -EINVAL;
> +
> +	if (var.policy & SIGNEDUPDATE)
> +		return -EINVAL;
> +
> +	auth = construct_auth(PKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	label = construct_label(var.component, var.os, var.name,
> var.namelen);
> +	if (IS_ERR(label)) {
> +		rc = PTR_ERR(label);
> +		goto out;
> +	}
> +
> +	rc = plpar_hcall(H_PKS_WRITE_OBJECT, retbuf,
> virt_to_phys(auth),
> +			 virt_to_phys(label), label->size, var.policy,
> +			 virt_to_phys(var.data), var.datalen);
> +
> +	if (!rc)
> +		rc = plpks_confirm_object_flushed(label, auth);
> +
> +	if (rc)
> +		pr_err("Failed to write variable %s for component %s
> with error %d\n",
> +		       var.name, var.component, rc);
> +
> +	rc = pseries_status_to_err(rc);
> +	kfree(label);
> +out:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +
> +int plpks_remove_var(char *component, u8 varos, struct
> plpks_var_name vname)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	struct plpks_auth *auth;
> +	struct label *label;
> +	int rc;
> +
> +	if (!component || vname.namelen > MAX_NAME_SIZE)
> +		return -EINVAL;
> +
> +	auth = construct_auth(PKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	label = construct_label(component, varos, vname.name,
> vname.namelen);
> +	if (IS_ERR(label)) {
> +		rc = PTR_ERR(label);
> +		goto out;
> +	}
> +
> +	rc = plpar_hcall(H_PKS_REMOVE_OBJECT, retbuf,
> virt_to_phys(auth),
> +			 virt_to_phys(label), label->size);
> +
> +	if (!rc)
> +		rc = plpks_confirm_object_flushed(label, auth);
> +
> +	if (rc)
> +		pr_err("Failed to remove variable %s for component %s
> with error %d\n",
> +		       vname.name, component, rc);
> +
> +	rc = pseries_status_to_err(rc);
> +	kfree(label);
> +out:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +
> +static int plpks_read_var(u8 consumer, struct plpks_var *var)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
> +	struct plpks_auth *auth;
> +	struct label *label;
> +	u8 *output;
> +	int rc;
> +
> +	if (var->namelen > MAX_NAME_SIZE)
> +		return -EINVAL;
> +
> +	auth = construct_auth(PKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	label = construct_label(var->component, var->os, var->name,
> +				var->namelen);
> +	if (IS_ERR(label)) {
> +		rc = PTR_ERR(label);
> +		goto out_free_auth;
> +	}
> +
> +	output = kzalloc(maxobjsize, GFP_KERNEL);
> +	if (!output) {
> +		rc = -ENOMEM;
> +		goto out_free_label;
> +	}
> +
> +	rc = plpar_hcall(H_PKS_READ_OBJECT, retbuf, virt_to_phys(auth),
> +			 virt_to_phys(label), label->size,
> virt_to_phys(output),
> +			 maxobjsize);
> +
> +	if (rc != H_SUCCESS) {
> +		pr_err("Failed to read variable %s for component %s
> with error %d\n",
> +		       var->name, var->component, rc);
> +		rc = pseries_status_to_err(rc);
> +		goto out_free_output;
> +	}
> +
> +	if (var->datalen == 0 || var->datalen > retbuf[0])
> +		var->datalen = retbuf[0];
> +
> +	var->data = kzalloc(var->datalen, GFP_KERNEL);
> +	if (!var->data) {
> +		rc = -ENOMEM;
> +		goto out_free_output;
> +	}
> +	var->policy = retbuf[1];
> +
> +	memcpy(var->data, output, var->datalen);
> +	rc = 0;
> +
> +out_free_output:
> +	kfree(output);
> +out_free_label:
> +	kfree(label);
> +out_free_auth:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +
> +int plpks_read_os_var(struct plpks_var *var)
> +{
> +	return plpks_read_var(PKS_OS_OWNER, var);
> +}
> +
> +int plpks_read_fw_var(struct plpks_var *var)
> +{
> +	return plpks_read_var(PKS_FW_OWNER, var);
> +}
> +
> +int plpks_read_bootloader_var(struct plpks_var *var)
> +{
> +	return plpks_read_var(PKS_BOOTLOADER_OWNER, var);
> +}
> +
> +static __init int pseries_plpks_init(void)
> +{
> +	int rc;
> +
> +	rc = _plpks_get_config();
> +
> +	if (rc) {
> +		pr_err("POWER LPAR Platform KeyStore is not supported
> or enabled\n");
> +		return rc;
> +	}
> +
> +	rc = plpks_gen_password();
> +	if (rc)
> +		pr_err("Failed setting POWER LPAR Platform KeyStore
> Password\n");
> +	else
> +		pr_info("POWER LPAR Platform KeyStore initialized
> successfully\n");
> +
> +	return rc;
> +}
> +arch_initcall(pseries_plpks_init);
> diff --git a/arch/powerpc/platforms/pseries/plpks.h
> b/arch/powerpc/platforms/pseries/plpks.h
> new file mode 100644
> index 000000000000..c6a291367bb1
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks.h
> @@ -0,0 +1,71 @@
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
> +	u8 *name;
> +	u8 *data;
> +	u32 policy;
> +	u16 namelen;
> +	u16 datalen;
> +	u8 os;
> +};
> +
> +struct plpks_var_name {
> +	u8  *name;
> +	u16 namelen;
> +};
> +
> +struct plpks_var_name_list {
> +	u32 varcount;
> +	struct plpks_var_name varlist[];
> +};
> +
> +/**
> + * Writes the specified var and its data to PKS.
> + * Any caller of PKS driver should present a valid component type
> for
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


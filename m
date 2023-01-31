Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EC168336B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:12:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5s6f2gb7z3bbD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 04:12:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZVV1N5+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZVV1N5+;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5s5g2m7jz3bWw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 04:11:18 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VH15qU006846;
	Tue, 31 Jan 2023 17:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M7hCoyZ3GgR+amA9q/k7HjtRzlO4PgcMJF/4giftCM8=;
 b=rZVV1N5+saHTn2gSuqlmRcwwHrq2PjK+7gn3bE3/EdSQ63CJdC0ndSy985foHs1BkJSE
 2Q6AF/KKDm9CDh3Mc6lGUWm/QmGxuFRiHV0ew/gPKhci++h3IFSxnmD+uqGTCIyE4xv9
 +/Z55Q+8vGNaFOoh2+R/VRO3iGEwLsiAIJlpndmMAnSZAS6k7rYD73CmDQtoVaQi6xWZ
 n9pocEOyRI93zqiZAWdBEEA9hAad6o1fYl0vgOH6YgMNjmIrLoIksyGKrLqu6F/TD3wV
 JD1/Dz7q4ihBzBviTW5mQONUYBoQJfK8M+spbDV1CJflFhrK7ELRY2OJ4J8LpqwpEvMP vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf71389gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 17:11:11 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VH29Uv011119;
	Tue, 31 Jan 2023 17:11:10 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf71389gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 17:11:10 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VFYniQ028526;
	Tue, 31 Jan 2023 17:11:10 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ncvuyh4us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 17:11:09 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30VHB83b4195040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Jan 2023 17:11:08 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 632CD5805D;
	Tue, 31 Jan 2023 17:11:08 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0A175805B;
	Tue, 31 Jan 2023 17:11:06 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 31 Jan 2023 17:11:06 +0000 (GMT)
Message-ID: <00aa1164-5a90-7a72-1f0d-67a9561419cb@linux.ibm.com>
Date: Tue, 31 Jan 2023 12:11:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 23/25] powerpc/pseries: Implement secvars for dynamic
 secure boot
Content-Language: en-US
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
References: <20230131063928.388035-1-ajd@linux.ibm.com>
 <20230131063928.388035-24-ajd@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230131063928.388035-24-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1E705dE470KAiLvMfjnygqEIpxPr265A
X-Proofpoint-GUID: CD8E6qTF5dPL7IAW1oCICCb3SXfgW7L-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310150
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/31/23 01:39, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
> 
> The pseries platform can support dynamic secure boot (i.e. secure boot
> using user-defined keys) using variables contained with the PowerVM LPAR
> Platform KeyStore (PLPKS).  Using the powerpc secvar API, expose the
> relevant variables for pseries dynamic secure boot through the existing
> secvar filesystem layout.
> 
> The relevant variables for dynamic secure boot are signed in the
> keystore, and can only be modified using the H_PKS_SIGNED_UPDATE hcall.
> Object labels in the keystore are encoded using ucs2 format.  With our
> fixed variable names we don't have to care about encoding outside of the
> necessary byte padding.
> 
> When a user writes to a variable, the first 8 bytes of data must contain
> the signed update flags as defined by the hypervisor.
> 
> When a user reads a variable, the first 4 bytes of data contain the
> policies defined for the object.
> 
> Limitations exist due to the underlying implementation of sysfs binary
> attributes, as is the case for the OPAL secvar implementation -
> partial writes are unsupported and writes cannot be larger than PAGE_SIZE.
> (Even when using bin_attributes, which can be larger than a single page,
> sysfs only gives us one page's worth of write buffer at a time, and the
> hypervisor does not expose an interface for partial writes.)
> 
> Co-developed-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> 
> ---
> 
> v2: Remove unnecessary config vars from sysfs and document the others,
>      thanks to review from Greg.  If we end up needing to expose more, we
>      can add them later and update the docs.
> 
>      Use sysfs_emit() instead of sprintf(), thanks to Greg.
> 
>      Change the size of the sysfs binary attributes to include the 8-byte
>      flags header, preventing truncation of large writes.
> 
> v3: plpks_set_variable(): pass var to plpks_signed_update_var() as a
>      pointer (mpe)
> 
>      Update copyright date (ajd)
> 
>      Consistent comment style (ajd)
> 
>      Change device_initcall() to machine_arch_initcall(pseries...) so we
>      don't try to load on powernv and kill the machine (mpe)
> 
>      Add config attributes into plpks_secvar_ops (mpe)
> 
>      Get rid of PLPKS_SECVAR_COUNT macro (mpe)
> 
>      Reworded descriptions in ABI documentation (mpe)
> 
>      Switch to using secvar_ops->var_names rather than
>      secvar_ops->get_next() (ajd/mpe)
> 
>      Optimise allocation/copying of buffers (mpe)
> 
>      Elaborate the comment documenting the "format" string (mpe)
> 
>      Return -EIO on errors in the read case (mpe)
> 
>      Add "grubdbx" variable (Sudhakar Kuppusamy)
> 
>      Use utf8s_to_utf16s() rather than our own "UCS-2" conversion code (mpe)
> 
>      Change uint64_t to u64 (mpe)
> 
>      Fix SB_VERSION data length (ruscur)
> 
>      Stop prepending policy data on read (ruscur)
> 
>      Enforce max format length on format string (not strictly needed, but
>      makes the length limit clear) (ajd)
> 
>      Update include of plpks.h to reflect new path (ruscur)
> 
>      Consistent constant naming scheme (ruscur)
> 
> v4: Return set_secvar_ops() return code
> 
>      Pass buffer size to plpks_secvar_format() (stefanb, npiggin)
> 
>      Add missing null check (stefanb)
> 
>      Add comment to commit message explaining PAGE_SIZE write limit (joel)
> 
> v5: Add comment explaining why we use "key_len - 1" (npiggin)
> 
>      Use strlen(var.name) instead of hardcoding 10 as length of
>      "SB_VERSION" (npiggin)
> 
>      Improve comments about use of SB_VERSION and format string (npiggin)
> 
>      Change "+ 8" to "+ sizeof(u64)" when accounting for flags size in
>      working out file's max size (npiggin)
> 
>      Compile plpks-secvar.c based on CONFIG_PPC_SECURE_BOOT, not
>      CONFIG_PPC_SECVAR_SYSFS, as the secvar backend is needed for loading
>      keys into keyrings even if the sysfs interface is disabled (ajd)
> ---
>   Documentation/ABI/testing/sysfs-secvar        |  75 +++++-
>   arch/powerpc/platforms/pseries/Makefile       |   4 +-
>   arch/powerpc/platforms/pseries/plpks-secvar.c | 219 ++++++++++++++++++
>   3 files changed, 295 insertions(+), 3 deletions(-)
>   create mode 100644 arch/powerpc/platforms/pseries/plpks-secvar.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> index feebb8c57294..a19f4d5fcec6 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -18,6 +18,14 @@ Description:	A string indicating which backend is in use by the firmware.
>   		This determines the format of the variable and the accepted
>   		format of variable updates.
>   
> +		On powernv/OPAL, this value is provided by the OPAL firmware
> +		and is expected to be "ibm,edk2-compat-v1".
> +
> +		On pseries/PLPKS, this is generated by the kernel based on the
> +		version number in the SB_VERSION variable in the keystore, and
> +		has the form "ibm,plpks-sb-v<version>", or
> +		"ibm,plpks-sb-unknown" if there is no SB_VERSION variable.
> +
>   What:		/sys/firmware/secvar/vars/<variable name>
>   Date:		August 2019
>   Contact:	Nayna Jain <nayna@linux.ibm.com>
> @@ -34,7 +42,7 @@ Description:	An integer representation of the size of the content of the
>   
>   What:		/sys/firmware/secvar/vars/<variable_name>/data
>   Date:		August 2019
> -Contact:	Nayna Jain h<nayna@linux.ibm.com>
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
>   Description:	A read-only file containing the value of the variable. The size
>   		of the file represents the maximum size of the variable data.
>   
> @@ -44,3 +52,68 @@ Contact:	Nayna Jain <nayna@linux.ibm.com>
>   Description:	A write-only file that is used to submit the new value for the
>   		variable. The size of the file represents the maximum size of
>   		the variable data that can be written.
> +
> +What:		/sys/firmware/secvar/config
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	This optional directory contains read-only config attributes as
> +		defined by the secure variable implementation.  All data is in
> +		ASCII format. The directory is only created if the backing
> +		implementation provides variables to populate it, which at
> +		present is only PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/version
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Config version as reported by the hypervisor in ASCII decimal
> +		format.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/max_object_size
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Maximum allowed size of	objects in the keystore in bytes,
> +		represented in ASCII decimal format.
> +
> +		This is not necessarily the same as the max size that can be
> +		written to an update file as writes can contain more than
> +		object data, you should use the size of the update file for
> +		that purpose.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/total_size
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Total size of the PLPKS in bytes, represented in ASCII decimal
> +		format.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/used_space
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Current space consumed by the key store, in bytes, represented
> +		in ASCII decimal format.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/supported_policies
> +Date:		December 2022
> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Bitmask of supported policy flags by the hypervisor,
> +		represented as an 8 byte hexadecimal ASCII string. Consult the
> +		hypervisor documentation for what these flags are.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> +
> +What:		/sys/firmware/secvar/config/signed_update_algorithms
> +Date:		December 2022

Need to update date now ?

> +Contact:	Nayna Jain <nayna@linux.ibm.com>
> +Description:	Bitmask of flags indicating which algorithms the hypervisor
> +		supports for signed update of objects, represented as a 16 byte
> +		hexadecimal ASCII string. Consult the hypervisor documentation
> +		for what these flags mean.
> +
> +		Currently only provided by PLPKS on the pseries platform.
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 92310202bdd7..20a0f3c3fe04 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -27,8 +27,8 @@ obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
>   obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
>   obj-$(CONFIG_PPC_SVM)		+= svm.o
>   obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
> -obj-$(CONFIG_PSERIES_PLPKS) += plpks.o
> -
> +obj-$(CONFIG_PSERIES_PLPKS)	+= plpks.o
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= plpks-secvar.o
>   obj-$(CONFIG_SUSPEND)		+= suspend.o
>   obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
>   
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> new file mode 100644
> index 000000000000..04e6cc3f9dd8
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +// Secure variable implementation using the PowerVM LPAR Platform KeyStore (PLPKS)
> +//
> +// Copyright 2022, 2023 IBM Corporation
> +// Authors: Russell Currey
> +//          Andrew Donnellan
> +//          Nayna Jain
> +
> +#define pr_fmt(fmt) "secvar: "fmt
> +
> +#include <linux/printk.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/kobject.h>
> +#include <linux/nls.h>
> +#include <asm/machdep.h>
> +#include <asm/secvar.h>
> +#include <asm/plpks.h>
> +
> +// Config attributes for sysfs
> +#define PLPKS_CONFIG_ATTR(name, fmt, func)			\
> +	static ssize_t name##_show(struct kobject *kobj,	\
> +				   struct kobj_attribute *attr,	\
> +				   char *buf)			\
> +	{							\
> +		return sysfs_emit(buf, fmt, func());		\
> +	}							\
> +	static struct kobj_attribute attr_##name = __ATTR_RO(name)
> +
> +PLPKS_CONFIG_ATTR(version, "%u\n", plpks_get_version);
> +PLPKS_CONFIG_ATTR(max_object_size, "%u\n", plpks_get_maxobjectsize);
> +PLPKS_CONFIG_ATTR(total_size, "%u\n", plpks_get_totalsize);
> +PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
> +PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
> +PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n", plpks_get_signedupdatealgorithms);
> +
> +static const struct attribute *config_attrs[] = {
> +	&attr_version.attr,
> +	&attr_max_object_size.attr,
> +	&attr_total_size.attr,
> +	&attr_used_space.attr,
> +	&attr_supported_policies.attr,
> +	&attr_signed_update_algorithms.attr,
> +	NULL,
> +};
> +
> +static u32 get_policy(const char *name)
> +{
> +	if ((strcmp(name, "db") == 0) ||
> +	    (strcmp(name, "dbx") == 0) ||
> +	    (strcmp(name, "grubdb") == 0) ||
> +	    (strcmp(name, "grubdbx") == 0) ||
> +	    (strcmp(name, "sbat") == 0))
> +		return (PLPKS_WORLDREADABLE | PLPKS_SIGNEDUPDATE);
> +	else
> +		return PLPKS_SIGNEDUPDATE;
> +}
> +
> +static const char * const plpks_var_names[] = {
> +	"PK",
> +	"KEK",
> +	"db",
> +	"dbx",
> +	"grubdb",
> +	"grubdbx",
> +	"sbat",
> +	"moduledb",
> +	"trustedcadb",
> +	NULL,
> +};
> +
> +static int plpks_get_variable(const char *key, u64 key_len, u8 *data,
> +			      u64 *data_size)
> +{
> +	struct plpks_var var = {0};
> +	int rc = 0;
> +
> +	// We subtract 1 from key_len because we don't need to include the
> +	// null terminator at the end of the string
> +	var.name = kcalloc(key_len - 1, sizeof(wchar_t), GFP_KERNEL);
> +	if (!var.name)
> +		return -ENOMEM;
> +	rc = utf8s_to_utf16s(key, key_len - 1, UTF16_LITTLE_ENDIAN, (wchar_t *)var.name,
> +			     key_len - 1);
> +	if (rc < 0)
> +		goto err;
> +	var.namelen = rc * 2;

Are you sure this is not just supposed to be 'rc'?

> +
> +	var.os = PLPKS_VAR_LINUX;
> +	if (data) {
> +		var.data = data;
> +		var.datalen = *data_size;
> +	}
> +	rc = plpks_read_os_var(&var);
> +
> +	if (rc)
> +		goto err;
> +
> +	*data_size = var.datalen;
> +
> +err:
> +	kfree(var.name);
> +	if (rc && rc != -ENOENT) {
> +		pr_err("Failed to read variable '%s': %d\n", key, rc);
> +		// Return -EIO since userspace probably doesn't care about the
> +		// specific error
> +		rc = -EIO;
> +	}
> +	return rc;
> +}
> +
> +static int plpks_set_variable(const char *key, u64 key_len, u8 *data,
> +			      u64 data_size)
> +{
> +	struct plpks_var var = {0};
> +	int rc = 0;
> +	u64 flags;
> +
> +	// Secure variables need to be prefixed with 8 bytes of flags.
> +	// We only want to perform the write if we have at least one byte of data.
> +	if (data_size <= sizeof(flags))
> +		return -EINVAL;
> +
> +	// We subtract 1 from key_len because we don't need to include the
> +	// null terminator at the end of the string
> +	var.name = kcalloc(key_len - 1, sizeof(wchar_t), GFP_KERNEL);
here I would think that it should be key_len * 2 - 1 since utf8s_to_utf16s presumably makes the string longer

> +	if (!var.name)
> +		return -ENOMEM;
> +	rc = utf8s_to_utf16s(key, key_len - 1, UTF16_LITTLE_ENDIAN, (wchar_t *)var.name,
> +			     key_len - 1);

Same here.

> +	if (rc < 0)
> +		goto err;
> +	var.namelen = rc * 2;

Again I would think this should be rc.

> +
> +	memcpy(&flags, data, sizeof(flags));
> +
> +	var.datalen = data_size - sizeof(flags);
> +	var.data = data + sizeof(flags);
> +	var.os = PLPKS_VAR_LINUX;
> +	var.policy = get_policy(key);
> +
> +	// Unlike in the read case, the plpks error code can be useful to
> +	// userspace on write, so we return it rather than just -EIO
> +	rc = plpks_signed_update_var(&var, flags);
> +
> +err:
> +	kfree(var.name);
> +	return rc;
> +}
> +
> +// PLPKS dynamic secure boot doesn't give us a format string in the same way OPAL does.
> +// Instead, report the format using the SB_VERSION variable in the keystore.
> +// The string is made up by us, and takes the form "ibm,plpks-sb-v<n>" (or "ibm,plpks-sb-unknown"
> +// if the SB_VERSION variable doesn't exist). Hypervisor defines the SB_VERSION variable as a
> +// "1 byte unsigned integer value".
> +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> +{
> +	struct plpks_var var = {0};
> +	ssize_t ret;
> +
> +	var.component = NULL;
> +	// Only the signed variables have null bytes in their names, this one doesn't
> +	var.name = "SB_VERSION";
> +	var.namelen = strlen(var.name);
> +	var.datalen = 1;
> +	var.data = kzalloc(1, GFP_KERNEL);
> +	if (!var.data)
> +		return -ENOMEM;
> +
> +	// Unlike the other vars, SB_VERSION is owned by firmware instead of the OS
> +	ret = plpks_read_fw_var(&var);
> +	if (ret) {
> +		if (ret == -ENOENT) {
> +			ret = snprintf(buf, bufsize, "ibm,plpks-sb-unknown");
> +		} else {
> +			pr_err("Error %ld reading SB_VERSION from firmware\n", ret);
> +			ret = -EIO;
> +		}
> +		goto err;
> +	}
> +
> +	ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", var.data[0]);
> +
> +err:
> +	kfree(var.data);
> +	return ret;
> +}
> +
> +static int plpks_max_size(u64 *max_size)
> +{
> +	// The max object size reported by the hypervisor is accurate for the
> +	// object itself, but we use the first 8 bytes of data on write as the
> +	// signed update flags, so the max size a user can write is larger.
> +	*max_size = (u64)plpks_get_maxobjectsize() + sizeof(u64);
> +
> +	return 0;
> +}
> +
> +
> +static const struct secvar_operations plpks_secvar_ops = {
> +	.get = plpks_get_variable,
> +	.set = plpks_set_variable,
> +	.format = plpks_secvar_format,
> +	.max_size = plpks_max_size,
> +	.config_attrs = config_attrs,
> +	.var_names = plpks_var_names,
> +};
> +
> +static int plpks_secvar_init(void)
> +{
> +	if (!plpks_is_available())
> +		return -ENODEV;
> +
> +	return set_secvar_ops(&plpks_secvar_ops);
> +}
> +machine_device_initcall(pseries, plpks_secvar_init);

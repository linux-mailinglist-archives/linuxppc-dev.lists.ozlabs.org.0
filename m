Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E04583C98AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 08:08:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQP7N6BVmz3bWm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 16:08:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I0smwEyl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=I0smwEyl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQP6n5FnLz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 16:07:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16F64JhC090348; Thu, 15 Jul 2021 02:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AwT4A9t+WXfni1juP11yaUh3yH7SiPMqBj9MgXN8+e4=;
 b=I0smwEylGpFEFyj6Nys/RclwC5VMF0Uhh3/F1snQhloVmQ8OraJYh9yB7HBiX+y+8/Tt
 CHTZ71xejw/fH2sV01tVVk3w+0YgvVEiP5a2d0st0g9Nzu5y8WyGmNA6UZV1FswfHK1x
 d2y2U3l/lSumuHFAlT5KJTcj+DIg2xchHBsfXo5cO0HGRVRtXkqCmJ3MZTvvMduIHN++
 PbgifpApX05p1QJBBUucNyna8+uy0fTxkPwQgIZiOFmNVCp0NHa1psxjGg2eIbdtnNIy
 iNSV5t6BybhWGhq4HO/PU2Ji9S9SDtHlkjq+Pbb+1yiI5MWDX7+hJuEqwZUKvIY6FrDg 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ssmrum15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 02:07:34 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16F64U5H091391;
 Thu, 15 Jul 2021 02:07:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ssmrukyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 02:07:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16F67WxP031481;
 Thu, 15 Jul 2021 06:07:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 39q368a306-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 06:07:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16F65H0Z37618028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Jul 2021 06:05:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A77B642042;
 Thu, 15 Jul 2021 06:07:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35F3E42052;
 Thu, 15 Jul 2021 06:07:28 +0000 (GMT)
Received: from [9.85.112.236] (unknown [9.85.112.236])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Jul 2021 06:07:28 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
To: Fabiano Rosas <farosas@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
References: <20210712105140.33388-1-psampat@linux.ibm.com>
 <20210712105140.33388-2-psampat@linux.ibm.com> <87lf6bo7v0.fsf@linux.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <60575876-b15d-6dee-dbb7-c68b9e304557@linux.ibm.com>
Date: Thu, 15 Jul 2021 11:37:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87lf6bo7v0.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y04AM3ZxvXTGPthv0Lb2mFK27z3WCI8y
X-Proofpoint-GUID: IMxxeLEpfUS1ZYl2cYHBxEkIec65GNq-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_02:2021-07-14,
 2021-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107150044
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 12/07/21 9:13 pm, Fabiano Rosas wrote:
> "Pratik R. Sampat" <psampat@linux.ibm.com> writes:
>
> Hi, have you seen Documentation/core-api/kobject.rst, particularly the
> part that says:
>
> "When you see a sysfs directory full of other directories, generally each
>     of those directories corresponds to a kobject in the same kset."
>
> Taking a look at samples/kobject/kset-example.c, it seems to provide an
> overall structure that is closer to what other modules do when creating
> sysfs entries. It uses less dynamic allocations and deals a bit better
> with cleaning up the state afterwards.
>
Thank you for pointing me towards this example, the kset approach is
interesting and the example indeed does handle cleanups better.

Currently, we use "machine_device_initcall()" to register this
functionality, do you suggest I convert this into a tristate module
instead where I can include a "module_exit" for cleanups?

>> Adds a generic interface to represent the energy and frequency related
>> PAPR attributes on the system using the new H_CALL
>> "H_GET_ENERGY_SCALE_INFO".
>>
>> H_GET_EM_PARMS H_CALL was previously responsible for exporting this
>> information in the lparcfg, however the H_GET_EM_PARMS H_CALL
>> will be deprecated P10 onwards.
>>
>> The H_GET_ENERGY_SCALE_INFO H_CALL is of the following call format:
>> hcall(
>>    uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
>>    uint64 flags,           // Per the flag request
>>    uint64 firstAttributeId,// The attribute id
>>    uint64 bufferAddress,   // Guest physical address of the output buffer
>>    uint64 bufferSize       // The size in bytes of the output buffer
>> );
>>
>> This H_CALL can query either all the attributes at once with
>> firstAttributeId = 0, flags = 0 as well as query only one attribute
>> at a time with firstAttributeId = id, flags = 1.
>>
>> The output buffer consists of the following
>> 1. number of attributes              - 8 bytes
>> 2. array offset to the data location - 8 bytes
>> 3. version info                      - 1 byte
>> 4. A data array of size num attributes, which contains the following:
>>    a. attribute ID              - 8 bytes
>>    b. attribute value in number - 8 bytes
>>    c. attribute name in string  - 64 bytes
>>    d. attribute value in string - 64 bytes
>>
>> The new H_CALL exports information in direct string value format, hence
>> a new interface has been introduced in
>> /sys/firmware/papr/energy_scale_info to export this information to
>> userspace in an extensible pass-through format.
>>
>> The H_CALL returns the name, numeric value and string value (if exists)
>>
>> The format of exposing the sysfs information is as follows:
>> /sys/firmware/papr/energy_scale_info/
>>     |-- <id>/
>>       |-- desc
>>       |-- value
>>       |-- value_desc (if exists)
>>     |-- <id>/
>>       |-- desc
>>       |-- value
>>       |-- value_desc (if exists)
>> ...
>>
>> The energy information that is exported is useful for userspace tools
>> such as powerpc-utils. Currently these tools infer the
>> "power_mode_data" value in the lparcfg, which in turn is obtained from
>> the to be deprecated H_GET_EM_PARMS H_CALL.
>> On future platforms, such userspace utilities will have to look at the
>> data returned from the new H_CALL being populated in this new sysfs
>> interface and report this information directly without the need of
>> interpretation.
>>
>> Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>
>> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
>> ---
>>   .../sysfs-firmware-papr-energy-scale-info     |  26 ++
>>   arch/powerpc/include/asm/hvcall.h             |  24 +-
>>   arch/powerpc/kvm/trace_hv.h                   |   1 +
>>   arch/powerpc/platforms/pseries/Makefile       |   3 +-
>>   .../pseries/papr_platform_attributes.c        | 320 ++++++++++++++++++
>>   5 files changed, 372 insertions(+), 2 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
>>   create mode 100644 arch/powerpc/platforms/pseries/papr_platform_attributes.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info b/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
>> new file mode 100644
>> index 000000000000..fd82f2bfafe5
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
>> @@ -0,0 +1,26 @@
>> +What:		/sys/firmware/papr/energy_scale_info
>> +Date:		June 2021
>> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
>> +Description:	Directory hosting a set of platform attributes like
>> +		energy/frequency on Linux running as a PAPR guest.
>> +
>> +		Each file in a directory contains a platform
>> +		attribute hierarchy pertaining to performance/
>> +		energy-savings mode and processor frequency.
>> +
>> +What:		/sys/firmware/papr/energy_scale_info/<id>
>> +		/sys/firmware/papr/energy_scale_info/<id>/desc
>> +		/sys/firmware/papr/energy_scale_info/<id>/value
>> +		/sys/firmware/papr/energy_scale_info/<id>/value_desc
>> +Date:		June 2021
>> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
>> +Description:	Energy, frequency attributes directory for POWERVM servers
>> +
>> +		This directory provides energy, erequency, folding information. It
> s/erequency/frequency/

ack. Thanks for pointing out the typo

>
>> +		contains below sysfs attributes:
>> +
>> +		- desc: String description of the attribute <id>
>> +
>> +		- value: Numeric value of attribute <id>
>> +
>> +		- value_desc: String value of attribute <id>
>> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
>> index e3b29eda8074..c91714ea6719 100644
>> --- a/arch/powerpc/include/asm/hvcall.h
>> +++ b/arch/powerpc/include/asm/hvcall.h
>> @@ -316,7 +316,8 @@
>>   #define H_SCM_PERFORMANCE_STATS 0x418
>>   #define H_RPT_INVALIDATE	0x448
>>   #define H_SCM_FLUSH		0x44C
>> -#define MAX_HCALL_OPCODE	H_SCM_FLUSH
>> +#define H_GET_ENERGY_SCALE_INFO	0x450
>> +#define MAX_HCALL_OPCODE	H_GET_ENERGY_SCALE_INFO
>>
>>   /* Scope args for H_SCM_UNBIND_ALL */
>>   #define H_UNBIND_SCOPE_ALL (0x1)
>> @@ -631,6 +632,27 @@ struct hv_gpci_request_buffer {
>>   	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
>>   } __packed;
>>
>> +#define ESI_VERSION	0x1
>> +#define MAX_ESI_ATTRS	10
>> +#define MAX_BUF_SZ	(sizeof(struct h_energy_scale_info_hdr) + \
>> +			(sizeof(struct energy_scale_attribute) * MAX_ESI_ATTRS))
>> +
>> +struct energy_scale_attribute {
>> +	__be64 id;
>> +	__be64 value;
>> +	unsigned char desc[64];
>> +	unsigned char value_desc[64];
>> +} __packed;
>> +
>> +struct h_energy_scale_info_hdr {
>> +	__be64 num_attrs;
>> +	__be64 array_offset;
>> +	__u8 data_header_version;
>> +} __packed;
>> +
>> +/* /sys/firmware/papr */
>> +extern struct kobject *papr_kobj;
>> +
>>   #endif /* __ASSEMBLY__ */
>>   #endif /* __KERNEL__ */
>>   #endif /* _ASM_POWERPC_HVCALL_H */
>> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
>> index 830a126e095d..38cd0ed0a617 100644
>> --- a/arch/powerpc/kvm/trace_hv.h
>> +++ b/arch/powerpc/kvm/trace_hv.h
>> @@ -115,6 +115,7 @@
>>   	{H_VASI_STATE,			"H_VASI_STATE"}, \
>>   	{H_ENABLE_CRQ,			"H_ENABLE_CRQ"}, \
>>   	{H_GET_EM_PARMS,		"H_GET_EM_PARMS"}, \
>> +	{H_GET_ENERGY_SCALE_INFO,	"H_GET_ENERGY_SCALE_INFO"}, \
>>   	{H_SET_MPP,			"H_SET_MPP"}, \
>>   	{H_GET_MPP,			"H_GET_MPP"}, \
>>   	{H_HOME_NODE_ASSOCIATIVITY,	"H_HOME_NODE_ASSOCIATIVITY"}, \
>> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
>> index c8a2b0b05ac0..d14fca89ac25 100644
>> --- a/arch/powerpc/platforms/pseries/Makefile
>> +++ b/arch/powerpc/platforms/pseries/Makefile
>> @@ -6,7 +6,8 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
>>   			   of_helpers.o \
>>   			   setup.o iommu.o event_sources.o ras.o \
>>   			   firmware.o power.o dlpar.o mobility.o rng.o \
>> -			   pci.o pci_dlpar.o eeh_pseries.o msi.o
>> +			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
>> +			   papr_platform_attributes.o
>>   obj-$(CONFIG_SMP)	+= smp.o
>>   obj-$(CONFIG_SCANLOG)	+= scanlog.o
>>   obj-$(CONFIG_KEXEC_CORE)	+= kexec.o
>> diff --git a/arch/powerpc/platforms/pseries/papr_platform_attributes.c b/arch/powerpc/platforms/pseries/papr_platform_attributes.c
>> new file mode 100644
>> index 000000000000..43c620132b4d
>> --- /dev/null
>> +++ b/arch/powerpc/platforms/pseries/papr_platform_attributes.c
>> @@ -0,0 +1,320 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Platform energy and frequency attributes driver
>> + *
>> + * This driver creates a sys file at /sys/firmware/papr/ which encapsulates a
>> + * directory structure containing files in keyword - value pairs that specify
>> + * energy and frequency configuration of the system.
>> + *
>> + * The format of exposing the sysfs information is as follows:
>> + * /sys/firmware/papr/energy_scale_info/
>> + *  |-- <id>/
>> + *    |-- desc
>> + *    |-- value
>> + *    |-- value_desc (if exists)
>> + *  |-- <id>/
>> + *    |-- desc
>> + *    |-- value
>> + *    |-- value_desc (if exists)
>> + *
>> + * Copyright 2021 IBM Corp.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/hugetlb.h>
>> +#include <asm/lppaca.h>
>> +#include <asm/hvcall.h>
>> +#include <asm/firmware.h>
>> +#include <asm/time.h>
>> +#include <asm/prom.h>
>> +#include <asm/vdso_datapage.h>
>> +#include <asm/vio.h>
>> +#include <asm/mmu.h>
>> +#include <asm/machdep.h>
>> +#include <asm/drmem.h>
>> +
>> +#include "pseries.h"
>> +
>> +#define MAX_ATTRS		3
>> +#define MAX_NAME_LEN		16
>> +
>> +/*
>> + * Flag attributes to fetch either all or one attribute from the HCALL
>> + * flag = BE(0) => fetch all attributes with firstAttributeId = 0
>> + * flag = BE(1) => fetch a single attribute with firstAttributeId = id
>> + */
>> +#define ESI_FLAGS_ALL		0
>> +#define ESI_FLAGS_SINGLE	PPC_BIT(0)
>> +
>> +struct papr_attr {
>> +	u64 id;
>> +	struct kobj_attribute kobj_attr;
>> +};
>> +struct papr_group {
>> +	char name[MAX_NAME_LEN];
> This is unused.

ack. We used it in one of the previous iterations and I missed removing it.
Thanks.

>
>> +	struct attribute_group pg;
>> +	struct papr_attr *pgattrs;
> This is always MAX_ATTRS long, we could define it statically and avoid a
> kmalloc later.

Sure

>> +} *pgs;
>> +
>> +/* /sys/firmware/papr */
>> +struct kobject *papr_kobj;
>> +/* /sys/firmware/papr/energy_scale_info */
>> +struct kobject *esi_kobj;
>> +
>> +struct h_energy_scale_info_hdr *esi_hdr;
>> +struct energy_scale_attribute *esi_attrs;
>> +
>> +/*
>> + * Extract and export the description of the energy scale attribute
>> + *
>> + * As We do not expect the name to change, hence use the old description and
>> + * save a call to the H_GET_ENERGY_SCALE_INFO HCALL
>> + */
>> +static ssize_t papr_show_desc(struct kobject *kobj,
>> +			       struct kobj_attribute *kobj_attr,
>> +			       char *buf)
>> +{
>> +	struct papr_attr *pattr = container_of(kobj_attr, struct papr_attr,
>> +					       kobj_attr);
>> +	int idx, ret = 0;
>> +
>> +	for (idx = 0; idx < be64_to_cpu(esi_hdr->num_attrs); idx++) {
>> +		if (pattr->id == be64_to_cpu(esi_attrs[idx].id)) {
>> +			ret = sprintf(buf, "%s\n", esi_attrs[idx].desc);
> We know the size of desc, so could use snprintf here.
ack
>> +			if (ret < 0)
>> +				ret = -EIO;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Extract and export the numeric value of the energy scale attributes
>> + */
>> +static ssize_t papr_show_value(struct kobject *kobj,
>> +				struct kobj_attribute *kobj_attr,
>> +				char *buf)
>> +{
>> +	struct papr_attr *pattr = container_of(kobj_attr, struct papr_attr,
>> +					       kobj_attr);
>> +	char *t_buf;
>> +	struct h_energy_scale_info_hdr *t_hdr;
>> +	struct energy_scale_attribute *t_esi;
>> +	int ret = 0;
>> +
>> +	t_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
>> +	if (t_buf == NULL)
>> +		return -ENOMEM;
>> +
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_SINGLE,
>> +				 pattr->id, virt_to_phys(t_buf),
>> +				 MAX_BUF_SZ);
>> +
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	t_hdr = (struct h_energy_scale_info_hdr *) t_buf;
>> +	t_esi = (struct energy_scale_attribute *)
>> +		(t_buf + be64_to_cpu(t_hdr->array_offset));
>> +
>> +	ret = sprintf(buf, "%llu\n", be64_to_cpu(t_esi->value));
> snprintf
ack
>> +	if (ret < 0)
>> +		ret = -EIO;
>> +out:
>> +	kfree(t_buf);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Extract and export the value description in string format of the energy
>> + * scale attributes
>> + */
>> +static ssize_t papr_show_value_desc(struct kobject *kobj,
>> +				     struct kobj_attribute *kobj_attr,
>> +				     char *buf)
>> +{
>> +	struct papr_attr *pattr = container_of(kobj_attr, struct papr_attr,
>> +					       kobj_attr);
>> +	char *t_buf;
>> +	struct h_energy_scale_info_hdr *t_hdr;
>> +	struct energy_scale_attribute *t_esi;
>> +	int ret = 0;
>> +
>> +	t_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
>> +	if (t_buf == NULL)
>> +		return -ENOMEM;
>> +
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_SINGLE,
>> +				 pattr->id, virt_to_phys(t_buf),
>> +				 MAX_BUF_SZ);
>> +
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	t_hdr = (struct h_energy_scale_info_hdr *) t_buf;
>> +	t_esi = (struct energy_scale_attribute *)
>> +		(t_buf + be64_to_cpu(t_hdr->array_offset));
>> +
>> +	ret = sprintf(buf, "%s\n", t_esi->value_desc);
> snprintf
>
ack
>> +	if (ret < 0)
>> +		ret = -EIO;
>> +out:
>> +	kfree(t_buf);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct papr_ops_info {
>> +	const char *attr_name;
>> +	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *kobj_attr,
>> +			char *buf);
>> +} ops_info[MAX_ATTRS] = {
>> +	{ "desc", papr_show_desc },
>> +	{ "value", papr_show_value },
>> +	{ "value_desc", papr_show_value_desc },
>> +};
>> +
>> +static void add_attr(u64 id, int index, struct papr_attr *attr)
>> +{
>> +	attr->id = id;
>> +	sysfs_attr_init(&attr->kobj_attr.attr);
>> +	attr->kobj_attr.attr.name = ops_info[index].attr_name;
>> +	attr->kobj_attr.attr.mode = 0444;
>> +	attr->kobj_attr.show = ops_info[index].show;
>> +}
>> +
>> +static int add_attr_group(u64 id, int len, struct papr_group *pg,
>> +			  bool show_val_desc)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < len; i++) {
>> +		if (!strcmp(ops_info[i].attr_name, "value_desc") &&
>> +		    !show_val_desc) {
>> +			continue;
>> +		}
>> +		add_attr(id, i, &pg->pgattrs[i]);
>> +		pg->pg.attrs[i] = &pg->pgattrs[i].kobj_attr.attr;
>> +	}
>> +
>> +	return sysfs_create_group(esi_kobj, &pg->pg);
>> +}
>> +
>> +static int __init papr_init(void)
>> +{
>> +	uint64_t num_attrs;
>> +	int ret, idx, i;
>> +	char *esi_buf;
>> +
>> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
>> +		return -ENXIO;
>> +
>> +	esi_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
> This memory is never released. I don't think it's worth it just to save
> a hcall.

Sure, I can convert the struct to local scope in this function and make
a H_CALL for "desc"

>> +	if (esi_buf == NULL)
>> +		return -ENOMEM;
>> +	/*
>> +	 * hcall(
>> +	 * uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
>> +	 * uint64 flags,            // Per the flag request
>> +	 * uint64 firstAttributeId, // The attribute id
>> +	 * uint64 bufferAddress,    // Guest physical address of the output buffer
>> +	 * uint64 bufferSize);      // The size in bytes of the output buffer
>> +	 */
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_ALL, 0,
>> +				 virt_to_phys(esi_buf), MAX_BUF_SZ);
>> +	esi_hdr = (struct h_energy_scale_info_hdr *) esi_buf;
>> +	if (ret != H_SUCCESS || esi_hdr->data_header_version != ESI_VERSION) {
> I really dislike this. If you want to bail due to version change, then
> at least include in the ABI document that we might not give the
> userspace any data at all.

My only concern for having a version check is that, the attribute list
can change as well as the attributes itself may change.
If that is the case, then in a newer version if we do not bail out we
may parse data into our structs incorrectly.

My argument only hinges on that we should likely give no data at all
instead of junk or incorrect data.

Maybe I could make this check after the return check and give out a
version mismatch message like the following?
pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO VER MISMATCH - EXP: 0x%x, REC: 0x%x",
         ESI_VERSION, esi_hdr->data_header_version);

>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	num_attrs = be64_to_cpu(esi_hdr->num_attrs);
>> +	/*
>> +	 * Typecast the energy buffer to the attribute structure at the offset
>> +	 * specified in the buffer
>> +	 */
> I think the code is now simple enough that this comment could be
> removed.

ack

>> +	esi_attrs = (struct energy_scale_attribute *)
>> +		    (esi_buf + be64_to_cpu(esi_hdr->array_offset));
>> +
>> +	pgs = kcalloc(num_attrs, sizeof(*pgs), GFP_KERNEL);
> This is never freed.
>
>> +	if (!pgs)
>> +		goto out_pgs;
>> +
>> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
>> +	if (!papr_kobj) {
>> +		pr_warn("kobject_create_and_add papr failed\n");
>> +		goto out_kobj;
>> +	}
>> +
>> +	esi_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
>> +	if (!esi_kobj) {
>> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
>> +		goto out_ekobj;
>> +	}
>> +
>> +	for (idx = 0; idx < num_attrs; idx++) {
>> +		char buf[4];
>> +		bool show_val_desc = true;
>> +
>> +		pgs[idx].pgattrs = kcalloc(MAX_ATTRS,
>> +					   sizeof(*pgs[idx].pgattrs),
>> +					   GFP_KERNEL);
>> +		if (!pgs[idx].pgattrs)
>> +			goto out_kobj;
>> +
>> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
>> +					    sizeof(*pgs[idx].pg.attrs),
>> +					    GFP_KERNEL);
> I think the kobject code expects this to be statically allocated, so
> you'd need to override the release function in some way to be able to
> free this.

Right this and pgs both are never free'd because my understanding was
that as this functionality is invoked from machine_init, I'd expect it
to stay until shutdown.

However, if you believe that a module approach is cleaner, I can change
my implementation to accommodate for that and also include a
module_exit for cleanup of the above allocations

>
>> +		if (!pgs[idx].pg.attrs) {
>> +			kfree(pgs[idx].pgattrs);
>> +			goto out_kobj;
>> +		}
>> +
>> +		sprintf(buf, "%lld", be64_to_cpu(esi_attrs[idx].id));
> Do you mean pgs[idx].name instead of buf? Otherwise you're passing this
> stack allocated 'buf' to another function.
>
Yes you're right I should have either passed the pg struct or I should
have used strcpy, here the stack allocated buffer is being taken out of
scope which is incorrect.
Thanks for pointing this out!

>> +		pgs[idx].pg.name = buf;
>> +
>> +		/* Do not add the value description if it does not exist */
>> +		if (strlen(esi_attrs[idx].value_desc) == 0)
>> +			show_val_desc = false;
>> +
>> +		if (add_attr_group(be64_to_cpu(esi_attrs[idx].id),
>> +				   MAX_ATTRS, &pgs[idx], show_val_desc)) {
>> +			pr_warn("Failed to create papr attribute group %s\n",
>> +				pgs[idx].pg.name);
>> +			goto out_pgattrs;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_pgattrs:
>> +	for (i = 0; i < MAX_ATTRS; i++) {
>> +		kfree(pgs[i].pgattrs);
>> +		kfree(pgs[i].pg.attrs);
>> +	}
>> +out_ekobj:
>> +	kobject_put(esi_kobj);
>> +out_kobj:
>> +	kobject_put(papr_kobj);
>> +out_pgs:
>> +	kfree(pgs);
>> +out:
>> +	kfree(esi_buf);
>> +
>> +	return -ENOMEM;
>> +}
>> +
>> +machine_device_initcall(pseries, papr_init);


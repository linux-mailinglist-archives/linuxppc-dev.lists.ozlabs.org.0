Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E74E3AD407
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 22:58:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6B9W4tqjz3c69
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 06:58:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NI/lC7mq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NI/lC7mq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6B9063Ywz2yXy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 06:58:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IKX7j5030887; Fri, 18 Jun 2021 16:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=djaxZYBOT4sQFXo7DVNynOI1l/WwDoIZkCOChKHzQqQ=;
 b=NI/lC7mqLmAshquzvPVtk32Kal7T4l2Mdj7pGhjXPjdIota8K7X5oVJ/iQxDY6vgxHvG
 4gwf8XKH4M6fmYyTa7MDbjwVINzyesSSCouErlqINtUCISsJZ1vi+1C81FYXMqvnkgTI
 Myn+8QYcVnrCgAxPw6AEK25qDVSZFhYF6FVRf1GuMQUnVU9DPAUDW4Rihs1QfnypcHnI
 5K2FbZ0T5XnBxAeAA9LJncbAzIE2MojACd1mKoKLgJA+oze0L/OuwLEEPZZdMrcNg7vq
 A2zr9UcyzquQ2o6HvyEdUSKge8+qPUVMgkqMDvt2SgT1zQ1ewgm0m1xdfvKIHm3K/8zs Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3992221bbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 16:58:17 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15IKXhrv031764;
 Fri, 18 Jun 2021 16:58:17 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3992221bbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 16:58:17 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15IKvtqK012729;
 Fri, 18 Jun 2021 20:58:16 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 394mjas2n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 20:58:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15IKwEtO19595712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 20:58:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF6A47805E;
 Fri, 18 Jun 2021 20:58:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ECF878063;
 Fri, 18 Jun 2021 20:58:13 +0000 (GMT)
Received: from localhost (unknown [9.211.76.195])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Jun 2021 20:58:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Pratik R. Sampat" <psampat@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, psampat@linux.ibm.com,
 pratik.r.sampat@gmail.com
Subject: Re: [PATCH 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
In-Reply-To: <20210616134240.62195-2-psampat@linux.ibm.com>
References: <20210616134240.62195-1-psampat@linux.ibm.com>
 <20210616134240.62195-2-psampat@linux.ibm.com>
Date: Fri, 18 Jun 2021 17:58:10 -0300
Message-ID: <87wnqqopp9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gkm0v9ZQ7zyD9QoN6YF8v_9hxuxknvT2
X-Proofpoint-GUID: dg32ySk7ih_00eDD87nUR8nxTfhgGrFk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_11:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106180119
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

"Pratik R. Sampat" <psampat@linux.ibm.com> writes:

> Adds a generic interface to represent the energy and frequency related
> PAPR attributes on the system using the new H_CALL
> "H_GET_ENERGY_SCALE_INFO".
>
> H_GET_EM_PARMS H_CALL was previously responsible for exporting this
> information in the lparcfg, however the H_GET_EM_PARMS H_CALL
> will be deprecated P10 onwards.
>
> The H_GET_ENERGY_SCALE_INFO H_CALL is of the following call format:
> hcall(
>   uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
>   uint64 flags,           // Per the flag request
>   uint64 firstAttributeId,// The attribute id
>   uint64 bufferAddress,   // Guest physical address of the output buffer
>   uint64 bufferSize       // The size in bytes of the output buffer
> );
>
> This H_CALL can query either all the attributes at once with
> firstAttributeId = 0, flags = 0 as well as query only one attribute
> at a time with firstAttributeId = id
>
> The output buffer consists of the following
> 1. number of attributes              - 8 bytes
> 2. array offset to the data location - 8 bytes
> 3. version info                      - 1 byte
> 4. A data array of size num attributes, which contains the following:
>   a. attribute ID              - 8 bytes
>   b. attribute value in number - 8 bytes
>   c. attribute name in string  - 64 bytes
>   d. attribute value in string - 64 bytes
>
> The new H_CALL exports information in direct string value format, hence
> a new interface has been introduced in
> /sys/firmware/papr/energy_scale_info to export this information to
> userspace in an extensible pass-through format.
>
> The H_CALL returns the name, numeric value and string value (if exists)
>
> The format of exposing the sysfs information is as follows:
> /sys/firmware/papr/energy_scale_info/
>    |-- <id>/
>      |-- desc
>      |-- value
>      |-- value_desc (if exists)
>    |-- <id>/
>      |-- desc
>      |-- value
>      |-- value_desc (if exists)
> ...
>
> The energy information that is exported is useful for userspace tools
> such as powerpc-utils. Currently these tools infer the
> "power_mode_data" value in the lparcfg, which in turn is obtained from
> the to be deprecated H_GET_EM_PARMS H_CALL.
> On future platforms, such userspace utilities will have to look at the
> data returned from the new H_CALL being populated in this new sysfs
> interface and report this information directly without the need of
> interpretation.
>
> Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>
> ---
>  .../sysfs-firmware-papr-energy-scale-info     |  26 ++
>  arch/powerpc/include/asm/hvcall.h             |  21 +-
>  arch/powerpc/kvm/trace_hv.h                   |   1 +
>  arch/powerpc/platforms/pseries/Makefile       |   3 +-
>  .../pseries/papr_platform_attributes.c        | 292 ++++++++++++++++++
>  5 files changed, 341 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
>  create mode 100644 arch/powerpc/platforms/pseries/papr_platform_attributes.c
>
> diff --git a/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info b/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
> new file mode 100644
> index 000000000000..499bc1ae173a
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
> @@ -0,0 +1,26 @@
> +What:		/sys/firmware/papr/energy_scale_info
> +Date:		June 2021
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Description:	Director hosting a set of platform attributes on Linux
> +		running as a PAPR guest.

This still refers to papr attributes. We want energy/frequency, etc. instead.

> +
> +		Each file in a directory contains a platform
> +		attribute hierarchy pertaining to performance/
> +		energy-savings mode and processor frequency.
> +
> +What:		/sys/firmware/papr/energy_scale_info/<id>
> +		/sys/firmware/papr/energy_scale_info/<id>/desc
> +		/sys/firmware/papr/energy_scale_info/<id>/value
> +		/sys/firmware/papr/energy_scale_info/<id>/value_desc
> +Date:		June 2021
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Description:	PAPR attributes directory for POWERVM servers

Same here.

> +
> +		This directory provides PAPR information. It

And here.

> +		contains below sysfs attributes:
> +
> +		- desc: File contains the name of attribute <id>

desc: String description of the attribute <id>

> +
> +		- value: Numeric value of attribute <id>
> +
> +		- value_desc: String value of attribute <id>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index e3b29eda8074..19a2a8c77a49 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -316,7 +316,8 @@
>  #define H_SCM_PERFORMANCE_STATS 0x418
>  #define H_RPT_INVALIDATE	0x448
>  #define H_SCM_FLUSH		0x44C
> -#define MAX_HCALL_OPCODE	H_SCM_FLUSH
> +#define H_GET_ENERGY_SCALE_INFO	0x450
> +#define MAX_HCALL_OPCODE	H_GET_ENERGY_SCALE_INFO
>
>  /* Scope args for H_SCM_UNBIND_ALL */
>  #define H_UNBIND_SCOPE_ALL (0x1)
> @@ -631,6 +632,24 @@ struct hv_gpci_request_buffer {
>  	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
>  } __packed;
>
> +#define MAX_EM_ATTRS	10
> +#define MAX_EM_DATA_BYTES \
> +	(sizeof(struct energy_scale_attributes) * MAX_EM_ATTRS)

EM doesn't really mean anything in the context of this code. Maybe we
could standardize the names with 'energy_scale_info' and 'esi' for
short.

> +struct energy_scale_attributes {

s/attributes/attribute/

> +	__be64 attr_id;
> +	__be64 attr_value;
> +	unsigned char attr_desc[64];
> +	unsigned char attr_value_desc[64];

These attr_ prefixes could be dropped. I will be clear from the context
where they are used.

> +} __packed;
> +
> +struct hv_energy_scale_buffer {
> +	__be64 num_attr;

s/num_attr/num_attrs/

> +	__be64 array_offset;
> +	__u8 data_header_version;
> +	unsigned char data[MAX_EM_DATA_BYTES];
> +} __packed;

Your code is correct with the current assumptions, but I think we got
the assumptions wrong, see if you agree:

My understanding of the hypercall is that it is designed around a header
+ data concept. If the header is versioned and backwards compatible,
then it means that it could increase in size. The offset to the data is
what ensures backward compatibility so that we can always access the
data, no matter what the header contains. So this leads me to conclude:

1- We should stop aborting in case the version changes. Nothing should
really break if that happens. Both the kernel and userspace would read
less data than the hypercall is returning, but that is it.

With the current design, if the hypervisor changes the header version,
the attributes stop being exposed in sysfs (because this code aborts),
which will break the userspace setup.

2- We cannot have 'data' in the struct. There is no array there. The
array is wherever the offset indicates. If the header increases in size,
then the 'data' would move forward in the buffer.

3- The concept of MAX_EM_ATTRS is misleading. It is the maximum number
of attributes that fit in the buffer *for this version of the hcall*. A
subsequent version could fit fewer attributes and our MAX_EM_ATTRS would
land us out of bounds. So the number of attributes must be defined
exclusively by num_attrs.

If we change the above, we only need to touch this code again if the
header version changes *and* we want to expose the extra information
brought by the change. An unexpected change in version should not cause
this code to fail.

So what I suggest is we keep a 'header' struct:

struct h_energy_scale_info_hdr {
    __be64 num_attrs;
    __be64 data_offset;
    __u8 version;
};

and we define an arbitrary size for the attributes array and allocate
that much more memory:

/*
 * Note: we allocate space for 10 attributes, but the HV can move the data
 * array further in the buffer, so it could return fewer attributes.
 */
#define MAX_BUF_SZ (sizeof(struct h_energy_scale_info_hdr) + \
                    sizeof(struct energy_scale_attributes) * 10)
...
em_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);



The suggestions from here on apply even if my analysis above is wrong:

> +
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_HVCALL_H */
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 830a126e095d..38cd0ed0a617 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -115,6 +115,7 @@
>  	{H_VASI_STATE,			"H_VASI_STATE"}, \
>  	{H_ENABLE_CRQ,			"H_ENABLE_CRQ"}, \
>  	{H_GET_EM_PARMS,		"H_GET_EM_PARMS"}, \
> +	{H_GET_ENERGY_SCALE_INFO,	"H_GET_ENERGY_SCALE_INFO"}, \
>  	{H_SET_MPP,			"H_SET_MPP"}, \
>  	{H_GET_MPP,			"H_GET_MPP"}, \
>  	{H_HOME_NODE_ASSOCIATIVITY,	"H_HOME_NODE_ASSOCIATIVITY"}, \
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index c8a2b0b05ac0..d14fca89ac25 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -6,7 +6,8 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
>  			   of_helpers.o \
>  			   setup.o iommu.o event_sources.o ras.o \
>  			   firmware.o power.o dlpar.o mobility.o rng.o \
> -			   pci.o pci_dlpar.o eeh_pseries.o msi.o
> +			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
> +			   papr_platform_attributes.o
>  obj-$(CONFIG_SMP)	+= smp.o
>  obj-$(CONFIG_SCANLOG)	+= scanlog.o
>  obj-$(CONFIG_KEXEC_CORE)	+= kexec.o
> diff --git a/arch/powerpc/platforms/pseries/papr_platform_attributes.c b/arch/powerpc/platforms/pseries/papr_platform_attributes.c
> new file mode 100644
> index 000000000000..498c74a5e9ab
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/papr_platform_attributes.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * PAPR platform energy attributes driver
> + *
> + * This driver creates a sys file at /sys/firmware/papr/ which contains
> + * files keyword - value pairs that specify energy configuration of the system.

This description needs updating.

> + *
> + * Copyright 2021 IBM Corp.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/hugetlb.h>
> +#include <asm/lppaca.h>
> +#include <asm/hvcall.h>
> +#include <asm/firmware.h>
> +#include <asm/time.h>
> +#include <asm/prom.h>
> +#include <asm/vdso_datapage.h>
> +#include <asm/vio.h>
> +#include <asm/mmu.h>
> +#include <asm/machdep.h>
> +#include <asm/drmem.h>
> +
> +#include "pseries.h"
> +
> +#define MAX_ATTRS	3

It might be good to link this with ops_info size somehow to make sure we
don't update one without the other.

> +#define MAX_NAME_LEN	16
> +
> +struct papr_attr {
> +	u64 id;
> +	struct kobj_attribute attr;

We have attr everywhere. I would use kobj_attr here to improve
readability.

> +};
> +struct papr_group {
> +	char name[MAX_NAME_LEN];
> +	struct attribute_group pg;
> +	struct papr_attr *pgattrs;
> +} *pgs;
> +
> +struct kobject *papr_kobj;
> +struct kobject *escale_kobj;

Nitpick: esi_kobj

> +struct hv_energy_scale_buffer *em_buf;

Could replace the "em" here.

> +struct energy_scale_attributes *ea;

Nitpick: esi_attrs.

> +
> +static ssize_t papr_show_desc(struct kobject *kobj,
> +			       struct kobj_attribute *attr,
> +			       char *buf)
> +{
> +	struct papr_attr *pattr = container_of(attr, struct papr_attr, attr);
> +	int idx, ret = 0;
> +
> +	/*
> +	 * We do not expect the name to change, hence use the old value
> +	 * and save a HCALL
> +	 */
> +	for (idx = 0; idx < be64_to_cpu(em_buf->num_attr); idx++) {
> +		if (pattr->id == be64_to_cpu(ea[idx].attr_id)) {
> +			ret = sprintf(buf, "%s\n", ea[idx].attr_desc);
> +			if (ret < 0)
> +				ret = -EIO;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t papr_show_value(struct kobject *kobj,
> +				struct kobj_attribute *attr,
> +				char *buf)
> +{
> +	struct papr_attr *pattr = container_of(attr, struct papr_attr, attr);
> +	struct hv_energy_scale_buffer *t_buf;
> +	struct energy_scale_attributes *t_ea;
> +	int data_offset, ret = 0;
> +
> +	t_buf = kmalloc(sizeof(*t_buf), GFP_KERNEL);
> +	if (t_buf == NULL)
> +		return -ENOMEM;
> +
> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 0,
> +				 pattr->id, virt_to_phys(t_buf),
> +				 sizeof(*t_buf));
> +
> +	if (ret != H_SUCCESS) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}
> +
> +	data_offset = be64_to_cpu(t_buf->array_offset) -
> +			(sizeof(t_buf->num_attr) +
> +			sizeof(t_buf->array_offset) +
> +			sizeof(t_buf->data_header_version));
> +
> +	t_ea = (struct energy_scale_attributes *) &t_buf->data[data_offset];

t_ea = (struct energy_scale_attributes *)(t_buf + be64_to_cpu(t_buf->array_offset));

Right? If array_offset "points" to data, then data_offset would always
be 0. So there is no point doing this arithmetic.

> +
> +	ret = sprintf(buf, "%llu\n", be64_to_cpu(t_ea->attr_value));
> +	if (ret < 0)
> +		ret = -EIO;
> +out:
> +	kfree(t_buf);
> +
> +	return ret;
> +}
> +
> +static ssize_t papr_show_value_desc(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     char *buf)
> +{
> +	struct papr_attr *pattr = container_of(attr, struct papr_attr, attr);
> +	struct hv_energy_scale_buffer *t_buf;
> +	struct energy_scale_attributes *t_ea;
> +	int data_offset, ret = 0;
> +
> +	t_buf = kmalloc(sizeof(*t_buf), GFP_KERNEL);
> +	if (t_buf == NULL)
> +		return -ENOMEM;
> +
> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 0,
> +				 pattr->id, virt_to_phys(t_buf),
> +				 sizeof(*t_buf));
> +
> +	if (ret != H_SUCCESS) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}
> +
> +	data_offset = be64_to_cpu(t_buf->array_offset) -
> +			(sizeof(t_buf->num_attr) +
> +			sizeof(t_buf->array_offset) +
> +			sizeof(t_buf->data_header_version));
> +
> +	t_ea = (struct energy_scale_attributes *) &t_buf->data[data_offset];
> +
> +	ret = sprintf(buf, "%s\n", t_ea->attr_value_desc);
> +	if (ret < 0)
> +		ret = -EIO;
> +out:
> +	kfree(t_buf);
> +
> +	return ret;
> +}
> +
> +static struct papr_ops_info {
> +	const char *attr_name;
> +	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> +			char *buf);
> +} ops_info[] = {
> +	{ "desc", papr_show_desc },
> +	{ "value", papr_show_value },
> +	{ "value_desc", papr_show_value_desc },
> +};
> +
> +static void add_attr(u64 id, int index, struct papr_attr *attr)
> +{
> +	attr->id = id;
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = ops_info[index].attr_name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = ops_info[index].show;
> +}
> +
> +static int add_attr_group(u64 id, int len, struct papr_group *pg,
> +			  bool show_val_desc)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++) {
> +		if (!strcmp(ops_info[i].attr_name, "value_desc") &&
> +		    !show_val_desc) {
> +			continue;
> +		}
> +		add_attr(id, i, &pg->pgattrs[i]);
> +		pg->pg.attrs[i] = &pg->pgattrs[i].attr.attr;
> +	}
> +
> +	return sysfs_create_group(escale_kobj, &pg->pg);
> +}
> +
> +
> +static int __init papr_init(void)
> +{
> +	uint64_t num_attr;
> +	int ret, idx, i, data_offset;
> +
> +	em_buf = kmalloc(sizeof(*em_buf), GFP_KERNEL);
> +	if (em_buf == NULL)
> +		return -ENOMEM;
> +	/*
> +	 * hcall(
> +	 * uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
> +	 * uint64 flags,            // Per the flag request
> +	 * uint64 firstAttributeId, // The attribute id
> +	 * uint64 bufferAddress,    // Guest physical address of the output buffer
> +	 * uint64 bufferSize);      // The size in bytes of the output buffer
> +	 */

Since the flags are well defined, we could have:
#define ESI_FLAGS_ALL PPC_BIT(0)
#define ESI_FLAGS_SINGLE PPC_BIT(1)

I assume the bits are IBM-order. But you get my point...

> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 0, 0,
> +				 virt_to_phys(em_buf), sizeof(*em_buf));
> +
> +	if (!firmware_has_feature(FW_FEATURE_LPAR) || ret != H_SUCCESS ||
> +	    em_buf->data_header_version != 0x1) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}

I'd make the FW_FEATURE_LPAR check an early return at the start of the
function.

> +
> +	num_attr = be64_to_cpu(em_buf->num_attr);
> +
> +	/*
> +	 * Typecast the energy buffer to the attribute structure at the offset
> +	 * specified in the buffer
> +	 */
> +	data_offset = be64_to_cpu(em_buf->array_offset) -
> +			(sizeof(em_buf->num_attr) +
> +			sizeof(em_buf->array_offset) +
> +			sizeof(em_buf->data_header_version));
> +
> +	ea = (struct energy_scale_attributes *) &em_buf->data[data_offset];
> +
> +	pgs = kcalloc(num_attr, sizeof(*pgs), GFP_KERNEL);
> +	if (!pgs)
> +		goto out_pgs;
> +
> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
> +	if (!papr_kobj) {
> +		pr_warn("kobject_create_and_add papr failed\n");
> +		goto out_kobj;
> +	}
> +
> +	escale_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
> +	if (!escale_kobj) {
> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
> +		goto out_ekobj;
> +	}
> +
> +	for (idx = 0; idx < num_attr; idx++) {
> +		char buf[4];
> +		bool show_val_desc = true;
> +
> +		pgs[idx].pgattrs = kcalloc(MAX_ATTRS,
> +					   sizeof(*pgs[idx].pgattrs),
> +					   GFP_KERNEL);
> +		if (!pgs[idx].pgattrs)
> +			goto out_kobj;
> +
> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
> +					    sizeof(*pgs[idx].pg.attrs),
> +					    GFP_KERNEL);
> +		if (!pgs[idx].pg.attrs) {
> +			kfree(pgs[idx].pgattrs);
> +			goto out_kobj;
> +		}
> +
> +		sprintf(buf, "%lld", be64_to_cpu(ea[idx].attr_id));
> +		pgs[idx].pg.name = buf;
> +
> +		/* Do not add the value description if it does not exist */
> +		if (strlen(ea[idx].attr_value_desc) == 0)
> +			show_val_desc = false;
> +
> +		if (add_attr_group(be64_to_cpu(ea[idx].attr_id),
> +				   MAX_ATTRS, &pgs[idx], show_val_desc)) {
> +			pr_warn("Failed to create papr attribute group %s\n",
> +				pgs[idx].pg.name);
> +			goto out_pgattrs;
> +		}
> +	}
> +
> +	return 0;
> +
> +out_pgattrs:
> +	for (i = 0; i < MAX_ATTRS; i++) {
> +		kfree(pgs[i].pgattrs);
> +		kfree(pgs[i].pg.attrs);
> +	}
> +out_ekobj:
> +	kobject_put(escale_kobj);
> +out_kobj:
> +	kobject_put(papr_kobj);
> +out_pgs:
> +	kfree(pgs);
> +out:
> +	kfree(em_buf);
> +
> +	return -ENOMEM;
> +}
> +
> +machine_device_initcall(pseries, papr_init);

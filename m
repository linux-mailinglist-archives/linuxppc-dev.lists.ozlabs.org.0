Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE901BF624
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 13:09:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CXhF3gcgzDqCR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 21:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CXfB46BDzDrB2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 21:07:30 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UB3CWu140075; Thu, 30 Apr 2020 07:07:24 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30me47aym9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 07:07:23 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03UAxq33021847;
 Thu, 30 Apr 2020 11:07:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 30mcu5akyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 11:07:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03UB63KF63832326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 11:06:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ABA852057;
 Thu, 30 Apr 2020 11:07:12 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.79.182.234])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2900052054;
 Thu, 30 Apr 2020 11:07:09 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Thu, 30 Apr 2020 16:37:09 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v6 3/4] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
In-Reply-To: <87lfmde3il.fsf@mpe.ellerman.id.au>
References: <20200420070711.223545-1-vaibhav@linux.ibm.com>
 <20200420070711.223545-4-vaibhav@linux.ibm.com>
 <87lfmde3il.fsf@mpe.ellerman.id.au>
Date: Thu, 30 Apr 2020 16:37:09 +0530
Message-ID: <87mu6t6xlu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_07:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300087
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mpe,

Thanks again for reviewing this patchset.

Michael Ellerman <mpe@ellerman.id.au> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> Introduce support for Papr nvDimm Specific Methods (PDSM) in papr_scm
>> modules and add the command family to the white list of NVDIMM command
>> sets. Also advertise support for ND_CMD_CALL for the dimm
>> command mask and implement necessary scaffolding in the module to
>> handle ND_CMD_CALL ioctl and PDSM requests that we receive.
>>
>> The layout of the PDSM request as we expect from libnvdimm/libndctl is
>> described in newly introduced uapi header 'papr_scm_pdsm.h' which
>> defines a new 'struct nd_pdsm_cmd_pkg' header. This header is used
>> to communicate the PDSM request via member
>> 'nd_pkg_papr_scm->nd_command' and size of payload that need to be
>> sent/received for servicing the PDSM.
>>
>> A new function is_cmd_valid() is implemented that reads the args to
>> papr_scm_ndctl() and performs sanity tests on them. A new function
>> papr_scm_service_pdsm() is introduced and is called from
>> papr_scm_ndctl() in case of a PDSM request is received via ND_CMD_CALL
>> command from libnvdimm.
>>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>> Changelog
>>
>> v5..v6 :
>> * Changed the usage of the term DSM to PDSM to distinguish it from the
>>   ACPI term [ Dan Williams ]
>> * Renamed papr_scm_dsm.h to papr_scm_pdsm.h and updated various struct
>>   to reflect the new terminology.
>> * Updated the patch description and title to reflect the new terminology.
>> * Squashed patch to introduce new command family in 'ndctl.h' with
>>   this patch [ Dan Williams ]
>> * Updated the papr_scm_pdsm method starting index from 0x10000 to 0x0
>>   [ Dan Williams ]
>> * Removed redundant license text from the papr_scm_psdm.h file.
>>   [ Dan Williams ]
>> * s/envelop/envelope/ at various places [ Dan Williams ]
>> * Added '__packed' attribute to command package header to gaurd
>>   against different compiler adding paddings between the fields.
>>   [ Dan Williams]
>> * Converted various pr_debug to dev_debug [ Dan Williams ]
>>
>> v4..v5 :
>> * None
>>
>> v3..v4 :
>> * None
>>
>> v2..v3 :
>> * Updated the patch prefix to 'ndctl/uapi' [Aneesh]
>>
>> v1..v2 :
>> * None
>> ---
>>  arch/powerpc/include/uapi/asm/papr_scm_pdsm.h | 153 ++++++++++++++++++
>>  arch/powerpc/platforms/pseries/papr_scm.c     | 101 +++++++++++-
>>  include/uapi/linux/ndctl.h                    |   1 +
>>  3 files changed, 249 insertions(+), 6 deletions(-)
>>  create mode 100644 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
>>
>> diff --git a/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
>> new file mode 100644
>> index 000000000000..ec48b5c7fc18
>> --- /dev/null
>> +++ b/arch/powerpc/include/uapi/asm/papr_scm_pdsm.h
>> @@ -0,0 +1,153 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>> +/*
>> + * PAPR-SCM Dimm specific methods (PDSM) and structs for libndctl
>> + *
>> + * (C) Copyright IBM 2020
>> + *
>> + * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
>> + */
>> +
>> +#ifndef _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_
>> +#define _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#ifdef __KERNEL__
>> +#include <linux/ndctl.h>
>> +#else
>> +#include <ndctl.h>
>> +#endif
>
> We shouldn't be checking __KERNEL__ in uapi headers, something has gone
> wrong if this is necessary.
This header file is shared with userspace libndctl changes as proposed at
https://lore.kernel.org/linux-nvdimm/20200420075556.272174-5-vaibhav@linux.ibm.com/

The definition of "struct nd_cmd_pkg" on which 'struct nd_pdsm_cmd_pkg'
depenends on, is available in different locations in kernel and libndctl

>
>> +
>> +/*
>> + * PDSM Envelope:
>> + *
>> + * The ioctl ND_CMD_CALL transfers data between user-space and kernel via
>> + * 'envelopes' which consists of a header and user-defined payload sections.
>> + * The header is described by 'struct nd_pdsm_cmd_pkg' which expects a
>> + * payload following it and offset of which relative to the struct is provided
>> + * by 'nd_pdsm_cmd_pkg.payload_offset'. *
>> + *
>> + *  +-------------+---------------------+---------------------------+
>> + *  |   64-Bytes  |       8-Bytes       |       Max 184-Bytes       |
>> + *  +-------------+---------------------+---------------------------+
>> + *  |               nd_pdsm_cmd_pkg |                           |
>> + *  |-------------+                     |                           |
>> + *  |  nd_cmd_pkg |                     |                           |
>> + *  +-------------+---------------------+---------------------------+
>> + *  | nd_family   |			|			    |
>> + *  | nd_size_out | cmd_status          |			    |
>> + *  | nd_size_in  | payload_version     |      PAYLOAD		    |
>> + *  | nd_command  | payload_offset ----->			    |
>> + *  | nd_fw_size  |                     |			    |
>> + *  +-------------+---------------------+---------------------------+
>> + *
>> + * PDSM Header:
>> + *
>> + * The header is defined as 'struct nd_pdsm_cmd_pkg' which embeds a
>> + * 'struct nd_cmd_pkg' instance. The PDSM command is assigned to member
>> + * 'nd_cmd_pkg.nd_command'. Apart from size information of the envelope which is
>> + * contained in 'struct nd_cmd_pkg', the header also has members following
>> + * members:
>> + *
>> + * 'cmd_status'		: (Out) Errors if any encountered while servicing PDSM.
>> + * 'payload_version'	: (In/Out) Version number associated with the payload.
>> + * 'payload_offset'	: (In)Relative offset of payload from start of envelope.
>> + *
>> + * PDSM Payload:
>> + *
>> + * The layout of the PDSM Payload is defined by various structs shared between
>> + * papr_scm and libndctl so that contents of payload can be interpreted. During
>> + * servicing of a PDSM the papr_scm module will read input args from the payload
>> + * field by casting its contents to an appropriate struct pointer based on the
>> + * PDSM command. Similarly the output of servicing the PDSM command will be
>> + * copied to the payload field using the same struct.
>> + *
>> + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size, which
>> + * leaves around 184 bytes for the envelope payload (ignoring any padding that
>> + * the compiler may silently introduce).
>> + *
>> + * Payload Version:
>> + *
>> + * A 'payload_version' field is present in PDSM header that indicates a specific
>> + * version of the structure present in PDSM Payload for a given PDSM command.
>> + * This provides backward compatibility in case the PDSM Payload structure
>> + * evolves and different structures are supported by 'papr_scm' and 'libndctl'.
>> + *
>> + * When sending a PDSM Payload to 'papr_scm', 'libndctl' should send the version
>> + * of the payload struct it supports via 'payload_version' field. The 'papr_scm'
>> + * module when servicing the PDSM envelope checks the 'payload_version' and then
>> + * uses 'payload struct version' == MIN('payload_version field',
>> + * 'max payload-struct-version supported by papr_scm') to service the PDSM.
>> + * After servicing the PDSM, 'papr_scm' put the negotiated version of payload
>> + * struct in returned 'payload_version' field.
>> + *
>> + * Libndctl on receiving the envelope back from papr_scm again checks the
>> + * 'payload_version' field and based on it use the appropriate version dsm
>> + * struct to parse the results.
>> + *
>> + * Backward Compatibility:
>> + *
>> + * Above scheme of exchanging different versioned PDSM struct between libndctl
>> + * and papr_scm should provide backward compatibility until following two
>> + * assumptions/conditions when defining new PDSM structs hold:
>> + *
>> + * Let T(X) = { set of attributes in PDSM struct 'T' versioned X }
>> + *
>> + * 1. T(X) is a proper subset of T(Y) if X > Y.
>> + *    i.e Each new version of PDSM struct should retain existing struct
>> + *    attributes from previous version
>> + *
>> + * 2. If an entity (libndctl or papr_scm) supports a PDSM struct T(X) then
>> + *    it should also support T(1), T(2)...T(X - 1).
>> + *    i.e When adding support for new version of a PDSM struct, libndctl
>> + *    and papr_scm should retain support of the existing PDSM struct
>> + *    version they support.
>> + */
>> +
>> +#ifndef __packed
>> +#define __packed __attribute__((packed))
>> +#endif
>
> I'm not sure it's kosher to be defining __packed in a uapi header.
>
Similar reason as before. Userspace libndctl doesnt provide a definition
of __packed hence adding it here.

>> +
>> +/* Papr-scm-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
>> +struct nd_pdsm_cmd_pkg {
>> +	struct nd_cmd_pkg hdr;	/* Package header containing sub-cmd */
>> +	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
>> +	__u16 payload_offset;	/* In: offset from start of struct */
>> +	__u16 payload_version;	/* In/Out: version of the payload */
>> +	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
>> +} __packed;
>> +
>> +/*
>> + * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
>> + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
>> + */
>> +enum papr_scm_pdsm {
>> +	PAPR_SCM_PDSM_MIN = 0x0,
>> +	PAPR_SCM_PDSM_MAX,
>> +};
>> +
>> +/* Helpers to evaluate the size of PDSM envelope */
>> +/* Calculate the papr_scm-header size */
>> +#define ND_PDSM_ENVELOPE_CONTENT_HDR_SIZE \
>> +	(sizeof(struct nd_pdsm_cmd_pkg) - sizeof(struct nd_cmd_pkg))
>> +
>> +/* Given a type calculate envelope-content size (papr_scm-header + payload) */
>> +#define ND_PDSM_ENVELOPE_CONTENT_SIZE(_type_)	\
>> +	(sizeof(_type_) + ND_PDSM_ENVELOPE_CONTENT_HDR_SIZE)
>
> Those seem unused? Do we really need to make them part of the uapi for
> all time?
This helper macro is used in proposed libndctl changes to calculate returning
payload buffer size from the kernel.

https://lore.kernel.org/linux-nvdimm/20200420075556.272174-7-vaibhav@linux.ibm.com/
>
>> +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */
>> +static struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct nd_cmd_pkg *cmd)
>> +{
>> +	return (struct nd_pdsm_cmd_pkg *) cmd;
>> +}
>> +
>> +/* Return the payload pointer for a given pcmd */
>> +static void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
>
> That should probably be static inline?
Agree, will do.
>
>> +{
>> +	if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
>> +		return NULL;
>> +	else
>> +		return (void *)((__u8 *) pcmd + pcmd->payload_offset);
>> +}
>> +
>> +#endif /* _UAPI_ASM_POWERPC_PAPR_SCM_PDSM_H_ */
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index f8fe579e6f2e..20da1b837017 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -15,13 +15,15 @@
>>  
>>  #include <asm/plpar_wrappers.h>
>>  #include <asm/papr_scm.h>
>> +#include <asm/papr_scm_pdsm.h>
>>  
>>  #define BIND_ANY_ADDR (~0ul)
>>  
>>  #define PAPR_SCM_DIMM_CMD_MASK \
>>  	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>>  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
>> -	 (1ul << ND_CMD_SET_CONFIG_DATA))
>> +	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
>> +	 (1ul << ND_CMD_CALL))
>>  
>>  struct papr_scm_priv {
>>  	struct platform_device *pdev;
>> @@ -306,16 +308,97 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>>  	return 0;
>>  }
>>  
>> -int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>> -		unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
>> +/*
>> + * Validate the inputs args to dimm-control function and return '0' if valid.
>> + * This also does initial sanity validation to ND_CMD_CALL sub-command packages.
>> + */
>> +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>> +		       unsigned int buf_len)
>>  {
>> -	struct nd_cmd_get_config_size *get_size_hdr;
>> +	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
>> +	struct nd_pdsm_cmd_pkg *pkg = nd_to_pdsm_cmd_pkg(buf);
>>  	struct papr_scm_priv *p;
>>  
>>  	/* Only dimm-specific calls are supported atm */
>>  	if (!nvdimm)
>>  		return -EINVAL;
>>  
>> +	/* get the provider date from struct nvdimm */
>> +	p = nvdimm_provider_data(nvdimm);
>> +
>> +	if (!test_bit(cmd, &cmd_mask)) {
>> +		dev_dbg(&p->pdev->dev, "Unsupported cmd=%u\n", cmd);
>> +		return -EINVAL;
>> +	} else if (cmd == ND_CMD_CALL) {
>> +
>> +		/* Verify the envelope package */
>> +		if (!buf || buf_len < sizeof(struct nd_pdsm_cmd_pkg)) {
>> +			dev_dbg(&p->pdev->dev, "Invalid pkg size=%u\n",
>> +				buf_len);
>> +			return -EINVAL;
>> +		}
>> +
>> +		/* Verify that the PDSM family is valid */
>> +		if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR_SCM) {
>> +			dev_dbg(&p->pdev->dev, "Invalid pkg family=0x%llx\n",
>> +				pkg->hdr.nd_family);
>> +			return -EINVAL;
>> +
>> +		}
>> +
>> +		/* We except a payload with all PDSM commands */
>> +		if (pdsm_cmd_to_payload(pkg) == NULL) {
>> +			dev_dbg(&p->pdev->dev,
>> +				"Empty payload for sub-command=0x%llx\n",
>> +				pkg->hdr.nd_command);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	/* Command looks valid */
>> +	return 0;
>> +}
>> +
>> +static int papr_scm_service_pdsm(struct papr_scm_priv *p,
>> +				struct nd_pdsm_cmd_pkg *call_pkg)
>> +{
>> +	/* unknown subcommands return error in packages */
>> +	if (call_pkg->hdr.nd_command <= PAPR_SCM_PDSM_MIN ||
>> +	    call_pkg->hdr.nd_command >= PAPR_SCM_PDSM_MAX) {
>> +		dev_dbg(&p->pdev->dev, "Invalid PDSM request 0x%llx\n",
>> +			call_pkg->hdr.nd_command);
>> +		call_pkg->cmd_status = -EINVAL;
>> +		return 0;
>> +	}
>> +
>> +	/* Depending on the DSM command call appropriate service routine */
>> +	switch (call_pkg->hdr.nd_command) {
>> +	default:
>> +		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
>> +			call_pkg->hdr.nd_command);
>> +		call_pkg->cmd_status = -ENOENT;
>> +		return 0;
>> +	}
>> +}
>> +
>> +int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>> +		unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
>> +{
>> +	struct nd_cmd_get_config_size *get_size_hdr;
>> +	struct papr_scm_priv *p;
>> +	struct nd_pdsm_cmd_pkg *call_pkg = NULL;
>> +	int rc;
>> +
>> +	/* Use a local variable in case cmd_rc pointer is NULL */
>> +	if (cmd_rc == NULL)
>> +		cmd_rc = &rc;
>> +
>> +	*cmd_rc = is_cmd_valid(nvdimm, cmd, buf, buf_len);
>> +	if (*cmd_rc) {
>> +		pr_debug("Invalid cmd=0x%x. Err=%d\n", cmd, *cmd_rc);
>> +		return *cmd_rc;
>> +	}
>> +
>>  	p = nvdimm_provider_data(nvdimm);
>>  
>>  	switch (cmd) {
>> @@ -336,13 +419,19 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>>  		*cmd_rc = papr_scm_meta_set(p, buf);
>>  		break;
>>  
>> +	case ND_CMD_CALL:
>> +		call_pkg = nd_to_pdsm_cmd_pkg(buf);
>> +		*cmd_rc = papr_scm_service_pdsm(p, call_pkg);
>> +		break;
>> +
>>  	default:
>> -		return -EINVAL;
>> +		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
>> +		*cmd_rc = -EINVAL;
>>  	}
>>  
>>  	dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
>>  
>> -	return 0;
>> +	return *cmd_rc;
>>  }
>>  
>>  static inline int papr_scm_node(int node)
>> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
>> index de5d90212409..99fb60600ef8 100644
>> --- a/include/uapi/linux/ndctl.h
>> +++ b/include/uapi/linux/ndctl.h
>> @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
>>  #define NVDIMM_FAMILY_HPE2 2
>>  #define NVDIMM_FAMILY_MSFT 3
>>  #define NVDIMM_FAMILY_HYPERV 4
>> +#define NVDIMM_FAMILY_PAPR_SCM 5
>
> Would like an ack from Dan for that change.
>
Agree
> cheers
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

~ Vaibhav

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E981EFC6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 17:24:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dmfM6FgCzDqy6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 01:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dmbT4BhNzDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 01:22:13 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 055F69vS007456; Fri, 5 Jun 2020 11:21:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31fjay2p71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 11:21:39 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 055F6uBA010003;
 Fri, 5 Jun 2020 11:21:38 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31fjay2p5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 11:21:37 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 055FGBpE032481;
 Fri, 5 Jun 2020 15:21:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 31bf47d2r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 15:21:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 055FLWZ040763392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jun 2020 15:21:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF16F4204F;
 Fri,  5 Jun 2020 15:21:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 925BF42047;
 Fri,  5 Jun 2020 15:21:28 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.97.247])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  5 Jun 2020 15:21:28 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Fri, 05 Jun 2020 20:51:27 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Williams\, Dan J" <dan.j.williams@intel.com>,
 "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-nvdimm\@lists.01.org" <linux-nvdimm@lists.01.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RESEND PATCH v9 4/5] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
In-Reply-To: <BN6PR11MB4132FA66A84CBD798AADCEC1C6860@BN6PR11MB4132.namprd11.prod.outlook.com>
References: <20200602101438.73929-1-vaibhav@linux.ibm.com>
 <20200602101438.73929-5-vaibhav@linux.ibm.com>
 <BN6PR11MB413223B333153721405DFD91C6890@BN6PR11MB4132.namprd11.prod.outlook.com>
 <87h7vrgpzx.fsf@linux.ibm.com>
 <BN6PR11MB4132FA66A84CBD798AADCEC1C6860@BN6PR11MB4132.namprd11.prod.outlook.com>
Date: Fri, 05 Jun 2020 20:51:27 +0530
Message-ID: <873679h72g.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_04:2020-06-04,
 2020-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 adultscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 cotscore=-2147483648
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006050109
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Oliver
 O'Halloran <oohall@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, "Weiny,
 Ira" <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Williams, Dan J" <dan.j.williams@intel.com> writes:

>> -----Original Message-----
>> From: Vaibhav Jain <vaibhav@linux.ibm.com>
>> Sent: Thursday, June 4, 2020 2:06 AM
>> To: Williams, Dan J <dan.j.williams@intel.com>; linuxppc-
>> dev@lists.ozlabs.org; linux-nvdimm@lists.01.org; linux-
>> kernel@vger.kernel.org
>> Cc: Santosh Sivaraj <santosh@fossix.org>; Aneesh Kumar K . V
>> <aneesh.kumar@linux.ibm.com>; Steven Rostedt <rostedt@goodmis.org>;
>> Oliver O'Halloran <oohall@gmail.com>; Weiny, Ira <ira.weiny@intel.com>
>> Subject: RE: [RESEND PATCH v9 4/5] ndctl/papr_scm,uapi: Add support for
>> PAPR nvdimm specific methods
>> 
>> Hi Dan,
>> 
>> Thanks for review and insights on this. My responses below:
>> 
>> "Williams, Dan J" <dan.j.williams@intel.com> writes:
>> 
>> > [ forgive formatting I'm temporarily stuck using Outlook this week...
>> > ]
>> >
>> >> From: Vaibhav Jain <vaibhav@linux.ibm.com>
>> > [..]
>> >>
>> >> Introduce support for PAPR NVDIMM Specific Methods (PDSM) in
>> papr_scm
>> >> module and add the command family NVDIMM_FAMILY_PAPR to the
>> white
>> >> list of NVDIMM command sets. Also advertise support for ND_CMD_CALL
>> >> for the nvdimm command mask and implement necessary scaffolding in
>> >> the module to handle ND_CMD_CALL ioctl and PDSM requests that we
>> receive.
>> >>
>> >> The layout of the PDSM request as we expect from libnvdimm/libndctl
>> >> is described in newly introduced uapi header 'papr_pdsm.h' which
>> >> defines a new 'struct nd_pdsm_cmd_pkg' header. This header is used to
>> >> communicate the PDSM request via member
>> 'nd_cmd_pkg.nd_command' and
>> >> size of payload that need to be sent/received for servicing the PDSM.
>> >>
>> >> A new function is_cmd_valid() is implemented that reads the args to
>> >> papr_scm_ndctl() and performs sanity tests on them. A new function
>> >> papr_scm_service_pdsm() is introduced and is called from
>> >> papr_scm_ndctl() in case of a PDSM request is received via
>> >> ND_CMD_CALL command from libnvdimm.
>> >>
>> >> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
>> >> Cc: Dan Williams <dan.j.williams@intel.com>
>> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> >> Cc: Ira Weiny <ira.weiny@intel.com>
>> >> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> >> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> >> ---
>> >> Changelog:
>> >>
>> >> Resend:
>> >> * Added ack from Aneesh.
>> >>
>> >> v8..v9:
>> >> * Reduced the usage of term SCM replacing it with appropriate
>> >>   replacement [ Dan Williams, Aneesh ]
>> >> * Renamed 'papr_scm_pdsm.h' to 'papr_pdsm.h'
>> >> * s/PAPR_SCM_PDSM_*/PAPR_PDSM_*/g
>> >> * s/NVDIMM_FAMILY_PAPR_SCM/NVDIMM_FAMILY_PAPR/g
>> >> * Minor updates to 'papr_psdm.h' to replace usage of term 'SCM'.
>> >> * Minor update to patch description.
>> >>
>> >> v7..v8:
>> >> * Removed the 'payload_offset' field from 'struct
>> >>   nd_pdsm_cmd_pkg'. Instead command payload is always assumed to
>> start
>> >>   at 'nd_pdsm_cmd_pkg.payload'. [ Aneesh ]
>> >> * To enable introducing new fields to 'struct nd_pdsm_cmd_pkg',
>> >>   'reserved' field of 10-bytes is introduced. [ Aneesh ]
>> >> * Fixed a typo in "Backward Compatibility" section of papr_scm_pdsm.h
>> >>   [ Ira ]
>> >>
>> >> Resend:
>> >> * None
>> >>
>> >> v6..v7 :
>> >> * Removed the re-definitions of __packed macro from papr_scm_pdsm.h
>> >>   [Mpe].
>> >> * Removed the usage of __KERNEL__ macros in papr_scm_pdsm.h
>> [Mpe].
>> >> * Removed macros that were unused in papr_scm.c from
>> papr_scm_pdsm.h
>> >>   [Mpe].
>> >> * Made functions defined in papr_scm_pdsm.h as static inline. [Mpe]
>> >>
>> >> v5..v6 :
>> >> * Changed the usage of the term DSM to PDSM to distinguish it from the
>> >>   ACPI term [ Dan Williams ]
>> >> * Renamed papr_scm_dsm.h to papr_scm_pdsm.h and updated various
>> >> struct
>> >>   to reflect the new terminology.
>> >> * Updated the patch description and title to reflect the new terminology.
>> >> * Squashed patch to introduce new command family in 'ndctl.h' with
>> >>   this patch [ Dan Williams ]
>> >> * Updated the papr_scm_pdsm method starting index from 0x10000 to
>> 0x0
>> >>   [ Dan Williams ]
>> >> * Removed redundant license text from the papr_scm_psdm.h file.
>> >>   [ Dan Williams ]
>> >> * s/envelop/envelope/ at various places [ Dan Williams ]
>> >> * Added '__packed' attribute to command package header to gaurd
>> >>   against different compiler adding paddings between the fields.
>> >>   [ Dan Williams]
>> >> * Converted various pr_debug to dev_debug [ Dan Williams ]
>> >>
>> >> v4..v5 :
>> >> * None
>> >>
>> >> v3..v4 :
>> >> * None
>> >>
>> >> v2..v3 :
>> >> * Updated the patch prefix to 'ndctl/uapi' [Aneesh]
>> >>
>> >> v1..v2 :
>> >> * None
>> >> ---
>> >>  arch/powerpc/include/uapi/asm/papr_pdsm.h | 136
>> >> ++++++++++++++++++++++
>> arch/powerpc/platforms/pseries/papr_scm.c |
>> >> 101 +++++++++++++++-
>> >>  include/uapi/linux/ndctl.h                |   1 +
>> >>  3 files changed, 232 insertions(+), 6 deletions(-)  create mode
>> >> 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h
>> >>
>> >> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h
>> >> b/arch/powerpc/include/uapi/asm/papr_pdsm.h
>> >> new file mode 100644
>> >> index 000000000000..6407fefcc007
>> >> --- /dev/null
>> >> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
>> >> @@ -0,0 +1,136 @@
>> >> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>> >> +/*
>> >> + * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
>> >> + *
>> >> + * (C) Copyright IBM 2020
>> >> + *
>> >> + * Author: Vaibhav Jain <vaibhav at linux.ibm.com>  */
>> >> +
>> >> +#ifndef _UAPI_ASM_POWERPC_PAPR_PDSM_H_ #define
>> >> +_UAPI_ASM_POWERPC_PAPR_PDSM_H_
>> >> +
>> >> +#include <linux/types.h>
>> >> +
>> >> +/*
>> >> + * PDSM Envelope:
>> >> + *
>> >> + * The ioctl ND_CMD_CALL transfers data between user-space and
>> >> +kernel via
>> >> + * envelope which consists of a header and user-defined payload
>> sections.
>> >> + * The header is described by 'struct nd_pdsm_cmd_pkg' which expects
>> >> +a
>> >> + * payload following it and accessible via 'nd_pdsm_cmd_pkg.payload'
>> field.
>> >> + * There is reserved field that can used to introduce new fields to
>> >> +the
>> >> + * structure in future. It also tries to ensure that
>> >> 'nd_pdsm_cmd_pkg.payload'
>> >> + * lies at a 8-byte boundary.
>> >> + *
>> >> + *  +-------------+---------------------+---------------------------+
>> >> + *  |   64-Bytes  |       16-Bytes      |       Max 176-Bytes       |
>> >> + *  +-------------+---------------------+---------------------------+
>> >> + *  |               nd_pdsm_cmd_pkg     |                           |
>> >> + *  |-------------+                     |                           |
>> >> + *  |  nd_cmd_pkg |                     |                           |
>> >> + *  +-------------+---------------------+---------------------------+
>> >> + *  | nd_family   |                     |                           |
>> >> + *  | nd_size_out | cmd_status          |                           |
>> >> + *  | nd_size_in  | payload_version     |     payload               |
>> >> + *  | nd_command  | reserved            |                           |
>> >> + *  | nd_fw_size  |                     |                           |
>> >> + *
>> >> + +-------------+---------------------+---------------------------+
>> >> + *
>> >> + * PDSM Header:
>> >> + *
>> >> + * The header is defined as 'struct nd_pdsm_cmd_pkg' which embeds a
>> >> + * 'struct nd_cmd_pkg' instance. The PDSM command is assigned to
>> >> member
>> >> + * 'nd_cmd_pkg.nd_command'. Apart from size information of the
>> >> envelope
>> >> +which is
>> >> + * contained in 'struct nd_cmd_pkg', the header also has members
>> >> +following
>> >> + * members:
>> >> + *
>> >> + * 'cmd_status'		: (Out) Errors if any encountered while
>> >> servicing PDSM.
>> >> + * 'payload_version'	: (In/Out) Version number associated with
>> the
>> >> payload.
>> >> + * 'reserved'		: Not used and reserved for future.
>> >> + *
>> >> + * PDSM Payload:
>> >> + *
>> >> + * The layout of the PDSM Payload is defined by various structs
>> >> +shared between
>> >> + * papr_scm and libndctl so that contents of payload can be
>> >> +interpreted. During
>> >> + * servicing of a PDSM the papr_scm module will read input args from
>> >> +the payload
>> >> + * field by casting its contents to an appropriate struct pointer
>> >> +based on the
>> >> + * PDSM command. Similarly the output of servicing the PDSM command
>> >> +will be
>> >> + * copied to the payload field using the same struct.
>> >> + *
>> >> + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope
>> >> +size, which
>> >> + * leaves around 176 bytes for the envelope payload (ignoring any
>> >> +padding that
>> >> + * the compiler may silently introduce).
>> >> + *
>> >> + * Payload Version:
>> >> + *
>> >> + * A 'payload_version' field is present in PDSM header that
>> >> +indicates a specific
>> >> + * version of the structure present in PDSM Payload for a given PDSM
>> >> command.
>> >> + * This provides backward compatibility in case the PDSM Payload
>> >> +structure
>> >> + * evolves and different structures are supported by 'papr_scm' and
>> >> 'libndctl'.
>> >> + *
>> >> + * When sending a PDSM Payload to 'papr_scm', 'libndctl' should send
>> >> +the version
>> >> + * of the payload struct it supports via 'payload_version' field.
>> >> +The
>> >> 'papr_scm'
>> >> + * module when servicing the PDSM envelope checks the
>> 'payload_version'
>> >> +and then
>> >> + * uses 'payload struct version' == MIN('payload_version field',
>> >> + * 'max payload-struct-version supported by papr_scm') to service
>> >> +the
>> >> PDSM.
>> >> + * After servicing the PDSM, 'papr_scm' put the negotiated version
>> >> +of payload
>> >> + * struct in returned 'payload_version' field.
>> >> + *
>> >> + * Libndctl on receiving the envelope back from papr_scm again
>> >> +checks the
>> >> + * 'payload_version' field and based on it use the appropriate
>> >> +version dsm
>> >> + * struct to parse the results.
>> >> + *
>> >> + * Backward Compatibility:
>> >> + *
>> >> + * Above scheme of exchanging different versioned PDSM struct
>> >> +between libndctl
>> >> + * and papr_scm should provide backward compatibility until
>> >> +following two
>> >> + * assumptions/conditions when defining new PDSM structs hold:
>> >> + *
>> >> + * Let T(X) = { set of attributes in PDSM struct 'T' versioned X }
>> >> + *
>> >> + * 1. T(X) is a proper subset of T(Y) if Y > X.
>> >> + *    i.e Each new version of PDSM struct should retain existing struct
>> >> + *    attributes from previous version
>> >> + *
>> >> + * 2. If an entity (libndctl or papr_scm) supports a PDSM struct T(X) then
>> >> + *    it should also support T(1), T(2)...T(X - 1).
>> >> + *    i.e When adding support for new version of a PDSM struct, libndctl
>> >> + *    and papr_scm should retain support of the existing PDSM struct
>> >> + *    version they support.
>> >> + */
>> >> +
>> >> +/* PDSM-header + payload expected with ND_CMD_CALL ioctl from
>> >> libnvdimm
>> >> +*/ struct nd_pdsm_cmd_pkg {
>> >> +	struct nd_cmd_pkg hdr;	/* Package header containing sub-
>> >> cmd */
>> >> +	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
>> >> +	__u16 reserved[5];	/* Ignored and to be used in future */
>> >> +	__u16 payload_version;	/* In/Out: version of the payload */
>> >> +	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
>> >> +} __packed;
>> >> +
>> >> +/*
>> >> + * Methods to be embedded in ND_CMD_CALL request. These are sent
>> to
>> >> the
>> >> +kernel
>> >> + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
>> >> +*/ enum papr_pdsm {
>> >> +	PAPR_PDSM_MIN = 0x0,
>> >> +	PAPR_PDSM_MAX,
>> >> +};
>> >> +
>> >> +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */ static
>> >> +inline struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct
>> nd_cmd_pkg
>> >> *cmd) {
>> >> +	return (struct nd_pdsm_cmd_pkg *) cmd; }
>> >> +
>> >> +/* Return the payload pointer for a given pcmd */ static inline void
>> >> +*pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd) {
>> >> +	if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
>> >> +		return NULL;
>> >> +	else
>> >> +		return (void *)(pcmd->payload);
>> >> +}
>> >> +
>> >> +#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
>> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
>> >> b/arch/powerpc/platforms/pseries/papr_scm.c
>> >> index 149431594839..5e2237e7ec08 100644
>> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> >> @@ -15,13 +15,15 @@
>> >>  #include <linux/seq_buf.h>
>> >>
>> >>  #include <asm/plpar_wrappers.h>
>> >> +#include <asm/papr_pdsm.h>
>> >>
>> >>  #define BIND_ANY_ADDR (~0ul)
>> >>
>> >>  #define PAPR_SCM_DIMM_CMD_MASK \
>> >>  	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>> >>  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
>> >> -	 (1ul << ND_CMD_SET_CONFIG_DATA))
>> >> +	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
>> >> +	 (1ul << ND_CMD_CALL))
>> >>
>> >>  /* DIMM health bitmap bitmap indicators */
>> >>  /* SCM device is unable to persist memory contents */ @@ -350,16
>> >> +352,97 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>> >>  	return 0;
>> >>  }
>> >>
>> >> +/*
>> >> + * Validate the inputs args to dimm-control function and return '0' if valid.
>> >> + * This also does initial sanity validation to ND_CMD_CALL
>> >> +sub-command
>> >> packages.
>> >> + */
>> >> +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd,
>> >> +void
>> >> *buf,
>> >> +		       unsigned int buf_len)
>> >> +{
>> >> +	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
>> >> +	struct nd_pdsm_cmd_pkg *pkg = nd_to_pdsm_cmd_pkg(buf);
>> >> +	struct papr_scm_priv *p;
>> >> +
>> >> +	/* Only dimm-specific calls are supported atm */
>> >> +	if (!nvdimm)
>> >> +		return -EINVAL;
>> >> +
>> >> +	/* get the provider date from struct nvdimm */
>> >> +	p = nvdimm_provider_data(nvdimm);
>> >> +
>> >> +	if (!test_bit(cmd, &cmd_mask)) {
>> >> +		dev_dbg(&p->pdev->dev, "Unsupported cmd=%u\n", cmd);
>> >> +		return -EINVAL;
>> >> +	} else if (cmd == ND_CMD_CALL) {
>> >> +
>> >> +		/* Verify the envelope package */
>> >> +		if (!buf || buf_len < sizeof(struct nd_pdsm_cmd_pkg)) {
>> >> +			dev_dbg(&p->pdev->dev, "Invalid pkg size=%u\n",
>> >> +				buf_len);
>> >> +			return -EINVAL;
>> >> +		}
>> >> +
>> >> +		/* Verify that the PDSM family is valid */
>> >> +		if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR) {
>> >> +			dev_dbg(&p->pdev->dev, "Invalid pkg
>> >> family=0x%llx\n",
>> >> +				pkg->hdr.nd_family);
>> >> +			return -EINVAL;
>> >> +
>> >> +		}
>> >> +
>> >> +		/* We except a payload with all PDSM commands */
>> >> +		if (pdsm_cmd_to_payload(pkg) == NULL) {
>> >> +			dev_dbg(&p->pdev->dev,
>> >> +				"Empty payload for sub-command=0x%llx\n",
>> >> +				pkg->hdr.nd_command);
>> >> +			return -EINVAL;
>> >> +		}
>> >> +	}
>> >> +
>> >> +	/* Command looks valid */
>> >
>> <snip>
>> > So this is where I would expect the kernel to validate the command vs
>> > a known list of supported commands / payloads. One of the goals of
>> > requiring public documentation of any commands that libnvdimm might
>> > support for the ioctl path is to give the kernel the ability to gate
>> > future enabling on consideration of a common kernel front-end
>> > interface. I believe this would also address questions about the
>> > versioning scheme because userspace would be actively prevented from
>> > sending command payloads that were not first explicitly enabled in the
>> > kernel. This interface as it stands in this patch set seems to be a
>> > very thin / "anything goes" passthrough with no consideration for that
>> > policy.
>> >
>> > As an example of the utility of this policy, consider the recent
>> > support for nvdimm security commands that allow a passphrase to be set
>> > and issue commands like "unlock" and "secure erase". The kernel
>> > actively prevents those commands from being sent from userspace. See
>> > acpi_nfit_clear_to_send() and nd_cmd_clear_to_send(). The reasoning is
>> > that it enforces the kernel's nvdimm security model that uses
>> > encrypted/trusted keys to protect key material (clear text keys
>> > only-ever exist in kernel-space). Yes, that restriction is painful for
>> > people that don't want the kernel's security model and just want the
>> > simplicity of passing clear-text keys around, but it's necessary for
>> > the kernel to have any chance to provide a common abstraction across
>> > vendors. The pain of negotiating every single command with what the
>> > kernel will support is useful for the long term health of the kernel.
>> > It forces ongoing conversations across vendors to consolidate
>> > interfaces and reuse kernel best practices like encrypted/trusted
>> > keys. Code acceptance is the only real gate the kernel has to enforce
>> > cooperation across vendors.
>> >
>> > The expectation is that the kernel does not allow any command to pass
>> > that is not explicitly listed in a bitmap of known commands. I would
>> > expect that if you changed the payload of an existing command that
>> > would likely require a new entry in this bitmap. The goal is to give
>> > the kernel a chance to constrain the passthrough interface to afford a
>> > chance to have a discussion of what might done in a common
>> > implementation. Another example is the label-area read-write commands.
>> > The kernel needs explicit control to ensure that it owns the label
>> > area and that userspace is not able to corrupt it (write it behind the
>> > kernel's back).
>> >
>> > Now that said, I have battle scars with some OEMs that just want a
>> > generic passthrough interface so they never need to work with the
>> > kernel community again and can just write their custom validation
>> > tooling and be done. I've mostly been successful in that fight outside
>> > of the gaping hole of ND_CMD_VENDOR. That's the path that ipmctl has
>> > used to issue commands that have not made it into the public
>> > specification on docs.pmem.io. My warning shot for that is the
>> > "disable_vendor_specific" module option that administrators can set to
>> > only allow commands that the kernel explicitly knows the effects of to
>> > be issued. The result is only tooling / enabling that submits to this
>> > auditing regime is guaranteed to work everywhere.
>> 
>> Agree with points made above. With this patchset we arent really trying to
>> push an ioctl passthrough to exchange arbitary data with papr-scm module.
>> Nor do we want to bypass the kernel community for any future
>> enhancements on this interface. We made some design choices based on
>> our understanding of certain restriction we saw in ndctl/libndctl. Specifically
>> wanted to avoid issuing two CMD_CALL ioctl roundtrips.
>> 
>> That being said I had an extended discussion with Aneesh rethinking the
>> 'version' field and we both agreed *to remove this field* from the proposed
>> 'struct nd_pdsm_cmd_pkg'. This should resolve the contentions around this
>> Patch-4 in this patchset. Since the 'version' field isnt extensively used right
>> now the impact on the patchset would be small.
>> 
>> >
>> > So, that long explanation out of the way, what does that mean for this
>> > patch set? I'd like to understand if you still see a need for a
>> > versioning scheme if the implementation is required to explicitly list
>> > all the commands it supports? I.e. that the kernel need not worry
>> > about userspace sending future unknown payloads because unknown
>> > payloads are blocked. Also if your interface has anything similar to a
>> > "vendor specific" passthrough I would like to require that go through
>> > the ND_CMD_VENDOR ioctl, so that the kernel still has a common check
>> > point to prevent vendor specific "I don't want to talk to the kernel
>> > community" shenanigans, but even better if ND_CMD_VENDOR is
>> something
>> > the kernel can eventually jettison because nobody is using it.
>> 
>> As I mentioned above this isn't a 'vendor specific passthrough'
>> machenism. The 'version' field was proposed to avoid two CMD_CALL ioctl
>> roundtrip to fetch and report extended nvdimm health data like 'life-
>> remaining' which isnt always available for papr-scm.
>

> Oh, why not define a maximal health payload with all the attributes
> you know about today, leave some room for future expansion, and then
> report a validity flag for each attribute? This is how the "intel"
> smart-health payload works. If they ever needed to extend the payload
> they would increase the size and add more validity flags. Old
> userspace never groks the new fields, new userspace knows to ask for
> and parse the larger payload.
>
> See the flags field in 'struct nd_intel_smart' (in ndctl) and the
> translation of those flags to ndctl generic attribute flags
> intel_cmd_smart_get_flags().
>
> In general I'd like ndctl to understand the superset of all health
> attributes across all vendors. For the truly vendor specific ones it
> would mean that the health flags with a specific "papr_scm" back-end
> just would never be set on an "intel" device. I.e. look at the "hpe"
> and "msft" health backends. They only set a subset of the valid flags
> that could be reported.

Thanks, this sounds good. Infact papr_scm implementation in ndctl does
advertises support for only a subset of ND_SMART_* flags right now.

Using 'flags' instead of 'version' was indeed discussed during
v7..v9. However re-looking at the 'msft' and 'hpe' implementations the
approach of maximal health payload tagged with a flags field looks more
intuitive and I would prefer implementing this scheme in this patch-set.

The current set health data exchanged with between libndctl and
papr_scm via 'struct nd_papr_pdsm_health' (e.g various health status
bits , nvdimm arming status etc) are guaranteed to be always available
hence associating their availability with a flag wont be much useful as
the flag will be always set.

However as you suggested, extending the 'struct nd_papr_pdsm_health' in
future to accommodate new attributes like 'life-remaining' can be done
via adding them to the end of the struct and setting a flag field to
indicate its presence.

So I have the following proposal:
* Add a new '__u32 extension_flags' field at beginning of 'struct
  nd_papr_pdsm_health'
* Set the size of the struct to 184-bytes which is the maximum possible
  size for a pdsm payload.
* 'papr_scm' kernel driver will currently set 'extension_flag' to 0
  indicating no extension fields.

* Future patch that adds support for 'life-remaining' add the new-field
  at the end of known fields in 'struct nd_papr_pdsm_health'.
* When provided to  papr_scm kernel module, if 'life-remaining' data is
  available its populated and corresponding flag set in
  'extension_flags' field indicating its presence.
* When received by libndctl papr_scm implementation its tests if the
  extension_flags have associated 'life-remaining' flag set and if yes
  then return ND_SMART_USED_VALID flag back from
  ndctl_cmd_smart_get_flags().
  
Implementing first 3 items above in the current patchset should be
fairly trivial.

Does that sounds reasonable ?

Thanks,
~ Vaibhav

>
>> However we just realized instead of relying on 'version' field we can
>> advertise support for these extended attributes via nvdimm-flags from sysfs.
>> Looking at the nvdimm-flags libndctl can use an appropriate pdsm command
>> and struct to fetch the dimm health information from papr_scm via
>> CMD_CALL.
>> 
>> But thats something we plan to do in future and not with the current
>> patchset which only reports fixed set of nvdimm health attributes.
>> 
>> >
>> > I feel like this is a conversation that will take a few days to
>> > resolve, which does not leave time to push this for v5.8. That said, I
>> > do think the health flags patches at the beginning of this series are
>> > low risk and uncontentious. How about I merge those for v5.8 and
>> > circle back to get this ioctl path queued early in v5.8-rc? Apologies
>> > for the late feedback on this relative to v5.8.
>> >
>> Thanks for this consideration. Agree to the proposal. However changes to
>> patchset with removal of 'version' field is fairly small hence can quickly push
>> an updated patch series cumulating rest of the review comments from Ira.
>> 
>> Does that sounds reasonable ?
>

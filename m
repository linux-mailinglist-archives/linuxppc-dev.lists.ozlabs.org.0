Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F3D1ED765
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 22:30:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cgWm3DVzzDqft
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 06:30:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cgTz1kXSzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 06:28:38 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053K8nId106718; Wed, 3 Jun 2020 16:28:09 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dj9q2srt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 16:28:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 053KLZUI015414;
 Wed, 3 Jun 2020 20:28:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 31bf47bh5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 20:28:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 053KS4Id852444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 20:28:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DE75A4040;
 Wed,  3 Jun 2020 20:28:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83D5AA4051;
 Wed,  3 Jun 2020 20:28:01 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.74.91])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Jun 2020 20:28:01 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Thu, 04 Jun 2020 01:58:00 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [RESEND PATCH v9 4/5] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
In-Reply-To: <20200602210553.GG1505637@iweiny-DESK2.sc.intel.com>
References: <20200602101438.73929-1-vaibhav@linux.ibm.com>
 <20200602101438.73929-5-vaibhav@linux.ibm.com>
 <20200602205148.GF1505637@iweiny-DESK2.sc.intel.com>
 <20200602210553.GG1505637@iweiny-DESK2.sc.intel.com>
Date: Thu, 04 Jun 2020 01:58:00 +0530
Message-ID: <87lfl3hp2n.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 cotscore=-2147483648
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006030150
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ira,

Thanks again for reviewing this patch. My Response below:

Ira Weiny <ira.weiny@intel.com> writes:

> On Tue, Jun 02, 2020 at 01:51:49PM -0700, 'Ira Weiny' wrote:
>> On Tue, Jun 02, 2020 at 03:44:37PM +0530, Vaibhav Jain wrote:
>
> ...
>
>> > +
>> > +/*
>> > + * PDSM Envelope:
>> > + *
>> > + * The ioctl ND_CMD_CALL transfers data between user-space and kernel via
>> > + * envelope which consists of a header and user-defined payload sections.
>> > + * The header is described by 'struct nd_pdsm_cmd_pkg' which expects a
>> > + * payload following it and accessible via 'nd_pdsm_cmd_pkg.payload' field.
>> > + * There is reserved field that can used to introduce new fields to the
>> > + * structure in future. It also tries to ensure that 'nd_pdsm_cmd_pkg.payload'
>> > + * lies at a 8-byte boundary.
>> > + *
>> > + *  +-------------+---------------------+---------------------------+
>> > + *  |   64-Bytes  |       16-Bytes      |       Max 176-Bytes       |
>> > + *  +-------------+---------------------+---------------------------+
>> > + *  |               nd_pdsm_cmd_pkg     |                           |
>> > + *  |-------------+                     |                           |
>> > + *  |  nd_cmd_pkg |                     |                           |
>> > + *  +-------------+---------------------+---------------------------+
>> > + *  | nd_family   |                     |                           |
>> > + *  | nd_size_out | cmd_status          |                           |
>> > + *  | nd_size_in  | payload_version     |     payload               |
>> > + *  | nd_command  | reserved            |                           |
>> > + *  | nd_fw_size  |                     |                           |
>> > + *  +-------------+---------------------+---------------------------+
>
> One more comment WRT nd_size_[in|out].  I know that it is defined as the size
> of the FW payload but normally when you nest headers 'size' in Header A
> represents everything after Header A, including Header B.  In this case that
> would be including nd_pdsm_cmd_pkg...
>
> It looks like that is not what you have done?  Or perhaps I missed it?
>
Not sure if I understand the question correctly.
'struct nd_pdsm_cmd_pkg' contains 'struct nd_cmd_pkg' at its head and
its size_[in|out] are populated by the libndctl in userspace, setting
them to data following the 'struct nd_cmd_pkg'.

Copying of 'struct nd_cmd_pkg' to the input/out envelop is implicitly
done in __nd_ioctl via the command descriptor array
__nd_cmd_bus_descs. So I dont need to add the size of 'struct
nd_cmd_pkg' to nd_size_[in|out].

> Ira
>
>> > + *
>> > + * PDSM Header:
>> > + *
>> > + * The header is defined as 'struct nd_pdsm_cmd_pkg' which embeds a
>> > + * 'struct nd_cmd_pkg' instance. The PDSM command is assigned to member
>> > + * 'nd_cmd_pkg.nd_command'. Apart from size information of the envelope which is
>> > + * contained in 'struct nd_cmd_pkg', the header also has members following 
>>                                                              ^^^^^
>>                                                         ...  the  ...
>> 
>> > + * members:
>> > + *
>> > + * 'cmd_status'		: (Out) Errors if any encountered while servicing PDSM.
>> > + * 'payload_version'	: (In/Out) Version number associated with the payload.
>> > + * 'reserved'		: Not used and reserved for future.
>> > + *
>> > + * PDSM Payload:
>> > + *
>> > + * The layout of the PDSM Payload is defined by various structs shared between
>> > + * papr_scm and libndctl so that contents of payload can be interpreted. During
>> > + * servicing of a PDSM the papr_scm module will read input args from the payload
>> > + * field by casting its contents to an appropriate struct pointer based on the
>> > + * PDSM command. Similarly the output of servicing the PDSM command will be
>> > + * copied to the payload field using the same struct.
>> > + *
>> > + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size, which
>> > + * leaves around 176 bytes for the envelope payload (ignoring any padding that
>> > + * the compiler may silently introduce).
>> > + *
>> > + * Payload Version:
>> > + *
>> > + * A 'payload_version' field is present in PDSM header that indicates a specific
>> > + * version of the structure present in PDSM Payload for a given PDSM command.
>> > + * This provides backward compatibility in case the PDSM Payload structure
>> > + * evolves and different structures are supported by 'papr_scm' and 'libndctl'.
>> > + *
>> > + * When sending a PDSM Payload to 'papr_scm', 'libndctl' should send the version
>> > + * of the payload struct it supports via 'payload_version' field. The 'papr_scm'
>> > + * module when servicing the PDSM envelope checks the 'payload_version' and then
>> > + * uses 'payload struct version' == MIN('payload_version field',
>> > + * 'max payload-struct-version supported by papr_scm') to service the PDSM.
>> > + * After servicing the PDSM, 'papr_scm' put the negotiated version of payload
>> > + * struct in returned 'payload_version' field.
>> > + *
>> > + * Libndctl on receiving the envelope back from papr_scm again checks the
>> > + * 'payload_version' field and based on it use the appropriate version dsm
>> > + * struct to parse the results.
>> > + *
>> > + * Backward Compatibility:
>> > + *
>> > + * Above scheme of exchanging different versioned PDSM struct between libndctl
>> > + * and papr_scm should provide backward compatibility until following two
>> > + * assumptions/conditions when defining new PDSM structs hold:
>> > + *
>> > + * Let T(X) = { set of attributes in PDSM struct 'T' versioned X }
>> > + *
>> > + * 1. T(X) is a proper subset of T(Y) if Y > X.
>> > + *    i.e Each new version of PDSM struct should retain existing struct
>> > + *    attributes from previous version
>> > + *
>> > + * 2. If an entity (libndctl or papr_scm) supports a PDSM struct T(X) then
>> > + *    it should also support T(1), T(2)...T(X - 1).
>> > + *    i.e When adding support for new version of a PDSM struct, libndctl
>> > + *    and papr_scm should retain support of the existing PDSM struct
>> > + *    version they support.
>> 
>> Please see this thread for an example why versions are a bad idea in UAPIs:
>> 
>> https://lkml.org/lkml/2020/3/26/213
>> 
>> While the use of version is different in that thread the fundamental issues are
>> the same.  You end up with some weird matrix of supported features and
>> structure definitions.  For example, you are opening up the possibility of
>> changing structures with a different version for no good reason.
>> 
>> Also having the user query with version Z and get back version X (older) is
>> odd.  Generally if the kernel does not know about a feature (ie version Z of
>> the structure) it should return -EINVAL and let the user figure out what to do.
>> The user may just give up or they could try a different query.
>> 
>> > + */
>> > +
>> > +/* PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
>> > +struct nd_pdsm_cmd_pkg {
>> > +	struct nd_cmd_pkg hdr;	/* Package header containing sub-cmd */
>> > +	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
>> > +	__u16 reserved[5];	/* Ignored and to be used in future */
>> 
>> How do you know when reserved is used for something else in the future?  Is
>> reserved guaranteed (and checked by the code) to be 0?
>> 
>> > +	__u16 payload_version;	/* In/Out: version of the payload */
>> 
>> Why is payload_version after reserved?
>> 
>> > +	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
>> > +} __packed;
>> > +
>> > +/*
>> > + * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
>> > + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
>> > + */
>> > +enum papr_pdsm {
>> > +	PAPR_PDSM_MIN = 0x0,
>> > +	PAPR_PDSM_MAX,
>> > +};
>> > +
>> > +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */
>> > +static inline struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct nd_cmd_pkg *cmd)
>> > +{
>> > +	return (struct nd_pdsm_cmd_pkg *) cmd;
>> > +}
>> > +
>> > +/* Return the payload pointer for a given pcmd */
>> > +static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
>> > +{
>> > +	if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
>> > +		return NULL;
>> > +	else
>> > +		return (void *)(pcmd->payload);
>> > +}
>> > +
>> > +#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
>> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> > index 149431594839..5e2237e7ec08 100644
>> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> > @@ -15,13 +15,15 @@
>> >  #include <linux/seq_buf.h>
>> >  
>> >  #include <asm/plpar_wrappers.h>
>> > +#include <asm/papr_pdsm.h>
>> >  
>> >  #define BIND_ANY_ADDR (~0ul)
>> >  
>> >  #define PAPR_SCM_DIMM_CMD_MASK \
>> >  	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>> >  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
>> > -	 (1ul << ND_CMD_SET_CONFIG_DATA))
>> > +	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
>> > +	 (1ul << ND_CMD_CALL))
>> >  
>> >  /* DIMM health bitmap bitmap indicators */
>> >  /* SCM device is unable to persist memory contents */
>> > @@ -350,16 +352,97 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>> >  	return 0;
>> >  }
>> >  
>> > +/*
>> > + * Validate the inputs args to dimm-control function and return '0' if valid.
>> > + * This also does initial sanity validation to ND_CMD_CALL sub-command packages.
>> > + */
>> > +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>> > +		       unsigned int buf_len)
>> > +{
>> > +	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
>> > +	struct nd_pdsm_cmd_pkg *pkg = nd_to_pdsm_cmd_pkg(buf);
>> > +	struct papr_scm_priv *p;
>> > +
>> > +	/* Only dimm-specific calls are supported atm */
>> > +	if (!nvdimm)
>> > +		return -EINVAL;
>> > +
>> > +	/* get the provider date from struct nvdimm */
>> 
>> s/date/data
>> 
>> > +	p = nvdimm_provider_data(nvdimm);
>> > +
>> > +	if (!test_bit(cmd, &cmd_mask)) {
>> > +		dev_dbg(&p->pdev->dev, "Unsupported cmd=%u\n", cmd);
>> > +		return -EINVAL;
>> > +	} else if (cmd == ND_CMD_CALL) {
>> > +
>> > +		/* Verify the envelope package */
>> > +		if (!buf || buf_len < sizeof(struct nd_pdsm_cmd_pkg)) {
>> > +			dev_dbg(&p->pdev->dev, "Invalid pkg size=%u\n",
>> > +				buf_len);
>> > +			return -EINVAL;
>> > +		}
>> > +
>> > +		/* Verify that the PDSM family is valid */
>> > +		if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR) {
>> > +			dev_dbg(&p->pdev->dev, "Invalid pkg family=0x%llx\n",
>> > +				pkg->hdr.nd_family);
>> > +			return -EINVAL;
>> > +
>> > +		}
>> > +
>> > +		/* We except a payload with all PDSM commands */
>> > +		if (pdsm_cmd_to_payload(pkg) == NULL) {
>> > +			dev_dbg(&p->pdev->dev,
>> > +				"Empty payload for sub-command=0x%llx\n",
>> > +				pkg->hdr.nd_command);
>> > +			return -EINVAL;
>> > +		}
>> > +	}
>> > +
>> > +	/* Command looks valid */
>> 
>> I assume the first command to be implemented also checks the { nd_command,
>> payload_version, payload length } for correctness?
>> 
>> > +	return 0;
>> > +}
>> > +
>> > +static int papr_scm_service_pdsm(struct papr_scm_priv *p,
>> > +				struct nd_pdsm_cmd_pkg *call_pkg)
>> > +{
>> > +	/* unknown subcommands return error in packages */
>> > +	if (call_pkg->hdr.nd_command <= PAPR_PDSM_MIN ||
>> > +	    call_pkg->hdr.nd_command >= PAPR_PDSM_MAX) {
>> > +		dev_dbg(&p->pdev->dev, "Invalid PDSM request 0x%llx\n",
>> > +			call_pkg->hdr.nd_command);
>> > +		call_pkg->cmd_status = -EINVAL;
>> > +		return 0;
>> > +	}
>> > +
>> > +	/* Depending on the DSM command call appropriate service routine */
>> > +	switch (call_pkg->hdr.nd_command) {
>> > +	default:
>> > +		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
>> > +			call_pkg->hdr.nd_command);
>> > +		call_pkg->cmd_status = -ENOENT;
>> > +		return 0;
>> > +	}
>> > +}
>> > +
>> >  static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>> >  			  struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>> >  			  unsigned int buf_len, int *cmd_rc)
>> >  {
>> >  	struct nd_cmd_get_config_size *get_size_hdr;
>> >  	struct papr_scm_priv *p;
>> > +	struct nd_pdsm_cmd_pkg *call_pkg = NULL;
>> > +	int rc;
>> >  
>> > -	/* Only dimm-specific calls are supported atm */
>> > -	if (!nvdimm)
>> > -		return -EINVAL;
>> > +	/* Use a local variable in case cmd_rc pointer is NULL */
>> > +	if (cmd_rc == NULL)
>> > +		cmd_rc = &rc;
>> 
>> Why is this needed?  AFAICT The caller of papr_scm_ndctl does not specify null
>> and you did not change it.
>> 
>> > +
>> > +	*cmd_rc = is_cmd_valid(nvdimm, cmd, buf, buf_len);
>> > +	if (*cmd_rc) {
>> > +		pr_debug("Invalid cmd=0x%x. Err=%d\n", cmd, *cmd_rc);
>> > +		return *cmd_rc;
>> > +	}
>> >  
>> >  	p = nvdimm_provider_data(nvdimm);
>> >  
>> > @@ -381,13 +464,19 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>> >  		*cmd_rc = papr_scm_meta_set(p, buf);
>> >  		break;
>> >  
>> > +	case ND_CMD_CALL:
>> > +		call_pkg = nd_to_pdsm_cmd_pkg(buf);
>> > +		*cmd_rc = papr_scm_service_pdsm(p, call_pkg);
>> > +		break;
>> > +
>> >  	default:
>> > -		return -EINVAL;
>> > +		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
>> > +		*cmd_rc = -EINVAL;
>> 
>> Is this change related?  If there is a bug where there is a caller of
>> papr_scm_ndctl() with cmd_rc == NULL this should be a separate patch to fix
>> that issue.
>> 
>> Ira
>> 
>> >  	}
>> >  
>> >  	dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
>> >  
>> > -	return 0;
>> > +	return *cmd_rc;
>> >  }
>> >  
>> >  static ssize_t flags_show(struct device *dev,
>> > diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
>> > index de5d90212409..0e09dc5cec19 100644
>> > --- a/include/uapi/linux/ndctl.h
>> > +++ b/include/uapi/linux/ndctl.h
>> > @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
>> >  #define NVDIMM_FAMILY_HPE2 2
>> >  #define NVDIMM_FAMILY_MSFT 3
>> >  #define NVDIMM_FAMILY_HYPERV 4
>> > +#define NVDIMM_FAMILY_PAPR 5
>> >  
>> >  #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
>> >  					struct nd_cmd_pkg)
>> > -- 
>> > 2.26.2
>> > 
>> _______________________________________________
>> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
>> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

-- 
Cheers
~ Vaibhav

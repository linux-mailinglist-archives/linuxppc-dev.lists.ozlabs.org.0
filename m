Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A271ED8C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:47:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ckZb61gpzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 08:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ckXv6LCfzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 08:46:18 +1000 (AEST)
IronPort-SDR: FbOT8Yr2vhuF94pcLG31MkT5vW/GbHZ2qypM8fJnjD9NTf58r5kf1wkjljg4D/IBEAXJ2KhG19
 a00/heQoBcFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 15:46:13 -0700
IronPort-SDR: BwMy8V3saj5wGA97puK3HPhCUMIOOAOlsACc7qhIuGKRi4WzRbqGukHo8He1P0Mpv0bTGP4PKK
 Fto5QvvF32SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,470,1583222400"; d="scan'208";a="304521862"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2020 15:46:13 -0700
Date: Wed, 3 Jun 2020 15:46:13 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [RESEND PATCH v9 4/5] ndctl/papr_scm,uapi: Add support for PAPR
 nvdimm specific methods
Message-ID: <20200603224612.GJ1505637@iweiny-DESK2.sc.intel.com>
References: <20200602101438.73929-1-vaibhav@linux.ibm.com>
 <20200602101438.73929-5-vaibhav@linux.ibm.com>
 <20200602205148.GF1505637@iweiny-DESK2.sc.intel.com>
 <87tuzsggtd.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuzsggtd.fsf@linux.ibm.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 11:41:42PM +0530, Vaibhav Jain wrote:
> Hi Ira,
> 
> Thanks for reviewing this patch. My responses below:
> 
> Ira Weiny <ira.weiny@intel.com> writes:
> 

...

> >> + *
> >> + * Payload Version:
> >> + *
> >> + * A 'payload_version' field is present in PDSM header that indicates a specific
> >> + * version of the structure present in PDSM Payload for a given PDSM command.
> >> + * This provides backward compatibility in case the PDSM Payload structure
> >> + * evolves and different structures are supported by 'papr_scm' and 'libndctl'.
> >> + *
> >> + * When sending a PDSM Payload to 'papr_scm', 'libndctl' should send the version
> >> + * of the payload struct it supports via 'payload_version' field. The 'papr_scm'
> >> + * module when servicing the PDSM envelope checks the 'payload_version' and then
> >> + * uses 'payload struct version' == MIN('payload_version field',
> >> + * 'max payload-struct-version supported by papr_scm') to service the PDSM.
> >> + * After servicing the PDSM, 'papr_scm' put the negotiated version of payload
> >> + * struct in returned 'payload_version' field.
> >> + *
> >> + * Libndctl on receiving the envelope back from papr_scm again checks the
> >> + * 'payload_version' field and based on it use the appropriate version dsm
> >> + * struct to parse the results.
> >> + *
> >> + * Backward Compatibility:
> >> + *
> >> + * Above scheme of exchanging different versioned PDSM struct between libndctl
> >> + * and papr_scm should provide backward compatibility until following two
> >> + * assumptions/conditions when defining new PDSM structs hold:
> >> + *
> >> + * Let T(X) = { set of attributes in PDSM struct 'T' versioned X }
> >> + *
> >> + * 1. T(X) is a proper subset of T(Y) if Y > X.
> >> + *    i.e Each new version of PDSM struct should retain existing struct
> >> + *    attributes from previous version
> >> + *
> >> + * 2. If an entity (libndctl or papr_scm) supports a PDSM struct T(X) then
> >> + *    it should also support T(1), T(2)...T(X - 1).
> >> + *    i.e When adding support for new version of a PDSM struct, libndctl
> >> + *    and papr_scm should retain support of the existing PDSM struct
> >> + *    version they support.
> >
> > Please see this thread for an example why versions are a bad idea in UAPIs:
> >
> > https://lkml.org/lkml/2020/3/26/213
> >
> 
> > While the use of version is different in that thread the fundamental issues are
> > the same.  You end up with some weird matrix of supported features and
> > structure definitions.  For example, you are opening up the possibility of
> > changing structures with a different version for no good reason.
> 
> Not really sure I understand the statement correctly "you are opening up
> the possibility of changing structures with a different version for no
> good reason."

What I mean is:

struct v1 {
	u32 x;
	u32 y;
};

struct v2 {
	u32 y;
	u32 x;
};

x and y are the same data but you have now redefined the order of the struct.
You don't need that flexibility/complexity.

Generally I think you are defining:

struct v1 {
	u32 x;
	u32 y;
};

struct v2 {
	u32 x;
	u32 y;
	u32 z;
	u32 a;
};

Which becomes 2 structures...  There is no need.

The easiest thing to do is:

struct user_data {
	u32 x;
	u32 y;
};

And later you modify user_data to:

struct user_data {
	u32 x;
	u32 y;
	u32 z;
	u32 a;
};

libndctl always passes sizeof(struct user_data) to the call. [Do ensure
structures are 64bit aligned for this to work.]

The kernel sees the size and returns the amount of data up to that size.

Therefore, older kernels automatically fill in x and y,  newer kernels fill in
z/a if the buffer was big enough.  libndctl only uses the fields it knows about.

It is _much_ easier this way.  Almost nothing needs to get changed as versions
roll forward.  The only big issue is if libndctl _needs_ z then it has to check
if z is returned.

In that case add a cap_mask with bit fields which the kernel can fill in for
which fields are valid.

struct user_data {
	u64 cap_mask;  /* where bits define extra future capabilities */
	u32 x;
	u32 y;
};

IFF you need to add data within fields which are reserved you can use
capability flags to indicate which fields are requested and which are returned
by the kernel.

But I _think_ for what you want libndctl must survive if z/a are not available
right?  So just adding to the structure should be fine.

> We want to return more data in the struct in future iterations. So
> 'changing structure with different version' is something we are
> expecting. 
> 
> With the backward compatibility constraints 1 & 2 above, it will ensure
> that support matrix looks like a lower traingular matrix with each
> successive version supporting previous version attributes. So supporting
> future versions is relatively simplified.

But you end up with weird switch/if's etc to deal with the multiple structures.

With the size method the kernel simply returns the same size data as the user
requested and everything is done.  No logic required at all.  Literally it can
just copy the data it has (truncating if necessary).

> 
> >
> > Also having the user query with version Z and get back version X (older) is
> > odd.  Generally if the kernel does not know about a feature (ie version Z of
> > the structure) it should return -EINVAL and let the user figure out what to do.
> > The user may just give up or they could try a different query.
> >
> Considering the flow of ndctl/libndctl this is needed. libndctl will
> usually issues only one CMD_CALL ioctl to kernel and if that fails then
> an error is reported and ndctl will exit loosing state.
> 
> Adding mechanism in libndctl to reissue CMD_CALL ioctl to fetch a
> appropriate version of pdsm struct is going to be considerably more
> work.
> 
> This version fall-back mechanism, ensures that libndctl will receive
> usable data without having to reissue a more CMD_CALL ioctls.

Define usable?

What happens if libndctl does not get 'z' in my example above?  What does it
do?  If I understand correctly it does not _need_ z.  So why have a check on
the version from the kernel?

What if we change to:

struct v3 {
	u32 x;
	u32 y;
	u32 z;
	u32 a;
	u32 b;
	u32 c;
};

Now it has to

	if(version 2)
		z/a valid do something()

	if(version 3)
		b/c valid do something else()

if z, a, b, c are all 0 does it matter?

If not, the logic above disappears.

If so, then you need a cap mask.  Then the kernel can say c and a are valid
(but c is 0) or other flexible stuff like that.

> 
> >> + */
> >> +
> >> +/* PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
> >> +struct nd_pdsm_cmd_pkg {
> >> +	struct nd_cmd_pkg hdr;	/* Package header containing sub-cmd */
> >> +	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
> >> +	__u16 reserved[5];	/* Ignored and to be used in future */
> >
> > How do you know when reserved is used for something else in the future?  Is
> > reserved guaranteed (and checked by the code) to be 0?
> 
> For current set of pdsm requests ignore these reserved fields. However a
> future pdsm request can leverage these reserved fields. So papr_scm
> just bind the usage of these fields with the value of
> 'nd_cmd_pkg.nd_command' that indicates the pdsm request.
> 
> That being said checking if the reserved fields are set to 0 will be a
> good measure. Will add this check in next iteration.

Exactly, if you don't check them now you will end up with an older libndctl
which passes in garbage and breaks future users...  Basically rendering the
reserved fields useless.

> 
> >
> >> +	__u16 payload_version;	/* In/Out: version of the payload */
> >
> > Why is payload_version after reserved?
> Want to place the payload version field just before the payload data so
> that it can be accessed with simple pointer arithmetic.

I did not see that in the patch.  I thought you were using
nd_pdsm_cmd_pkg->payload_version?

> 
> >
> >> +	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
> >> +} __packed;
> >> +
> >> +/*
> >> + * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
> >> + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
> >> + */
> >> +enum papr_pdsm {
> >> +	PAPR_PDSM_MIN = 0x0,
> >> +	PAPR_PDSM_MAX,
> >> +};
> >> +
> >> +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */
> >> +static inline struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct nd_cmd_pkg *cmd)
> >> +{
> >> +	return (struct nd_pdsm_cmd_pkg *) cmd;
> >> +}
> >> +
> >> +/* Return the payload pointer for a given pcmd */
> >> +static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
> >> +{
> >> +	if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
> >> +		return NULL;
> >> +	else
> >> +		return (void *)(pcmd->payload);
> >> +}
> >> +
> >> +#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> >> index 149431594839..5e2237e7ec08 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -15,13 +15,15 @@
> >>  #include <linux/seq_buf.h>
> >>  
> >>  #include <asm/plpar_wrappers.h>
> >> +#include <asm/papr_pdsm.h>
> >>  
> >>  #define BIND_ANY_ADDR (~0ul)
> >>  
> >>  #define PAPR_SCM_DIMM_CMD_MASK \
> >>  	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
> >>  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
> >> -	 (1ul << ND_CMD_SET_CONFIG_DATA))
> >> +	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
> >> +	 (1ul << ND_CMD_CALL))
> >>  
> >>  /* DIMM health bitmap bitmap indicators */
> >>  /* SCM device is unable to persist memory contents */
> >> @@ -350,16 +352,97 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
> >>  	return 0;
> >>  }
> >>  
> >> +/*
> >> + * Validate the inputs args to dimm-control function and return '0' if valid.
> >> + * This also does initial sanity validation to ND_CMD_CALL sub-command packages.
> >> + */
> >> +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
> >> +		       unsigned int buf_len)
> >> +{
> >> +	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
> >> +	struct nd_pdsm_cmd_pkg *pkg = nd_to_pdsm_cmd_pkg(buf);
> >> +	struct papr_scm_priv *p;
> >> +
> >> +	/* Only dimm-specific calls are supported atm */
> >> +	if (!nvdimm)
> >> +		return -EINVAL;
> >> +
> >> +	/* get the provider date from struct nvdimm */
> >
> > s/date/data
> Thanks for point this out. Will fix this in next iteration.
> 
> >
> >> +	p = nvdimm_provider_data(nvdimm);
> >> +
> >> +	if (!test_bit(cmd, &cmd_mask)) {
> >> +		dev_dbg(&p->pdev->dev, "Unsupported cmd=%u\n", cmd);
> >> +		return -EINVAL;
> >> +	} else if (cmd == ND_CMD_CALL) {
> >> +
> >> +		/* Verify the envelope package */
> >> +		if (!buf || buf_len < sizeof(struct nd_pdsm_cmd_pkg)) {
> >> +			dev_dbg(&p->pdev->dev, "Invalid pkg size=%u\n",
> >> +				buf_len);
> >> +			return -EINVAL;
> >> +		}
> >> +
> >> +		/* Verify that the PDSM family is valid */
> >> +		if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR) {
> >> +			dev_dbg(&p->pdev->dev, "Invalid pkg family=0x%llx\n",
> >> +				pkg->hdr.nd_family);
> >> +			return -EINVAL;
> >> +
> >> +		}
> >> +
> >> +		/* We except a payload with all PDSM commands */
> >> +		if (pdsm_cmd_to_payload(pkg) == NULL) {
> >> +			dev_dbg(&p->pdev->dev,
> >> +				"Empty payload for sub-command=0x%llx\n",
> >> +				pkg->hdr.nd_command);
> >> +			return -EINVAL;
> >> +		}
> >> +	}
> >> +
> >> +	/* Command looks valid */
> >
> > I assume the first command to be implemented also checks the { nd_command,
> > payload_version, payload length } for correctness?
> Yes the pdsm service functions do check the payload_version and
> payload_length. Please see the papr_pdsm_health() that services the
> PAPR_PDSM_HEALTH pdsm in Patch-5
> 

cool.

> >
> >> +	return 0;
> >> +}
> >> +
> >> +static int papr_scm_service_pdsm(struct papr_scm_priv *p,
> >> +				struct nd_pdsm_cmd_pkg *call_pkg)
> >> +{
> >> +	/* unknown subcommands return error in packages */
> >> +	if (call_pkg->hdr.nd_command <= PAPR_PDSM_MIN ||
> >> +	    call_pkg->hdr.nd_command >= PAPR_PDSM_MAX) {
> >> +		dev_dbg(&p->pdev->dev, "Invalid PDSM request 0x%llx\n",
> >> +			call_pkg->hdr.nd_command);
> >> +		call_pkg->cmd_status = -EINVAL;
> >> +		return 0;
> >> +	}
> >> +
> >> +	/* Depending on the DSM command call appropriate service routine */
> >> +	switch (call_pkg->hdr.nd_command) {
> >> +	default:
> >> +		dev_dbg(&p->pdev->dev, "Unsupported PDSM request 0x%llx\n",
> >> +			call_pkg->hdr.nd_command);
> >> +		call_pkg->cmd_status = -ENOENT;
> >> +		return 0;
> >> +	}
> >> +}
> >> +
> >>  static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> >>  			  struct nvdimm *nvdimm, unsigned int cmd, void *buf,
> >>  			  unsigned int buf_len, int *cmd_rc)
> >>  {
> >>  	struct nd_cmd_get_config_size *get_size_hdr;
> >>  	struct papr_scm_priv *p;
> >> +	struct nd_pdsm_cmd_pkg *call_pkg = NULL;
> >> +	int rc;
> >>  
> >> -	/* Only dimm-specific calls are supported atm */
> >> -	if (!nvdimm)
> >> -		return -EINVAL;
> >> +	/* Use a local variable in case cmd_rc pointer is NULL */
> >> +	if (cmd_rc == NULL)
> >> +		cmd_rc = &rc;
> >
> > Why is this needed?  AFAICT The caller of papr_scm_ndctl does not specify null
> > and you did not change it.
> This pointer is coming from outside the papr_scm code hence need to be
> defensive here. Also as per[1] cmd_rc is "translation of firmware status"
> and not every caller would need it hence making this pointer optional.
> 
> This is evident in acpi_nfit_blk_get_flags() where the 'nd_desc->ndctl'
> is called with 'cmd_rc == NULL'.
> 
> [1] https://lore.kernel.org/linux-nvdimm/CAPcyv4hE_FG0YZXJVA1G=CBq8b9e0K54jxk5Sq5UKU-dnWT2Kg@mail.gmail.com/

Ah... Ok.  So this is a bug fix which needs to happen regardless of the status
of this patch...

> 
> >
> >> +
> >> +	*cmd_rc = is_cmd_valid(nvdimm, cmd, buf, buf_len);
> >> +	if (*cmd_rc) {
> >> +		pr_debug("Invalid cmd=0x%x. Err=%d\n", cmd, *cmd_rc);
> >> +		return *cmd_rc;
> >> +	}
> >>  
> >>  	p = nvdimm_provider_data(nvdimm);
> >>  
> >> @@ -381,13 +464,19 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> >>  		*cmd_rc = papr_scm_meta_set(p, buf);

... Because this will break here. even without this new code...  right?

Lets get this fix in as a prelim-patch.

> >>  		break;
> >>  
> >> +	case ND_CMD_CALL:
> >> +		call_pkg = nd_to_pdsm_cmd_pkg(buf);
> >> +		*cmd_rc = papr_scm_service_pdsm(p, call_pkg);
> >> +		break;
> >> +
> >>  	default:
> >> -		return -EINVAL;
> >> +		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
> >> +		*cmd_rc = -EINVAL;
> >
> > Is this change related?  If there is a bug where there is a caller of
> > papr_scm_ndctl() with cmd_rc == NULL this should be a separate patch to fix
> > that issue.
> This simplifies a bit debugging of errors reported in
> papr_scm_ndctl() as it ensures that subsequest dev_dbg "Returned with
> cmd_rc" is always logged.
> 
> I think, this is a too small change to be carved out as an independent
> patch. Also this doesnt change the behaviour of the code except logging
> some more error info.
> 
> However, If you feel too strongly about it I will spin a separate patch
> in this patch series for this.

This can go in as part of a 'protect against cmd_rc == NULL' preliminary patch.

I flagged this because at first I could not figure out what this had to do with
the ND_CMD_CALL...

For reviewers you want to make your patches concise to what you are
fixing/adding...

Also, based on acpi_nfit_blk_get_flags() using cmd_rc == NULL it looks like we
have a bug which needs to get fixed regardless of the this patch.  And if that
bug exists in earlier kernels you will need a separate patch to backport as a
fix.

So lets get that in first and separate...  :-D

Ira

> 
> >
> > Ira
> >
> >>  	}
> >>  
> >>  	dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
> >>  
> >> -	return 0;
> >> +	return *cmd_rc;
> >>  }
> >>  
> >>  static ssize_t flags_show(struct device *dev,
> >> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
> >> index de5d90212409..0e09dc5cec19 100644
> >> --- a/include/uapi/linux/ndctl.h
> >> +++ b/include/uapi/linux/ndctl.h
> >> @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
> >>  #define NVDIMM_FAMILY_HPE2 2
> >>  #define NVDIMM_FAMILY_MSFT 3
> >>  #define NVDIMM_FAMILY_HYPERV 4
> >> +#define NVDIMM_FAMILY_PAPR 5
> >>  
> >>  #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
> >>  					struct nd_cmd_pkg)
> >> -- 
> >> 2.26.2
> >> 
> 
> -- 
> Cheers
> ~ Vaibhav

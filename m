Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 810161DB792
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 16:58:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RwqW6Jy7zDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 00:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rwl54KZVzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 00:54:34 +1000 (AEST)
IronPort-SDR: vdPAkB/tr+I4JpI4Pcr9hvrJyp1rzYMMfZ2S/iW3useIMnritezXwcdMJP1Kluz3DblLyPu8IU
 j2HMeum2DmgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 07:54:31 -0700
IronPort-SDR: FzX76Gq6r0Mp5WT39XxITd7IMdIN8sA0+4H1/WxoIr3thi1ua91iaTz6omU6HO6l4ZR98VykTN
 hW9JSOeletGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="308743884"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by FMSMGA003.fm.intel.com with ESMTP; 20 May 2020 07:54:31 -0700
Date: Wed, 20 May 2020 07:54:31 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [RESEND PATCH v7 3/5] powerpc/papr_scm: Fetch nvdimm health
 information from PHYP
Message-ID: <20200520145430.GB3660833@iweiny-DESK2.sc.intel.com>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
 <20200519190058.257981-4-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519190058.257981-4-vaibhav@linux.ibm.com>
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
Cc: linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 12:30:56AM +0530, Vaibhav Jain wrote:
> Implement support for fetching nvdimm health information via
> H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair
> of 64-bit big-endian integers, bitwise-and of which is then stored in
> 'struct papr_scm_priv' and subsequently partially exposed to
> user-space via newly introduced dimm specific attribute
> 'papr/flags'. Since the hcall is costly, the health information is
> cached and only re-queried, 60s after the previous successful hcall.
> 
> The patch also adds a  documentation text describing flags reported by
> the the new sysfs attribute 'papr/flags' is also introduced at
> Documentation/ABI/testing/sysfs-bus-papr-scm.
> 
> [1] commit 58b278f568f0 ("powerpc: Provide initial documentation for
> PAPR hcalls")
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
> 
> Resend:
> * None
> 
> v6..v7 :
> * Used the exported buf_seq_printf() function to generate content for
>   'papr/flags'
> * Moved the PAPR_SCM_DIMM_* bit-flags macro definitions to papr_scm.c
>   and removed the papr_scm.h file [Mpe]
> * Some minor consistency issued in sysfs-bus-papr-scm
>   documentation. [Mpe]
> * s/dimm_mutex/health_mutex/g [Mpe]
> * Split drc_pmem_query_health() into two function one of which takes
>   care of caching and locking. [Mpe]
> * Fixed a local copy creation of dimm health information using
>   READ_ONCE(). [Mpe]
> 
> v5..v6 :
> * Change the flags sysfs attribute from 'papr_flags' to 'papr/flags'
>   [Dan Williams]
> * Include documentation for 'papr/flags' attr [Dan Williams]
> * Change flag 'save_fail' to 'flush_fail' [Dan Williams]
> * Caching of health bitmap to reduce expensive hcalls [Dan Williams]
> * Removed usage of PPC_BIT from 'papr-scm.h' header [Mpe]
> * Replaced two __be64 integers from papr_scm_priv to a single u64
>   integer [Mpe]
> * Updated patch description to reflect the changes made in this
>   version.
> * Removed avoidable usage of 'papr_scm_priv.dimm_mutex' from
>   flags_show() [Dan Williams]
> 
> v4..v5 :
> * None
> 
> v3..v4 :
> * None
> 
> v2..v3 :
> * Removed PAPR_SCM_DIMM_HEALTH_NON_CRITICAL as a condition for
>        	 NVDIMM unarmed [Aneesh]
> 
> v1..v2 :
> * New patch in the series.
> ---
>  Documentation/ABI/testing/sysfs-bus-papr-scm |  27 +++
>  arch/powerpc/platforms/pseries/papr_scm.c    | 169 ++++++++++++++++++-
>  2 files changed, 194 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-papr-scm
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-scm b/Documentation/ABI/testing/sysfs-bus-papr-scm
> new file mode 100644
> index 000000000000..6143d06072f1
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-papr-scm
> @@ -0,0 +1,27 @@
> +What:		/sys/bus/nd/devices/nmemX/papr/flags
> +Date:		Apr, 2020
> +KernelVersion:	v5.8
> +Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
> +Description:
> +		(RO) Report flags indicating various states of a
> +		papr-scm NVDIMM device. Each flag maps to a one or
> +		more bits set in the dimm-health-bitmap retrieved in
> +		response to H_SCM_HEALTH hcall. The details of the bit
> +		flags returned in response to this hcall is available
> +		at 'Documentation/powerpc/papr_hcalls.rst' . Below are
> +		the flags reported in this sysfs file:
> +
> +		* "not_armed"	: Indicates that NVDIMM contents will not
> +				  survive a power cycle.
> +		* "flush_fail"	: Indicates that NVDIMM contents
> +				  couldn't be flushed during last
> +				  shut-down event.
> +		* "restore_fail": Indicates that NVDIMM contents
> +				  couldn't be restored during NVDIMM
> +				  initialization.
> +		* "encrypted"	: NVDIMM contents are encrypted.
> +		* "smart_notify": There is health event for the NVDIMM.
> +		* "scrubbed"	: Indicating that contents of the
> +				  NVDIMM have been scrubbed.
> +		* "locked"	: Indicating that NVDIMM contents cant
> +				  be modified until next power cycle.
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index f35592423380..142636e1a59f 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -12,6 +12,7 @@
>  #include <linux/libnvdimm.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> +#include <linux/seq_buf.h>
>  
>  #include <asm/plpar_wrappers.h>
>  
> @@ -22,6 +23,44 @@
>  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
>  	 (1ul << ND_CMD_SET_CONFIG_DATA))
>  
> +/* DIMM health bitmap bitmap indicators */
> +/* SCM device is unable to persist memory contents */
> +#define PAPR_SCM_DIMM_UNARMED                   (1ULL << (63 - 0))
> +/* SCM device failed to persist memory contents */
> +#define PAPR_SCM_DIMM_SHUTDOWN_DIRTY            (1ULL << (63 - 1))
> +/* SCM device contents are persisted from previous IPL */
> +#define PAPR_SCM_DIMM_SHUTDOWN_CLEAN            (1ULL << (63 - 2))
> +/* SCM device contents are not persisted from previous IPL */
> +#define PAPR_SCM_DIMM_EMPTY                     (1ULL << (63 - 3))
> +/* SCM device memory life remaining is critically low */
> +#define PAPR_SCM_DIMM_HEALTH_CRITICAL           (1ULL << (63 - 4))
> +/* SCM device will be garded off next IPL due to failure */
> +#define PAPR_SCM_DIMM_HEALTH_FATAL              (1ULL << (63 - 5))
> +/* SCM contents cannot persist due to current platform health status */
> +#define PAPR_SCM_DIMM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
> +/* SCM device is unable to persist memory contents in certain conditions */
> +#define PAPR_SCM_DIMM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
> +/* SCM device is encrypted */
> +#define PAPR_SCM_DIMM_ENCRYPTED                 (1ULL << (63 - 8))
> +/* SCM device has been scrubbed and locked */
> +#define PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED       (1ULL << (63 - 9))
> +
> +/* Bits status indicators for health bitmap indicating unarmed dimm */
> +#define PAPR_SCM_DIMM_UNARMED_MASK (PAPR_SCM_DIMM_UNARMED |		\
> +				    PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
> +
> +/* Bits status indicators for health bitmap indicating unflushed dimm */
> +#define PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK (PAPR_SCM_DIMM_SHUTDOWN_DIRTY)
> +
> +/* Bits status indicators for health bitmap indicating unrestored dimm */
> +#define PAPR_SCM_DIMM_BAD_RESTORE_MASK  (PAPR_SCM_DIMM_EMPTY)
> +
> +/* Bit status indicators for smart event notification */
> +#define PAPR_SCM_DIMM_SMART_EVENT_MASK (PAPR_SCM_DIMM_HEALTH_CRITICAL | \
> +					PAPR_SCM_DIMM_HEALTH_FATAL |	\
> +					PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
> +
> +/* private struct associated with each region */
>  struct papr_scm_priv {
>  	struct platform_device *pdev;
>  	struct device_node *dn;
> @@ -39,6 +78,15 @@ struct papr_scm_priv {
>  	struct resource res;
>  	struct nd_region *region;
>  	struct nd_interleave_set nd_set;
> +
> +	/* Protect dimm health data from concurrent read/writes */
> +	struct mutex health_mutex;
> +
> +	/* Last time the health information of the dimm was updated */
> +	unsigned long lasthealth_jiffies;
> +
> +	/* Health information for the dimm */
> +	u64 health_bitmap;

I wonder if this should be typed big endian as you mention that it is in the
commit message?

>  };
>  
>  static int drc_pmem_bind(struct papr_scm_priv *p)
> @@ -144,6 +192,62 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
>  	return drc_pmem_bind(p);
>  }
>  
> +/*
> + * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
> + * health information.
> + */
> +static int __drc_pmem_query_health(struct papr_scm_priv *p)
> +{
> +	unsigned long ret[PLPAR_HCALL_BUFSIZE];

Is this exclusive to 64bit?  Why not u64?

> +	s64 rc;

plpar_hcall() returns long and this function returns int and rc is declared
s64?

Why not have them all be long to follow plpar_hcall?

> +
> +	/* issue the hcall */
> +	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
> +	if (rc != H_SUCCESS) {
> +		dev_err(&p->pdev->dev,
> +			 "Failed to query health information, Err:%lld\n", rc);
> +		rc = -ENXIO;
> +		goto out;
> +	}
> +
> +	p->lasthealth_jiffies = jiffies;
> +	p->health_bitmap = ret[0] & ret[1];
> +
> +	dev_dbg(&p->pdev->dev,
> +		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
> +		ret[0], ret[1]);
> +out:
> +	return rc;
> +}
> +
> +/* Min interval in seconds for assuming stable dimm health */
> +#define MIN_HEALTH_QUERY_INTERVAL 60
> +
> +/* Query cached health info and if needed call drc_pmem_query_health */
> +static int drc_pmem_query_health(struct papr_scm_priv *p)
> +{
> +	unsigned long cache_timeout;
> +	s64 rc;
> +
> +	/* Protect concurrent modifications to papr_scm_priv */
> +	rc = mutex_lock_interruptible(&p->health_mutex);
> +	if (rc)
> +		return rc;
> +
> +	/* Jiffies offset for which the health data is assumed to be same */
> +	cache_timeout = p->lasthealth_jiffies +
> +		msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
> +
> +	/* Fetch new health info is its older than MIN_HEALTH_QUERY_INTERVAL */
> +	if (time_after(jiffies, cache_timeout))
> +		rc = __drc_pmem_query_health(p);

And back to s64 after returning int?

> +	else
> +		/* Assume cached health data is valid */
> +		rc = 0;
> +
> +	mutex_unlock(&p->health_mutex);
> +	return rc;
> +}
>  
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>  			     struct nd_cmd_get_config_data_hdr *hdr)
> @@ -286,6 +390,64 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  	return 0;
>  }
>  
> +static ssize_t flags_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct nvdimm *dimm = to_nvdimm(dev);
> +	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
> +	struct seq_buf s;
> +	u64 health;
> +	int rc;
> +
> +	rc = drc_pmem_query_health(p);

and back to int...

Just make them long all through...

Ira

> +	if (rc)
> +		return rc;
> +
> +	/* Copy health_bitmap locally, check masks & update out buffer */
> +	health = READ_ONCE(p->health_bitmap);
> +
> +	seq_buf_init(&s, buf, PAGE_SIZE);
> +	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
> +		seq_buf_printf(&s, "not_armed ");
> +
> +	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
> +		seq_buf_printf(&s, "flush_fail ");
> +
> +	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
> +		seq_buf_printf(&s, "restore_fail ");
> +
> +	if (health & PAPR_SCM_DIMM_ENCRYPTED)
> +		seq_buf_printf(&s, "encrypted ");
> +
> +	if (health & PAPR_SCM_DIMM_SMART_EVENT_MASK)
> +		seq_buf_printf(&s, "smart_notify ");
> +
> +	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED)
> +		seq_buf_printf(&s, "scrubbed locked ");
> +
> +	if (seq_buf_used(&s))
> +		seq_buf_printf(&s, "\n");
> +
> +	return seq_buf_used(&s);
> +}
> +DEVICE_ATTR_RO(flags);
> +
> +/* papr_scm specific dimm attributes */
> +static struct attribute *papr_scm_nd_attributes[] = {
> +	&dev_attr_flags.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group papr_scm_nd_attribute_group = {
> +	.name = "papr",
> +	.attrs = papr_scm_nd_attributes,
> +};
> +
> +static const struct attribute_group *papr_scm_dimm_attr_groups[] = {
> +	&papr_scm_nd_attribute_group,
> +	NULL,
> +};
> +
>  static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  {
>  	struct device *dev = &p->pdev->dev;
> @@ -312,8 +474,8 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  	dimm_flags = 0;
>  	set_bit(NDD_LABELING, &dimm_flags);
>  
> -	p->nvdimm = nvdimm_create(p->bus, p, NULL, dimm_flags,
> -				  PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
> +	p->nvdimm = nvdimm_create(p->bus, p, papr_scm_dimm_attr_groups,
> +				  dimm_flags, PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
>  	if (!p->nvdimm) {
>  		dev_err(dev, "Error creating DIMM object for %pOF\n", p->dn);
>  		goto err;
> @@ -399,6 +561,9 @@ static int papr_scm_probe(struct platform_device *pdev)
>  	if (!p)
>  		return -ENOMEM;
>  
> +	/* Initialize the dimm mutex */
> +	mutex_init(&p->health_mutex);
> +
>  	/* optional DT properties */
>  	of_property_read_u32(dn, "ibm,metadata-size", &metadata_size);
>  
> -- 
> 2.26.2
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

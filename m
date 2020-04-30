Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6621BF3DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 11:12:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CV5d2DdqzDrJC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 19:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CV3h74V3zDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 19:10:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=A7GfYDf2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49CV3g3wJbz9sP7;
 Thu, 30 Apr 2020 19:10:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588237856;
 bh=hc1yJFOYnOxFL1yCrowPWF437JulaYOXzs5/ZBcAgTE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=A7GfYDf24Pbsy//dMLTn6tWClEdEzRaBp9cM3fofBOon6YDNXaMhSIdQpCzzD0WeT
 x8OkNUKPoJL/gWHM3csIU7GyYdPp2laUwZ1rOYu6tl8hEIcQtHkB06lh27tuH5luHi
 7k2eIeskb1OgYJpNHHcrtUgxFY71D6C54c1HrPGCer3P8NGrzSa+Pox6GbwhjoOA0m
 svyvsTN3lO+jzUABGyldTDy7Zjzmd2++APfW1waVT+SILaf4RqgRhOxQLPduKob/s3
 WJ93FORZNKKOcqwdscd4dItDSKLDsD+npsvuvhfdV6pVvptCPbokpIZveVxvuP1fcr
 AmjPs7IeJfFPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v6 2/4] powerpc/papr_scm: Fetch nvdimm health information
 from PHYP
In-Reply-To: <20200420070711.223545-3-vaibhav@linux.ibm.com>
References: <20200420070711.223545-1-vaibhav@linux.ibm.com>
 <20200420070711.223545-3-vaibhav@linux.ibm.com>
Date: Thu, 30 Apr 2020 19:11:09 +1000
Message-ID: <87o8r9e3te.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Santosh Sivaraj <santosh@fossix.org>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Implement support for fetching nvdimm health information via
> H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair
> of 64-bit big-endian integers, bitwise-and of which is then stored in
> 'struct papr_scm_priv' and subsequently partially exposed to
> user-space via newly introduced dimm specific attribute
> 'papr/flags'. Since the hcall is costly, the health information is
> cached and only re-queried, 60s after the previous successful hcall.
>
> The patch also adds a new asm header named 'papr_scm.h' describing the
> interface between PHYP and guest kernel. A documentation text
> describing flags reported by the the new sysfs attribute 'papr/flags'
> is also introduced at Documentation/ABI/testing/sysfs-bus-papr-scm.
>
> [1] commit 58b278f568f0 ("powerpc: Provide initial documentation for
> PAPR hcalls")
>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog
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
>  Documentation/ABI/testing/sysfs-bus-papr-scm |  27 ++++
>  arch/powerpc/include/asm/papr_scm.h          |  49 ++++++++
>  arch/powerpc/platforms/pseries/papr_scm.c    | 126 ++++++++++++++++++-
>  3 files changed, 200 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-papr-scm
>  create mode 100644 arch/powerpc/include/asm/papr_scm.h
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-scm b/Documentation/ABI/testing/sysfs-bus-papr-scm
> new file mode 100644
> index 000000000000..001e4d34ab5c
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
> +		* "not_armed"	: Indicating that nvdimm contents will not

NVDIMM?

> +				  survive a power cycle.
> +		* "flush_fail"	: Indicating that nvdimm contents
> +				  couldn't be flushed during last
> +				  shutdown event.
> +		* "restore_fail": Indicating that nvdimm contents
> +				  couldn't be restored during dimm

DIMM?

> +				  initialization.
> +		* "encrypted"	: Dimm contents are encrypted.
> +		* "smart_notify": There is health event for the nvdimm.
> +		* "scrubbed"	: Indicating that contents of the
> +				  nvdimm have been scrubbed.
> +		* "locked"	: Indicating that nvdimm contents cant
> +				  be modified until next power cycle.

Some of these strings are not very meaningful to me, I would choose
different values.

But I assume you are using these because they are defined somewhere
else, where is that?

> diff --git a/arch/powerpc/include/asm/papr_scm.h b/arch/powerpc/include/asm/papr_scm.h
> new file mode 100644
> index 000000000000..b51c048e906a
> --- /dev/null
> +++ b/arch/powerpc/include/asm/papr_scm.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Structures and defines needed to manage nvdimms for spapr guests.
> + */
> +#ifndef _ASM_POWERPC_PAPR_SCM_H_
> +#define _ASM_POWERPC_PAPR_SCM_H_
> +
> +#include <linux/types.h>
> +#include <asm/bitsperlong.h>
> +
> +/* DIMM health bitmap bitmap indicators */
> +
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
> +#define PAPR_SCM_DIMM_UNARMED_MASK (PAPR_SCM_DIMM_UNARMED |	\
> +					PAPR_SCM_DIMM_HEALTH_UNHEALTHY)
> +
> +/* Bits status indicators for health bitmap indicating unflushed dimm */
> +#define PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK (PAPR_SCM_DIMM_SHUTDOWN_DIRTY)
> +
> +/* Bits status indicators for health bitmap indicating unrestored dimm */
> +#define PAPR_SCM_DIMM_BAD_RESTORE_MASK  (PAPR_SCM_DIMM_EMPTY)
> +
> +/* Bit status indicators for smart event notification */
> +#define PAPR_SCM_DIMM_SMART_EVENT_MASK (PAPR_SCM_DIMM_HEALTH_CRITICAL | \
> +					   PAPR_SCM_DIMM_HEALTH_FATAL | \
> +					   PAPR_SCM_DIMM_HEALTH_UNHEALTHY)

These are only ever used in papr_scm.c AFAICS, so put them in there.

> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0b4467e378e5..f8fe579e6f2e 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -14,6 +14,7 @@
>  #include <linux/delay.h>
>  
>  #include <asm/plpar_wrappers.h>
> +#include <asm/papr_scm.h>
>  
>  #define BIND_ANY_ADDR (~0ul)
>  
> @@ -39,6 +40,15 @@ struct papr_scm_priv {
>  	struct resource res;
>  	struct nd_region *region;
>  	struct nd_interleave_set nd_set;
> +
> +	/* Protect dimm health data from concurrent read/writes */
> +	struct mutex dimm_mutex;

health_mutex then?

> +	/* Last time the health information of the dimm was updated */
> +	unsigned long lasthealth_jiffies;
> +
> +	/* Health information for the dimm */
> +	u64 health_bitmap;
>  };
>  
>  static int drc_pmem_bind(struct papr_scm_priv *p)
> @@ -144,6 +154,56 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
>  	return drc_pmem_bind(p);
>  }
>  
> +/* Min interval in seconds between successive H_SCM_HEALTH hcalls */
> +#define MIN_HEALTH_QUERY_INTERVAL 60
> +
> +/*
> + * Issue hcall if needed to retrieve dimm health info. Information is cached
> + * and subsequent calls may return success without issueing the hcall.
                                                      ^
                                                      issuing

> + * Use 'force == true' to force issue of the hcall ignoring the cache
> + * timeout.
> + */
> +static int drc_pmem_query_health(struct papr_scm_priv *p, bool force)

The force API is a bit clunky.

I think it would make more sense if you had the caching logic in a
wrapper function, or even in flags_show() directly.

And then have papr_scm_get_health() just call the underlying routine
that always does the hcall.

I think you can safely read lasthealth_jiffies without the mutex.

> +{
> +	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> +	s64 rc;
> +	unsigned long cache_timeout;

My eyes! ;)

	unsigned long cache_timeout, ret[PLPAR_HCALL_BUFSIZE];
	s64 rc;

Please :)

> +
> +	/* Protect concurrent modifications to papr_scm_priv */
> +	rc = mutex_lock_interruptible(&p->dimm_mutex);
> +	if (rc)
> +		return rc;
> +
> +	/* Jiffies offset for which the health data is assumed to be same */
> +	cache_timeout = p->lasthealth_jiffies +
> +		msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
> +
> +	/* Dont issue the hcall if health information is relatively new */
> +	if (!force && time_after(cache_timeout, jiffies)) {
> +		rc = 0;
> +		goto out;
> +	}
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

I said in v5 that you needn't store health_bitmap as __be64, but you do
still need to convert it to CPU endian at some point.

I think ret[] should actually be __be64, and this is where you should
convert it to CPU endian, before assigning to health_bitmap.

> +
> +	dev_dbg(&p->pdev->dev,
> +		"Queried dimm health info. Bitmap:0x%016lx Mask:0x%016lx\n",
> +		ret[0], ret[1]);
> +
> +out:
> +	mutex_unlock(&p->dimm_mutex);
> +	return rc;
> +}
>  
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>  			     struct nd_cmd_get_config_data_hdr *hdr)
> @@ -304,6 +364,65 @@ static inline int papr_scm_node(int node)
>  	return min_node;
>  }
>  
> +static ssize_t flags_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct nvdimm *dimm = to_nvdimm(dev);
> +	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
> +	int rc;
> +	u64 health;
> +
> +	rc = drc_pmem_query_health(p, false);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Copy the LE byte-ordered health_bitmap locally, check for various
> +	 * masks and update the sysfs out buffer.
> +	 */
> +	health = p->health_bitmap;

Why are you copying it locally? Because you don't hold the lock and
you're worried it will mutate? The compiler may just ignore you and
reload it anyway.

You'd need to use READ_ONCE(), or do it with the lock held. Or you can
just decide that it's OK for an update to race vs the display.

> +
> +	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
> +		rc += sprintf(buf, "not_armed ");

I'd still be happier if you used snprintf() or seq_puts(), but I won't
die in a ditch over it.

> +	if (health & PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK)
> +		rc += sprintf(buf + rc, "save_fail ");
> +
> +	if (health & PAPR_SCM_DIMM_BAD_RESTORE_MASK)
> +		rc += sprintf(buf + rc, "restore_fail ");
> +
> +	if (health & PAPR_SCM_DIMM_ENCRYPTED)
> +		rc += sprintf(buf + rc, "encrypted ");
> +
> +	if (health & PAPR_SCM_DIMM_SMART_EVENT_MASK)
> +		rc += sprintf(buf + rc, "smart_notify ");
> +
> +	if (health & PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED)
> +		rc += sprintf(buf + rc, "scrubbed locked ");
> +
> +	if (rc > 0)
> +		rc += sprintf(buf + rc, "\n");
> +
> +	return rc;
> +}
> +DEVICE_ATTR_RO(flags);

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEE19C00D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 13:19:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tLFR2BxRzDrR3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 22:19:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ellerman@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tJwg5djxzDr1S
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 21:20:13 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032A33FF102128
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 06:20:11 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022r18q0q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 06:20:10 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ellerman@au1.ibm.com>;
 Thu, 2 Apr 2020 11:19:50 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 11:19:47 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032AK4EG41222338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 10:20:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F0E74204D;
 Thu,  2 Apr 2020 10:20:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7838442052;
 Thu,  2 Apr 2020 10:20:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 10:20:03 +0000 (GMT)
Received: from localhost (unknown [9.102.33.58])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9E8E7A0130;
 Thu,  2 Apr 2020 21:19:57 +1100 (AEDT)
From: Michael Ellerman <ellerman@au1.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v5 1/4] powerpc/papr_scm: Fetch nvdimm health information
 from PHYP
In-Reply-To: <20200331143229.306718-2-vaibhav@linux.ibm.com>
References: <20200331143229.306718-1-vaibhav@linux.ibm.com>
 <20200331143229.306718-2-vaibhav@linux.ibm.com>
Date: Thu, 02 Apr 2020 21:20:11 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 20040210-0020-0000-0000-000003C02470
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040210-0021-0000-0000-00002218CED9
Message-Id: <878sjetcis.fsf@mpe.ellerman.id.au>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_01:2020-03-31,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=1 adultscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020091
X-Mailman-Approved-At: Thu, 02 Apr 2020 22:17:55 +1100
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Implement support for fetching nvdimm health information via
> H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair
> of 64-bit big-endian integers which are then stored in 'struct
> papr_scm_priv' and subsequently partially exposed to user-space via
> newly introduced dimm specific attribute 'papr_flags'. Also a new asm
> header named 'papr-scm.h' is added that describes the interface
> between PHYP and guest kernel.
>
> Following flags are reported via 'papr_flags' sysfs attribute contents
> of which are space separated string flags indicating various nvdimm
> states:
>
>  * "not_armed" 	: Indicating that nvdimm contents wont survive a power
> 		   cycle.
>  * "save_fail" 	: Indicating that nvdimm contents couldn't be flushed
> 		   during last shutdown event.
>  * "restore_fail": Indicating that nvdimm contents couldn't be restored
> 		   during dimm initialization.
>  * "encrypted" 	: Dimm contents are encrypted.
>  * "smart_notify": There is health event for the nvdimm.
>  * "scrubbed" 	: Indicating that contents of the nvdimm have been
> 		   scrubbed.
>  * "locked"	: Indicating that nvdimm contents cant be modified
> 		   until next power cycle.
>
> [1]: commit 58b278f568f0 ("powerpc: Provide initial documentation for
> PAPR hcalls")
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v4..v5 : None
>
> v3..v4 : None
>
> v2..v3 : Removed PAPR_SCM_DIMM_HEALTH_NON_CRITICAL as a condition for
>        	 NVDIMM unarmed [Aneesh]
>
> v1..v2 : New patch in the series.
> ---
>  arch/powerpc/include/asm/papr_scm.h       |  48 ++++++++++
>  arch/powerpc/platforms/pseries/papr_scm.c | 105 +++++++++++++++++++++-
>  2 files changed, 151 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/papr_scm.h
>
> diff --git a/arch/powerpc/include/asm/papr_scm.h b/arch/powerpc/include/asm/papr_scm.h
> new file mode 100644
> index 000000000000..868d3360f56a
> --- /dev/null
> +++ b/arch/powerpc/include/asm/papr_scm.h
> @@ -0,0 +1,48 @@
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
> +/* SCM device is unable to persist memory contents */
> +#define PAPR_SCM_DIMM_UNARMED			PPC_BIT(0)

Please don't use PPC_BIT, it's just unncessary obfuscation for folks
who are reading the code without access to the docs (ie. more or less
everyone other than you :)

> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0b4467e378e5..aaf2e4ab1f75 100644
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
> @@ -39,6 +40,13 @@ struct papr_scm_priv {
>  	struct resource res;
>  	struct nd_region *region;
>  	struct nd_interleave_set nd_set;
> +
> +	/* Protect dimm data from concurrent access */
> +	struct mutex dimm_mutex;
> +
> +	/* Health information for the dimm */
> +	__be64 health_bitmap;
> +	__be64 health_bitmap_valid;

It's much less error prone to store the data in CPU endian and do the
endian conversion only at the point where the data either comes from or
goes to firmware.

That would also mean you can define flags above without needing PPC_BIT
because they'll be in CPU endian too.

> @@ -144,6 +152,35 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
>  	return drc_pmem_bind(p);
>  }
>  
> +static int drc_pmem_query_health(struct papr_scm_priv *p)
> +{
> +	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> +	int64_t rc;

Use kernel types please, ie. s64, or just long.

> +	rc = plpar_hcall(H_SCM_HEALTH, ret, p->drc_index);
> +	if (rc != H_SUCCESS) {
> +		dev_err(&p->pdev->dev,
> +			 "Failed to query health information, Err:%lld\n", rc);
> +		return -ENXIO;
> +	}
> +
> +	/* Protect modifications to papr_scm_priv with the mutex */
> +	rc = mutex_lock_interruptible(&p->dimm_mutex);
> +	if (rc)
> +		return rc;
> +
> +	/* Store the retrieved health information in dimm platform data */
> +	p->health_bitmap = ret[0];
> +	p->health_bitmap_valid = ret[1];
> +
> +	dev_dbg(&p->pdev->dev,
> +		"Queried dimm health info. Bitmap:0x%016llx Mask:0x%016llx\n",
> +		be64_to_cpu(p->health_bitmap),
> +		be64_to_cpu(p->health_bitmap_valid));
> +
> +	mutex_unlock(&p->dimm_mutex);
> +	return 0;
> +}
>  
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>  			     struct nd_cmd_get_config_data_hdr *hdr)
> @@ -304,6 +341,67 @@ static inline int papr_scm_node(int node)
>  	return min_node;
>  }
>  
> +static ssize_t papr_flags_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct nvdimm *dimm = to_nvdimm(dev);
> +	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
> +	__be64 health;

No need for __be64 here if health_bitmap was stored in CPU endian.

> +	int rc;
> +
> +	rc = drc_pmem_query_health(p);
> +	if (rc)
> +		return rc;
> +
> +	/* Protect against modifications to papr_scm_priv with the mutex */
> +	rc = mutex_lock_interruptible(&p->dimm_mutex);
> +	if (rc)
> +		return rc;
> +
> +	health = p->health_bitmap & p->health_bitmap_valid;

This is all you ever do with the health_bitmap? In which case why not
just do the masking before storing it into priv and save yourself 8
bytes?

> +	/* Check for various masks in bitmap and set the buffer */
> +	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
> +		rc += sprintf(buf, "not_armed ");

I know buf is "big enough" but using sprintf() in 2020 is a bit ... :)

seq_buf is a pretty thin wrapper over a buffer you can use to make this
cleaner and also handles overflow for you.

See eg. show_user_instructions() for an example.

> +
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
> +	mutex_unlock(&p->dimm_mutex);
> +	return rc;
> +}
> +DEVICE_ATTR_RO(papr_flags);

cheers


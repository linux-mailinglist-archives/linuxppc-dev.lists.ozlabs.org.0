Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25707175A1B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 13:11:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WJsT02ZVzDqX6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 23:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WJpW4fjHzDq9d
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 23:09:07 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022C60ej030460; Mon, 2 Mar 2020 07:09:04 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfk5krv72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 07:09:04 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 022C5DKL007259;
 Mon, 2 Mar 2020 12:09:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 2yffk6x937-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 12:09:03 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022C92tL62980592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 12:09:02 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED02C136060;
 Mon,  2 Mar 2020 12:09:01 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E70413605D;
 Mon,  2 Mar 2020 12:09:00 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.1.4])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  2 Mar 2020 12:08:59 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Subject: Re: [PATCH v3 3/5] libnvdimm/namespace: Enforce
 memremap_compat_align()
In-Reply-To: <158291748226.1609624.8971922874557923784.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158291746615.1609624.7591692546429050845.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158291748226.1609624.8971922874557923784.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Mon, 02 Mar 2020 17:38:57 +0530
Message-ID: <87fterrmau.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020092
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> The pmem driver on PowerPC crashes with the following signature when
> instantiating misaligned namespaces that map their capacity via
> memremap_pages().
>
>     BUG: Unable to handle kernel data access at 0xc001000406000000
>     Faulting instruction address: 0xc000000000090790
>     NIP [c000000000090790] arch_add_memory+0xc0/0x130
>     LR [c000000000090744] arch_add_memory+0x74/0x130
>     Call Trace:
>      arch_add_memory+0x74/0x130 (unreliable)
>      memremap_pages+0x74c/0xa30
>      devm_memremap_pages+0x3c/0xa0
>      pmem_attach_disk+0x188/0x770
>      nvdimm_bus_probe+0xd8/0x470
>
> With the assumption that only memremap_pages() has alignment
> constraints, enforce memremap_compat_align() for
> pmem_should_map_pages(), nd_pfn, and nd_dax cases. This includes
> preventing the creation of namespaces where the base address is
> misaligned and cases there infoblock padding parameters are invalid.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Jeff Moyer <jmoyer@redhat.com>
> Fixes: a3619190d62e ("libnvdimm/pfn: stop padding pmem namespaces to section alignment")
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  drivers/nvdimm/namespace_devs.c |   12 ++++++++++++
>  drivers/nvdimm/pfn_devs.c       |   26 +++++++++++++++++++++++---
>  2 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> index 032dc61725ff..68e89855f779 100644
> --- a/drivers/nvdimm/namespace_devs.c
> +++ b/drivers/nvdimm/namespace_devs.c
> @@ -10,6 +10,7 @@
>  #include <linux/nd.h>
>  #include "nd-core.h"
>  #include "pmem.h"
> +#include "pfn.h"
>  #include "nd.h"
>  
>  static void namespace_io_release(struct device *dev)
> @@ -1739,6 +1740,17 @@ struct nd_namespace_common *nvdimm_namespace_common_probe(struct device *dev)
>  		return ERR_PTR(-ENODEV);
>  	}

May be add a comment here that both dax/fsdax namespace details are
checked in nd_pfn_validate() so that we look at start_pad and end_trunc
while validating the namespace?

>  
> +	if (pmem_should_map_pages(dev)) {
> +		struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
> +		struct resource *res = &nsio->res;
> +
> +		if (!IS_ALIGNED(res->start | (res->end + 1),
> +					memremap_compat_align())) {
> +			dev_err(&ndns->dev, "%pr misaligned, unable to map\n", res);
> +			return ERR_PTR(-EOPNOTSUPP);
> +		}
> +	}
> +
>  	if (is_namespace_pmem(&ndns->dev)) {
>  		struct nd_namespace_pmem *nspm;
>  
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 79fe02d6f657..3bdd4b883d05 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -446,6 +446,7 @@ static bool nd_supported_alignment(unsigned long align)
>  int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>  {
>  	u64 checksum, offset;
> +	struct resource *res;
>  	enum nd_pfn_mode mode;
>  	struct nd_namespace_io *nsio;
>  	unsigned long align, start_pad;
> @@ -578,13 +579,14 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>  	 * established.
>  	 */
>  	nsio = to_nd_namespace_io(&ndns->dev);
> -	if (offset >= resource_size(&nsio->res)) {
> +	res = &nsio->res;
> +	if (offset >= resource_size(res)) {
>  		dev_err(&nd_pfn->dev, "pfn array size exceeds capacity of %s\n",
>  				dev_name(&ndns->dev));
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if ((align && !IS_ALIGNED(nsio->res.start + offset + start_pad, align))
> +	if ((align && !IS_ALIGNED(res->start + offset + start_pad, align))
>  			|| !IS_ALIGNED(offset, PAGE_SIZE)) {
>  		dev_err(&nd_pfn->dev,
>  				"bad offset: %#llx dax disabled align: %#lx\n",
> @@ -592,6 +594,18 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
>  		return -EOPNOTSUPP;
>  	}
>  
> +	if (!IS_ALIGNED(res->start + le32_to_cpu(pfn_sb->start_pad),
> +				memremap_compat_align())) {
> +		dev_err(&nd_pfn->dev, "resource start misaligned\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (!IS_ALIGNED(res->end + 1 - le32_to_cpu(pfn_sb->end_trunc),
> +				memremap_compat_align())) {
> +		dev_err(&nd_pfn->dev, "resource end misaligned\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(nd_pfn_validate);
> @@ -750,7 +764,13 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>  	start = nsio->res.start;
>  	size = resource_size(&nsio->res);
>  	npfns = PHYS_PFN(size - SZ_8K);
> -	align = max(nd_pfn->align, SUBSECTION_SIZE);
> +	align = max(nd_pfn->align, memremap_compat_align());
> +	if (!IS_ALIGNED(start, memremap_compat_align())) {
> +		dev_err(&nd_pfn->dev, "%s: start %pa misaligned to %#lx\n",
> +				dev_name(&ndns->dev), &start,
> +				memremap_compat_align());
> +		return -EINVAL;
> +	}

This validates start in case of a new namespace creation where the user
updated nd_region->align value? A comment there would help when looking
at the code later?

>  	end_trunc = start + size - ALIGN_DOWN(start + size, align);
>  	if (nd_pfn->mode == PFN_MODE_PMEM) {
>  		/*
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

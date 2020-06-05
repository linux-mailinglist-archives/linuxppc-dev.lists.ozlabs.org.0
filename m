Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B41EFE9E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 19:15:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dq5Y14m2zDr22
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 03:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dq3l14gwzDqyJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 03:13:18 +1000 (AEST)
IronPort-SDR: sE+Q3nPsQrFv1KBn+BwmEfbj/v2gnxAKh2hAKJsy0zxM2MZ68SYypNuP4MX1dsEMIYeIcYQVV5
 Rgu+UtsaIxqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 10:13:13 -0700
IronPort-SDR: 8dXeibKw9Oymx4zZCYxphg3R+QpK3j/MMW6EYOklYlz1iNt6dXs2V1i7rgC+IijYWiuL9QozSq
 vrfI0EMm/8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,477,1583222400"; d="scan'208";a="273530919"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga006.jf.intel.com with ESMTP; 05 Jun 2020 10:13:13 -0700
Date: Fri, 5 Jun 2020 10:13:13 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v10 4/6] powerpc/papr_scm: Improve error logging and
 handling papr_scm_ndctl()
Message-ID: <20200605171313.GO1505637@iweiny-DESK2.sc.intel.com>
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-5-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604234136.253703-5-vaibhav@linux.ibm.com>
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

On Fri, Jun 05, 2020 at 05:11:34AM +0530, Vaibhav Jain wrote:
> Since papr_scm_ndctl() can be called from outside papr_scm, its
> exposed to the possibility of receiving NULL as value of 'cmd_rc'
> argument. This patch updates papr_scm_ndctl() to protect against such
> possibility by assigning it pointer to a local variable in case cmd_rc
> == NULL.
> 
> Finally the patch also updates the 'default' clause of the switch-case
> block removing a 'return' statement thereby ensuring that value of
> 'cmd_rc' is always logged when papr_scm_ndctl() returns.
> 
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
> 
> v9..v10
> * New patch in the series

Thanks for making this a separate patch it is easier to see what is going on
here.

> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0c091622b15e..6512fe6a2874 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -355,11 +355,16 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  {
>  	struct nd_cmd_get_config_size *get_size_hdr;
>  	struct papr_scm_priv *p;
> +	int rc;
>  
>  	/* Only dimm-specific calls are supported atm */
>  	if (!nvdimm)
>  		return -EINVAL;
>  
> +	/* Use a local variable in case cmd_rc pointer is NULL */
> +	if (!cmd_rc)
> +		cmd_rc = &rc;
> +

This protects you from the NULL.  However...

>  	p = nvdimm_provider_data(nvdimm);
>  
>  	switch (cmd) {
> @@ -381,12 +386,13 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  		break;
>  
>  	default:
> -		return -EINVAL;
> +		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
> +		*cmd_rc = -EINVAL;

... I think you are conflating rc and cmd_rc...

>  	}
>  
>  	dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
>  
> -	return 0;
> +	return *cmd_rc;

... this changes the behavior of the current commands.  Now if the underlying
papr_scm_meta_[get|set]() fails you return that failure as rc rather than 0.

Is that ok?

Also 'logging cmd_rc' in the invalid cmd case does not seem quite right unless
you really want rc to be cmd_rc.

The architecture is designed to separate errors which occur in the kernel vs
errors in the firmware/dimm.  Are they always the same?  The current code
differentiates them.

Ira

>  }
>  
>  static ssize_t flags_show(struct device *dev,
> -- 
> 2.26.2
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5185427B127
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 17:47:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Rjx1Yc4zDqF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 01:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0Rg62Bt5zDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 01:45:20 +1000 (AEST)
IronPort-SDR: 8HsXqGnuAF6c5iV8GSGYbC9QS3oeBEn7ls2CztcxqnSHKnuphtewP1itp9G+wD/P8duCcE2VtA
 OxS6xlBoogfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149788064"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="149788064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 08:45:17 -0700
IronPort-SDR: qOPJKrzOfDHGsK9qtB8ba1xH7UmUmktOCif20xZeUHjB03krI6qr5hcOb45D6THF5KmSq7VCXO
 cX0DwyyHa9ZA==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="456875203"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 08:45:17 -0700
Date: Mon, 28 Sep 2020 08:45:16 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc/papr_scm: Add PAPR command family to
 pass-through command-set
Message-ID: <20200928154516.GA458519@iweiny-DESK2.sc.intel.com>
References: <20200913211904.24472-1-vaibhav@linux.ibm.com>
 <87pn662gc3.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pn662gc3.fsf@vajain21.in.ibm.com>
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
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, "Verma,
 Vishal L" <vishal.l.verma@intel.com>, Oliver O'Halloran <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 28, 2020 at 06:44:52PM +0530, Vaibhav Jain wrote:
> Hi Dan, Ira and Vishal,
> 
> Can you please take a look at this patch. Without it the functionality
> to report nvdimm health via ndctl breaks on 5.9

Sorry...

> 
> Thanks,
> ~ Vaibhav
> 
> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> 
> > Add NVDIMM_FAMILY_PAPR to the list of valid 'dimm_family_mask'
> > acceptable by papr_scm. This is needed as since commit
> > 92fe2aa859f5 ("libnvdimm: Validate command family indices") libnvdimm
> > performs a validation of 'nd_cmd_pkg.nd_family' received as part of
> > ND_CMD_CALL processing to ensure only known command families can use
> > the general ND_CMD_CALL pass-through functionality.
> >
> > Without this change the ND_CMD_CALL pass-through targeting
> > NVDIMM_FAMILY_PAPR error out with -EINVAL.
> >
> > Fixes: 92fe2aa859f5 ("libnvdimm: Validate command family indices")
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

LGTM

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> > ---
> >  arch/powerpc/platforms/pseries/papr_scm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index 5493bc847bd08..27268370dee00 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -898,6 +898,9 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
> >  	p->bus_desc.of_node = p->pdev->dev.of_node;
> >  	p->bus_desc.provider_name = kstrdup(p->pdev->name, GFP_KERNEL);
> >  
> > +	/* Set the dimm command family mask to accept PDSMs */
> > +	set_bit(NVDIMM_FAMILY_PAPR, &p->bus_desc.dimm_family_mask);
> > +
> >  	if (!p->bus_desc.provider_name)
> >  		return -ENOMEM;
> >  
> > -- 
> > 2.26.2
> >

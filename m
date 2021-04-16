Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75D361CB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 11:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM9Q821Cjz3c3v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 19:09:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM9Pp6JQbz30B9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 19:09:17 +1000 (AEST)
IronPort-SDR: C2MVShrxJfBkB0HgTwnlDIxfxyZyHcG6n49oLEbja+Rcw3efQRPlmx8SEjB14trf5QAmdgTLZR
 fsmD5p+W+cCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="215543577"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="215543577"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 02:09:14 -0700
IronPort-SDR: Yo/3KwkOHpa5Wf4bKNcz6VeTmOGVjM3sJsowFc8GKwZSCiEqLG1ZnjTPBZ6Gazj3PDH3eznpcX
 EwTwxrokmsrg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="399857691"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 02:09:12 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lXKTN-004bZv-0X; Fri, 16 Apr 2021 12:09:09 +0300
Date: Fri, 16 Apr 2021 12:09:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
Message-ID: <YHlUNSwm8Ofy9sNr@smile.fi.intel.com>
References: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
 <af677216-82b4-f1fa-1d90-3d32dabf8583@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af677216-82b4-f1fa-1d90-3d32dabf8583@linux.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 01:28:21PM +0530, Aneesh Kumar K.V wrote:
> On 4/15/21 7:16 PM, Andy Shevchenko wrote:
> > Parse to and export from UUID own type, before dereferencing.
> > This also fixes wrong comment (Little Endian UUID is something else)
> > and should fix Sparse warnings about assigning strict types to POD.
> > 
> > Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset cookie")
> > Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree")
> > Cc: Oliver O'Halloran <oohall@gmail.com>
> > Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > Not tested
> >   arch/powerpc/platforms/pseries/papr_scm.c | 13 ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index ae6f5d80d5ce..4366e1902890 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -1085,8 +1085,9 @@ static int papr_scm_probe(struct platform_device *pdev)
> >   	u32 drc_index, metadata_size;
> >   	u64 blocks, block_size;
> >   	struct papr_scm_priv *p;
> > +	u8 uuid_raw[UUID_SIZE];
> >   	const char *uuid_str;
> > -	u64 uuid[2];
> > +	uuid_t uuid;
> >   	int rc;
> >   	/* check we have all the required DT properties */
> > @@ -1129,16 +1130,18 @@ static int papr_scm_probe(struct platform_device *pdev)
> >   	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
> >   	/* We just need to ensure that set cookies are unique across */
> > -	uuid_parse(uuid_str, (uuid_t *) uuid);
> > +	uuid_parse(uuid_str, &uuid);
> > +
> >   	/*
> >   	 * cookie1 and cookie2 are not really little endian
> > -	 * we store a little endian representation of the
> > +	 * we store a raw buffer representation of the
> >   	 * uuid str so that we can compare this with the label
> >   	 * area cookie irrespective of the endian config with which
> >   	 * the kernel is built.
> >   	 */
> > -	p->nd_set.cookie1 = cpu_to_le64(uuid[0]);
> > -	p->nd_set.cookie2 = cpu_to_le64(uuid[1]);
> > +	export_uuid(uuid_raw, &uuid);
> > +	p->nd_set.cookie1 = get_unaligned_le64(&uuid_raw[0]);
> > +	p->nd_set.cookie2 = get_unaligned_le64(&uuid_raw[8]);
> 
> ok that does the equivalent of cpu_to_le64 there. So we are good. But the
> comment update is missing the details why we did that get_unaligned_le64.
> Maybe raw buffer representation is the correct term?
> Should we add an example in the comment. ie,

> /*
>  * Historically we stored the cookie in the below format.
> for a uuid str 72511b67-0b3b-42fd-8d1d-5be3cae8bcaa
> cookie1 was  0xfd423b0b671b5172 cookie2 was 0xaabce8cae35b1d8d
> */

I'm fine with the comment. At least it will shed a light on the byte ordering
we are expecting.

> >   	/* might be zero */
> >   	p->metadata_size = metadata_size;

-- 
With Best Regards,
Andy Shevchenko



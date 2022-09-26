Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC95EB14D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 21:29:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbtBB03H2z3c7k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 05:29:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DyJL9EqH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DyJL9EqH;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbt9b1yw3z304J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 05:29:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E7D77B80C75;
	Mon, 26 Sep 2022 19:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77985C433D6;
	Mon, 26 Sep 2022 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664220558;
	bh=dd4PJJug6S0lh3IVCKUeujY4WoRu7gTAlwK1QGArvfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyJL9EqHEJa1IOL8XS7x+/G/haaho4oc3H/3vrn1H4kZuAkeKgowf02GePVilfoDc
	 Sv2EWtKWfiZfnawULSrsCRK1nc/h34HuK/eLW+WfIflFOtYliPTWrI4SRYsZsU3fGV
	 js7S3Cx/Yaq/WqdzR7EZXv7EEwhD9epczfat6bq/i/r0Y7gE/Gh3wMidrCob8htJ/x
	 /07JW2l8NGcZK+NE+RZNSgjPozi8piIirVCC1WOOkr42kX6ImdwYgWOCYvPt9uIil1
	 JflR77OnGaUF4AjtLfD68p1iEK6wXTzTWgBogb6pNxl++QRH/eKV42vC8QKqM3HgkC
	 GJJ7LB+U27lfg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id B7CFD403B0; Mon, 26 Sep 2022 20:29:15 +0100 (IST)
Date: Mon, 26 Sep 2022 20:29:15 +0100
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH V2] tools/perf/tests: Fix perf probe error log check in
 skip_if_no_debuginfo
Message-ID: <YzH9i4XQI1Ec9T/W@kernel.org>
References: <20220916104904.99798-1-atrajeev@linux.vnet.ibm.com>
 <be87927f-f2c9-4475-6298-9ffe0a0195de@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be87927f-f2c9-4475-6298-9ffe0a0195de@linux.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Sep 16, 2022 at 06:35:41PM +0530, kajoljain escreveu:
> 
> 
> On 9/16/22 16:19, Athira Rajeev wrote:
> > The perf probe related tests like probe_vfs_getname.sh which
> > is in "tools/perf/tests/shell" directory have dependency on
> > debuginfo information in the kernel. Currently debuginfo
> > check is handled by skip_if_no_debuginfo function in the
> > file "lib/probe_vfs_getname.sh". skip_if_no_debuginfo function
> > looks for this specific error log from perf probe to skip
> > the testcase:
> > 
> > <<>>
> > Failed to find the path for the kernel|Debuginfo-analysis is
> > not supported
> > <>>
> > 
> > But in some case, like this one in powerpc, while running this
> > test, observed error logs is:
> > 
> > <<>>
> > The /lib/modules/<version>/build/vmlinux file has no debug information.
> > Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> > package.
> >   Error: Failed to add events.
> > <<>>
> > 
> > Update the skip_if_no_debuginfo function to include the above
> > error, to skip the test in these scenarios too.
> 
> Patch looks good to me.
> 
> Reviewed-By: Kajol Jain <kjain@linux.ibm.com>

Thanks, applied.

- Arnaldo

 
> Thanks,
> Kajol Jain
> 
> > 
> > Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> > changelog:
> >  v1 -> v2:
> >  Corrected formatting of spaces in error log.
> >  With spaces in v1 of the patch, the egrep search was
> >  considering spaces also.
> > 
> >  tools/perf/tests/shell/lib/probe_vfs_getname.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> > index 5b17d916c555..b616d42bd19d 100644
> > --- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> > +++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> > @@ -19,6 +19,6 @@ add_probe_vfs_getname() {
> >  }
> >  
> >  skip_if_no_debuginfo() {
> > -	add_probe_vfs_getname -v 2>&1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)" && return 2
> > +	add_probe_vfs_getname -v 2>&1 | egrep -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)|(file has no debug information)" && return 2
> >  	return 1
> >  }

-- 

- Arnaldo

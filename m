Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 149FA3BDDE6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 21:16:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKC2Z0DhLz3bW4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 05:16:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZvqvC7ZL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZvqvC7ZL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKC281YK0z2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 05:15:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC86B61C7A;
 Tue,  6 Jul 2021 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625598942;
 bh=AtH56eW72m8BpdbGWiJELuMI6J92ShZ97mnSWwRKvQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZvqvC7ZLKHZD4VdrsKjXLa3kJgUGINBTZa2kp84Tex81UNAgSWqDIu7Pk5LatqtYg
 Lor8u/FIhzBBOp5XHa4K0yA+TP/MkyRoqhegOFxTnKi5O8W9nT8iSCNsAySJznsjvN
 GCpqC7Yo2p2oR+WuAR4uUbFMxFTPN15vWhLlLv86agNeNWN6gAYs/vloO+3qy8Ra3w
 IOe6JYTQ6PYMv932akm6WRhhp/mXg+ciJXl1so4jBrksgjhqy69iATN5lszUqV/Sl+
 Nd69lYy8+q4EDIPfBT6cSi2SF18gDtX7O49dSIK4OnhKL305jGXOLw2E++iaPTs9aU
 r4i6Fl3E9rByA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 6135D40B1A; Tue,  6 Jul 2021 16:15:39 -0300 (-03)
Date: Tue, 6 Jul 2021 16:15:39 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf script python: Fix buffer size to report iregs in
 perf script
Message-ID: <YOSr25+a+r3MF2Ob@kernel.org>
References: <20210628062341.155839-1-kjain@linux.ibm.com>
 <20210628144937.GE142768@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <ee98968a-f343-a68e-9a3e-58e97dc130c8@linux.ibm.com>
 <c6fb2136-21e1-325a-f7f7-9745dbe29661@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6fb2136-21e1-325a-f7f7-9745dbe29661@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 maddy@linux.vnet.ibm.com, "Paul A. Clarke" <pc@us.ibm.com>,
 Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jul 06, 2021 at 05:26:12PM +0530, kajoljain escreveu:
> 
> 
> On 6/29/21 12:39 PM, kajoljain wrote:
> > 
> > 
> > On 6/28/21 8:19 PM, Paul A. Clarke wrote:
> >> On Mon, Jun 28, 2021 at 11:53:41AM +0530, Kajol Jain wrote:
> >>> Commit 48a1f565261d ("perf script python: Add more PMU fields
> >>> to event handler dict") added functionality to report fields like
> >>> weight, iregs, uregs etc via perf report.
> >>> That commit predefined buffer size to 512 bytes to print those fields.
> >>>
> >>> But incase of powerpc, since we added extended regs support
> >>> in commits:
> >>>
> >>> Commit 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
> >>> Counter SPRs as part of extended regs")
> >>> Commit d735599a069f ("powerpc/perf: Add extended regs support for
> >>> power10 platform")
> >>>
> >>> Now iregs can carry more bytes of data and this predefined buffer size
> >>> can result to data loss in perf script output.
> >>>
> >>> Patch resolve this issue by making buffer size dynamic based on number
> >>> of registers needed to print. It also changed return type for function
> >>> "regs_map" from int to void, as the return value is not being used by
> >>> the caller function "set_regs_in_dict".
> >>>
> >>> Fixes: 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
> >>> Counter SPRs as part of extended regs")
> >>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >>> ---
> >>>  .../util/scripting-engines/trace-event-python.c | 17 ++++++++++++-----
> >>>  1 file changed, 12 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
> >>> index 4e4aa4c97ac5..c8c9706b4643 100644
> >>> --- a/tools/perf/util/scripting-engines/trace-event-python.c
> >>> +++ b/tools/perf/util/scripting-engines/trace-event-python.c
> >> [...]
> >>> @@ -713,7 +711,16 @@ static void set_regs_in_dict(PyObject *dict,
> >>>  			     struct evsel *evsel)
> >>>  {
> >>>  	struct perf_event_attr *attr = &evsel->core.attr;
> >>> -	char bf[512];
> >>> +
> >>> +	/*
> >>> +	 * Here value 28 is a constant size which can be used to print
> >>> +	 * one register value and its corresponds to:
> >>> +	 * 16 chars is to specify 64 bit register in hexadecimal.
> >>> +	 * 2 chars is for appending "0x" to the hexadecimal value and
> >>> +	 * 10 chars is for register name.
> >>> +	 */
> >>> +	int size = __sw_hweight64(attr->sample_regs_intr) * 28;
> >>> +	char bf[size];
> >>
> >> I propose using a template rather than a magic number here. Something like:
> >> const char reg_name_tmpl[] = "10 chars  ";
> >> const char reg_value_tmpl[] = "0x0123456789abcdef";
> >> const int size = __sw_hweight64(attr->sample_regs_intr) +
> >>                  sizeof reg_name_tmpl + sizeof reg_value_tmpl;
> >>
> > 
> > Hi Paul,
> >    Thanks for reviewing the patch. Yes these are
> > some standardization we can do by creating macros for different
> > fields.
> > The basic idea is, we want to provide significant buffer size
> > based on number of registers present in sample_regs_intr to accommodate
> > all data.
> > 
> 
> Hi Arnaldo/Jiri,
>    Is the approach used in this patch looks fine to you?

Yeah, and the comment you provide right above it explains it, so I think
that is enough, ok?

- Arnaldo
 
> Thanks,
> Kajol Jain
> 
> > But before going to optimizing code, Arnaldo/Jiri, is this approach looks good to you?
> > 
> >> Pardon my ignorance, but is there no separation/whitespace between the name
> >> and the value?
> > 
> > This is how we will get data via perf script
> > 
> > r0:0xc000000000112008
> > r1:0xc000000023b37920
> > r2:0xc00000000144c900
> > r3:0xc0000000bc566120
> > r4:0xc0000000c5600000
> > r5:0x2606c6506ca
> > r6:0xc000000023b378f8
> > r7:0xfffffd9f93a48f0e
> > .....
> > 
> >  And is there some significance to 10 characters for the
> >> register name, or is that a magic number?
> > 
> > Most of the register name are within 10 characters, basically we are giving this
> > magic number to make sure we have enough space in buffer to contain all registers
> > name with colon.
> > 
> > Thanks,
> > Kajol Jain
> >  
> >>
> >> PC
> >>

-- 

- Arnaldo

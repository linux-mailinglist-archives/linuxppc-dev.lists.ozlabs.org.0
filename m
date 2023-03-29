Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A96CDAAE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmnNL0HHLz3fB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 00:25:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WgjzEvDb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WgjzEvDb;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmnMR1Jjnz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 00:24:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 32A8CCE2406;
	Wed, 29 Mar 2023 13:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2492CC4339B;
	Wed, 29 Mar 2023 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680096253;
	bh=B9ZlgYT32JXvL6r+V3u05oh637hA8lFhd1cUlq+5cBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgjzEvDbVTM7KJMGoXBzfWyNLjDmQM47ERZLqqkdSuvCs8rYIE/0MAgYKKswE2E1v
	 CsxU8LNdtuty9PKKSvPxRs9UfjmX8YdQsqmGbwfLg2JHGM4Wlf9RqSYPbL6hy1jyEQ
	 aRSuUPRf16oaUdy7IEqTovjaOshwe24NIwZVdmFkaA56qv/6XLXvN6zocfof8o3MXv
	 i0B9WM/5qZ1awOUPYAvsmMcp8FmBwq8jD7vTRmstQiVx+57MUZuOleiHhuCGAEs1IN
	 T3obesQZXOW3ttpXB8rHuJEovo/3fsbCfF1aTHMRIKomXIOFExC08QF6JELanHeO0B
	 BsQmRsb73tyYA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 517864052D; Wed, 29 Mar 2023 10:24:11 -0300 (-03)
Date: Wed, 29 Mar 2023 10:24:11 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] perf vendor events power9: Remove UTF-8 characters from
 json files
Message-ID: <ZCQ7+/9Yj5SDYsDn@kernel.org>
References: <20230328112908.113158-1-kjain@linux.ibm.com>
 <CAP-5=fXU4F=LvE883EVjq0bWHKJ-LT12pTr827jqwGfH1RTXdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXU4F=LvE883EVjq0bWHKJ-LT12pTr827jqwGfH1RTXdw@mail.gmail.com>
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, disgoel@linux.ibm.com, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.com>, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Mar 28, 2023 at 09:21:49AM -0700, Ian Rogers escreveu:
> On Tue, Mar 28, 2023 at 4:30 AM Kajol Jain <kjain@linux.ibm.com> wrote:
> >
> > Commit 3c22ba524304 ("perf vendor events powerpc: Update POWER9 events")
> > added and updated power9 pmu json events. However some of the json
> > events which are part of other.json and pipeline.json files,
> > contains UTF-8 characters in their brief description.
> > Having UTF-8 character could brakes the perf build on some distros.
> 
> nit: s/bakes/break/

I'll fix that later, thans.
 
> > Fix this issue by removing the UTF-8 characters from other.json and
> > pipeline.json files.
> >
> > Result without the fix patch:

[perfbuilder@five ~]$ cat dm.log/summary 
   1    23.25 ubuntu:18.04-x-powerpc        : Ok   powerpc-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0 
   2    24.56 ubuntu:18.04-x-powerpc64      : Ok   powerpc64-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0 
   3    25.06 ubuntu:18.04-x-powerpc64el    : Ok   powerpc64le-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0 
BUILD_TARBALL_HEAD=9da5ab1d38cd17fb47cbe5a1f95bca63e6ca9796

> > [command]# file -i pmu-events/arch/powerpc/power9/*
> > pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/other.json:          application/json; charset=utf-8
> > pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=utf-8
> > pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii
> >
> > Result with the fix patch:
> >
> > [command]# file -i pmu-events/arch/powerpc/power9/*
> > pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/other.json:          application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
> > pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii
> >
> > Fixes: 3c22ba524304 ("perf vendor events powerpc: Update POWER9 events")
> > Reported-by: Arnaldo Carvalho de Melo <acme@kernel.com>
> > Link: https://lore.kernel.org/lkml/ZBxP77deq7ikTxwG@kernel.org/
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Acked-by: Ian Rogers <irogers@google.com>
> 
> Thanks,
> Ian
> 
> > ---
> >  tools/perf/pmu-events/arch/powerpc/power9/other.json    | 4 ++--
> >  tools/perf/pmu-events/arch/powerpc/power9/pipeline.json | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power9/other.json b/tools/perf/pmu-events/arch/powerpc/power9/other.json
> > index 3f69422c21f9..f10bd554521a 100644
> > --- a/tools/perf/pmu-events/arch/powerpc/power9/other.json
> > +++ b/tools/perf/pmu-events/arch/powerpc/power9/other.json
> > @@ -1417,7 +1417,7 @@
> >    {
> >      "EventCode": "0x45054",
> >      "EventName": "PM_FMA_CMPL",
> > -    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only. "
> > +    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only."
> >    },
> >    {
> >      "EventCode": "0x201E8",
> > @@ -2017,7 +2017,7 @@
> >    {
> >      "EventCode": "0xC0BC",
> >      "EventName": "PM_LSU_FLUSH_OTHER",
> > -    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the “bad dval” back and flush all younger ops)"
> > +    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the 'bad dval' back and flush all younger ops)"
> >    },
> >    {
> >      "EventCode": "0x5094",
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
> > index d0265f255de2..723bffa41c44 100644
> > --- a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
> > +++ b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
> > @@ -442,7 +442,7 @@
> >    {
> >      "EventCode": "0x4D052",
> >      "EventName": "PM_2FLOP_CMPL",
> > -    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg "
> > +    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg"
> >    },
> >    {
> >      "EventCode": "0x1F142",
> > --
> > 2.39.1
> >

-- 

- Arnaldo

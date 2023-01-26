Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAED67CD90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 15:21:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2jYb6d8jz3fDb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 01:21:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Di5FbnDS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Di5FbnDS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2jXb5dPJz3cd9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 01:20:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CDF686156F;
	Thu, 26 Jan 2023 14:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CF4C433EF;
	Thu, 26 Jan 2023 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674742812;
	bh=0gXWAG3HpQenfONyLXdhDKUli2Bo4Uhdo9PrFLTy79U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Di5FbnDS9IrLIy3Qguh0lMbFBe4bJSqS/l3RAASfKfNH1svLVK5jIH4Wjx0Qm7lcs
	 p1ANYjqQnfYnxcGRR3hAFwSmbx7h+hpr8Z4tZZTDzQROrpG0qD7Vaf1OfCZ9Uvs+AG
	 tdF/Segi7SvyPLuSXD0gaULEqWFYRz58MyilF5I8LCXgmljMCMVU+uTw4Baa1b6Bwl
	 5GxnpltqOr4V//yI/aBZ83AFdyOWCWdjAHpgSqID/KujYWxtJTWL2Wkt69aTbBzjLW
	 9TdyQMIjh6spUOVsL5qyxZ5sUEJYrdkLy4Vjaqr6j9W9qsu8+p6CBUrtcOxOt3BjVS
	 +L/UXKiSp2Oiw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 71802405BE; Thu, 26 Jan 2023 11:20:09 -0300 (-03)
Date: Thu, 26 Jan 2023 11:20:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: John Garry <john.g.garry@oracle.com>
Subject: Re: [PATCH v4 11/12] perf jevents: Add model list option
Message-ID: <Y9KMGa1jGW3aLVZG@kernel.org>
References: <20230126011854.198243-1-irogers@google.com>
 <20230126011854.198243-12-irogers@google.com>
 <10ae719f-2549-a367-2d2b-48671a00135e@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10ae719f-2549-a367-2d2b-48671a00135e@oracle.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Sandipan Das <sandipan.das@amd.com>, Peter Zijlstra <peterz@infradead.org>, Perry Taylor <perry.taylor@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>, Kim Phillips <kim.phillips@amd.com>, Will Deacon <will@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Xing Zhengjun <zhengjun.xing@linux.intel.com>, Kang Minchul <tegongkang@gmail.com>, Mike Leach <mike.leach@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, Florian Fischer <florian.fischer@muhq.space>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@li
 naro.org>, linuxppc-dev@lists.ozlabs.org, Jing Zhang <renyu.zj@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Jan 26, 2023 at 01:44:39PM +0000, John Garry escreveu:
> On 26/01/2023 01:18, Ian Rogers wrote:
> > This allows the set of generated jevents events and metrics be limited
> > to a subset of the model names. Appropriate if trying to minimize the
> > binary size where only a set of models are possible.
> > 
> > Signed-off-by: Ian Rogers <irogers@google.com>
> 
> Thanks for this:
> 
> Reviewed-by: John Garry <john.g.garry@oracle.com>

Thanks for reviewing the series John, I see there are a few patches for
which you didn't provide your Reviewed-by, are you planning to review
those as well?

- Arnaldo
 
> > ---
> >   tools/perf/pmu-events/Build      |  3 ++-
> >   tools/perf/pmu-events/jevents.py | 14 ++++++++++++++
> >   2 files changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
> > index 15b9e8fdbffa..a14de24ecb69 100644
> > --- a/tools/perf/pmu-events/Build
> > +++ b/tools/perf/pmu-events/Build
> > @@ -10,6 +10,7 @@ JEVENTS_PY	=  pmu-events/jevents.py
> >   ifeq ($(JEVENTS_ARCH),)
> >   JEVENTS_ARCH=$(SRCARCH)
> >   endif
> > +JEVENTS_MODEL ?= all
> >   #
> >   # Locate/process JSON files in pmu-events/arch/
> > @@ -23,5 +24,5 @@ $(OUTPUT)pmu-events/pmu-events.c: pmu-events/empty-pmu-events.c
> >   else
> >   $(OUTPUT)pmu-events/pmu-events.c: $(JSON) $(JSON_TEST) $(JEVENTS_PY) pmu-events/metric.py
> >   	$(call rule_mkdir)
> > -	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) pmu-events/arch $@
> > +	$(Q)$(call echo-cmd,gen)$(PYTHON) $(JEVENTS_PY) $(JEVENTS_ARCH) $(JEVENTS_MODEL) pmu-events/arch $@
> >   endif
> > diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> > index 627ee817f57f..2bcd07ce609f 100755
> > --- a/tools/perf/pmu-events/jevents.py
> > +++ b/tools/perf/pmu-events/jevents.py
> > @@ -599,6 +599,8 @@ const struct pmu_events_map pmu_events_map[] = {
> >               else:
> >                 metric_tblname = 'NULL'
> >                 metric_size = '0'
> > +            if event_size == '0' and metric_size == '0':
> > +              continue
> >               cpuid = row[0].replace('\\', '\\\\')
> >               _args.output_file.write(f"""{{
> >   \t.arch = "{arch}",
> > @@ -888,12 +890,24 @@ def main() -> None:
> >             action: Callable[[Sequence[str], os.DirEntry], None]) -> None:
> >       """Replicate the directory/file walking behavior of C's file tree walk."""
> >       for item in os.scandir(path):
> > +      if _args.model != 'all' and item.is_dir():
> > +        # Check if the model matches one in _args.model.
> > +        if len(parents) == _args.model.split(',')[0].count('/'):
> > +          # We're testing the correct directory.
> > +          item_path = '/'.join(parents) + ('/' if len(parents) > 0 else '') + item.name
> > +          if 'test' not in item_path and item_path not in _args.model.split(','):
> > +            continue
> >         action(parents, item)
> >         if item.is_dir():
> >           ftw(item.path, parents + [item.name], action)
> >     ap = argparse.ArgumentParser()
> >     ap.add_argument('arch', help='Architecture name like x86')
> > +  ap.add_argument('model', help='''Select a model such as skylake to
> > +reduce the code size.  Normally set to "all". For architectures like
> > +ARM64 with an implementor/model, the model must include the implementor
> 
> mega-nit: /s/ARM64/arm64/
> 
> it just makes grepping easier (without -i, of course)
> 
> > +such as "arm/cortex-a34".''',
> > +                  default='all')
> >     ap.add_argument(
> >         'starting_dir',
> >         type=dir_path,
> 

-- 

- Arnaldo

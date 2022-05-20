Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3EF52ED94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Srm6dHqz3blB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 23:54:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qt5Kf/E+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qt5Kf/E+; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Sr50PYbz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 23:53:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78C1261B07;
 Fri, 20 May 2022 13:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBC3C385A9;
 Fri, 20 May 2022 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653054833;
 bh=wMKx/4Sb0rUuzgPrC9WPtYzb6f6cO4tK8XR1XVwLuy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qt5Kf/E+IATCxZO4v8G+TRz0zVF3wZ4xo0ta5g0cN/v6FW14PfDzK1U5O+OOPnhEy
 HWghgeUk4Lyw89GHNMiZ53Cn18QW53lhSu3Jp5rj4FF8AyvkW9NIAqz7R2X4SFqxmv
 FQbqqiNgIdQ+O7wPSr8WcW7cb+HO+Y66u65f4/RYhi6r/acG9eDz/i2Q4uaEMA55TA
 lR+f3zQdRvxRh+B1UHq0IJevhKXR0ZRnISA/Sgx7qStJJqiX8wnTwAYYJ0ZXCIO+Md
 R1PiMC71mjjxNk5bRVLqNa1wPRrFVysH5oovWvvkI+RLKpzC7UIT5WEGxOI4DjJrFy
 dd09BEiWfYAYw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 0EF2A400B1; Fri, 20 May 2022 10:53:50 -0300 (-03)
Date: Fri, 20 May 2022 10:53:49 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH V2] tools/perf/test: Fix perf all PMU test to skip
 hv_24x7/hv_gpci tests on powerpc
Message-ID: <YoedbRTgfdQs+7H0@kernel.org>
References: <20220519154324.12531-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXrtTe=6-z8-OMzG60XZmA92nHEhc94+NyCJK-ZPDekPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fXrtTe=6-z8-OMzG60XZmA92nHEhc94+NyCJK-ZPDekPQ@mail.gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, jolsa@kernel.org,
 kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, May 19, 2022 at 11:45:07AM -0700, Ian Rogers escreveu:
> On Thu, May 19, 2022 at 8:43 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > "perf all PMU test" picks the input events from
> > "perf list --raw-dump pmu" list and runs "perf stat -e"
> > for each of the event in the list. In case of powerpc, the
> > PowerVM environment supports events from hv_24x7 and hv_gpci
> > PMU which is of example format like below:
> > - hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
> > - hv_gpci/event,partition_id=?/
> >
> > The value for "?" needs to be filled in depending on
> > system and respective event. CPM_ADJUNCT_INST needs have
> > core value and domain value. hv_gpci event needs partition_id.
> > Similarly, there are other events for hv_24x7 and hv_gpci
> > having "?" in event format. Hence skip these events on powerpc
> > platform since values like partition_id, domain is specific
> > to system and event.
> >
> > Fixes: 3d5ac9effcc6 ("perf test: Workload test of all PMUs")
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> > Changelog:
> >  v1 -> v2:
> >  Instead of checking for platform, used the pmu name
> >  ie, hv_24x7 and hv_gpci to skip the test since this
> >  pmu name is specific to powerpc as suggested by
> >  Michael Ellerman.
> >
> >  tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/shell/stat_all_pmu.sh
> > index b30dba455f36..7d046bb8a7b9 100755
> > --- a/tools/perf/tests/shell/stat_all_pmu.sh
> > +++ b/tools/perf/tests/shell/stat_all_pmu.sh
> > @@ -5,6 +5,16 @@
> >  set -e
> >
> >  for p in $(perf list --raw-dump pmu); do
> > +  # In powerpc, skip the events for hv_24x7 and hv_gpci.
> > +  # These events needs input values to be filled in for
> > +  # core, chip, patition id based on system.
> nit: s/patition/partition/
> > +  # Example: hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
> 
> I've no problem with this patch, we may need to do similar for other

Can I take this as an Acked-by?

- Arnaldo

> architectures. For this specific problem I wonder if rather than
> skipping the event the event can be fixed with domain and core set to
> 1 ? This would provide a little additional coverage.
> 
> Thanks,
> Ian
> 
> > +  # hv_gpci/event,partition_id=?/
> > +  # Hence skip these events for ppc.
> > +  if echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; then
> > +    echo "Skipping: Event '$p' in powerpc"
> > +    continue
> > +  fi
> >    echo "Testing $p"
> >    result=$(perf stat -e "$p" true 2>&1)
> >    if ! echo "$result" | grep -q "$p" && ! echo "$result" | grep -q "<not supported>" ; then
> > --
> > 2.35.1
> >

-- 

- Arnaldo

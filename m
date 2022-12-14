Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66964CD66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 16:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXKd05g62z3cLT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 02:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9tSyzsP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9tSyzsP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXKc26S8Qz3bTL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 02:51:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2C3FCB816ED;
	Wed, 14 Dec 2022 15:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908ECC433EF;
	Wed, 14 Dec 2022 15:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671033098;
	bh=0AiPOWaXzR9wFk0mvBF4P1v2VviLkdCesDZbtqkudPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9tSyzsP7bNgg/C0KPShsPZYdkcVAGsMPskh94D3+1/sWDJCviFHBlSagZBPrgIs4
	 P8d4u1wKA3lkh20qclXr8YCuZeItKOBq3qB1YLL/ZIf4B8G7utm2n+ymFQ+pzoTtag
	 tH7/bGdlaM/yqxkZBwXVcvsOK/GhNb9D+T7kNNFnn/dS7AoTIOsJ2ynWVsq62/x1kr
	 +lssn5opURUhugct4Im8CTvSrAMJyfch5HxmIkgJ3OzizJP17sIqYjCgRY5mYEgq5r
	 qfM9BQI+drINAG6NNmXwSWQdfc+t3ujkO9KSNEaoMUrvrSk20wSYOz0xfDaytpf9Cf
	 IcG69uzPJs1Ag==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BC85040367; Wed, 14 Dec 2022 12:51:34 -0300 (-03)
Date: Wed, 14 Dec 2022 12:51:34 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] perf test bpf: Skip test if kernel-debuginfo is not
 present
Message-ID: <Y5nxBuZ2AmKQh93a@kernel.org>
References: <20221028154230.140709-1-kjain@linux.ibm.com>
 <A7B7E3F1-161D-4B1A-A4FE-E4A77EE06F1A@linux.vnet.ibm.com>
 <Y5d5mfyCEcUqI61Y@kernel.org>
 <6D5F1D8A-47FF-46CF-8251-20BABDF283F6@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6D5F1D8A-47FF-46CF-8251-20BABDF283F6@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Dec 13, 2022 at 03:21:03PM +0530, Athira Rajeev escreveu:
> > On 13-Dec-2022, at 12:27 AM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > Em Thu, Nov 03, 2022 at 12:27:01PM +0530, Athira Rajeev escreveu:
> >>> On 28-Oct-2022, at 9:12 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
> >>> 
> >>> Perf BPF filter test fails in environment where "kernel-debuginfo"
> >>> is not installed.
> >>> 
> >>> Test failure logs:
> >>> <<>>
> >>> 42: BPF filter                            :
> >>> 42.1: Basic BPF filtering                 : Ok
> >>> 42.2: BPF pinning                         : Ok
> >>> 42.3: BPF prologue generation             : FAILED!
> >>> <<>>
> >>> 
> >>> Enabling verbose option provided debug logs, which says debuginfo
> >>> needs to be installed. Snippet of verbose logs:
> >>> 
> >>> <<>>
> >>> 42.3: BPF prologue generation                                       :
> >>> --- start ---
> >>> test child forked, pid 28218
> >>> <<>>
> >>> Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> >>> package.
> >>> bpf_probe: failed to convert perf probe events
> >>> Failed to add events selected by BPF
> >>> test child finished with -1
> >>> ---- end ----
> >>> BPF filter subtest 3: FAILED!
> >>> <<>>
> >>> 
> >>> Here subtest, "BPF prologue generation" failed and
> >>> logs shows debuginfo is needed. After installing
> >>> kernel-debuginfo package, testcase passes.
> >>> 
> >>> Subtest "BPF prologue generation" failed because, the "do_test"
> >>> function returns "TEST_FAIL" without checking the error type
> >>> returned by "parse_events_load_bpf_obj" function.
> >>> Function parse_events_load_bpf_obj can also return error of type
> >>> "-ENOENT" incase kernel-debuginfo package is not installed. Fix this
> >>> by adding check for -ENOENT error.
> >>> 
> >>> Test result after the patch changes:
> >>> 
> >>> Test failure logs:
> >>> <<>>
> >>> 42: BPF filter                 :
> >>> 42.1: Basic BPF filtering      : Ok
> >>> 42.2: BPF pinning              : Ok
> >>> 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
> >>> installed or environment missing BPF support)
> >>> 
> >>> Fixes: ba1fae431e74bb42 ("perf test: Add 'perf test BPF'")
> >>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> >>> ---
> >>> tools/perf/tests/bpf.c | 6 +++++-
> >>> 1 file changed, 5 insertions(+), 1 deletion(-)
> >>> 
> >>> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> >>> index 17c023823713..57cecadc1da2 100644
> >>> --- a/tools/perf/tests/bpf.c
> >>> +++ b/tools/perf/tests/bpf.c
> >>> @@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int (*func)(void),
> >>> 
> >>> 	err = parse_events_load_bpf_obj(&parse_state, &parse_state.list, obj, NULL);
> >>> 	parse_events_error__exit(&parse_error);
> >>> +	if (err == -ENOENT) {
> >>> +		pr_debug("Failed to add events selected by BPF, debuginfo package not installed\n");
> >>> +		return TEST_SKIP;
> >>> +	}
> >> 
> >> Hi Kajol,
> >> 
> >> Here, you have used ENOENT to skip the test. But there could be other places in the code path for “parse_events_load_bpf_obj”
> >> which also returns ENOENT. In that case, for any exit that returns ENOENT, test will get skipped.
> >> 
> >> Can we look at the logs, example we have this in commit logs:
> >> 
> >> 	Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> >> 	package.
> >> 
> >> so as to decide whether to skip for debug info ?
> > 
> > Kajol?
 
> Hi Arnaldo, looking for your suggestion on how to handle the case where debuginfo is missing.
 
> Here the bpf test fails because of missing debuginfo. The function
> which goes through the debuginfo check is "parse_events_load_bpf_obj"
> . parse_events_load_bpf_obj internally calls "open_debuginfo" which
> returns ENOENT when debuginfo is missing. The patch fix from Kajol is
> to skip the test using error code ENOENT for debuginfo.

Lets see:

root@roc-rk3399-pc:~# uname -a
Linux roc-rk3399-pc 6.1.0-rc5-00123-g4dd7ff4a0311 #2 SMP PREEMPT Wed Nov 16 19:55:11 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
root@roc-rk3399-pc:~# perf probe -x ~/bin/perf open_debuginfo
Added new event:
  probe_perf:open_debuginfo (on open_debuginfo in /home/acme/bin/perf)

You can now use it in all perf tools, such as:

	perf record -e probe_perf:open_debuginfo -aR sleep 1

root@roc-rk3399-pc:~#

root@roc-rk3399-pc:~# perf trace --call-graph=dwarf -a -e probe_perf:* perf test bpf
 40: LLVM search and compile                                         :
 40.1: Basic BPF llvm compile                                        : Ok
 40.3: Compile source for BPF prologue generation                    : FAILED!
 40.4: Compile source for BPF relocation                             : Ok
 42: BPF filter                                                      :
 42.1: Basic BPF filtering                                           :     0.000 perf/38363 probe_perf:open_debuginfo(__probe_ip: 187650778659428)
                                       open_debuginfo (/home/acme/bin/perf)
                                       try_to_find_probe_trace_events (inlined)
                                       convert_to_probe_trace_events (inlined)
                                       convert_perf_probe_events (/home/acme/bin/perf)
                                       bpf__probe (/home/acme/bin/perf)
                                       parse_events_load_bpf_obj (/home/acme/bin/perf)
                                       do_test (/home/acme/bin/perf)
 FAILED!
 42.2: BPF pinning                                                   :  5594.218 perf/38582 probe_perf:open_debuginfo(__probe_ip: 187650778659428)
                                       open_debuginfo (/home/acme/bin/perf)
                                       try_to_find_probe_trace_events (inlined)
                                       convert_to_probe_trace_events (inlined)
                                       convert_perf_probe_events (/home/acme/bin/perf)
                                       bpf__probe (/home/acme/bin/perf)
                                       parse_events_load_bpf_obj (/home/acme/bin/perf)
                                       do_test (/home/acme/bin/perf)
 FAILED!
 42.3: BPF prologue generation                                       : FAILED!
 63: Test libpfm4 support                                            :
 99: perf stat --bpf-counters test                                   : Skip
100: perf stat --bpf-counters --for-each-cgroup test                 : Skip
root@roc-rk3399-pc:~#

So that is the callchains leading to open_debuginfo(), perhaps we should
return ENODATA at try_to_find_probe_trace_events() when open_debuginfo()
fails?

⬢[acme@toolbox perf]$ find tools/perf/ -name "*.[ch]" | xargs grep try_to_find_probe_trace_events
tools/perf/util/probe-event.c:static int try_to_find_probe_trace_events(struct perf_probe_event *pev,
tools/perf/util/probe-event.c:static int try_to_find_probe_trace_events(struct perf_probe_event *pev,
tools/perf/util/probe-event.c:	ret = try_to_find_probe_trace_events(pev, tevs);
⬢[acme@toolbox perf]$ 

Also it returns ENOENT as well when not finding the probe point... There
we should return perhaps ENOSYM?
 
> But issue with using this return code is that, there are other places
> in the code path for "parse_events_load_bpf_obj" which also returns
> ENOENT. In that case, for any exit path that returns ENOENT, test will
> get skipped.  Hence looking for an alternative way to identify missing
> debuginfo to skip the test. Please share your thoughts on this.

See above.

- Arnaldo

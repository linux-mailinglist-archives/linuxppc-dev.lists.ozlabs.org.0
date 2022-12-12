Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0A64A7C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 19:58:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NW9rX66Sbz3c7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 05:58:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnffZYAP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnffZYAP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NW9qW1FtDz3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 05:57:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 85EEEB80DFF;
	Mon, 12 Dec 2022 18:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2C7C433EF;
	Mon, 12 Dec 2022 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670871452;
	bh=oLM1EmBJn70XGRt7X/jZ1WyagJTgINmDi8SvRBD1y0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnffZYAP4zA3NP9Q+akqnk35ot/lF9sBRjGhSjIilwwEyu1Aakcx5r9OUUzPoscBC
	 1BrXkXihTZPONsWjIicjvJLYlcMCQmRNPFkYP6cBKVR7Q6C1nKsawxMifqOPo3jjol
	 sYxjvky9w90ngvV9Bvuf75lGaqsTEAVqBGo4DIeiar0zkpbAdUFEY7RqE4g5jegBlN
	 1gsNhtYbH7w7Z7RhElcX0DDWCxTsy2ssQ5pfi+OF/IxRDbE46W1QWpF05c1owGyrG9
	 5oozGAPEROul9Dmpnc5xK/jZglrLOrVeH1qhzLOGY7Lswf9WwBnwIwD9LYa/E6KdyJ
	 GCZLfIwt7J/Gg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id CC2A240483; Mon, 12 Dec 2022 15:57:29 -0300 (-03)
Date: Mon, 12 Dec 2022 15:57:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] perf test bpf: Skip test if kernel-debuginfo is not
 present
Message-ID: <Y5d5mfyCEcUqI61Y@kernel.org>
References: <20221028154230.140709-1-kjain@linux.ibm.com>
 <A7B7E3F1-161D-4B1A-A4FE-E4A77EE06F1A@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A7B7E3F1-161D-4B1A-A4FE-E4A77EE06F1A@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Nov 03, 2022 at 12:27:01PM +0530, Athira Rajeev escreveu:
> > On 28-Oct-2022, at 9:12 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
> > 
> > Perf BPF filter test fails in environment where "kernel-debuginfo"
> > is not installed.
> > 
> > Test failure logs:
> > <<>>
> > 42: BPF filter                            :
> > 42.1: Basic BPF filtering                 : Ok
> > 42.2: BPF pinning                         : Ok
> > 42.3: BPF prologue generation             : FAILED!
> > <<>>
> > 
> > Enabling verbose option provided debug logs, which says debuginfo
> > needs to be installed. Snippet of verbose logs:
> > 
> > <<>>
> > 42.3: BPF prologue generation                                       :
> > --- start ---
> > test child forked, pid 28218
> > <<>>
> > Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> > package.
> > bpf_probe: failed to convert perf probe events
> > Failed to add events selected by BPF
> > test child finished with -1
> > ---- end ----
> > BPF filter subtest 3: FAILED!
> > <<>>
> > 
> > Here subtest, "BPF prologue generation" failed and
> > logs shows debuginfo is needed. After installing
> > kernel-debuginfo package, testcase passes.
> > 
> > Subtest "BPF prologue generation" failed because, the "do_test"
> > function returns "TEST_FAIL" without checking the error type
> > returned by "parse_events_load_bpf_obj" function.
> > Function parse_events_load_bpf_obj can also return error of type
> > "-ENOENT" incase kernel-debuginfo package is not installed. Fix this
> > by adding check for -ENOENT error.
> > 
> > Test result after the patch changes:
> > 
> > Test failure logs:
> > <<>>
> > 42: BPF filter                 :
> > 42.1: Basic BPF filtering      : Ok
> > 42.2: BPF pinning              : Ok
> > 42.3: BPF prologue generation  : Skip (clang/debuginfo isn't
> > installed or environment missing BPF support)
> > 
> > Fixes: ba1fae431e74bb42 ("perf test: Add 'perf test BPF'")
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> > ---
> > tools/perf/tests/bpf.c | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> > index 17c023823713..57cecadc1da2 100644
> > --- a/tools/perf/tests/bpf.c
> > +++ b/tools/perf/tests/bpf.c
> > @@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int (*func)(void),
> > 
> > 	err = parse_events_load_bpf_obj(&parse_state, &parse_state.list, obj, NULL);
> > 	parse_events_error__exit(&parse_error);
> > +	if (err == -ENOENT) {
> > +		pr_debug("Failed to add events selected by BPF, debuginfo package not installed\n");
> > +		return TEST_SKIP;
> > +	}
> 
> Hi Kajol,
> 
> Here, you have used ENOENT to skip the test. But there could be other places in the code path for “parse_events_load_bpf_obj”
> which also returns ENOENT. In that case, for any exit that returns ENOENT, test will get skipped.
> 
> Can we look at the logs, example we have this in commit logs:
> 
> 	Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
> 	package.
> 
> so as to decide whether to skip for debug info ?

Kajol?

- Arnaldo
 
> Thanks
> Athira
> 
> > 	if (err || list_empty(&parse_state.list)) {
> > 		pr_debug("Failed to add events selected by BPF\n");
> > 		return TEST_FAIL;
> > @@ -368,7 +372,7 @@ static struct test_case bpf_tests[] = {
> > 			"clang isn't installed or environment missing BPF support"),
> > #ifdef HAVE_BPF_PROLOGUE
> > 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
> > -			"clang isn't installed or environment missing BPF support"),
> > +			"clang/debuginfo isn't installed or environment missing BPF support"),
> > #else
> > 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
> > #endif
> > -- 
> > 2.31.1

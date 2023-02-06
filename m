Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280068C057
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 15:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9TV06xMFz3cfL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 01:41:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jbP4NAyv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jbP4NAyv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9TT14MSWz300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 01:40:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAF2E60EFD;
	Mon,  6 Feb 2023 14:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6347C433EF;
	Mon,  6 Feb 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675694433;
	bh=t9iIrsUHTjnBmZRzJ5/uLbX5TRcXl3Ays/RfP1ZqCqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbP4NAyvNcSXGgnAjYhKRuD1pIR9A8EpHbhws0dnenQqM9P8D9icca8BDpED1bJsT
	 ucWDtRpVSAZSkaOf5X7sqmxGWK8+p8hWcG3EKKvvGG5WgU1xpUCobOZz2VAk48l/7n
	 wVOjjaq8by53lmqpXFjbRFUO1CcnhDH3OL7C1WUguPIlY6aqSZIejBNyGSICe1ErHC
	 LCUhEEy+G7aQlaFGleRSfRaWAhmZqbaJ9WjpsOkyQz/N0ezV6oug44EAzSJxwMSx0q
	 p6CbTfTZMHuPGbE36G+Y40iep9jURww4QAbcxYzDPhvR3JA0ggcbKVbDMFbgqkMf2R
	 XB/NCkChFwhug==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id BDF6A405BE; Mon,  6 Feb 2023 11:40:29 -0300 (-03)
Date: Mon, 6 Feb 2023 11:40:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tests/bpf: Fix the bpf test to check for libtraceevent
 support
Message-ID: <Y+ERXfJpXXv7xRxx@kernel.org>
References: <20230131135001.54578-1-atrajeev@linux.vnet.ibm.com>
 <Y9sKjYV8b37vstQ0@kernel.org>
 <628A923D-A993-4A35-A90E-8F6798549FD0@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628A923D-A993-4A35-A90E-8F6798549FD0@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Feb 06, 2023 at 09:27:13AM +0530, Athira Rajeev escreveu:
> > On 02-Feb-2023, at 6:27 AM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > 
> > Em Tue, Jan 31, 2023 at 07:20:01PM +0530, Athira Rajeev escreveu:
> >> "bpf" tests fails in environment with missing libtraceevent
> >> support as below:
> >> 
> >> # ./perf test 36
> >> 36: BPF filter                                                      :
> >> 36.1: Basic BPF filtering                                           : FAILED!
> >> 36.2: BPF pinning                                                   : FAILED!
> >> 36.3: BPF prologue generation                                       : FAILED!
> >> 
> >> The environment has clang but missing the libtraceevent
> >> devel. Hence perf is compiled without libtraceevent support.
> > 
> > Thanks, applied.
> 
> Hi,
> 
> Thanks for checking
> 
> Arnaldo, this is applied to tmp.perf/core branch ?

I thought I had this in :-\ Now its in tmp.perf/core.

- Arnaldo
 
> Athira 
> > 
> > - Arnaldo
> > 
> > 
> >> Detailed logs:
> >> 	./perf test -v "Basic BPF filtering"
> >> 
> >> 	Failed to add BPF event syscalls:sys_enter_epoll_pwait
> >> 	bpf: tracepoint call back failed, stop iterate
> >> 	Failed to add events selected by BPF
> >> 
> >> The bpf tests tris to add probe event which fails
> >> at "parse_events_add_tracepoint" function due to missing
> >> libtraceevent. Add check for "HAVE_LIBTRACEEVENT" in the
> >> "tests/bpf.c" before proceeding with the test.
> >> 
> >> With the change,
> >> 
> >> 	# ./perf test 36
> >> 	36: BPF filter                                                      :
> >> 	36.1: Basic BPF filtering                                           : Skip (not compiled in or missing libtraceevent support)
> >> 	36.2: BPF pinning                                                   : Skip (not compiled in or missing libtraceevent support)
> >> 	36.3: BPF prologue generation                                       : Skip (not compiled in or missing libtraceevent support)
> >> 
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> tools/perf/tests/bpf.c | 22 +++++++++++-----------
> >> 1 file changed, 11 insertions(+), 11 deletions(-)
> >> 
> >> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> >> index 17c023823713..4af39528f611 100644
> >> --- a/tools/perf/tests/bpf.c
> >> +++ b/tools/perf/tests/bpf.c
> >> @@ -23,7 +23,7 @@
> >> #define NR_ITERS       111
> >> #define PERF_TEST_BPF_PATH "/sys/fs/bpf/perf_test"
> >> 
> >> -#ifdef HAVE_LIBBPF_SUPPORT
> >> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
> >> #include <linux/bpf.h>
> >> #include <bpf/bpf.h>
> >> 
> >> @@ -330,10 +330,10 @@ static int test__bpf(int i)
> >> static int test__basic_bpf_test(struct test_suite *test __maybe_unused,
> >> 				int subtest __maybe_unused)
> >> {
> >> -#ifdef HAVE_LIBBPF_SUPPORT
> >> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
> >> 	return test__bpf(0);
> >> #else
> >> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
> >> +	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
> >> 	return TEST_SKIP;
> >> #endif
> >> }
> >> @@ -341,10 +341,10 @@ static int test__basic_bpf_test(struct test_suite *test __maybe_unused,
> >> static int test__bpf_pinning(struct test_suite *test __maybe_unused,
> >> 			     int subtest __maybe_unused)
> >> {
> >> -#ifdef HAVE_LIBBPF_SUPPORT
> >> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
> >> 	return test__bpf(1);
> >> #else
> >> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
> >> +	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
> >> 	return TEST_SKIP;
> >> #endif
> >> }
> >> @@ -352,17 +352,17 @@ static int test__bpf_pinning(struct test_suite *test __maybe_unused,
> >> static int test__bpf_prologue_test(struct test_suite *test __maybe_unused,
> >> 				   int subtest __maybe_unused)
> >> {
> >> -#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE)
> >> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_BPF_PROLOGUE) && defined(HAVE_LIBTRACEEVENT)
> >> 	return test__bpf(2);
> >> #else
> >> -	pr_debug("Skip BPF test because BPF support is not compiled\n");
> >> +	pr_debug("Skip BPF test because BPF or libtraceevent support is not compiled\n");
> >> 	return TEST_SKIP;
> >> #endif
> >> }
> >> 
> >> 
> >> static struct test_case bpf_tests[] = {
> >> -#ifdef HAVE_LIBBPF_SUPPORT
> >> +#if defined(HAVE_LIBBPF_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
> >> 	TEST_CASE("Basic BPF filtering", basic_bpf_test),
> >> 	TEST_CASE_REASON("BPF pinning", bpf_pinning,
> >> 			"clang isn't installed or environment missing BPF support"),
> >> @@ -373,9 +373,9 @@ static struct test_case bpf_tests[] = {
> >> 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
> >> #endif
> >> #else
> >> -	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not compiled in"),
> >> -	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in"),
> >> -	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
> >> +	TEST_CASE_REASON("Basic BPF filtering", basic_bpf_test, "not compiled in or missing libtraceevent support"),
> >> +	TEST_CASE_REASON("BPF pinning", bpf_pinning, "not compiled in or missing libtraceevent support"),
> >> +	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in or missing libtraceevent support"),
> >> #endif
> >> 	{ .name = NULL, }
> >> };
> >> -- 
> >> 2.39.0
> >> 
> > 
> > -- 
> > 
> > - Arnaldo
> 

-- 

- Arnaldo

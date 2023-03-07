Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF46AEA38
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 18:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWMvH5YM4z3cgv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 04:31:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HXEaqvf0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HXEaqvf0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWMsN4kr2z3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 04:30:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE6586150F;
	Tue,  7 Mar 2023 17:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D11C433EF;
	Tue,  7 Mar 2023 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678210214;
	bh=dxFSj10K1gAdGhzhQE+cReJR7o4SDTExojXack2sgcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HXEaqvf03OH2uPj+tPGeha0503KVIR7SdBAj8nZKWpsvOcw4t35pyPgTsN0Kv+GET
	 UbHCz+DK6HxXEOGuoZbtLOTDzrhRuYIo2TaO13RWBIsRQ8ItMjJehv3l+UKzmaRVko
	 l+CRTZZ0hJ3BDR0V2goGVrl0WwCKR0+eIndElVw4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.2 0470/1001] perf test bpf: Skip test if kernel-debuginfo is not present
Date: Tue,  7 Mar 2023 17:54:02 +0100
Message-Id: <20230307170041.792183851@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307170022.094103862@linuxfoundation.org>
References: <20230307170022.094103862@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Wang Nan <wangnan0@huawei.com>, Disha Goel <disgoel@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit 34266f904abd45731bdade2e92d0536c092ee9bc ]

Perf BPF filter test fails in environment where "kernel-debuginfo"
is not installed.

Test failure logs:

  <<>>
  42: BPF filter                            :
  42.1: Basic BPF filtering                 : Ok
  42.2: BPF pinning                         : Ok
  42.3: BPF prologue generation             : FAILED!
  <<>>

Enabling verbose option provided debug logs, which says debuginfo
needs to be installed. Snippet of verbose logs:

  <<>>
  42.3: BPF prologue generation                                       :
  --- start ---
  test child forked, pid 28218
  <<>>
  Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo
  package.
  bpf_probe: failed to convert perf probe events
  Failed to add events selected by BPF
  test child finished with -1
  ---- end ----
  BPF filter subtest 3: FAILED!
  <<>>

Here the subtest "BPF prologue generation" failed and logs shows
debuginfo is needed. After installing kernel-debuginfo package, testcase
passes.

The "BPF prologue generation" subtest failed because, the do_test()
returns TEST_FAIL without checking the error type returned by
parse_events_load_bpf_obj().

parse_events_load_bpf_obj() can also return error of type -ENODATA
incase kernel-debuginfo package is not installed. Fix this by adding
check for -ENODATA error.

Test result after the patch changes:

Test failure logs:

  <<>>
  42: BPF filter                 :
  42.1: Basic BPF filtering      : Ok
  42.2: BPF pinning              : Ok
  42.3: BPF prologue generation  : Skip (clang/debuginfo isn't installed or environment missing BPF support)
  <<>>

Fixes: ba1fae431e74bb42 ("perf test: Add 'perf test BPF'")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Disha Goel <disgoel@linux.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Wang Nan <wangnan0@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lore.kernel.org/linux-perf-users/Y7bIk77mdE4j8Jyi@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/tests/bpf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
index 17c023823713d..6a4235a9cf57e 100644
--- a/tools/perf/tests/bpf.c
+++ b/tools/perf/tests/bpf.c
@@ -126,6 +126,10 @@ static int do_test(struct bpf_object *obj, int (*func)(void),
 
 	err = parse_events_load_bpf_obj(&parse_state, &parse_state.list, obj, NULL);
 	parse_events_error__exit(&parse_error);
+	if (err == -ENODATA) {
+		pr_debug("Failed to add events selected by BPF, debuginfo package not installed\n");
+		return TEST_SKIP;
+	}
 	if (err || list_empty(&parse_state.list)) {
 		pr_debug("Failed to add events selected by BPF\n");
 		return TEST_FAIL;
@@ -368,7 +372,7 @@ static struct test_case bpf_tests[] = {
 			"clang isn't installed or environment missing BPF support"),
 #ifdef HAVE_BPF_PROLOGUE
 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
-			"clang isn't installed or environment missing BPF support"),
+			"clang/debuginfo isn't installed or environment missing BPF support"),
 #else
 	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
 #endif
-- 
2.39.2




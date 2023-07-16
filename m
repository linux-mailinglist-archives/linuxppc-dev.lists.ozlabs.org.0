Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B367C755333
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 22:16:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ikQQ21/O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3xLn4My6z3brB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 06:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ikQQ21/O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3xK05ypvz309D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 06:15:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A7FA60E65;
	Sun, 16 Jul 2023 20:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115D6C433C8;
	Sun, 16 Jul 2023 20:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689538498;
	bh=WvwUjWJMfD0SL9pbZfYk/rYV+dUpluyu12Sr1ip0kUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ikQQ21/O3/F5t01YhWyqBvxdoascI5TYChjXEHpbEnHkjBt7Q4cOM8Opssdw2ZjCW
	 6YMzRcRRacZ1v8T/t0CkuXn9c26z4+eVigp0CBQd2W+DwTnL0z1FK0fAykNYAquref
	 IYJk5EuIXcb+RW2x8vv7g1qhp7a65gSWnb6Z5wVA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.4 473/800] perf tests task_analyzer: Skip tests if no libtraceevent support
Date: Sun, 16 Jul 2023 21:45:26 +0200
Message-ID: <20230716195000.067159112@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230716194949.099592437@linuxfoundation.org>
References: <20230716194949.099592437@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, John Garry <john.g.garry@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ravi Bangoria <ravi.bangoria@amd.com>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Petar Gligoric <petar.gligoric@rohde-schwarz.com>, Namhyung Kim <namhyung@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Aditya Gupta <adityag@linux.ibm.com>

[ Upstream commit c3ac3b0779770acd3ad7eecb5099ab4419ef2e2e ]

Test "perf script task-analyzer tests" fails in environment with missing
libtraceevent support, as perf record fails to create the perf.data
file, which further tests depend on.

Instead, when perf is not compiled with libtraceevent support, skip
those tests instead of failing them, by checking the output of `perf
record --dry-run` to see if it prints the error "libtraceevent is
necessary for tracepoint support"

For the following output, perf compiled with: `make NO_LIBTRACEEVENT=1`

Before the patch:

108: perf script task-analyzer tests                                 :
test child forked, pid 24105
failed to open perf.data: No such file or directory  (try 'perf record' first)
FAIL: "invokation of perf script report task-analyzer command failed" Error message: ""
FAIL: "test_basic" Error message: "Failed to find required string:'Comm'."
failed to open perf.data: No such file or directory  (try 'perf record' first)
FAIL: "invokation of perf script report task-analyzer --ns --rename-comms-by-tids 0:random command failed" Error message: ""
FAIL: "test_ns_rename" Error message: "Failed to find required string:'Comm'."
failed to open perf.data: No such file or directory  (try 'perf record' first)
<...>
perf script task-analyzer tests: FAILED!

With this patch, the script instead returns 2 signifying SKIP, and after
the patch:

108: perf script task-analyzer tests                                 :
test child forked, pid 26010
libtraceevent is necessary for tracepoint support
WARN: Skipping tests. No libtraceevent support
test child finished with -2
perf script task-analyzer tests: Skip

Fixes: e8478b84d6ba9ccf ("perf test: Add new task-analyzer tests")
Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Petar Gligoric <petar.gligoric@rohde-schwarz.com>
Cc: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230613164145.50488-18-atrajeev@linux.vnet.ibm.com
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/tests/shell/test_task_analyzer.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
index 6b3343234a6b2..1b7f3c1ec218b 100755
--- a/tools/perf/tests/shell/test_task_analyzer.sh
+++ b/tools/perf/tests/shell/test_task_analyzer.sh
@@ -44,9 +44,20 @@ find_str_or_fail() {
 	fi
 }
 
+# check if perf is compiled with libtraceevent support
+skip_no_probe_record_support() {
+	perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
+	return 0
+}
+
 prepare_perf_data() {
 	# 1s should be sufficient to catch at least some switches
 	perf record -e sched:sched_switch -a -- sleep 1 > /dev/null 2>&1
+	# check if perf data file got created in above step.
+	if [ ! -e "perf.data" ]; then
+		printf "FAIL: perf record failed to create \"perf.data\" \n"
+		return 1
+	fi
 }
 
 # check standard inkvokation with no arguments
@@ -134,6 +145,13 @@ test_csvsummary_extended() {
 	find_str_or_fail "Out-Out;" csvsummary ${FUNCNAME[0]}
 }
 
+skip_no_probe_record_support
+err=$?
+if [ $err -ne 0 ]; then
+	echo "WARN: Skipping tests. No libtraceevent support"
+	cleanup
+	exit $err
+fi
 prepare_perf_data
 test_basic
 test_ns_rename
-- 
2.39.2




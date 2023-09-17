Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F877A39A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 21:53:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=by9WHEc4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpdrW6WrZz3dDv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 05:52:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=by9WHEc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rpdns73pfz3cCv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 05:50:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8882060C71;
	Sun, 17 Sep 2023 19:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18287C433C9;
	Sun, 17 Sep 2023 19:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694980238;
	bh=AzLhrFAyBm4mZ1q04duCq69YE0x3dfw/7favHmn/jX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=by9WHEc4miseZp0EQpzcdkoWwLVqYbfx6+Bco9mGlGqQt/Nr0+IWTjMIL2WdTtM43
	 trndrg+pejZOQ04y0ZcEmaDi4vBVTT1RpHUOFDyuU9MQt9XKyHQt2uYJCrgrAARX2w
	 1ya/w5gcY57PpaRu+SIlbBS6GcNe4R4nBc5XGozw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.5 097/285] perf test stat_bpf_counters_cgrp: Fix shellcheck issue about logical operators
Date: Sun, 17 Sep 2023 21:11:37 +0200
Message-ID: <20230917191055.046209683@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230917191051.639202302@linuxfoundation.org>
References: <20230917191051.639202302@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit 0dd1f815545d7210150642741c364521cc5cf116 ]

Running shellcheck on lock_contention.sh generates below warning:

In stat_bpf_counters_cgrp.sh line 28:
	if [ -d /sys/fs/cgroup/system.slice -a -d /sys/fs/cgroup/user.slice ]; then
                                            ^-- SC2166 (warning): Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.

In stat_bpf_counters_cgrp.sh line 34:
	local self_cgrp=$(grep perf_event /proc/self/cgroup | cut -d: -f3)
        ^-------------^ SC3043 (warning): In POSIX sh, 'local' is undefined.
              ^-------^ SC2155 (warning): Declare and assign separately to avoid masking return values.
                        ^-- SC2046 (warning): Quote this to prevent word splitting.

In stat_bpf_counters_cgrp.sh line 51:
	local output
        ^----------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

In stat_bpf_counters_cgrp.sh line 65:
	local output
        ^----------^ SC3043 (warning): In POSIX sh, 'local' is undefined.

Fixed above warnings by:
- Changing the expression [p -a q] to [p] && [q].
- Fixing shellcheck warnings for local usage, by prefixing
  function name to the variable.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Acked-by: Ian Rogers <irogers@google.com>
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230709182800.53002-6-atrajeev@linux.vnet.ibm.com
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: a84260e31402 ("perf test stat_bpf_counters_cgrp: Enhance perf stat cgroup BPF counter test")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
index d724855d097c2..a74440a00b6b6 100755
--- a/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
+++ b/tools/perf/tests/shell/stat_bpf_counters_cgrp.sh
@@ -25,22 +25,22 @@ check_bpf_counter()
 find_cgroups()
 {
 	# try usual systemd slices first
-	if [ -d /sys/fs/cgroup/system.slice -a -d /sys/fs/cgroup/user.slice ]; then
+	if [ -d /sys/fs/cgroup/system.slice ] && [ -d /sys/fs/cgroup/user.slice ]; then
 		test_cgroups="system.slice,user.slice"
 		return
 	fi
 
 	# try root and self cgroups
-	local self_cgrp=$(grep perf_event /proc/self/cgroup | cut -d: -f3)
-	if [ -z ${self_cgrp} ]; then
+	find_cgroups_self_cgrp=$(grep perf_event /proc/self/cgroup | cut -d: -f3)
+	if [ -z ${find_cgroups_self_cgrp} ]; then
 		# cgroup v2 doesn't specify perf_event
-		self_cgrp=$(grep ^0: /proc/self/cgroup | cut -d: -f3)
+		find_cgroups_self_cgrp=$(grep ^0: /proc/self/cgroup | cut -d: -f3)
 	fi
 
-	if [ -z ${self_cgrp} ]; then
+	if [ -z ${find_cgroups_self_cgrp} ]; then
 		test_cgroups="/"
 	else
-		test_cgroups="/,${self_cgrp}"
+		test_cgroups="/,${find_cgroups_self_cgrp}"
 	fi
 }
 
@@ -48,13 +48,11 @@ find_cgroups()
 # Just check if it runs without failure and has non-zero results.
 check_system_wide_counted()
 {
-	local output
-
-	output=$(perf stat -a --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, sleep 1  2>&1)
-	if echo ${output} | grep -q -F "<not "; then
+	check_system_wide_counted_output=$(perf stat -a --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, sleep 1  2>&1)
+	if echo ${check_system_wide_counted_output} | grep -q -F "<not "; then
 		echo "Some system-wide events are not counted"
 		if [ "${verbose}" = "1" ]; then
-			echo ${output}
+			echo ${check_system_wide_counted_output}
 		fi
 		exit 1
 	fi
@@ -62,13 +60,11 @@ check_system_wide_counted()
 
 check_cpu_list_counted()
 {
-	local output
-
-	output=$(perf stat -C 1 --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, taskset -c 1 sleep 1  2>&1)
-	if echo ${output} | grep -q -F "<not "; then
+	check_cpu_list_counted_output=$(perf stat -C 1 --bpf-counters --for-each-cgroup ${test_cgroups} -e cpu-clock -x, taskset -c 1 sleep 1  2>&1)
+	if echo ${check_cpu_list_counted_output} | grep -q -F "<not "; then
 		echo "Some CPU events are not counted"
 		if [ "${verbose}" = "1" ]; then
-			echo ${output}
+			echo ${check_cpu_list_counted_output}
 		fi
 		exit 1
 	fi
-- 
2.40.1




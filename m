Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC1941B3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 18:52:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V6IjUfZl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYLr31Ht0z3dB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 02:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V6IjUfZl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYLqM2kzlz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 02:51:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF3AF61FF5;
	Tue, 30 Jul 2024 16:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EA4C32782;
	Tue, 30 Jul 2024 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722358315;
	bh=BJV3QLEA/AdECFmss7esuyk98F2mBcMG847FAFHZzfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6IjUfZlDopGwDRq8i/VaAzop/fQ0EwJatFPVGvMXc6U0/BHHN6tE6TYSWN/hZRg5
	 kV2j+sxcUF8uH8DfYx+WyF2aiyDEYhrhubojWyp1MUh+SVVC+E5EFg8hosxT7Lb6Wt
	 +vs2NOAVXWg8Y6oct6WA+n5bpmY8ZiLdthfvanV0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.10 345/809] tools/perf: Fix the string match for "/tmp/perf-$PID.map" files in dso__load
Date: Tue, 30 Jul 2024 17:43:41 +0200
Message-ID: <20240730151738.260500822@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730151724.637682316@linuxfoundation.org>
References: <20240730151724.637682316@linuxfoundation.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, disgoel@linux.vnet.ibm.com, akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit b0979f008f1352a44cd3c8877e3eb8a1e3e1c6f3 ]

Perf test for perf probe of function from different CU fails
as below:

	./perf test -vv "test perf probe of function from different CU"
	116: test perf probe of function from different CU:
	--- start ---
	test child forked, pid 2679
	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.Msa7iy89bx/testfile
	  Error: Failed to add events.
	--- Cleaning up ---
	"foo" does not hit any event.
	  Error: Failed to delete events.
	---- end(-1) ----
	116: test perf probe of function from different CU                   : FAILED!

The test does below to probe function "foo" :

	# gcc -g -Og -flto -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.c
	-o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
	# gcc -g -Og -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.c
	-o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
	# gcc -g -Og -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
	/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
	/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o

	# ./perf probe -x /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile foo
	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
	   Error: Failed to add events.

Perf probe fails to find symbol foo in the executable placed in
/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7

Simple reproduce:

 # mktemp -d /tmp/perf-checkXXXXXXXXXX
   /tmp/perf-checkcWpuLRQI8j

 # gcc -g -o test test.c
 # cp test /tmp/perf-checkcWpuLRQI8j/
 # nm /tmp/perf-checkcWpuLRQI8j/test | grep foo
   00000000100006bc T foo

 # ./perf probe -x /tmp/perf-checkcWpuLRQI8j/test foo
   Failed to find symbol foo in /tmp/perf-checkcWpuLRQI8j/test
      Error: Failed to add events.

But it works with any files like /tmp/perf/test. Only for
patterns with "/tmp/perf-", this fails.

Further debugging, commit 80d496be89ed ("perf report: Add support
for profiling JIT generated code") added support for profiling JIT
generated code. This patch handles dso's of form
"/tmp/perf-$PID.map" .

The check used "if (strncmp(self->name, "/tmp/perf-", 10) == 0)"
to match "/tmp/perf-$PID.map". With this commit, any dso in
/tmp/perf- folder will be considered separately for processing
(not only JIT created map files ). Fix this by changing the
string pattern to check for "/tmp/perf-%d.map". Add a helper
function is_perf_pid_map_name to do this check. In "struct dso",
dso->long_name holds the long name of the dso file. Since the
/tmp/perf-$PID.map check uses the complete name, use dso___long_name for
the string name.

With the fix,
	# ./perf test "test perf probe of function from different CU"
	117: test perf probe of function from different CU                   : Ok

Fixes: 56cbeacf1435 ("perf probe: Add test for regression introduced by switch to die_get_decl_file()")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Cc: akanksha@linux.ibm.com
Cc: kjain@linux.ibm.com
Cc: maddy@linux.ibm.com
Cc: disgoel@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/20240623064850.83720-1-atrajeev@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/dso.c    | 12 ++++++++++++
 tools/perf/util/dso.h    |  4 ++++
 tools/perf/util/symbol.c |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index dde706b71da7b..2340c4f6d0c24 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1652,3 +1652,15 @@ int dso__strerror_load(struct dso *dso, char *buf, size_t buflen)
 	scnprintf(buf, buflen, "%s", dso_load__error_str[idx]);
 	return 0;
 }
+
+bool perf_pid_map_tid(const char *dso_name, int *tid)
+{
+	return sscanf(dso_name, "/tmp/perf-%d.map", tid) == 1;
+}
+
+bool is_perf_pid_map_name(const char *dso_name)
+{
+	int tid;
+
+	return perf_pid_map_tid(dso_name, &tid);
+}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index df2c98402af3e..d72f3b8c37f6a 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -809,4 +809,8 @@ void reset_fd_limit(void);
 u64 dso__find_global_type(struct dso *dso, u64 addr);
 u64 dso__findnew_global_type(struct dso *dso, u64 addr, u64 offset);
 
+/* Check if dso name is of format "/tmp/perf-%d.map" */
+bool perf_pid_map_tid(const char *dso_name, int *tid);
+bool is_perf_pid_map_name(const char *dso_name);
+
 #endif /* __PERF_DSO */
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 9e5940b5bc591..aee0a4cfb3836 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1799,7 +1799,8 @@ int dso__load(struct dso *dso, struct map *map)
 	const char *map_path = dso__long_name(dso);
 
 	mutex_lock(dso__lock(dso));
-	perfmap = strncmp(dso__name(dso), "/tmp/perf-", 10) == 0;
+	perfmap = is_perf_pid_map_name(map_path);
+
 	if (perfmap) {
 		if (dso__nsinfo(dso) &&
 		    (dso__find_perf_map(newmapname, sizeof(newmapname),
-- 
2.43.0




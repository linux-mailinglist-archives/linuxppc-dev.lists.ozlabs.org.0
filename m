Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BFC9417C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 18:15:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=SBHQlpfe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYL1n1nYcz3d40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 02:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=SBHQlpfe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYL153KQtz3cfm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 02:15:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E77161EE7;
	Tue, 30 Jul 2024 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DC4C32782;
	Tue, 30 Jul 2024 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722356118;
	bh=Yc0i+YNDdSzDYuM3ZOr6qks0c9Mv4Z2i82DMrfdTSjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SBHQlpfenaQm1LioZNT+agGBfAPz5sL8+MSCDYFTVkHrkKLsb1B0J+CVhDC2JF4r0
	 0u79u39V6X9dqj+n2QpXryZ4ReTB8gH9vEUzzjaZvvUwhC1KV0GYEup8CF1fNqvgmr
	 mRQ/tPcqtwpOjc7M4Jpta9sneKo2TZlVOTl++mkE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.1 157/440] perf tests arm_callgraph_fp: Address shellcheck warnings about signal names and adding double quotes for expression
Date: Tue, 30 Jul 2024 17:46:30 +0200
Message-ID: <20240730151622.009115670@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730151615.753688326@linuxfoundation.org>
References: <20240730151615.753688326@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, John Garry <john.g.garry@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ravi Bangoria <ravi.bangoria@amd.com>, patches@lists.linux.dev, Spoorthy S <spoorts2@in.ibm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Spoorthy S <spoorts2@in.ibm.com>

[ Upstream commit 1bb17b4c6c91ad4d9468247cf5f5464fa6440668 ]

Running shellcheck -S on test_arm_calligraph_fp throws warnings SC2086 and SC3049,

      $shellcheck -S warning tests/shell/test_arm_callgraph_fp.sh
         rm -f $PERF_DATA
            : Double quote to prevent globbing and word splitting.
         trap cleanup_files exit term int
                     : In POSIX sh, using lower/mixed case for signal names is undefined.

After fixing the warnings,

      $shellcheck tests/shell/test_arm_callgraph_fp.sh
      $ echo $?
      0

To address the POSIX shell warnings added changes to convert Lowercase
signal names to uppercase in the script and double quoted the
command substitutions($fix to "$fix") to solve Globbing warnings.

Signed-off-by: Spoorthy S<spoorts2@in.ibm.com>
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ravi Bangoria <ravi.bangoria@amd.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: https://lore.kernel.org/r/20230613164145.50488-4-atrajeev@linux.vnet.ibm.com
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: ff16aeb9b834 ("perf test: Make test_arm_callgraph_fp.sh more robust")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/tests/shell/test_arm_callgraph_fp.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_callgraph_fp.sh b/tools/perf/tests/shell/test_arm_callgraph_fp.sh
index e61d8deaa0c41..1380e0d12dce3 100755
--- a/tools/perf/tests/shell/test_arm_callgraph_fp.sh
+++ b/tools/perf/tests/shell/test_arm_callgraph_fp.sh
@@ -9,13 +9,13 @@ TEST_PROGRAM="perf test -w leafloop"
 
 cleanup_files()
 {
-	rm -f $PERF_DATA
+	rm -f "$PERF_DATA"
 }
 
-trap cleanup_files exit term int
+trap cleanup_files EXIT TERM INT
 
 # Add a 1 second delay to skip samples that are not in the leaf() function
-perf record -o $PERF_DATA --call-graph fp -e cycles//u -D 1000 --user-callchains -- $TEST_PROGRAM 2> /dev/null &
+perf record -o "$PERF_DATA" --call-graph fp -e cycles//u -D 1000 --user-callchains -- "$TEST_PROGRAM" 2> /dev/null &
 PID=$!
 
 echo " + Recording (PID=$PID)..."
-- 
2.43.0




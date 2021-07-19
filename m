Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 853CC3CE2EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 18:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT6SL3HpYz3bfM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 02:17:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mUnzsyUp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=mUnzsyUp; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT6Rw2fJ9z3076
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 02:17:00 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65FCB600EF;
 Mon, 19 Jul 2021 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626711418;
 bh=PtHEC4fjV1SkrbDYKXWz5Y/hlrMieelJNujTSLzjXEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUnzsyUp7cnt2ijv1DLN80OuHHQgSyoylz+AXCJHoDULfZGsd7nVF4rccceU8SjJW
 rEF5OqTYbPJQKI++d0LqIMuBlcdIRGiXZAaxTg/xSj4EH19gdoc+ZVx/1J6faFJD77
 AiKshOGCJfdWIy9Aw8Lx0LwnPV7MdbBDm38Tuwso=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.13 345/351] perf script python: Fix buffer size to report
 iregs in perf script
Date: Mon, 19 Jul 2021 16:54:51 +0200
Message-Id: <20210719144956.480895368@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719144944.537151528@linuxfoundation.org>
References: <20210719144944.537151528@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Nageswara R Sastry <rnsastry@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 stable@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Paul Clarke <pc@us.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>, Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

[ Upstream commit dea8cfcc33695f70f56023b416cf88ae44c8a45a ]

Commit 48a1f565261d2ab1 ("perf script python: Add more PMU fields to
event handler dict") added functionality to report fields like weight,
iregs, uregs etc via perf report.  That commit predefined buffer size to
512 bytes to print those fields.

But in PowerPC, since we added extended regs support in:

  068aeea3773a6f4c ("perf powerpc: Support exposing Performance Monitor Counter SPRs as part of extended regs")
  d735599a069f6936 ("powerpc/perf: Add extended regs support for power10 platform")

Now iregs can carry more bytes of data and this predefined buffer size
can result to data loss in perf script output.

This patch resolves this issue by making the buffer size dynamic, based
on the number of registers needed to print. It also changes the
regs_map() return type from int to void, as it is not being used by the
set_regs_in_dict(), its only caller.

Fixes: 068aeea3773a6f4c ("perf powerpc: Support exposing Performance Monitor Counter SPRs as part of extended regs")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Paul Clarke <pc@us.ibm.com>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lore.kernel.org/lkml/20210628062341.155839-1-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../util/scripting-engines/trace-event-python.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 3dfc543327af..18dbd9cddda8 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -687,7 +687,7 @@ static void set_sample_datasrc_in_dict(PyObject *dict,
 			_PyUnicode_FromString(decode));
 }
 
-static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
+static void regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 {
 	unsigned int i = 0, r;
 	int printed = 0;
@@ -695,7 +695,7 @@ static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 	bf[0] = 0;
 
 	if (!regs || !regs->regs)
-		return 0;
+		return;
 
 	for_each_set_bit(r, (unsigned long *) &mask, sizeof(mask) * 8) {
 		u64 val = regs->regs[i++];
@@ -704,8 +704,6 @@ static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 				     "%5s:0x%" PRIx64 " ",
 				     perf_reg_name(r), val);
 	}
-
-	return printed;
 }
 
 static void set_regs_in_dict(PyObject *dict,
@@ -713,7 +711,16 @@ static void set_regs_in_dict(PyObject *dict,
 			     struct evsel *evsel)
 {
 	struct perf_event_attr *attr = &evsel->core.attr;
-	char bf[512];
+
+	/*
+	 * Here value 28 is a constant size which can be used to print
+	 * one register value and its corresponds to:
+	 * 16 chars is to specify 64 bit register in hexadecimal.
+	 * 2 chars is for appending "0x" to the hexadecimal value and
+	 * 10 chars is for register name.
+	 */
+	int size = __sw_hweight64(attr->sample_regs_intr) * 28;
+	char bf[size];
 
 	regs_map(&sample->intr_regs, attr->sample_regs_intr, bf, sizeof(bf));
 
-- 
2.30.2




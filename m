Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E116A5FF008
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:16:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppNf5fnFz3drg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:16:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l6dGaFH7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l6dGaFH7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpntD1g47z3c7g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:53:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 119D361B4E;
	Fri, 14 Oct 2022 13:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D869C433D6;
	Fri, 14 Oct 2022 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755632;
	bh=i/WP++QS9HRWhtXLA4OGY2laZT3zT7On4/gx+Gv/TGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l6dGaFH7ORXNGrWn0BtoGkKihh1gO886vcoUS1NMhYPJ6ipVQC1rxNSVFeySSEdQg
	 Xsrw7n5TilWkFspW4z6KZii5BHfjIGPwFREchfCW5PAZfxjGJfcQkSu0cBJut7yEWE
	 Qak4ANTKn80rrvUbOthIzK7dCJSrdWZ9WGWAzka7qWIaq1sF1CyLMhLexZuh5t+0xv
	 cQvDaHSQGn/IFmX/197IDAR953XrsbtoevvA4tKnG1/V2AkPUuHAqvvMAGpfkgoGAT
	 GqoZ4NRoSIHVbJHL9RFwlVeWcq+vlO2COmFFQn8nnclZw5phLH6YstF1vne3Vb8uy8
	 +WlPLfh81EUrA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 5/7] powerpc/perf: Fix branch_filter support for multiple filters
Date: Fri, 14 Oct 2022 09:53:31 -0400
Message-Id: <20221014135334.2109814-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135334.2109814-1-sashal@kernel.org>
References: <20221014135334.2109814-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, nick.child@ibm.com, Kajol Jain <kjain@linux.ibm.com>, npiggin@gmail.com, Julia.Lawall@inria.fr, Madhavan Srinivasan <maddy@linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit b9c001276d4a756f98cc7dc4672eff5343949203 ]

For PERF_SAMPLE_BRANCH_STACK sample type, different branch_sample_type
ie branch filters are supported. The branch filters are requested via
event attribute "branch_sample_type". Multiple branch filters can be
passed in event attribute. eg:

  $ perf record -b -o- -B --branch-filter any,ind_call true

None of the Power PMUs support having multiple branch filters at
the same time. Branch filters for branch stack sampling is set via MMCRA
IFM bits [32:33]. But currently when requesting for multiple filter
types, the "perf record" command does not report any error.

eg:
  $ perf record -b -o- -B --branch-filter any,save_type true
  $ perf record -b -o- -B --branch-filter any,ind_call true

The "bhrb_filter_map" function in PMU driver code does the validity
check for supported branch filters. But this check is done for single
filter. Hence "perf record" will proceed here without reporting any
error.

Fix power_pmu_event_init() to return EOPNOTSUPP when multiple branch
filters are requested in the event attr.

After the fix:
  $ perf record --branch-filter any,ind_call -- ls
  Error:
  cycles: PMU Hardware doesn't support sampling/overflow-interrupts.
  Try 'perf stat'

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
[mpe: Tweak comment and change log wording]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220921145255.20972-1-atrajeev@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/perf/core-book3s.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 6e3e50614353..a68652b37683 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2038,6 +2038,23 @@ static int power_pmu_event_init(struct perf_event *event)
 	if (has_branch_stack(event)) {
 		u64 bhrb_filter = -1;
 
+		/*
+		 * Currently no PMU supports having multiple branch filters
+		 * at the same time. Branch filters are set via MMCRA IFM[32:33]
+		 * bits for Power8 and above. Return EOPNOTSUPP when multiple
+		 * branch filters are requested in the event attr.
+		 *
+		 * When opening event via perf_event_open(), branch_sample_type
+		 * gets adjusted in perf_copy_attr(). Kernel will automatically
+		 * adjust the branch_sample_type based on the event modifier
+		 * settings to include PERF_SAMPLE_BRANCH_PLM_ALL. Hence drop
+		 * the check for PERF_SAMPLE_BRANCH_PLM_ALL.
+		 */
+		if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PLM_ALL) > 1) {
+			local_irq_restore(irq_flags);
+			return -EOPNOTSUPP;
+		}
+
 		if (ppmu->bhrb_filter_map)
 			bhrb_filter = ppmu->bhrb_filter_map(
 					event->attr.branch_sample_type);
-- 
2.35.1


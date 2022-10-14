Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3C5FEFE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppFR5P3lz3fM0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:10:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bbkqphNG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bbkqphNG;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpnsj4VJQz3dqh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:53:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 52308CE25C4;
	Fri, 14 Oct 2022 13:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EBFC433D6;
	Fri, 14 Oct 2022 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755605;
	bh=jmWeH9/kj19LdXILReX0a8HnufVDtXizi3mStS9SDkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbkqphNGg997AZ6cVmf20jgtDw6V2u/LhnKgeXlXS09F2RlBANJqpBrzwJTfxJ4o1
	 Prp9gMHWuHYgO1SxFaA2nzOYwIeKQ95JD0uxNAKBCDqO9cmGtnxAZd/aEc5cGTDuf/
	 y1qyB9ZaUP8PfthXMTiMnDyEzn0NOjekChn3suZICg/NjPxcNNsiaOD5LXDA2nXDqR
	 YFYWw5SRGHXZbQZcsdg9BXQENsFD+2SvgR/HHBmyV3zrLy4ArppwIcsDeATLbHPam2
	 BBeR5JBZggqKo8m74LX5UPMAVyQh1siHMp+0QdZOoI/fU63XcXHb033XA5K74q1O7w
	 ucTfK2Ljpn4cw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 6/8] powerpc/perf: Fix branch_filter support for multiple filters
Date: Fri, 14 Oct 2022 09:52:59 -0400
Message-Id: <20221014135302.2109489-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135302.2109489-1-sashal@kernel.org>
References: <20221014135302.2109489-1-sashal@kernel.org>
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
index 1078784b74c9..62cbbc36fe96 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2102,6 +2102,23 @@ static int power_pmu_event_init(struct perf_event *event)
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


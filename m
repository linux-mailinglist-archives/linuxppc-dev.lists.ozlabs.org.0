Return-Path: <linuxppc-dev+bounces-2489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6349ABA66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 02:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY8YZ147tz2yFQ;
	Wed, 23 Oct 2024 11:09:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729642178;
	cv=none; b=JneUoVXRvFGpJuRhGU5ilJGHulHtWoJI7ZfMDCRYR1ZJHq35zr2P+DTXgeLdjFMM3WavBdT/gzLfSXO2LvXfes+JHl2dSeF25JwokOuDmEEzTzNsR0pgJl+GTpepa9bkuBWmbskBoAqAxADBQYMGnfMFG1oonVhshYchHSAOLg/Uu+UMOYezkVLASln/z7UPiSQ9CcW2jwok1NOrGuY3Zn4kZgktteolfxq+c/ys/ZQ2bdII7E4rIl5PLbroMWY21gaZoHok2xfvGSJF/rWqmei0P5af2bIqzGONkQuFlBEMoJHvlTnhpVhqLHPYywfsNP/jKvIPE1eUCOxAwbsN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729642178; c=relaxed/relaxed;
	bh=Hrh9iR1AfgqzOwavxU1qbfTiS2/c/nnElWEMaxwfxxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mf8m+ZQqAq3VxDDqGH6GPssu0S2nZTpgIbVL3RDn2IEE+lPi6g/dmkrAnjXVCpCJv78psLHkcLJSxVMUnpdKFvOkQRYvJyb+Np2JfZrCfCNUxMFHlZaFPtDYZRH52VICmk586vGDP9sv2NR/ApjQCI1F4Jc9ZWnKdlGL6BbwRpPmxAOql5Ozud9Wlgw9jKn5NxVFXchtOA0hI6QE3MwhwTPUySHq/ydsBCh+n9t0JMoJ1ctznCftg9tfoa22o5Qq3q4oUYtHZT+w8oPOMnLZAh1I9d2CRx67xD0mDUIFUYL84ZLQBQ21+rryPDBuSge7xBusjTxMYmYf3gbtJwNzDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d8NpyZs+; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d8NpyZs+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XY8YY0hfqz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 11:09:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43955A444AE;
	Wed, 23 Oct 2024 00:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3034C4CEE7;
	Wed, 23 Oct 2024 00:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729642172;
	bh=19tEuIYfqiZ31nw60wQoKj/BrMPUXOXCbGkABPMtDio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8NpyZs+nIvTORI8b9ezVmcZhx5k/19f3THU1Sz6tPdDk4bJpoc3q9iqoCQ+DczyZ
	 AuVWeHu8DrHMUK+x3jRTWXnXfXxj9L+7D0z7NC8UdLDs7/It8qwoLcFx4RHJ6cR4F1
	 s0Fl8VcOfNnfSTO58/4NWU6keFxoTjgES1UISVCQYkPZgckQhPa2uKs6Mu4WAzZrqY
	 w3VvD8Xubfjk3QZH0iZdFillQA+aFfgA53Sxs/s5QpDSR9hmsTXnSG1SZ4RmhhAxCc
	 bxDBQ5Lu5U47eKZw3oE8jvvZ65p92T0keU+oXZlHxAHzQ0tip9XComAdE/mm3LBl9P
	 weMgJOwI2r1zA==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Stephane Eranian <eranian@google.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 4/5] perf/powerpc: Count dropped samples in core-book3s PMU
Date: Tue, 22 Oct 2024 17:09:27 -0700
Message-ID: <20241023000928.957077-5-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
In-Reply-To: <20241023000928.957077-1-namhyung@kernel.org>
References: <20241023000928.957077-1-namhyung@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Due to the hardware limitation, sometimes it could sample kernel address
while attr.exclude_kernel is set.  In that case it silently drops the
sample.  Let's count that case in the new dropped_samples counter.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 arch/powerpc/perf/core-book3s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 42867469752d73cf..553e288b9f113836 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2287,8 +2287,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	 */
 	if (event->attr.exclude_kernel &&
 	    (event->attr.sample_type & PERF_SAMPLE_IP) &&
-	    is_kernel_addr(mfspr(SPRN_SIAR)))
+	    is_kernel_addr(mfspr(SPRN_SIAR))) {
+		atomic64_inc(&event->dropped_samples);
 		record = 0;
+	}
 
 	/*
 	 * Finally record data if requested.
-- 
2.47.0.105.g07ac214952-goog



Return-Path: <linuxppc-dev+bounces-1028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FC96CD0B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 05:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzkrV6FVgz2xQD;
	Thu,  5 Sep 2024 13:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725505834;
	cv=none; b=TYwDKLtdw4pefQ96Jm4dFJJwFARdVl2Y9J2h+dJDM3HVbIAaWnn7xNcf3A+GzuiFkluHONX/BnPaB1PQML7arHy01AWB3ucGLR6q7Pyri6EJhsfBbDssxAQc4+TrnIneKQABB7ioQJAlL2xSEo97N1x0jKMQcYuNtEbxjeMLeOh+B8ALzTqb78vpI/lpbxz2PgoT87Qc+0AqnfTfY9xVDEiB8u67Z1nxm9ZCzF58tMU8b2AkgO7oCKTpEYEghkUWI1hEj1zsNWt3huC9x8C2aGoRUgts+/C4zvc/UxsBDtEYV0vjel2hSrYfqO+lsl5GxKmYNqoQ+UmICUEzO2NM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725505834; c=relaxed/relaxed;
	bh=552SiPm0KeWovDFqVQK06TjNHMNa0SCIGdq1wiSc+RQ=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=JRMH9J20NHzC7mdogJDpfubxS+yC3tVSCAVoCy4jgLFpQnvCLq5IZD/g/YY815Lb/zwzqC3eAdoXeZ8CnZ9c6GUev2NlRlaoK70DIYYjIlUpjCPeYwCHY0pwgAPwLEbH8TKbkclLRwSmGschbY3kMp9SXvDBXXXZD4BrAvvdmVkrbKAE0VIduCcWLCAWPZIzH6Crf+KuhC+dn8aP2PeTolG+PNNyymJk8wLXwmJ4MpLPWtojqxK1JFJvBtK1iqzIprEeuncNKFu66XGptAN6SKuibwZXrl1IkPqkt1lbgOfK+feh7/tlEViRWWCKGn5UAAOsq48KhN/FM4uJ8MAuMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mD7dO11t; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mD7dO11t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzkrV3CZlz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 13:10:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC22CA43F6E;
	Thu,  5 Sep 2024 03:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A766C4CEC2;
	Thu,  5 Sep 2024 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725505830;
	bh=aziyQ829/wguwAKETpVg+pRPOujyMEAw4EHfDvYu2+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mD7dO11tKbOKYa8rLno4b/Crd5G/0t/zA0m4V1HbuuyqSnJjEHaj432FJyQzSl4Th
	 XlJvlSa/eHf7EWGOJ05u9teTfKfNVRjVKrSYlpRmMbDFRqW2LninIBueVH4liyHXNA
	 +afXGYrBbO/gIlL9QoN163JckmbxYZu9pIyNopNKDTFHxPMOqwwy63NkF2G6R+bPvZ
	 9yl5sM0AtaLm9hIGQQqQSblCri+P2KLA7GPiFxGs6123EpPo8c0wUGuC85PYsJlxtS
	 BLPU76BDrJhhVUakoOoJap2YCvl1Ttm1wYDrg9/A+ltybTgdWssj2Ug4lpXiNlOem6
	 4n+Yl1JbGTyXA==
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] perf/powerpc: Count dropped samples in core-book3s PMU
Date: Wed,  4 Sep 2024 20:10:26 -0700
Message-ID: <20240905031027.2567913-5-namhyung@kernel.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240905031027.2567913-1-namhyung@kernel.org>
References: <20240905031027.2567913-1-namhyung@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to the hardware limitation, sometimes it could sample kernel address
while attr.exclude_kernel is set.  In that case it silently drops the
sample.  Let's count that case in the new dropped_samples counter.

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
2.46.0.469.g59c65b2a67-goog



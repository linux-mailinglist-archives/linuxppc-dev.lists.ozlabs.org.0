Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4299590C5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 09:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3w3r4Vfcz3blT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 17:17:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=FvhgFurr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=w8VGKIBJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=FvhgFurr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=w8VGKIBJ;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3w376dCqz2xTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 17:16:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5689D320070D;
	Fri, 12 Aug 2022 03:16:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 12 Aug 2022 03:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660288606; x=1660375006; bh=06O2XresKPmnssoag2kD4noV3
	GFqGieqwEYgvHbR5nU=; b=FvhgFurruGnHWx/JvCJ60hlxXjiIvJy4WZkKj9L48
	fw7ReyvtWNOSYHjMZCNnUmxPl9KtMu40kwM1PsIUb7yNvgDQBirO6t3xN3TiswOP
	33nWXnjSIJL+3Uv7WgBa8XRYC7jQUaJm3CMMSUWdtKUPKBCxW9ME+MaIgMc5JvlW
	l76Uz99O0nR47zsxB+VMDMLFnQo8AyfyKcXyjgdmTvGtjhUgLEyr9JS+86nsf6YC
	+77sXd6ESGhMmCsTs4NySFSS+eupWRWLUXvk/jIonvcXvcuSL8qNaMPVnHCe0b+D
	bfJJSxA3wuBd1VtdAd7s3Vd3UNd5UTBP6/lOfYLGG+GsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660288606; x=1660375006; bh=06O2XresKPmnssoag2kD4noV3GFqGieqwEY
	gvHbR5nU=; b=w8VGKIBJLH9hFaHo52fbYeZaAFVn5LRiTq1AVGmmVX9/ZInQN8P
	UmrPmvupFkNCkoOG+o1W9phQ3m1+Yev8ki47mBTJ6sH2Ovw5sGlj/PwRAHNPVvHd
	VLCPu70Dd4mxIfqaEfLws+S8BAIrAHrYgFE80RkEa7mRuFwPL0AH73P58uRtOL7I
	QRAxM2eZybEoDM7iyPRx4aGCUlQeUJjRVje712yR5tDmptsdSAxBacv/ViWoihTl
	gIvoIIuE/eAlM7tlGvVg7ZE3IRnU7FPyrE3hjQzhWE04JuJ9idYtqtT4gEgWCctb
	DeQIHdPswBI859zcXWPmnnjHrFP+4Njnpzw==
X-ME-Sender: <xms:Xv71YixJCTtQ16RcZp2ex7t9GY2EW6CD-LemTYNbCcr4ZNQH6v5UVg>
    <xme:Xv71YuTLN190hTWaMhOr8A21s7GiRLnUKIUGj1qbfsH1m7eUdeFamgj7FyNqQ_ojC
    KIzPOOTK6DjeF_Vtg>
X-ME-Received: <xmr:Xv71YkUAgVF2CN5yiwztNG2kplCmibcq2A9tV0XKa2sHgPCCqOOWoTnV91kKd0W3L9xCnEOIdHQvW2lMtiDbmtG4IDIr5F0ZJKaVHm8Fl8pphw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
    fvvefufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
    vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvd
    egudetjefgveevvedutdeigeelueffvefhfeeuheeuffekhfffheegheejhfdtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrse
    hruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:Xv71YoiHqvQQjtgHeXo4QNGCwQXOihdtRw9QWfQlLdEYEW1IKXB8xg>
    <xmx:Xv71YkCpA4C31GUqOX5A9Og00sbDR_PkHLWDejq_18PqCA0oPIBMaw>
    <xmx:Xv71YpIshdMe2NLaFSOvxJ4BlU8-DOQRmSlhuFIHpHvm_p6GccVpqg>
    <xmx:Xv71YnPSm_8xWhU7zYk-2Nv4YE1LuiQWRZSaQAndyoiXUi3jkEotFA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 03:16:44 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Add missing PMU selftests to .gitignores
Date: Fri, 12 Aug 2022 17:16:32 +1000
Message-Id: <20220812071632.56095-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some recently added selftests don't have their binaries in .gitignores,
so add them.

I also alphabetically sorted sampling_tests/.gitignore while I was in
there.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 .../powerpc/pmu/event_code_tests/.gitignore   | 20 +++++++++++++++++++
 .../powerpc/pmu/sampling_tests/.gitignore     | 18 +++++++++++++----
 2 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/.gitignore

diff --git a/tools/testing/selftests/powerpc/pmu/event_code_tests/.gitignore b/tools/testing/selftests/powerpc/pmu/event_code_tests/.gitignore
new file mode 100644
index 000000000000..5710683da525
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/event_code_tests/.gitignore
@@ -0,0 +1,20 @@
+blacklisted_events_test
+event_alternatives_tests_p10
+event_alternatives_tests_p9
+generic_events_valid_test
+group_constraint_cache_test
+group_constraint_l2l3_sel_test
+group_constraint_mmcra_sample_test
+group_constraint_pmc56_test
+group_constraint_pmc_count_test
+group_constraint_radix_scope_qual_test
+group_constraint_repeat_test
+group_constraint_thresh_cmp_test
+group_constraint_thresh_ctl_test
+group_constraint_thresh_sel_test
+group_constraint_unit_test
+group_pmc56_exclude_constraints_test
+hw_cache_event_type_test
+invalid_event_code_test
+reserved_bits_mmcra_sample_elig_mode_test
+reserved_bits_mmcra_thresh_ctl_test
diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
index 0fce5a694684..f93b4c7c3a8a 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
@@ -1,11 +1,21 @@
-mmcr0_exceptionbits_test
+bhrb_filter_map_test
+bhrb_no_crash_wo_pmu_test
+intr_regs_no_crash_wo_pmu_test
 mmcr0_cc56run_test
-mmcr0_pmccext_test
-mmcr0_pmcjce_test
+mmcr0_exceptionbits_test
 mmcr0_fc56_pmc1ce_test
 mmcr0_fc56_pmc56_test
+mmcr0_pmccext_test
+mmcr0_pmcjce_test
 mmcr1_comb_test
-mmcr2_l2l3_test
+mmcr1_sel_unit_cache_test
 mmcr2_fcs_fch_test
+mmcr2_l2l3_test
 mmcr3_src_test
+mmcra_bhrb_any_test
+mmcra_bhrb_cond_test
+mmcra_bhrb_disable_no_branch_test
+mmcra_bhrb_disable_test
+mmcra_bhrb_ind_call_test
+mmcra_thresh_cmp_test
 mmcra_thresh_marked_sample_test
-- 
2.37.1


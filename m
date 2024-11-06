Return-Path: <linuxppc-dev+bounces-2915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965EA9BEC7C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 14:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk55r68fTz3bcV;
	Thu,  7 Nov 2024 00:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730898304;
	cv=none; b=cMC+quSq80MNwCgftBBPxS8pchQ2W9MlMCCwO4b+rG+0p9euyJEppszf997uOjvOeXN7ZB5YOZBNHAY/xaG0gv2N/cJK6sZm6Ys4e6MIC1I0EEyl+838DAJdKM2g/71t2YdMTYFE0JNqNcZ/blEqdIfnVv1IkDWcL+yVpv/eQT29OHW0K3iyqKgISoHlGVt4vnSIRq3iqBnvGpWgR2gVyWeZlwZ8ABUnCdIsxSS4ocBvvxk0ONOEGFzOpnkM7LhbtxgfeUSYcMiQQeeM/2wHArFCK+ZlcXpNOM58GjmZ7ZMNiI6Wjm3enkSMTOYtppBn+MtKFFASSInzJAOw4oTEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730898304; c=relaxed/relaxed;
	bh=qW1N95F/0dD6RAC3La/bvo9UN0+AgyqUeekkAk1k6sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiUAqQjdfFA/LBOBdZ8ikYniY7bYMRxb5gUotrOHqYcxIMM7GBG5eU3jJWeeJpPgSTo3ZEEqdhd2CQ0oWXj0vw7xyvWteJxONxZerArPqBF+ITLSows5758srLM4ycXxGOoT2OZHrNZuCpJprKnQ9H7LfYfsIcx16NSTnC6cUOenw7ltd+T9qHo9kQXGtlvYgxsGCxzhodEUhmFDrNIk2T1LmRQ8rQ8R747L/iO5EXPlIEFl0dPW2cDdCk8B1a8JIRh24BTCP8C6W4ggAlBOaUIs/d26BOF3UvkyeWPcwIFXbsBfsSOFwv7TFIl5U8kp06F+y81qqS5aprLvPmr7Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SQL7HMtK; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SQL7HMtK;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk55q2HYkz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 00:05:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730898300;
	bh=qW1N95F/0dD6RAC3La/bvo9UN0+AgyqUeekkAk1k6sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQL7HMtKB9Hzn2YPrMPHbq0vPs6NsVSht0OT7tdD9x+9gug0bqDOx2Userp1YqU0A
	 LaITNIBj5YA3tobZeSvf/fXVFfKCSlzKhf6AsEucgkuv4yGEIXZC++LFbPIKEhkOWo
	 Yv9D/o4f1Eb1zvzlIdtljGnWAuhU/g85s4dx31LInHY0NcYKNIX+QbqDXEStRSIvSF
	 JyT/H1dDoWLoCt20RshW3skimRp5SCQ0cKNecMoUfrUcynaMxT1T7ykOPnSitDMfhC
	 5st1y+65BuGhidC/ebn1oASoEX6uQwIoz8pY6xNmUmAZwCs/1Iytw7vU68+m0oBlZZ
	 T40dKXJADn3Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xk55m5vnLz4xRj;
	Thu,  7 Nov 2024 00:05:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kselftest@vger.kernel.org>
Subject: [PATCH 4/5] selftests/powerpc: Return errors from all tests
Date: Thu,  7 Nov 2024 00:04:52 +1100
Message-ID: <20241106130453.1741013-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106130453.1741013-1-mpe@ellerman.id.au>
References: <20241106130453.1741013-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fix some tests which weren't returning an error code from main.

Although these tests only ever return success, they can still fail if
they time out and the harness kills them. If that happens they still
return success to the shell, which is incorrect and confuses the higher
level error reporting.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/signal/sigfuz.c                | 2 +-
 .../testing/selftests/powerpc/tm/tm-signal-context-force-tm.c  | 2 +-
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c    | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/signal/sigfuz.c b/tools/testing/selftests/powerpc/signal/sigfuz.c
index 08f9afe3b95c..c101b1391696 100644
--- a/tools/testing/selftests/powerpc/signal/sigfuz.c
+++ b/tools/testing/selftests/powerpc/signal/sigfuz.c
@@ -321,5 +321,5 @@ int main(int argc, char **argv)
 	if (!args)
 		args = ARG_COMPLETE;
 
-	test_harness(signal_fuzzer, "signal_fuzzer");
+	return test_harness(signal_fuzzer, "signal_fuzzer");
 }
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
index 421cb082f6be..0a4bc479ae39 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
@@ -176,5 +176,5 @@ int tm_signal_context_force_tm(void)
 
 int main(int argc, char **argv)
 {
-	test_harness(tm_signal_context_force_tm, "tm_signal_context_force_tm");
+	return test_harness(tm_signal_context_force_tm, "tm_signal_context_force_tm");
 }
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
index 06b801906f27..968864b052ec 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
@@ -46,6 +46,5 @@ int tm_signal_sigreturn_nt(void)
 
 int main(int argc, char **argv)
 {
-	test_harness(tm_signal_sigreturn_nt, "tm_signal_sigreturn_nt");
+	return test_harness(tm_signal_sigreturn_nt, "tm_signal_sigreturn_nt");
 }
-
-- 
2.47.0



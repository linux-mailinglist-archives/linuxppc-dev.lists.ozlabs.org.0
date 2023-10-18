Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14C7CE14B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 17:35:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6xRo07+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9Zfw4TBKz3cl9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 02:35:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6xRo07+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9Zf12MLLz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 02:34:31 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b497c8575aso5053610b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697643269; x=1698248069; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIFFgnXlmL9OSdV9BYoDFgvVe1Udxn1Wq4dk/jcDDIA=;
        b=m6xRo07+MfkyDJ2ui2S60uk5SngfhZ+b8Gc0LxaSW1J2q6IxHXZ6lZdEsUr7s1KQZO
         qzwoFep5ovk4gdCrn0h4XJgMnhIm7Wssc3+Gnq9ta3TSu3QXBqD+n4OGDmhI7Jgz6Tq2
         k/kfdIpVOm5fLsaK7qAapfv8XGG5+XPVUIzr2Xug8B8Gx9/B3Jk6NoE+Qr5MqspODW4u
         UwlAC5DKbpqnnAZ4LCXsNVHCsLjkLPUOm2YgX+oYA28FmicAGC1/JAvGys/hOQjplrZW
         qFikeCY4kZcRASsdU6PozxRfm2qDWWDzgTfIGcwHx5ax59cFnckBdaBTe5GFCr+OxCW0
         szRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697643269; x=1698248069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIFFgnXlmL9OSdV9BYoDFgvVe1Udxn1Wq4dk/jcDDIA=;
        b=tZLqOxjooPTHhsZkaxmz8cFIAtt8WJCZ+1/t4awsWb94fv3MpoAH9RqFgKA9Xr8x6M
         X8UPToZNF4hWfeZEZUcllYjB+6EnlHhBI8As3m59pNnLaISgPzmdoGLpSDLs6zOdaPQu
         xA0ts4oRRJSTeOSEZV7atH7wyzMaxnBvLQSDsn85w1CZcU8UjMn+JHD6gpbJXwrZYITL
         05TKkoB/EZjB/tVch/T7gfsBmSh74wF/2dHHD9OyccTvOxSocnGEx5ZWu4LSVXSWKh1J
         VfcgDzXW7BI8zLMlZTy+Frw+XlYwqzi1vBxh+hgF9ahD6XKCh6IZ+OgoQ7kVFxRcB29i
         PyBg==
X-Gm-Message-State: AOJu0YxAiUpbXQG1XSSWdb+cyqnyr9uZN2OwktrlVVbfyLFDJwliUSNn
	e8xHvRWKkVUDevH+Mh5eJBNylKtusBA=
X-Google-Smtp-Source: AGHT+IHDRklaHGDCq78zTSo/+7qbNfQhBS4vLfm+Ds40Q4B9Cpe6vyGuxwVjlLja+oeSef6hzZrkdQ==
X-Received: by 2002:a05:6a00:15cf:b0:6be:319:446b with SMTP id o15-20020a056a0015cf00b006be0319446bmr6897071pfu.21.1697643268737;
        Wed, 18 Oct 2023 08:34:28 -0700 (PDT)
Received: from wheely.local0.net (61-68-209-245.tpgi.com.au. [61.68.209.245])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7982a000000b006b725b2158bsm3478919pfl.41.2023.10.18.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:34:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/perf: Fix disabling BHRB and instruction sampling
Date: Thu, 19 Oct 2023 01:34:23 +1000
Message-ID: <20231018153423.298373-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the PMU is disabled, MMCRA is not updated to disable BHRB and
instruction sampling. This can lead to those features remaining enabled,
which can slow down a real or emulated CPU.

Fixes: 1cade527f6e9 ("powerpc/perf: BHRB control to disable BHRB logic when not used")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/perf/core-book3s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 8c1f7def596e..10b946e9c6e7 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1371,8 +1371,7 @@ static void power_pmu_disable(struct pmu *pmu)
 		/*
 		 * Disable instruction sampling if it was enabled
 		 */
-		if (cpuhw->mmcr.mmcra & MMCRA_SAMPLE_ENABLE)
-			val &= ~MMCRA_SAMPLE_ENABLE;
+		val &= ~MMCRA_SAMPLE_ENABLE;
 
 		/* Disable BHRB via mmcra (BHRBRD) for p10 */
 		if (ppmu->flags & PPMU_ARCH_31)
@@ -1383,7 +1382,7 @@ static void power_pmu_disable(struct pmu *pmu)
 		 * instruction sampling or BHRB.
 		 */
 		if (val != mmcra) {
-			mtspr(SPRN_MMCRA, mmcra);
+			mtspr(SPRN_MMCRA, val);
 			mb();
 			isync();
 		}
-- 
2.42.0


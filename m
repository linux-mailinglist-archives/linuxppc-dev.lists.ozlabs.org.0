Return-Path: <linuxppc-dev+bounces-4507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3D09FDBE9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 19:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLBHw719cz2xJ8;
	Sun, 29 Dec 2024 05:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735411804;
	cv=none; b=KiGuT0iXMA3IlS6Lcjsq16So1bLbuZhdppeWe79Iw7bfItBHHLAMaYU+wjUdv8Sd29hqjhW73CMD40Dx5LuaTRdZFXwL2M/9olQmQ7zKkfvHVq5PBeXEQpAvHmltrFhC05+ACGSz5eIzXURmuplmz36TUzB515rHGyxB6oxKm/lKus7GkHDZuE+wB00VD8q+UxNFu+BYuA7F7GT+H+WlPsEm39SZ0kkbebU4CaQ6HLapPjrm1ppp42ejRIDcgelW7DyxWJwin3PxVzC77zRQylCWc9xSjL1Fiufwk/KPvysjiLNWqPksRdsdUFYv17SphVWYAnGKH58EqMxRTW7eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735411804; c=relaxed/relaxed;
	bh=a3EcwrJaj13JFWV94S06ao9wKNfTeeg6w6xP84y4x0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCkqP0fx/jNeRLLWLq36XkqpmNFpJ9YBAwJsicgdbBBOMvKSO8I+qNscA3TsvEnHnvBux19Qcfd6+Y12tUT4gj8Fa0iS7XnIqUWumNGlVR/o9GKygePmKCCMpHL4P7/jasf0HKUnrFCzZJACWwNk4hYQ9nN2+yyyRzbG4KsODeAHg5oXXTojFZIaW78XgbTJUeXbD2BkXkD5A88Po8OIjBGhM+/214P4CDGxJ35WacYiLPaNJSwlWwxX1cUW5r02AqLEt2b6MxwTnohr0/XCWYfXDhz6/AlAeR/lFj8mjytspzBt5iJY3W01TQehmLdNsKOn4OBJBXldrLbAfdy89A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f+mZXf3b; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f+mZXf3b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLBHv646zz2yhM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 05:50:03 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so7767350276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 10:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411800; x=1736016600; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3EcwrJaj13JFWV94S06ao9wKNfTeeg6w6xP84y4x0M=;
        b=f+mZXf3btiTO4nX++rThLMtCyHxZ5Lr5jg4+NBvRlgknXYZ7Ruw546HP+K32LZ2V3O
         2ZdcRGPnaoTQCishJm6dnpvs+K7K121jMOpXzhdBGQz8ZgQx2/jqQsEeTK8aEL9AUrnZ
         l4youH/Rh72TMXhE/lepKoZOFfZTjXrfGsTHIofKI31pWm/86rAiZp3z3sc/4WMKhJ6o
         Hn780nDTZvV/5bZn1uJJn9TREy929DZFcwL4/cp+3z4IeK7HbV3UcG4zdFZEE1bitYnW
         O6ROM8TnyrylWDwVmwW0792HwBinmFUrb3hiuQ1qR2I6Z+XDHDLvams9/2hg2Q9rqMF9
         uWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411800; x=1736016600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3EcwrJaj13JFWV94S06ao9wKNfTeeg6w6xP84y4x0M=;
        b=YjKGSwlEftlUJVz627N4/oV7qtSTKGaiPC6GgXKjL71xCoiG4sh0dmbLppI9i1ED3Q
         YJ9lcv1+zNM+ecopFystT4/XlAJIiA5Ws1eEzw++L41qE5wfnfH4jr3cOG2mTT0GqtdJ
         1Jz4WKbXZwVmuMxvmlvK5OhtQqXbEnd4dhGswuhUCY4qtuMh815E3o/4R/6Mk70f9PBm
         zf1tgGQ/5fany05SJs7jlnI3zXM46t0cJlTrFSYJ4QCfpgvAx60tQ+iUoG9T5CQzUraD
         u3+B8UKiXNHgbV7SFNY0a4g8vSo4ebb6OeFuQYyaWIlE3mEme0sDPDc1m+y/pA85AZtV
         6JsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC0By97iapA7Q0ADA8+/f+lsdsL1pZnM8Gw4MRhcf6LQdN/jOvdX7mKY/aiEJEN84C4V09/PxvV1uWafs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcIkN38zhzLftKe+r/HTqLJPMngtIHrPf9lsD9pytiUBi25yVd
	Dmf2VCXpyRTqtSyQx75PJk5u5+s2ELeHn+029ql20eC0C7UVSls2
X-Gm-Gg: ASbGncvZu2ZSEUGyt7FhVIVcO8EAOsfoQqMMgZzmYniRBAtdHz8CG41XLRPFUT4biJF
	nJzUa/aSMmsa37anZGVYlNq5UKODaMgQEZI7i3LoD6yyv0UEujXqcNmFj5w0LRmbL2Oqb2HQtV3
	uatDJdxjbdQJ+iF8RPkm++B9MeMCjU7ObVpy0zgk07BJ7B9gSh1aPDER0DHRrBXvLgjRkULWYuS
	qm//m/STpo6EqqcVo0YP6mDtKa2Ayg0b3atMP3rc9K+ehWD5L2IS0RDxHgBGi3oxOPxbm/pjGag
	arjqGuNdG5KSIuhy
X-Google-Smtp-Source: AGHT+IHYxhV9z9c0TqaYoIc8tNJTOYJG9vJKS/fH54wKJcOX0hcp4pjTSDHzZiDSWaq/zIaFUgVQ0g==
X-Received: by 2002:a05:690c:f0f:b0:6ef:698a:1f02 with SMTP id 00721157ae682-6f3f8219d18mr230627707b3.32.1735411800391;
        Sat, 28 Dec 2024 10:50:00 -0800 (PST)
Received: from localhost (c-24-129-28-254.hsd1.fl.comcast.net. [24.129.28.254])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e745648asm47410067b3.52.2024.12.28.10.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:50:00 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 04/14] powerpc/xmon: simplify xmon_batch_next_cpu()
Date: Sat, 28 Dec 2024 10:49:36 -0800
Message-ID: <20241228184949.31582-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228184949.31582-1-yury.norov@gmail.com>
References: <20241228184949.31582-1-yury.norov@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The function opencodes for_each_cpu_wrap() macro. As a loop termination
condition it uses cpumask_empty(), which is O(N), and it makes the whole
algorithm O(N^2). Switching to for_each_cpu_wrap() simplifies the logic,
and makes the algorithm linear.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f4e841a36458..d7809f15dc68 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1271,11 +1271,7 @@ static int xmon_batch_next_cpu(void)
 {
 	unsigned long cpu;
 
-	while (!cpumask_empty(&xmon_batch_cpus)) {
-		cpu = cpumask_next_wrap(smp_processor_id(), &xmon_batch_cpus,
-					xmon_batch_start_cpu, true);
-		if (cpu >= nr_cpu_ids)
-			break;
+	for_each_cpu_wrap(cpu, &xmon_batch_cpus, xmon_batch_start_cpu) {
 		if (xmon_batch_start_cpu == -1)
 			xmon_batch_start_cpu = cpu;
 		if (xmon_switch_cpu(cpu))
-- 
2.43.0



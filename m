Return-Path: <linuxppc-dev+bounces-10662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FEB1B675
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2j6Pr6z3bmS;
	Wed,  6 Aug 2025 00:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404013;
	cv=none; b=d8TgrtmoqJT1p08jKjzmY1cwuJGn9XKRsS7tUbU87fp4O/PC7DhyZ9DTOly1E+4DmUSCbxbxmKdwfGjwrVgPzPsQ8/XOzDypYkmLbYK7Rw3QyJvsK4FFC3Lu+YzK9Sg+uSpCYikfaLh+zl/KCCvV/VD8jLyftOup7CFh61ss5aM4DnyqdYgOEpHCudlMhMFHm55jVqNXBzKJhajUfB3xZuJ6S1iE1Nv9AszY4J4e/qYeWKho6RJph9ouTrb3LokN1W31upc6KErtHyKuX+yy2gu80QgtjeIVq9bMpj6HRIWC4BteAkQPiZs6u/PTkzpItKOfk9s+GsWiILrNXYSBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404013; c=relaxed/relaxed;
	bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBm7l3X4ojoKMoz8AN1zBLA8OM8Ozw3xF/044H4UWDRIq8/bPYIdipYAv82nMz/GsRSaqqDceVrjSPv+0l5vgX612hjz0xR3UO+qtfCfuPm9iGgrpbNyyDofiFy0/rH4nulqniE8n11a7+vT/C2WV8DXOqD71xDdwcbr/57YW0Db8L5XnPiezXhHTtgEFwC88k27wjrOwEQtLhCSqLoaENpdUs5q43DJzHtgnEfVZFXkzbPTUZH3y9JwctTOJDyzGBu9+eUj5NelVaWPgfTDkx9kiFtoXNOatYQOMqwhUYp1TlOO2WOwmiH2ZkLA+0a0/vQTSIU4vnrItK5z7Pzodg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H44nFR8v; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H44nFR8v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2h6j7Fz3brv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:52 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b88369530so6962616e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404010; x=1755008810; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=H44nFR8vub8nb8UbgKD2EOAOz7xQSPRBx6qzS5YN+K1VGUfFT9E95ZKOHbC1dZfWW1
         GRS9es/5NGfQcFj9Kn/g+HJP1y5R4WgRwbJCTjowkg/ZnQOnRm0g7olAhF2rGgwa38Bq
         HGTdSJ5vypC4BiXwOLNpKaN/7dEMm07g1V3qat++d1Br+ezaxiPU+Hv4c5BGw+N42wIt
         CaDqA424Am1TeexHykXmyUrvuR/w+GzQxshYwUMj7o0Cc6anXxxeb11JL1b3HPUSy/LZ
         APZ8h8vmbu/Bxioj0ILmPhUro0o8dHvNXoBz2N7bmCSEfr2Vjhigxpm6jMkq3rC4ekqg
         61tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404010; x=1755008810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=WB3qcrIqjiQcg10u1ymwFSwagKfp7oR8C/jyBdqhJUJC2hbofVTGdmTPtenj5jKXch
         FPJWqxSIH2UQdnLHcG9rz4CrBiYmK8PlQQX8RBmsDcM6XFVYflZRJrRlP6piWxjWEqdK
         HwxlYWIeY0mbXDaTTycQP8Edlpq24pIvnngSyS4G0OH+fecCUZnAxLrdB2X0L5JsVE4F
         QCQGaUKNc1iMr2+SeYL7W+1R/uBeL1asxpVuLZsibi2/SOHw996jkJugWAexcMgCyA4Q
         U0uxfycKXA2s5kc4eZzhVbEp5kygYH19z8zR+RThl7GBW5/mO5JHOkXxaNmDnlxR3Qqh
         62Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWIKakl4IP0hBg887Q6MMTOdiKNz1dwFyiXSHwxu/uVKBkUzsGHBnGH0NUCNabG68+i8uh3XNVjxu3TTYc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFrnlUJYtaO6OKlffygn21n6C9FcC6xkDsSxsjsKGbi/5U9mKE
	z8KmLEYaIW/cbz150q/19v6mbDaTVeGQ5z9db+dCp1h6R5QQIq3A2w49
X-Gm-Gg: ASbGnctK/1L1tGVlhKBnzcMCpr07zee/Iqp+nAyQpx0bLgRUXynPA2Znt/20V/VlwJQ
	Y/cYkdVwmZgnTj1JdJ2f0tx9PtkuOFBeWIq9DQpBrJc8t+IBHcp8UoaazJI590Qb+ncLOajUlSs
	fE8xUSxlowFNIWrG+AFgIG6UXFQV22PP4O7JMdjphflP5eOOAszCxvudUuYPcCqM4qcfkkNAUcy
	Y1V5f/MJ8dbnXZLBUNfkefceaM11/tCMaXtNwpn+re3P5ZAwT0aaK751PMKoRCJN8CACrMCo7mn
	HAulj0td2Vs4zbO+ucyGgFP77a/qESUUg4lEpOuRM/MjYYTHzcnl4C+MkvVppeedN2ihfnrZvKb
	IewWFzZgdG+6Nach2KTyhi+N648H3IaPlHqzBoraNQ5LEgYg0ofWwjc6ppkOqNL5U+nKCRw==
X-Google-Smtp-Source: AGHT+IEuo6xaqIABZcTJ/AY4HFbxdZ3CAT0b3T807lmpaRovzDFMVVkpiUz/KiBR8yrsIvUCLLc9/A==
X-Received: by 2002:a05:6512:3e1d:b0:558:f694:a65e with SMTP id 2adb3069b0e04-55b97b41812mr3194986e87.34.1754404009682;
        Tue, 05 Aug 2025 07:26:49 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:49 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v4 9/9] kasan/riscv: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:22 +0500
Message-Id: <20250805142622.560992-10-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since riscv doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/riscv/mm/kasan_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 41c635d6aca..ba2709b1eec 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -530,6 +530,7 @@ void __init kasan_init(void)
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
-- 
2.34.1



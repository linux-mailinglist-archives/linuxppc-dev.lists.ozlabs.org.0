Return-Path: <linuxppc-dev+bounces-10660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCC5B1B670
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:27:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2d0r2yz3bpM;
	Wed,  6 Aug 2025 00:26:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404009;
	cv=none; b=f1n4MlA70u2usqg1lhgRGcEG3BiHPpR3UFK3qHPSJlBLvZZO6yhGvYPmG/pFnITQgvkCBImYED1bUKrN6cyan7c7Jq4qi97nLNZ3Y/UaKp9lCC7s09s30VHj/sFPxlrqCaY5luhlRjzck5v7jfd3VOfxjTJLItQwsRDPQbsLF5vkkdrFHbVCM6L0aT4Q20cVCUYXZCnNmvG/LK1wCGSjgu/P4qwJLLdk3khN8JeBLSdccPvF/TenuxEAqy/woBj0iBDnFl0o7l1PV6LUbwZDQKyoHATVNyYB1KD/uCwESNHLISctyEswELjXb7G90xxAfxl2o9/ne2FK5ZnBVHaqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404009; c=relaxed/relaxed;
	bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUsHONlEb3+lilP05nzxwyQfYiVpqD/yvAFZl6i+ofnLGXp8TjpepRUBGJM/A8xFGVZD3YXx8uqg6zFITQSiM3W5ueIp07Dd8+p1ltrNHSz4gHGnPVlAygnkcJkXolzuZ/FZBQ/Kg2h25u/O9Tx7uZ05pvO1wWnlNwf2uRze2c2c+EWYPDHZcnbtdyXdBWzFE6OATn/CCJOiele6+1hRaSQvV/Q3N3MHIEAfP8r0WjEHxJLu5eJFX1mhRJ/yJ7Dt82vqh1aiiuA0/h298M2ScDO4MnYpAB2Z7amHe/8DEXNOogRKcJnM2Imhx+K1ahy9peXPzbJ74URC8XciN1oVUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qq2rdwyF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qq2rdwyF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2c244pz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:48 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55b9a3e69d3so4045045e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404005; x=1755008805; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=Qq2rdwyFoZXcQMExAlmOPE59LSUB9xVkRFIsoyLVVD2RHbOBwYykNpgesn79bNNXlm
         79D0UPH//NLM+MSRc4ZYuVT78+t6ZzjbYSSGWKGCOzHLMVYo1w0dEJAQmDJK0XSR5ESr
         Nnqxk8h0cFDM7pl9BJgbmwx+2igcVhGgD4FXPj2GbT04oNzJDnnqjYv3kDdsGSdUW3ac
         PioVZU6kkI8jjYw0W30qbOmYn9wIoiieKCJzqDQJ77rldiM93DhSdMUIfZLNmndVNm3i
         PzQ6EMzoGIAXufB2M3x4oKbnhC5Pz0CaD8em4IP0kiWP+oh4mF4C8JxqpBL0ZFgfjmsO
         K6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404005; x=1755008805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=jXxMFhFcDoIClEjfxf6V+aK6F2/Wb4V1Jvi+z07v9Y7YCAYPUc/yMpXQ7os/+KFm65
         stgPoxDrBqg+Nq5njUJNz8BSHhNqdsoyWv/C7Ffo00kkL4aq58x+LHzNmCTcqhnHwgfa
         TV0h6AKoVYJOdzO5up2AKx4gtvCEfbhIps+EZFkGeT11geg1XkeScXO6R0I0uzMkv0se
         4JCVE59OajXzZl5Ec+55PR1J2S5GfDcJeIiRJwKwKBpt/RoD46xoKytrQ8yCkHPrKueE
         n40jASPogsW2f0SSM7g9c9+YPIAiKddJrfVYxkG37jQXJSL/Znv3YZvifWr6NoDF71Le
         LzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwCNxDzalHmZIQxdeWK81eurPRI+f7QDMwvjzof7nQGvmBxOfYpTL+CdyJb8ASGq78qM716zrkDw6383A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZVT55UvxTG3rj27AKUFlLkbtyYeT+vfqtFm8QON6nONmu38h2
	r6oEuKNRvElKxIauMbmkxb7OcWv+mNpzBlJDw/VB4lQrYIVdAYgTupNf
X-Gm-Gg: ASbGnctTe2ie8j1pkY1mAu0nTeh60s7oMeHCN6vUmzS7KPiDZJRIt5YuvDbFYOAb8V5
	eO5/IMQZtc2usYfQauqbMMge0/eQZExrDX+T4DQozZA/cUZjgFu3BfflIKa84UohYa2iKx0x9ot
	oDTKNDT5EJxXPIuCUVArcT557UoJpg0zL3irFrq++bUejnX8jNDd5XZsmk4aZ0a66iEWJzao6DO
	Xnd0udKLCQxWewaIQFjOJmorKbwzha0kS6jVMGn5Lpuh/h5klHlBtgVmmwIU2rfbhjc8HRB2INO
	aKgUR7IXMrMip2YHUGihVDlyMukgHeP3VmPpehrnj9S4J8xdSZ2VuvNe28ebg2rlY2nEYxJzk53
	Tah1UavIWeuTWPjP+9CitKBSHpcJMx+QUYm5CIbiP0VlkCijUCR/Z8yGfIgHhP1dwfpwfzpKYxp
	Yi0NV5
X-Google-Smtp-Source: AGHT+IEfdK6xUGSau1shbIGz1OserWC83V4+ELanbWHlOwkRpBjVR9Bm+3vZR0IX6iJXBqrfn1b6mA==
X-Received: by 2002:a05:6512:3c97:b0:55b:8277:22a2 with SMTP id 2adb3069b0e04-55b97ac64ccmr3140519e87.21.1754404005154;
        Tue, 05 Aug 2025 07:26:45 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:44 -0700 (PDT)
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
Subject: [PATCH v4 7/9] kasan/x86: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:20 +0500
Message-Id: <20250805142622.560992-8-snovitoll@gmail.com>
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
and prints the banner. Since x86 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/x86/mm/kasan_init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1



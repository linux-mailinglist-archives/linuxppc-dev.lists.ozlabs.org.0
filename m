Return-Path: <linuxppc-dev+bounces-10301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B1B08F59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:29:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZz86KcWz3bsy;
	Fri, 18 Jul 2025 00:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762500;
	cv=none; b=bKM9sJ1zWYjSSoF+6J7L4mwxoWR6yXYVUx8//8BAZEQgv8WHY+5FwE0zJthHJPRs4hFPI6BRbR/jUAMpTfpACA/I4EROL+OWWOe9mMx7293S1e/p2lOQHK7f+ZrCECFN/x3Ay+J11gHZBLIBb2sxPWawR8qrZLMgIbLdcEwx7UGMST1jzgmsjVuiszl6dG9lkpN0kF2I+fKP6RAVKETKMpxNVm+SEuOIQc2vbWxZ5iLDwpk/8VwtOvOWpLSElVYOvmh/gIMwwzqLl/wClXI7BmsDrFEx42rHaQS7C8ITLalwDsc3rAMTLhIC/IR9u4uk3WSdaIMpCKZViuz6WdDOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762500; c=relaxed/relaxed;
	bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BEwiTQFWq799JtwdAqM+MKkC7XCQgJBLHGawy/gJ+r5os3AG61wG/BbR1T5wqk9iFe7VgNJlb3ylmwVwN6t7Q94yveNP7BFNdkHT4KXl+KND35sMTeuN0/yTNeU2jtIX24uOAdSx6SyoH5L7AyHZUDmI07OEO6yJIXzHHaZudlpVu1a4Ljoup49eqJdbwntkWylSXSLuFRirwSx1eM0EN7phevvBg17fDC1oP0znWvah0MjhLxsWJJhb2mG6c1TdOWBENtI1ge91Npiv1iqkVwKTFs9/7dxjvWH0WC4LMERKSkAvQADwm6y3crPaVi8zQxRQv24QdiVCn0r5Fm9yWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KqUfkGzR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KqUfkGzR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZz763sMz3bvf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:19 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553e5df44f8so902330e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762497; x=1753367297; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=KqUfkGzR8Nk6RvesQPspA4JGnyz8zBOBGaG4TZFOQocOVk6WjkFPhe9bKW8c50Clm2
         qXqmFw3+Ej6c7Qc5Y7iSVAI55E/FtSvtW3Sp29dFr+9ZBpcPlBaxVvY6EgqiRrgfoZ9P
         l5xnEpwOR/AjJGoiB7VKJwsf3V9zDZfV0L52xxmUr9kZsE71XKhTvyAWUkA/M3gpW7BJ
         xG8uKMektaudyffewUbCk9uJ4KkenT1dMj8ZhopPf4UZ1NVoHww/QpeDj4bNk6wLDUyY
         cjmBqXtuppFNR2q/y5j6eUTO5OO+csQOhIHf9uJ/dLQ2qDzwEReLS+2JDFDC0c7JD7qK
         /1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762497; x=1753367297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=BzW/KoeUpEg90UqWPridckOlm+B94Q5SQNsBJhPOf98z5WphYuUnMrqNbr/SL2+OpN
         zcNDOrmFr3aVpV0YV531Q8fnnR9c+qYsA1RthrC7cE3oFPWtkFDdeBQ1WLlE0w/ZqksA
         Jw5ZT9fkLnNzLqgjTbSbP9Z7y0vMya2FximrJmzqFF1/cvSvp55MCo8ocZEhbuj7wCYw
         UH9suRktLlWQTsrsogwoVIiBd26kNo0HrOxyEONCJyo6YbyECwKD9wpJaXKw/jMp4Z60
         PYJnjowm4yy8ydfhnMeIM5rDtppeWRM+bGDGG9n6rZw/oVVd8YCGw46GnIUGQOHgxIO3
         KmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Uwtolj+4cy3iIaRCna4Q98xleRjey/U67I/K7qOaQ6AuFataAVX5PcldaWHC0izISFdbQYwhd9h3S5s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyAb5Rcp3gDoGqGV+i+EIDSPFvTOpa5RUDUguz9ksM2OQXrXQ/G
	ic50BzKGuYAueiZIOBAfFs0QD9ty/0ZWKqNORboGHedoUthsIVMdN3Ud
X-Gm-Gg: ASbGncvHL9gE7mFI5nad3u2UzZ3U5JMBUHdqtdcwTH8qWgOdlEwUxHxyg0ENBA0Yw1W
	8+8R8BteBrJQq1whEHvFAozLQ/upVNXISFlzEG/1dauQMnGW1CG+jCD9k/FYO4q92qWYCKlfvDI
	G30eyHHvGtXT1XFEfRvMhBYSPs7plIP6sgllOghzWOpY0xhbGyQ87rqN/S0UdLS1enBqInZjpg7
	gTSuNeuSNcdAaAabZZX3b3XyvE2YbFsqJJTD8pUUdbPngzsgGVllJFXxPk0RCinAm4xtLFPLU5V
	6vmmbwhc9FzbM6nKxQi61b6y0MVR6t+IVC3XqWiYgSt3cTVg95gnX6Cp0Bj1rmIvbkKY5lJmYfx
	6w8ge8hoIA65S3JIkC8dJ7nTlIWmK5MSlNnr9H7rdUgspR8a2jImEmzj+LKK3t7TFmm+P
X-Google-Smtp-Source: AGHT+IEO/8eHWJm582VzmdIOAIhCMVFXDa+uycN9FWVanpBus9xWQw/+gRsCzypPbNm9nuGJ8ZjzCw==
X-Received: by 2002:a05:6512:33ca:b0:553:37e7:867c with SMTP id 2adb3069b0e04-55a23fb26f9mr2259542e87.50.1752762496407;
        Thu, 17 Jul 2025 07:28:16 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:15 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
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
Subject: [PATCH v3 11/12] kasan/riscv: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:31 +0500
Message-Id: <20250717142732.292822-12-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
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



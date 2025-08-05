Return-Path: <linuxppc-dev+bounces-10661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E1B1B673
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2h0cpXz3bqM;
	Wed,  6 Aug 2025 00:26:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404012;
	cv=none; b=GRqYeR+pc6OkP21aqUmKx8LifWCSAHsxLF2R3pmEXrau0zCk9bSDAvGpW2yCrkNJqQG471Qsga47LJoDXjrkICGHt6+vHo2Uto++BLna13d9LRNBbveuYGkYXk1yBmfOPoj5C85EaDLYgV8jaCoh5vnqIRE56jm4o0PxGwXjeXggz/Ldav95qF+1p9x/w1myqLBVSmIZyGmYjBhJnJmkuM4Hp9v+F5qVozLdeWqlI7FArv9j4Prox7HxqeVHE0+QBWD5eaKh8jSJkIoresYmV1fZFkNC8B1OrSkvj7MaFmQhJ169Tojsb4bFiAbpnl9G9Pv/yI0P9nFH19PZksT4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404012; c=relaxed/relaxed;
	bh=DdpO03g2oqaaq9F6m1+GGOlZl0qQTOQbdkE3YGqW9w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JQ3WVXdZSYFoWuZV1ZlTVHKMAnCI4YLbc8vBSmzfFppLPRpJ0pTjfbpZfZATOt9IPS5AkAS3S7Us5SpigJmFYpxbWqnO3LbB9fVUdf67O7Y3jIx4WeIKwhhiCf+T0TCnovBmPbI/JGWjfRehqzxD2vAQthrqufgHFwLxCeD8dcMRtK2CK9U1SQtbNG+r5868LNlUylc2ZppmZXpGHS597JzMfr4kC1Raq8gdFe9jbI/DwgVy9FgzTo6a4S0De4bCnMeTEhAoJ0/yzYzcVVmbfNgVik9CyFC6fbvwc91Cubud+JHFRIffqERTDEtyJPVP5u2zd4QQM1bMqu2+ch3sVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d6vnE+TA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d6vnE+TA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2g0t03z3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:51 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ba26abd62so2665791e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404008; x=1755008808; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdpO03g2oqaaq9F6m1+GGOlZl0qQTOQbdkE3YGqW9w0=;
        b=d6vnE+TAOk8fkPATSjhgMBwbC+Qz6Gv9f3AX3XdOz/9sDyztxGyfHDbqhP1T6M/Iwq
         nDGa1C+JnWeNlAEfznMkn5LJjnueHmyOdCOdKy62RqzwSq33hkVPWAsySLaLVg3T6VnN
         5zunCVQZ/K4mF2iaS8Mj2v/uau72k0jAbH3hJ0z2Uz78P4BmGg0WNVTEKjXgveXl1lFQ
         bNYhOCzIqGdT+eXuky7WSe0wYBtwPWP40XmBpt7uWlmN+7Qzj1r9ig9Ux/ozAWSnT7Uc
         4/WOjPTDp518xiFpMuCBDGKncEQeP3WLIsM0+c2DR14T+qlZSHAl6+gPkJWV1ZB+v3UO
         ecbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404008; x=1755008808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdpO03g2oqaaq9F6m1+GGOlZl0qQTOQbdkE3YGqW9w0=;
        b=wrVRqZINuNI409rrmk1reWyIlTr/fXpxSSlQnljOqoCNBZjZNo852rudNi1ApMFcuH
         e0WaDzuZ1zYPO+k5jLs5TZ1nhp/Yz0mB3BIxrD9xmeqe0u6+ZiqOLCk7U7xBLwhxKd5t
         SvYRF0tZvHG9ZYMv2U1sVK5kEibQHqAi8JIK9ZTIP4cyE/8KHMVCyyomWmSrqHJCEdWh
         9EvqNd52cNLo5kYnDK9jOlY0SH+GeMLuswl+VvE6ipV6xb3r3Ru7CEbNPez+Rahq1EH9
         upPPJuCnQyntLCwDeJiT2t0+GRZxssuyBL/RtYUQxWn/qvGYWGJP3VC3Scyc6qQ4KbzQ
         Np4A==
X-Forwarded-Encrypted: i=1; AJvYcCVwzH8Xr6z9pXPgPBLzUV7SbKYGjFvE3PRUKM4xgzfj5HCI7HKLaHO/9T8Clqo5XvWcaeVfGqZTBayZZlk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzyZ63h6uoa30PNJw0MqsugzwKpad/3IWC3RgowOpfW5Qvxz4K
	Jh/i0o1DUE6wK3hGkDoiGVt9MhcAg4rcdziDb93zLnwcjNQLmZ8UofT0
X-Gm-Gg: ASbGncsJbMg3esPkdbPKmPAwhzeBMwkKCjZQ2p5OuR2ucNlDpMxu806QAQxHtIghthG
	b9sBZskax+zVczcIhe2LCpGsfovPf9FVUsDDxAmIcQnZwcKwMs0wnEgD8opbF4XmjGok7w86vEB
	7RBEHf+KJHMobNfZHto++L+1peGaNqlaDLQBHsEzD563UyfUkkWLnZTQ3rIf0UyS1qVXQ0llIRe
	+HHkh3uQ2h2Nqwm4Nd1qKh0qg6K1ZtKIVEAXnfDp6WaxWcJrHarwREmIkInk6P8l0BSxA2a1tDX
	fOYEsC+fvD7+VI+VEV41M8xmvDqwr/kpmk7XVNMipQxzyPonl/uYE0agwOT7Leci5nKbIZ83ae7
	RRk8wqS4pencyj2leyrx4khJIEBSEPn0vtAmSOnVa0+aZqKYdng8m8k50pK6SAWfAVlp7nA==
X-Google-Smtp-Source: AGHT+IEVcUaDrsN/KncF3Ds7Ejr3CDmhOGcodfBsVHrYzHQORJKCgwrZQppnXPfaGPKlSAziWl9h7g==
X-Received: by 2002:a05:6512:1254:b0:55b:842d:5825 with SMTP id 2adb3069b0e04-55b97b9395fmr4615455e87.43.1754404007496;
        Tue, 05 Aug 2025 07:26:47 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:46 -0700 (PDT)
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
Subject: [PATCH v4 8/9] kasan/s390: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:21 +0500
Message-Id: <20250805142622.560992-9-snovitoll@gmail.com>
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
and prints the banner. Since s390 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

s390 sets up KASAN mappings in the decompressor and can run with KASAN
enabled from very early, so it doesn't need runtime control.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 9adfbdd377d..544e5403dd9 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1



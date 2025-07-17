Return-Path: <linuxppc-dev+bounces-10291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D8B08F3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyX1HKDz3bh0;
	Fri, 18 Jul 2025 00:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762468;
	cv=none; b=be6ImaCoOyvpb5QVDZeiLHAOft7NDxTTIt+x4ZQOD97tFG3IYTq0umT46nEzDLWz3YRfiRtREjmNCQIp/PrMg2B+naait3zV1ZTnjgXb4Hp8QlGHIDiXTbBU4JqYaAJMjynbaDBk7jy62nBxQiLxa5Qxj6qy09iZ9163wVFRHQiIqoUrlASPa2u0MKAZbsHrIKIUiao9dPnbmYsPgrdQLZo8zvcwcGCuhtgo3Hq8265ej5aRXBepDcQhs0Ys84SIwiQLf8orM1uBI3iBjyGW3iYY7rHMtSa0GRRIHzb7M8eHnLc4C/YzAg+80nHSnqiNRmH3lWpOEaiNKIiwboB43g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762468; c=relaxed/relaxed;
	bh=Y3WcQqYlZ+nGmkIZO7BZjNBhDOM5R3Ju7Hd0Z8GcHCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WMg5hvVbj8JibuD82YEIlQuEg/8d1276iT2uV5sgKBVhF3c9G6seYcyAFx0FW7FRRcy6QY8GNmGy+jIQpRTkNm/dtLNCwbWc5Z2bs2deKjHpCa6I1eytOvQ/BJFDjbtJtTTDgi2GURr4iVVGyvty98OvS1AFirexyoM6xqSwkLBJUYjJGJGnDGjgtFFUc/s3vNI/1Z2eOVmw58/UqvfZTRTaAlInM8OTM0RyYrMXdcSi1t4YIf1l1jsbGcz4vlQM6hKC9YynMncTMktGqXdL7FwnefoYT62aMP0FoKLMbN0dHu57O8krJdjSYKHJo6LRNj5ws/qqffZQRkIqQVwN4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VrF6J4ey; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VrF6J4ey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyW2z3Vz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:27:47 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55a2604ebc1so1000121e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762464; x=1753367264; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3WcQqYlZ+nGmkIZO7BZjNBhDOM5R3Ju7Hd0Z8GcHCU=;
        b=VrF6J4eysnKvwp15FEAtKwazCP2XkzYovfx+mj4+E0uXuBu05sIyiQHhfJ8Nq41Bc0
         BmuSVXr8ZuyPJIto7qrB5mvo1zVNSpR8ZSVhhJ1RD+7TkD+GeX2XfAISJ5FYRDV1FdeX
         OHQFg3OBA/e6UEmVQIw9qAi4s7fOfqYuFVr0XEFOagRRPlgfuXq3xbrG7CTTYWaT/GMx
         48akBJz0FhItFxv1ly886PwB4biK+mgROnoSe2qO0VKfpAcw+D3sOGSrMnJVAISHM9vL
         dZ6FVqYOTX1/9wJnKt3VdDvlAJNlWeY5uJ9W6uvv557lD1fZBaoYqtUIsbP+IxZNtbB7
         vSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762464; x=1753367264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3WcQqYlZ+nGmkIZO7BZjNBhDOM5R3Ju7Hd0Z8GcHCU=;
        b=UKNMVlZm/dVUKuu6SKdYPzLMldsAvmY6PGRpWtvukKw35F8+cP2c44ZPd+fzexQfqi
         x2TcDUc3bDCLhWgtePaDfThFqlkcz05Gu3ezenNV9GWHgxXrmvM8JfGkKI3RzRNEm6UB
         SmOVasU7PiOse1qw3Pir8FOwcrmbHr0o2Dg7YKnrhMLZrdAk56EVmxgryPJciLIoln5/
         yEYZGANEWIX8Hjq9KKBEYdzqhqCZQ3BdbxMzkaYn1GVVnZuBcw/9lQd1+HIoiA9r3+AD
         1QHSRMRJCnLaZm+Nb/k7G9uSEPJUQeYoTuhq2ff2sRdCqx1SPKcf2r7b/OUOxcN/vqC8
         j+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWNBBjbrj5nRvzxGz+uBrte9TwQUSLn7VbU2EnHzF1NDGAxLr94ucJTG3gSyxanU3HnHQkMm+gpnl0eQ5Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbTuz1kjuIgIYgARuRsH0jUYsGq4nq6jLSSb80vToURCIfwQde
	oZf0MNWSIkJSqmCc7hKjOkaJRgxejoO7HiEY8dvXTQ2Noq0qhP80PkH8
X-Gm-Gg: ASbGnctiqV05H/kkasTMMZ6dWSGbhT5XHslhy9cYFa8ZLG11CsEy94gikfrhDJOEttf
	kYN/ruZKCWvA4Q7XSnieVLmUjhS+WRR3E85enB+ZQOMqXB63izBngtCqFmd07uT6tS31XpkOB8I
	pHEcXXs7TFSLUGPzv42ajpwXAj/J/pGkssijk3d0il7v798zcoN0bLee9z3ruFBo1NXq1au9w5I
	fH5smJbR5cTTliP3CYNXmGdXGP/bB5e8O2jXuGPNaEpHSPuA6hVCqxWYn3B7ij11iNyXG+jcOEU
	YIzHUDN7NuA3YnKjiF6izndPY0gx5+TFlHQWyW5WOZvNdSwNdmyhVbHkYI1oKbrsCC2f5MBL58P
	n21lWNHWiTVW7kuVgKzUY4sILly6yNHTVsmeq6ZtWq9fXtEJHH2QJ2lXlHFHGFwizVw6x
X-Google-Smtp-Source: AGHT+IF/OloHnnX3mhASN203Qn491wmneqjv+U28AgmKB7HhI1lYsnMn0p3m12S3GUHmxAKLZ2vT4A==
X-Received: by 2002:a05:6512:15a9:b0:553:2421:f5e3 with SMTP id 2adb3069b0e04-55a23f1f963mr2211249e87.19.1752762463801;
        Thu, 17 Jul 2025 07:27:43 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:42 -0700 (PDT)
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
Subject: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN option
Date: Thu, 17 Jul 2025 19:27:21 +0500
Message-Id: <20250717142732.292822-2-snovitoll@gmail.com>
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

Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
to defer KASAN initialization until shadow memory is properly set up.

Some architectures (like PowerPC with radix MMU) need to set up their
shadow memory mappings before KASAN can be safely enabled, while others
(like s390, x86, arm) can enable KASAN much earlier or even from the
beginning.

This option allows us to:
1. Use static keys only where needed (avoiding overhead)
2. Use compile-time constants for arch that don't need runtime checks
3. Maintain optimal performance for both scenarios

Architectures that need deferred KASAN should select this option.
Architectures that can enable KASAN early will get compile-time
optimizations instead of runtime checks.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Introduced CONFIG_ARCH_DEFER_KASAN to control static key usage
---
 lib/Kconfig.kasan | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830f..38456560c85 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -19,6 +19,14 @@ config ARCH_DISABLE_KASAN_INLINE
 	  Disables both inline and stack instrumentation. Selected by
 	  architectures that do not support these instrumentation types.
 
+config ARCH_DEFER_KASAN
+	bool
+	help
+	  Architectures should select this if they need to defer KASAN
+	  initialization until shadow memory is properly set up. This
+	  enables runtime control via static keys. Otherwise, KASAN uses
+	  compile-time constants for better performance.
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
-- 
2.34.1



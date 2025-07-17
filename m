Return-Path: <linuxppc-dev+bounces-10295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D8DB08F4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyn50Y4z3bqh;
	Fri, 18 Jul 2025 00:28:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762481;
	cv=none; b=OAtjvugnjbCsVN1akuBOedo204MsTxR5CrRSF15hm1ceaIVW1PdPju7rRdlxhUoX/bWDB6EC11/6EvCF9LKzNo1gkYNoo4IbVJ31ksVKrPKyZzXizzcs/1vvrdUm99qlmis98GOpRXe8uqanYp40Ln8GVozP8uSPLCeE3BQegQkdJUavQyGJoNxOq8bgn4iN6h+D1V0WYaRWsPzFuFitumA9IU0J3iytlMBSxT37m8aLc3tVu7lKCHAd7zN0Le31yeqARBPUuvvjV2aLTnfIY09AVM8XedZILnNUoY7exqN/Bt0XT9BEz5EyLLjavyuIASch0bK0QWstpB3oe199aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762481; c=relaxed/relaxed;
	bh=tj0938MKzJL3dLX2pSfruVoI7qA5XRt5dsqIl4I0tCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EEoJM+9BIrqRj7f2f8Gya2vk/SjfMT6W6bcQaQxfQBwggEd3GXTFH7dGPJ6V05BkVW3fTb0e0sBX53zUa9qm32WybugujhKDc8YMG1cIld5OgoPUpV+jG1DvTsP64y/jEtQRbBSHFP2xfyu5+A0JU5UhbvU6bu8iriyLlzGweG0fZC75wPSkLQzRgHDD9tUEcrIxA4m0qMhE2Dw7queJRceMeZiJXbxJkJxLPunz3EYpOSy8tL3lw2Fnp4aK7LdlHXsSaNT/DzK/bCtZZFMIor4Po9mXqYwRZW8XMh8ThuWCPGTsnIjvJGcPBW1WVcczJhq4CmXUXIx6+8xZIlINKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ISW8c5JK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ISW8c5JK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZym4yZbz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:00 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55622414cf4so908990e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762478; x=1753367278; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj0938MKzJL3dLX2pSfruVoI7qA5XRt5dsqIl4I0tCY=;
        b=ISW8c5JKhoK0qGu+5C4sm9AxnTWz0hYg1YlquvKl31QQVdaAjVtjHoYOh6guwNlGcV
         IXCepRKNa8JtGV0uhlWKe/G7RbuA00lLOpYTPLcM7vTDQhONPUnNbLMWrouUHL2xZbCu
         wLxw7LGer9A6HvZLr+u204EXIRCsnM/mRbiC/haE10rfNPhS9SMSXG9vxARVq5u0y+oQ
         z/4EGMQ6+rL7qMy1FyBIFvM1d+9KUabDsIe4nyRJXK+GaY2hMWPZz5cnFJ5Ffg8QpS4V
         t+DsEkcScom92hlS4WKsiv4ic/dvRf/uFrcLn3/+og2JPeAZpwMPsP9K2SckiE257gEJ
         mk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762478; x=1753367278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj0938MKzJL3dLX2pSfruVoI7qA5XRt5dsqIl4I0tCY=;
        b=myd/Dy29kXzA/HXUc2emTdOrKAVR0g0Tyu5YlbdHLV4f79U+zIkIAPvowuj0oKe+nk
         loC4Xb3GOMRNNJVT5wOMLxJvRQ8dXZqVglQ2zU6HGGOGnGWovxj0EDNbBdRFMAveQSon
         ulYZlGWMKJdWLunn13cyZoRqwSGGLr6F1nnhJlK4Ilto7X0DW5DWGq1uu4nl5ceyEvUU
         7LBS3TvBa+Hf1rOhIGDKkIvssDtNwaY8mfHeS1B49BRYJgWUu5iTM4Irms1mSl6i6+D+
         zXc1Yz/4WuEbUdR1WP3+4PIbtwV0Z4p6v6Hxvwq0vI14tX0mlprQxuJ201Ct45mo0YcJ
         wixA==
X-Forwarded-Encrypted: i=1; AJvYcCUXV24f1psmpVn3Y8eOBNbV/CZrRXZODKLDxlQnE94V6xBgcKTw6LthtKaSMicv+r+ndBUyorhrMjkQmJ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzh2sWG0XkPL9OCo8u8AWYeLpaEUyaIu0g0R5wGY8wo34956d9L
	Xfm9Z7xz/IxUuhDlVOXEkAthiil+yRHTeux5xbppHfYBskDy0Em0W6w4
X-Gm-Gg: ASbGncsF+cY81xfrQ1xSlQyce2wNbM+WyU0kcuGLrbgMRPs3yvRcmDu3aQlW5gGoD+Y
	MwaHNs4aIvMypwaewl1uPJoZbet4aiI9JaQeBbnWPpDfOJoc8Np+7DCkN+AGMOE/16LupLV6+Px
	5lT7WUCn/5mGuzoejDKKFaxyVwrbJrYXmSK7mezH0OR0Rtn4wpEqYo1D/Sd84EH1pvZc95LYd9Y
	++L79qQcdX5ixt82CUo5WjaR2+hkp0j6RKfPafBxAyOlp2gbO55swatdKtWPXV0HQhzDfz6IXin
	9albKUbJba/7F4I43qgCtqSe3Fi5tzBPHU51G//OUtSSrCcuJ1MZ/fgAgbPjnPSjYX4xF0e2dJN
	3q6Up8DcvPsaTUqYoX0hmlHHJWAHRk0NvXkgvp5fX+rqZOilJ6/nZbbSuNE3nib1fh758DAaqdb
	mo87E=
X-Google-Smtp-Source: AGHT+IEgw9d3ZuJ+QMY1MR2nr/3qOXMGIgWnHA/W5FJZ5VigpFpebSW6/CzlCrWt32sYjXVTTwrchg==
X-Received: by 2002:a05:6512:360e:b0:553:d12c:fef7 with SMTP id 2adb3069b0e04-55a233137ecmr2448163e87.14.1752762477204;
        Thu, 17 Jul 2025 07:27:57 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:56 -0700 (PDT)
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
Subject: [PATCH v3 05/12] kasan/arm: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:25 +0500
Message-Id: <20250717142732.292822-6-snovitoll@gmail.com>
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
and prints the banner. Since arm doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, but kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f70313..c6625e808bf 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -300,6 +300,6 @@ void __init kasan_init(void)
 	local_flush_tlb_all();
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
-	pr_info("Kernel address sanitizer initialized\n");
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
-- 
2.34.1



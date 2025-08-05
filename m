Return-Path: <linuxppc-dev+bounces-10657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C343B1B66D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:27:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2V3lS7z3bpS;
	Wed,  6 Aug 2025 00:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754404002;
	cv=none; b=PTAstVHa6yCOIq3Kvry2vO4SS6PIH2gPE2IFxeHRafDCkiy2Rl6kZFPvxGOm57+v7JFs+ZYIpQb0IzAisaccIgX7KIQ1tmknhv5G9Mbz65l4UP+/6+3Mb5qZrse9gOvrmXF8lB6/sunmDq2KQUdqUiqVPvIJ7abzwneT/rQQYwhnfaK1WG9QFouoYSfreH7d2AoVk/HvchGXp4Gqbw0FwfkTZm9wzz5qQlMnC/kh7PAYeHPs+x6Drt/8DjJ3BZiaFctbCAZbI0ksKwBu0vPE2kSU3gjrFIQH72x1ee1q+NKhvfQQHQrcgXpKM+NhrXl4h3brBnIdu2oa85XG7OaGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754404002; c=relaxed/relaxed;
	bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLDj4QMjDp45xyUnISHp1IYWqg3cN18FSIDix7soJp1kr0no62y96IA2UB2GmPyBTj8sb3SYmxeSOzIGrEzs+12j5u4fzqJQ7xpAeye0+6QyYLmrNAW3XBZfjHRSnIzUDUvcGnhitsWoIYKkU0EfhiIQkgJbUCjkIk3xqK81td1aw90dfOx6TIkRGbLOf5ESs+YyOctEiDE6AJeCs6vBLh29QFIVNXxzlqU54CkXPMiRfchdmJykwQmol6xvOTIiiBYgaCZif5mwiEFu2PJ2TFV3k9YrcXXU77FEZgvgUHb7/GPHXZrZfNUUm1XF3MkL5j7+X0i1iAzpk57fM+6ShQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GV3czOIQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GV3czOIQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2T51C1z3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:41 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55b88369530so6962370e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403999; x=1755008799; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=GV3czOIQwNDVbOUUSptqb0LgUmYxaPZPoMGPivvEyP34wR0Els91eJetSIz9k6vXlB
         4BE05s89ljgWGzmfYJJj/lg7aB5kf/ZyZuNCTu3k4qO74KsI542OIOVJKcWIF977opO9
         +3JXcOLyqy+2mH1M33MsOjXd4dzCh2I6rZdOGMbh+7ngOtT5Lm3sCIkFhVRKZu0EIGuA
         E/CY49V2fz1IcK1R8Vr+eyngK32BiAMVDsXERb4Rplmfig1j4zQvp4PRHQqqv6xFPnVh
         JEfRxuHtMRmPizZQIN0iixcHzrg7Fvb24f7PdJEdIrXlDGNhc0inxi91tpHr/9kIG2pA
         lEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403999; x=1755008799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=aXqY+TiE0ifcx+qcJ4bgsH5uW2rB6PgS5c5SePwC2fMxG0mmnZJagBBGNaK7exEHuN
         cn55+J4nQNUdQ+dsyRdXUgsOW0Uoho86JCB9jXA2K/zJJbkuK2eIZa7OAEyO/2h9sQQC
         E+glmKUDBZA19glXTiRqTLTqLmjFgzOtEiUksXzkX/nNbHTs3HWoT5TO8irbEI06dWqx
         h0jHdF9+6C9uKXsR1qGGHsLdBU3XraV5P4t3V77prZM/uqyzEgnjYAS+Iy6ZgIT6xz8r
         1WIP6sHvxjzvADO1C1TdSgTvLP53ng9BiCNVph93WX1w2b+SlahBH5CSJGqHYGZ5vF8a
         6lKw==
X-Forwarded-Encrypted: i=1; AJvYcCXpH9RxL9ySqacjTCc6bLUn0Iorq+JcDEphm5Dtbuc3ihFdq8mcRFoGDQxJmG0OrdJi9wzk/IowueQG2/w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygoWsDV3+205KuR5H1dIXeaUw8H90bkYfpK9D+zQBaLmZ4Z0jF
	3tir8lTrpG9r6gV531aFcah2OaVOwAbDGG/OhYzhijThfCKDx5VlX93Z
X-Gm-Gg: ASbGncv/Duv702IJTfDAQvFAN+IIJfpmxAYZkkHMuMjNMhBS4f1Ei2KtqD2DGTBsshc
	drf8vfJgM/9r3KmpSsWxLH+bEHe3tp687FgucC30sM1d0ypITMReUK47hjpIkcLvP5mb4qlPOLx
	E8GrTWhbjTxr2bRSxUX8Bk9PtCGOZmuISJ25PSpuzzNGw8rJGHHfvAOg/LySoxWVZxWBPz3kAcg
	JWDsAWjO5rNxd5sZpA01OYSqTQtyHPc12tXV5mxf+3GzfoAelfKSscffNzehsluSV2N3mCQb91K
	5PSMsebh7OFpfT/Zo+5kwtJZo10WQGrjYQNPKRzK2nyTlaHj1BcaWUR5hkWuDSkYMWU9Q/RhqMG
	MM2gI1jne58LWaq+0yVnLFz2lX9DpPo5MGe+nCuPG52xov/bsqFOnhq0dEF/JQDXAbnkP2Q==
X-Google-Smtp-Source: AGHT+IE4tVfY0GDnGQOdh7BehbCQ960f1sYrnnyIro3xm6jwPaApab0fDljnNDBd9SZqMzry0nuyew==
X-Received: by 2002:a05:6512:a8e:b0:55b:5b29:61ef with SMTP id 2adb3069b0e04-55b97b89544mr4329067e87.56.1754403997895;
        Tue, 05 Aug 2025 07:26:37 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:37 -0700 (PDT)
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
Subject: [PATCH v4 4/9] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:17 +0500
Message-Id: <20250805142622.560992-5-snovitoll@gmail.com>
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
and prints the banner. Since xtensa doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op.

Note that arch/xtensa still uses "current" instead of "init_task" pointer
in `current->kasan_depth = 0;` to enable error messages. This is left
unchanged as it cannot be tested.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/xtensa/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173..0524b9ed5e6 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -94,5 +94,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages. */
 	current->kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1



Return-Path: <linuxppc-dev+bounces-10299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB399B08F53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZz26PkDz3bt2;
	Fri, 18 Jul 2025 00:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762494;
	cv=none; b=WM5ypX65PTb/hhD29jpyCG7uaZahz3tmX/qxmw/+xEkK+M2O7qazqgzmw82J1rKUWzuZBXgKp7xBFwK7NzinbQCNIlzr1RVGVYjaeN9C6L5MPPHRw3Hh7Uf+V0aGiZuAkm0MKb+IPLxjnHJHPd7GK0NReVBo3dc6yw1Hcui2l+VLp7qxiHBcTRQiwD32py7a/w8loPRdRYMtRRQDHRZUv63CJQ3nQRlR1Ad9DmsrHD4l3G8t0lfW9K2l88wkzyCBBaIgx9g1SL7Zf6cce+kpCINmdt5zqGnNtf2M7JWYaH4iNm8pcJU+t+Se8Mf7NHy+AnNOzs9SPXK6EUcmTMmE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762494; c=relaxed/relaxed;
	bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=McwWpkWaOptdysuSu5L6WV+ijDNHmKE+hoejWORjnBBHzciRoDHQ9SqD44HsveAWOwVKGMMU717To00a2tHct20oMQFjiiG4TEf9uQlNCJcib6uLt0VTgGOHVsvj+xe2Kf1g6iKSaPSFcecxKU6jxQJq53nH2VKGYen/4VGjl+18qFVzFbfM6v9jkDxOp17n1L60GEJmoJusYhkx11C4RflXylItY4hYmeTJFhabL9yDLF+EmJi8OB2t9NeYqFPejZHgl2kIKMSfZFdfFdbvUYmtKJy0SHmen84ZzvcbVM30KaxgeRbdHc6OnGPTNGHns/uOx9HrorH1DnCvZZz4Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ihMM/SrT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ihMM/SrT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZz20nfRz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:13 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1236720e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762491; x=1753367291; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=ihMM/SrT/LnnWDhgNG/OQAi4bcfDCuYHf1Zje+D5DKq+2yJQLgEUIxHd0ZkR8wx3Cq
         o+Hgsn6dslQG4xhq4zREnWs18EZqraL1v4aF789QDpTBIFnfsrjaLPlP01SW8F1w9bqD
         cXaNZ5PSD//2VfvGGMqHC9ejYyNlnVxpf2XCsDicxm76p1Q0XyCgM5GlkMobfkMl3Dqm
         v+bhbWnoF/c/Bu5kxPE5KBgXm5TGhh+1O6iopnnpGWesOdhAJNv34qsKxTvYw8v2xvcu
         ybvnoLQF4iWBPr27JxvaCccbPc7624BA1KBzOPQ8b1imE9EpZOi0AxvcEA2zndCPTJoa
         VOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762491; x=1753367291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUgc2mQ1RFMODut/DxjH0e3nH7UxMqXiDg2xTFsSSw=;
        b=Eura+++t1WHlSBzGuS3SINk7x8mXa4Q3GWRomfjzlmVJoeB4nf9KA8F41NB/lRWYzQ
         bEoqdfLosgvz3CRP69BKJjFnyFBu2y3SUnHPnoZW/BYEjAX/ISyVtQCSJuqkLpZQKxto
         BcqHykVaD7B2Fcie6Q+8p1kbHeK1mzU5zHedKJsG/EHGtJYVvN7XbZL3vCFLye0Bnbmp
         dVXvIOWdwSXcCWKRyfjzJpVmQmt7k5LDlAmXojLwPDIA9BW7XIwxPeUBSeEkd2N5KWyl
         9cr5jT2HwH1NDnO6NiVsjIWzXxyYPkSzlFIEe4WHwMTelMH1KFmCCkDHY/h6YUa1drQL
         uOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSVG+/axnfpSuI7N69/1n93B26IgjY3LugbuMgkMsZ2OiC3XklqtSjJ+s+xbr5SkoonEAaizzZQz3dIXU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyAlbtG3cRkf/LjFKOoAfjeL/SE1dbx7Qf+c6HfDdZhT1dupekx
	hcseJ6neCLoUXHDp7bxBjbhMM+tgWfQoEnwWrS3Ww4ehBF6CPHlsysfM
X-Gm-Gg: ASbGncuVqBCJGzffLCynlBu6JWRUqiIwB/METx4TvGMk+xkoeRUEhPMgaq/1RCpj+Vw
	ykVR4zffaLlcOnillH2VL/uKWsvcRmSXpcnpOPJF430Hr4ZnxAn3mDhi/l57su+VLGFd0qIMLBU
	n2cUgZyhnluWpAE6feIpAWVX17f/XMT87hr2X8c4ej83Cf+WNVZF9R6aTmkfbP4JrVOaUUHT1AY
	6VIXixRaUENO462d3gBSijr+RKOeCmTDAHd8gQ9FOEG/rXRUsJoXD7x9ll4FUFyItee3sf+zBaQ
	uLhFeS671B0BjEUawE4Dh1S0Lg3okCndrR0/iU5tXyLJBqA/BOVBqTYs2V+c1xC+eusEOuOJFCB
	5P/It6ouoiJVzrsZjqmxqVneGPV70glBerytJ6ysW5wfOjkg8KTmSdND1xsSJDoLCqRco
X-Google-Smtp-Source: AGHT+IHDhctOdPCboINtKeXrLTUszqbBiUuSpXqwZ8iJGfUdyizY8inGgvaZnyh7hxTvzKTa8fgC6w==
X-Received: by 2002:a05:6512:618:20b0:553:23f9:bb37 with SMTP id 2adb3069b0e04-55a233b2fbemr1641277e87.40.1752762490421;
        Thu, 17 Jul 2025 07:28:10 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:09 -0700 (PDT)
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
Subject: [PATCH v3 09/12] kasan/x86: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:29 +0500
Message-Id: <20250717142732.292822-10-snovitoll@gmail.com>
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



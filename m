Return-Path: <linuxppc-dev+bounces-9757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC75AE8567
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 16:00:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3Nk0S9Yz3bpL;
	Thu, 26 Jun 2025 00:00:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845217;
	cv=none; b=ZhpQW8KbGeD7fbWWAoMwOM4/XaDRiuW/H8bo+f1X8PNMPv3uVnzlGKkWKNqCVx06seMJ4JbxzHTdzbBkEC3Xs/xSLcdZIy3cXBTv9865YQin5WOuYkR//dWwv9O7Nq85QHiuvrGKUON2NYTVKB5yxY4DJ0xnakCWw+DiDX4PjJaY+U8xUdbFIWUaE8q19+O+OdW97695Yyc06zghyZ1bE41jD55Qo9j85edh96oi73LVH00TgB0uATtmbpQUYO9kdV43LC2rBJ24HzlWkEKBrR9qEzoLPfkLfmW69WVxZ8kAi8qawiHWSgWMmvEH3I/v0yJTeaUUvHM6mrjdpywreg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845217; c=relaxed/relaxed;
	bh=BEyx1UFRvpVo+G4N42POvQdsD1hWzSpAcJ0U0Tlc1dQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W99AX8LqpJU3bSD5us4KQ1Nk8r7LOC0MWCeXMV3NtIYzUUQRbhfnNSy4da6xuuBDY/el1GnnDGvxjqRs7cCSYW7+Xgn1fw9/ghi1dlkjn6nVh98gtUZJYiOKtQbcxEMw7FZqruYbzJC5JEt/rvbPsWs801VN3/JJCuoulIlzIUcMK13/1HkUhnmNhTH5n+aA3D9y0QfcInFPyRL7Ey1S7uzvjrPwiPMLDu0svaqkai6WlvPIdkhVhXCqOOh2ucuzDWPO2s6iGXKpGv040Yan2WOFXKBnZED2rkn+TBXx2Zkawj4tmAY07TmHBaZcX7VvkLskYyPUZU5FUOl2e3IZMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AUR1JYWa; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AUR1JYWa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxwK0BBtz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:37 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so65438481fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845214; x=1751450014; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEyx1UFRvpVo+G4N42POvQdsD1hWzSpAcJ0U0Tlc1dQ=;
        b=AUR1JYWa2WIC5EYrTFrIHFDC3Vg9/1nSRwTdSDL/HWXVsbr4tfkqycM6YgScCvO5kD
         NnPVDcGjkCroWhvcWDhuf5U2vtL70Ug47oHrZD01H53356osmdoyW7v4lebZLixsPGnz
         n7mhiWbrWGvPa+yo1xlN75qgmdqWykIr3Zumxboq2OJFJAfZcTeA0xY4dhOktrWL93n+
         QHlBLHDGv2Tt9veEPqfX71wOc5pnNgXgaq7Z/5gbUhS5cl5LUp/JJMZrwnbdyY+U8hR3
         UVt4dpGDSChhQ8U49rNEjYHf/n61he/Rijxv/ffOphYTijbvR1Reu9nOIEmbXsv2pQUL
         jVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845214; x=1751450014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEyx1UFRvpVo+G4N42POvQdsD1hWzSpAcJ0U0Tlc1dQ=;
        b=l3WQeT1OI4BhLpSMfi3ybI48dQOhoyHclvLcWGPr+rRGlArSp//AFe1DMiWGpquaYi
         3W1pioC5tRGPta3zqkzx0ykrAD4cPeL1YccJDUB9pohDDJ3l26o7r2+IvRTRtWSuy1fw
         7na7OE62WnoyR0gVZkW7zgTbRaCc9jjNweGs9HRnieR20Jeyhd1nFXdv6YY40MQNJDPV
         kvsdLkHv19U9AEIiUWKz7hI4bqZ3h5d4Psh/H9meRPr10Pl6lE71YbJrzX/AciqT04k8
         Ic3v0/31N0Gi92DtR1P/mUP+37RGr+7wa9/0qmuB9XAYB+EfN5R7hpLbm0EVQ9AyBU6Q
         iALw==
X-Forwarded-Encrypted: i=1; AJvYcCUHLn90s0idfQclWzqgmrDnGXi2l7g1S/UoXgai4MHDo/EBPI4TH3/7wY0uTvgB9hdURZWGWaNbb88Vv5I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvFPJnTNv/fbtrRTTjfaAPPLGXwqfkXcnUlt1z5wdQEKuoYJGD
	aJWb0OawWz901/Fhek60uzDjEDUqt4f3Df/xroGZj89A/6vfI9Cbj7Ye
X-Gm-Gg: ASbGnct37yTi0K4g1R1+PH15kotQnMr1DLT6SrvKKVB8zl4ItTJLecF4PCxZjGdaq/R
	a9LpT3E3NpAqOb9piczXJqbjcQ6rCc8XFXC/Ao4xJcnEhVUO9Gvw+EPQE2vNJuzmWXaIr1vBV0Z
	1ZLKK3PF7YjMxgq24aqvA/JeYDvmF3ciHdimd7d+Lgj7ahDt3v3exC3jzd7uD8S9QIdEB5jrVbv
	IJnEsnNi1pSzo+Vr0xoT7jzIDGUtb3n9Hf+YSOGf9j0QzM24qHy2C57HgUhTuLGlmBmeX7SLUC+
	e+bEdoSyuTRt0Jtult9lH5egBg+0PU66l8i6hLWjUI5X3zb047nvsu/74Aya2e/rdEAbIVjdcCX
	0LYxEqKZiRejY3DE/pEN3FwIcn8gOzw==
X-Google-Smtp-Source: AGHT+IEcjLY1beu9wht7welDNsEE9aAi3GLekIAB8d1qrA4KC0EwxtCdVmkKJY06lTM1Yl9RfqTm0Q==
X-Received: by 2002:a05:651c:514:b0:32b:3c94:992d with SMTP id 38308e7fff4ca-32cc65755dbmr8009981fa.28.1750845213516;
        Wed, 25 Jun 2025 02:53:33 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:33 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 8/9] kasan/s390: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:23 +0500
Message-Id: <20250625095224.118679-9-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 54cf0923050..da7a13d9ab7 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -65,7 +65,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1



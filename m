Return-Path: <linuxppc-dev+bounces-9758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16645AE8568
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 16:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3Nt0cP9z3bkT;
	Thu, 26 Jun 2025 00:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845222;
	cv=none; b=GeOGp5rHKdIIZOKXkGHmRBIOjOlvEx6TB2Dt60Xfb0sT2MweXR0KqMPOBMgtbpGTUfCrg8AhCTMPkzJpUEHsn95Cd8Dm/or4DhMnnzpSl/RWER4ACXB8dB6Zzhjk6rDWV4Y+Zc4bh9WYnhsrZ/eBDSM4vLQqLb7kvS+x2Qydt6tFFWAsMYnAAReTgpbk1ZrXncW2wOJ5glAnbGIYaJobJs0v8xlILrCposl9vqRh8nI4GPcqFkSZDV8rZTLpHnLgUB25Q9FTMXQTOpNn3780LE81sM9CK6dN2R01PvOEJUezWOHVzntnNZ5+6XI0ekCV55zmG0CIqtZ698D/mtMX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845222; c=relaxed/relaxed;
	bh=ovwzGubQ7EZCWb++7xcfiusg6EJnFDR8lh6aTJ/PpoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IsqzXJxSjJMOlZDdejCikYSF3zETZKA0ue5/0Sq4c5/g4T68+B49Yx3NSIrMLHD2opL4gdk0Jr1H9P6NUZtfSubXYsemsvZ0Nsi6T0x8k+mGTedV+otFWohvTEO396Ov+C7i+pL6w5CUlJ87pVj8PQ4DDTA3klv6FIhsqLSpJ7rlMxQCQ1RVm8Dx/xX6FVUE5QNn34q2oYlqppbJp0Y/uRv+7bvz5n8rgjiE+w84292U7s2AIFrKCneHbsQ2xX0c8YHRauHfms0zBGh0XVeHTZ1HPWzerUDsmfixzsQk2P1WEVJo5WICx40C0NDloLuBe7L00s+meYFOO1KLMolSLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IRcddBYk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IRcddBYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxwP63Y6z2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:41 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55220699ba8so6788082e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845219; x=1751450019; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovwzGubQ7EZCWb++7xcfiusg6EJnFDR8lh6aTJ/PpoI=;
        b=IRcddBYkpDbf2TVZqYG89LZE0Kpox2xI5AHLFMfngbPtj2ALgwk+E6YPPs3ZFJ9a25
         MRwbSAfe7eCIP8PCbaJHkzqaSPwCNX1NtUPpUegxy42HwcbkQECwHUmbuDsYp3NkPY0l
         s6VU/to2k0Lcc7B3y9CDoL4+s3T+kL+VtpdgDsMDWz9c/rk4GPC6AKIUXAAScIfPdJb0
         HsJlnMtG8EalabFWulzL1lda9AGrDHTfJsbG+C7Fppcy7AoF3RkbmI7Irsui1wyu7gCr
         O2nSv/buDmTo5l5k78iwLi9x0z+qIGCsEfq/S6AiJmVQOzu36Lh9pP5ZbWyU7t+CClnZ
         SKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845219; x=1751450019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovwzGubQ7EZCWb++7xcfiusg6EJnFDR8lh6aTJ/PpoI=;
        b=Tlk38uwTveSZrpV9OMn6jYWVuLcvH2tiC+LZRYbSUWbnsOGl50uSWEAfb3NFD0+Wps
         2+HOoxNyAvhC8jfaaf0mfGybyhaFxs+2RclMs/kRoAQOyKRJ6TNCbEAFEwJ0zNY9ppf8
         p/E6o5lsAx3ryq14P1cFPXyx4Uu7HinWIkbfADXYE2VJRQhQ3ACsfZ5d7/iQ1wgrucpV
         w/IOY49md4EKTvBs+hPyLyYgjaCl/nrbbGlecZ4YnpXxrHvMgnng1jsFqwFAdb9zItU5
         9HGjGqleZ9b3mmBcUc0vllcU+PMyZHonrO50JU01g0hCfchd0CvZTtz25Ry9xMqaXvfU
         Fw0A==
X-Forwarded-Encrypted: i=1; AJvYcCW5i4usGUqX0KTLnx3wyhPUDYysr6lMfo9Fs83DezbDrC8/JDBQFtQOLbKUjwhp8uc601RYOLu22d3NDY8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzuM/28DfdAn26GqlSYFHFY3VcRyZINIRNJ51KgZIWqRSbAvOYh
	DbyYRDDG+RPZhZPXWS05B17y1UeUwNPC/UgZzYQm/mk/tZjluq1TqTeW
X-Gm-Gg: ASbGncumB+OHxOkFwq1LFD8kCLtm6LPaOqYdjJMe/1pCH3pb0M/vTaDAqAQINJQYY43
	fPnVWPeGkl7G5G1xNjy2llnCloT9mA9vMJ/Z7yGyDTNXkMtVmK+zb6hC8XEFep0IiLhsGkIhVae
	12OIkV0ST2Q/qCdzWNYY8dAVa6OB7DpOBWbh9V1lZ1H+m4Ifx7/X5dNjt876XoW12JCzJkus697
	NjyUyyj/jFdHGecIW6DCvUTc3dpo2boGepf1aEtq20lxWVY/ByRHrMXMvbnJKniZCsORjti0Qkg
	e7XjioHlhW/vUr7rUhOTkqU9aFASpqncJ7LV3gl4paob6mq9wUu4ElTlPlITtUvH/tONJ4xn+Uy
	vELy/g2PEBDdNQd9Oh1j2YNc90UtGLA==
X-Google-Smtp-Source: AGHT+IHEtWnCbJrLGTsCzIsOmvfz7XrCUuinYoJ1YMkmnRrIevIL2qUouOt7T42E5UqDFgQKhJfguA==
X-Received: by 2002:a05:6512:3dab:b0:553:26f6:bbfd with SMTP id 2adb3069b0e04-554fdce00cdmr639671e87.8.1750845218713;
        Wed, 25 Jun 2025 02:53:38 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:38 -0700 (PDT)
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
Subject: [PATCH 9/9] kasan/powerpc: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:24 +0500
Message-Id: <20250625095224.118679-10-snovitoll@gmail.com>
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
Fixes: 55d77bae7342 ("kasan: fix Oops due to missing calls to kasan_arch_is_ready()")
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/powerpc/include/asm/kasan.h       | 14 --------------
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index b5bbb94c51f..23a06fbec72 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -52,20 +52,6 @@
 
 #endif
 
-#ifdef CONFIG_KASAN
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	if (static_branch_likely(&powerpc_kasan_enabled_key))
-		return true;
-	return false;
-}
-
-#define kasan_arch_is_ready kasan_arch_is_ready
-#endif
-
 void kasan_early_init(void);
 void kasan_mmu_init(void);
 void kasan_init(void);
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 7d959544c07..dcafa641804 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -19,8 +19,6 @@
 #include <linux/memblock.h>
 #include <asm/pgalloc.h>
 
-DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
-
 static void __init kasan_init_phys_region(void *start, void *end)
 {
 	unsigned long k_start, k_end, k_cur;
@@ -92,11 +90,9 @@ void __init kasan_init(void)
 	 */
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
 
-	static_branch_inc(&powerpc_kasan_enabled_key);
-
 	/* Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KASAN init done\n");
+	kasan_init_generic();
 }
 
 void __init kasan_early_init(void) { }
-- 
2.34.1



Return-Path: <linuxppc-dev+bounces-9754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5DAE8561
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3N942qrz30W9;
	Wed, 25 Jun 2025 23:59:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845200;
	cv=none; b=RNSm4g+vJMpFMbmlWSir1t7g193LdHX3MWXP2+ntzzvIudmQRBM6ejyJ2lHiIjxe8JYY39VIO1PwmSc2Mm7gtUPLNm4Z2PZoC/XauRxbMAUM8zoS4tE8RMuHgp30jkeaueN2Lg5M3reUdEeWWmQ6dnBWtXiVNXnx45+8XtMNa/n5F0YEhvjkCwGm5L+qBCoC6vfz7rBepv3CAXTis0rLIPsYFMPoTemD3BZNuwAiIkQet6Ghp+oEUpNEd2T+yknjcjHBMc1w+te0OXSIBK2RxVp0EnwxFTLKe/HksvBIVVz/s9IFDJWQE8wi0WhGCYBYcufOVjWyguZf0e7ORTTLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845200; c=relaxed/relaxed;
	bh=aOegpAuvdkFcZey7AJnC2ppf18uuNZebWg0aRe4Uqy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PQ47Nud67zdTisy6UYfGBVOkb4EqlfoEM4ocUll5JSyUA7wJ14a0C269fJ5BzWt8IoKkdo2bV7sCakxCbhc3feCRHu3YyF/zkkynGnGSwbh/L3lGNdSrVOhYT8Zwy2wDkt4j6DXAnEdPZoHyKM9ORgV3cpHiIkPlw4QBJW/rlM7O6FGyCfMhr0PakUCTjihIHFBA5O7XmKkgSCIwPl8f1iF0zWze2gJz7+RXvs0ApxM3Ij2vbm4RBpwWsrf/tsvSbPDRjjsHUyzD2wqn9VJzUkPrvWRzcrWaKLHUj2HmJpcwgXUhJL+6vWAlLcLZJdJO8PJunWrRrECX0bKcgOB+fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N0t0Q3BT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N0t0Q3BT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxvz1BwDz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:19 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553bcf41440so1448442e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845196; x=1751449996; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOegpAuvdkFcZey7AJnC2ppf18uuNZebWg0aRe4Uqy0=;
        b=N0t0Q3BTuq1R4Xqq/InJh0y/EZvH0A5DROuuS6eQ8HOUWiBn00oDdmMfu3E/vG4XvS
         phnlsFi9Omc373FtxMy3Ty2ejWhFxxyHGmuvOocSysAQellN0oM/NKg5qKwizDmQnJdq
         NAib/V/vkaoJssMQg5ahg2GfBsodygniA3KKYHNxAH7j/Z8AXoyHio5SbWy7x+TVWOH5
         PDdsTfAU2hoOUXK1oBwCTC1Wo2Usjt4diF+ZJ0GLw1bjPtesLmUezkdOv01CZ66Pl+Xc
         oodruuKD0CzSUtqzg+/g0+XTY9k5vfC2DkmDiZkdIFLbXQyr4nZ4gqyTSN5DszbbX7YP
         M0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845196; x=1751449996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOegpAuvdkFcZey7AJnC2ppf18uuNZebWg0aRe4Uqy0=;
        b=ua2mR8aWnTxvL1CHwc3ITjhmGUW2kFc4mgQJPuUsAAn4Bf53DxpQZ+ZfCRlJcI2GuG
         sh1D2dKoX5L9n0rvBv/T9+UIWEoat4ECp19nGMpLB96AGuradcBdvlx9oEzM9no9cgv5
         wCwlHC821weq+QrKfk+/JdDGNTUkwzy2KBaBlKBfvaBLpDYcvPjTqJtl+vZIe51SbJrP
         OhnH/9cC8xGw11hOcNnxVz0jIQwHhltkSKqDKBdMon8iRtOT0bL9z23qNY4hm/+n2Ooc
         M4nBJ+eP3Q7miRK450Rw7D/FPPO7zx+H3XVPVeu4mv5wDPiksdyOFk+ymqKeMCB7YFYq
         Wc/A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ46ZyFuFwEoAgzjq8F/oQQI7hB6MClzX9mvbynRqA7Yb6QJxfTf/E3y0dm6GhNYxqOlAqhXeGRowV5jU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz15euoWpzLRwgxCyRm9+tbyDGZg7rajJlxtKKN0BYzWMG2kJuI
	WA2CCNEKXNkFEuPtsvi0wbai1E1CNdQQDYoilqc+zm0JPqnim1xkoizA
X-Gm-Gg: ASbGnct6YS9OPYfJKdwuQcz7Bl4BT8V+pWC6aL0H2Vo72zK5e/GibAR5eTjtc4eYsEs
	ga3cEaomCb3narAjnc1opHXGaJJKF4KrgFxDqIOkZSXlJzTJKuam0QKwQ2L9OZkqSJIE+fMLbyH
	CKxHoKaduWxnxyW1C/EE3E10rUQX8VOli4iTnMpQCgsq2n4P7xbNZo1MohhulyCszT2jxCRPe9z
	BDasnZcerI90vG3DKqWegHghwpHQ4SvwNIxewRidXIygDrpovYyHVhtYq7CCP1KXcI/cPGQ9l1L
	SwZxu2ERVUo3qVmtLbviOOCrEppZCtpPwDSqFhd4ZJYcq4HQSWtWE/RP73+44yLEbD8p1W15daZ
	pmkI68EMMGDN4h28lfCEKRy16UzNaJA==
X-Google-Smtp-Source: AGHT+IH5sVpXWqNvgigVbtHVAfe6SjaMuU3V6+6bSDasNHNXTwQEDyYqvBChJ5Rb3116y8fRmuAdlw==
X-Received: by 2002:a05:6512:b1d:b0:553:ccef:e31f with SMTP id 2adb3069b0e04-554fdd428c7mr668464e87.13.1750845195630;
        Wed, 25 Jun 2025 02:53:15 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:15 -0700 (PDT)
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
Subject: [PATCH 5/9] kasan/loongarch: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:20 +0500
Message-Id: <20250625095224.118679-6-snovitoll@gmail.com>
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

Replace `kasan_arch_is_ready` with `kasan_enabled`.
Delete the flag `kasan_early_stage` in favor of the global static key
enabled via kasan_enabled().

printk banner is printed earlier right where `kasan_early_stage`
was flipped, just to keep the same flow.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/loongarch/include/asm/kasan.h | 7 -------
 arch/loongarch/mm/kasan_init.c     | 7 ++-----
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 7f52bd31b9d..b0b74871257 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -66,7 +66,6 @@
 #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
 #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
 
-extern bool kasan_early_stage;
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 
 #define kasan_mem_to_shadow kasan_mem_to_shadow
@@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
 #define kasan_shadow_to_mem kasan_shadow_to_mem
 const void *kasan_shadow_to_mem(const void *shadow_addr);
 
-#define kasan_arch_is_ready kasan_arch_is_ready
-static __always_inline bool kasan_arch_is_ready(void)
-{
-	return !kasan_early_stage;
-}
-
 #define addr_has_metadata addr_has_metadata
 static __always_inline bool addr_has_metadata(const void *addr)
 {
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index d2681272d8f..cf8315f9119 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
 ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
 
-bool kasan_early_stage = true;
-
 void *kasan_mem_to_shadow(const void *addr)
 {
-	if (!kasan_arch_is_ready()) {
+	if (!kasan_enabled()) {
 		return (void *)(kasan_early_shadow_page);
 	} else {
 		unsigned long maddr = (unsigned long)addr;
@@ -298,7 +296,7 @@ void __init kasan_init(void)
 	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
 					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
 
-	kasan_early_stage = false;
+	kasan_init_generic();
 
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
@@ -329,5 +327,4 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized.\n");
 }
-- 
2.34.1



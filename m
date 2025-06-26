Return-Path: <linuxppc-dev+bounces-9827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D12AEA29D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjP5255Vz30W9;
	Fri, 27 Jun 2025 01:32:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951961;
	cv=none; b=SuBpNs2LaAJG66ZO7EY9Ln0xIMD4lNQYY6z4/r3LLelLcwPiZocXeyxiyGX16f98dlnwriQHMPRoxzrIqPTATNHfAxQ0eTvtXhrZh2ofNiqfdRP8tjmVrdjVSN+HsvqIivdI5U4rZYEL7bnW5XKH0iA4RpRxWrrqOJudE2SulzBwNOPf29W49zPy5qWdQMDuaKgxmrDMN58ITEE0WlOclpYX1z+wVd76YGQcxDljTdnvtBaJ79920aesCQvy0zw4K7w0Z9eug70xmDtjzKCX8hij8sqHaWeNadXtPVd4kXxBERMqYhFQvME7++/u4Ik+1GjYhnb3+P6Kyj2ZtRbZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951961; c=relaxed/relaxed;
	bh=dIODlzXqnC6bR1NnIlD5Ra9HGYOoS6BNr32H/5XQfhE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U7zRQLQo3Mn39XIvFq22jqhpeosxCcLc0CbDuERD1oof7gwPcvTGqctNrzlanoRcVXe2afkXJTtoljIdWKeujExQC1/W9PJ+wdMAf12pBKx9RqTrYSfd6G8CMcYEdMzoKOATss3qjjypz70iZm/3K7iIT4xkNHu92xhDsTXSunZGnzEbhRQo2SLp8PDY8+X+HFEYrpp+ZGArT8RAj+zDwNQWZ4OJs4BOEGVfy5XIQXeK5hETMT3nZUrPpU2jitVPMhZ4qf8/DvLB2qvsOOK2d4eiuzSaO/qyPyAU9f1+A6uD2MXfx6cEpHMWEV6O8l5vv3FP1XXF9HU3XJHsTT23Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=muDh37mj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=muDh37mj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjP42TLjz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:40 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1088983e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951957; x=1751556757; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIODlzXqnC6bR1NnIlD5Ra9HGYOoS6BNr32H/5XQfhE=;
        b=muDh37mjPbOIa72HfYIugBmA8UGQpfZXJIL30PE0tPXQ1Uqc1ICa0qokUhGXjWFm5i
         dcXbnZRZ3ntV7SnIPR15fAN7MiIm/JyDiq/kHktPHUYm3PfKQ9Uvy2TKP6fHV1Q44nYK
         OLWzSh9SNQ3hDb5xLXxh+x7ygnif1NYHzDr5JU24J7MJNoJbOtmAhS3A5kpJb150neZn
         On+f1z0V0ToMFKFDBORtRb/9B8AYD+hZK8Cwd2FIqI6IGyqGajVKAdDEo6vY0QOhBGwn
         4VCmRrurhbqlqXsnt64+fIfVDCmQ71kCwsn1XPMR0Kkh2EoJFxqAluYI+fgROmMY55Hn
         FJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951957; x=1751556757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIODlzXqnC6bR1NnIlD5Ra9HGYOoS6BNr32H/5XQfhE=;
        b=HkVNzut5fR/55yaTUqGK3TQYQophgPBRE9uyRifbv+ihb7b55j40wQQCUu6FOQf6b+
         3CRuJXW3GgS7rn2reoNfUkbbpB7OVIV1TozhFlodpMJK6VV2stm0HYJyHVpu1ib46zRG
         JY8CRNkhsyQCxJ9UaWNDlCplIg6YM2UmA3X9tA9+Camdz1y2IoTSL6HJHAnB6OudZCdz
         SIkdZW6yqGrqPWjT06tvyRShRNo8BLHU8eIEHSF++KoNHt21FGlZmGXdqpi1vjlfxTJ6
         I+eJ+G23BOkwH8yxK0mTvjL3XpaXRYXWnMkwjRipqN/5cJknjl0j1Vp677DR7u2Et8Rl
         kaRA==
X-Forwarded-Encrypted: i=1; AJvYcCXkc7VuTzNmzi+4AlWMsDpjKZtUrrMlNtslZ6L1v6+DdU2ZNOlptz1p0NettyfBMZjZjZE2j+8IKsM902I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywflis26y9zAlPIr13kcBR1TK41eFGBpLEOJ2VrsyV056BoysaF
	5HfSdJEhYNFqRu3pChUhvOBCoaH/aeD8e140acIEjlLjDYwRkfpF6NNx
X-Gm-Gg: ASbGncuxaAnYbU73o8jBsti7j0nz1OV+BfeNpv1pEB0shKJ6WS2Uk3IGDjIU1eXKDPF
	IpTPLy68fKAL5CdxNxu8P33ZswUXGUSiVaLWczBKieSfQD12Uqd3VEQWgbwuo2sT0zmek7i0jj8
	MdB77iVpUvs4G457SsUZBP3owqGvbbF4JIK6mvQyzd9qxfdBnC+0iFihdbb5LIFMPXqxFe3JcZ/
	G/cmNNh4EC5gF0KRajwJ7Lp+Dbn+I5bUb9IJI4G6Ao5RN/y5B447qsk1G5o4N9xEyz+k54lzJs7
	VCKNWBZ/88EPYIlcF+WXC0RSlNhQsrM0N3/FRpvocKOKpYv6QMTg8FDSoGbxyRlSpVpT3cjEjmu
	dqcMTy9zdYNbsTpSo93bcPW2ieKX2gQ==
X-Google-Smtp-Source: AGHT+IGOOgR6U3IUglZM4Cl6ycrypcWsOKlsDtFSbRY/qbGVasvQKBWsuTTYRYjSxtgLuzO8PX+T5Q==
X-Received: by 2002:a05:6512:b8a:b0:553:a490:fee0 with SMTP id 2adb3069b0e04-554fdcf457bmr2652845e87.10.1750951956874;
        Thu, 26 Jun 2025 08:32:36 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:36 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 05/11] kasan/loongarch: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:41 +0500
Message-Id: <20250626153147.145312-6-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
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

Note that `init_task.kasan_depth = 0;` is called after
`kasan_init_generic()`, which is different than in other arch
`kasan_init()`. I've left this unchanged as I can't test it.
Defer to loongarch maintainers.

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



Return-Path: <linuxppc-dev+bounces-10297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00836B08F4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyw2v8Fz3brr;
	Fri, 18 Jul 2025 00:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762488;
	cv=none; b=aJdOkIDzIpCBBx1PjsNaSDqMuCMFWO+A+b/9w6FsZFWvVjKLCgR19tE3Dnr3CLmYFdQIZuFWI6lr4+U5r5kHnw4T4hqRlGeJv//cbUtnSR9gxhsgnUqrcpjPKICOJpHZv1T85QzWLD06L75F9xmtUF9VkZalOqoA3U+7WKb2NvYQE8TQi6hJhYoPMOpWQ6QrP3wQ/I73gac06ORrcbyaOfD5v1oipFrVIojMdRgBs+PBKgiXRYzd94aXb+K4tTpJbw41hByC9PfWdpsi1MMNPYd6CIYaEW434ylR+t1nd1hlVlT4W+Yrqj5USivd2DRENC4rs1y7fFS6FBLNPCK1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762488; c=relaxed/relaxed;
	bh=VQlEQnJy2HJRDhHnfkaTRfud2Lma6wEowy/1dG9z9wI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=me+NiPQ01lOfc2TKbiodTWZsH7DdoNHKXL1lJp2e91Tzha9GCcpi6VWWsnr0ku6xZe/Q25CEXTwpMW4AOULCGANrcMXDpm9ArzAB0X+wC3NXOCCoRjV4UBJGMC9J5zbvqEZyjPwSYtQ2vuoX6LmEStVtPDjsFJJt4+wV1xlBHy7S+3xjQhtl4MK1CqPWsMpHbQmPZ1TP6qTrIrQpOm1HlgR3gpsK57XxH+3FhpMaxLxw9X+714f7XAmdWqoipdnbNVyTu3fzw50uCE0ULaUm05l2yBpd9KwDNL60J2yIKbIh+w8r/hSOWFW+iHxV4y+Qihu5AZkPHoQSI+15KkXRJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q/rJKMNF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q/rJKMNF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyv2p94z2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:07 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54b10594812so1024400e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762484; x=1753367284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQlEQnJy2HJRDhHnfkaTRfud2Lma6wEowy/1dG9z9wI=;
        b=Q/rJKMNFeOc7eZKWspSYAwco8TCyE/OIcKBnLO5r0o7WFlMd9aro/o3WVCy37Lh2TQ
         hdWlAjMctKp0eRKFiSjBnSGDqPiM28ymcpkoV+z4xfwYKIJJSh+z8SCPWJYGU0ekb/gF
         7gAp0NkST01jcRY5uW6DkICMChV0Bex/saeYOKWN/tFVl5lIX0WbGumv9xvgz1z1wFml
         LdRPIgi1aokCRRv15Ncj5DhIig6OENZD41S9Q+bVhJHkg/yd1Svl8QO62C7tHMugKTme
         E4sKffeq4U8Q2+CqyDZLXbOP51/xnNgfaqntfyXaktXBv//WdAdWEo0sOe60iTpwImRE
         9K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762484; x=1753367284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQlEQnJy2HJRDhHnfkaTRfud2Lma6wEowy/1dG9z9wI=;
        b=Pgudh4VcmFsojdxhiMoTEyZ/OKFQ5qWCxU9uhCQqXR/5NZC0yBMbuIIv1yBdjtqzau
         b6/4pm+6Ms7VmTAZgadSGqxipw8A2d1YkCxfHokZ4MpBMm5fpGg+Wve47mrBn9U4gIiw
         03LUt8GToSQEUWkxn0npzVu90J+JhKJg5pFlH/34o6QRfTwnsP8zZXg/Yinn6xjKzeaI
         DneWqm4VfWCTsl+8JSnJBkyDIoT927vtk0YEc9zlMorkpvnsoyX5BmU/Q0N1UvQ6ZpCn
         hrMO9l65jcZEuGHny5/i/tfNksr4h1fkMEgFOOyc0QuAfD5MZBA1gexVFo0/jrPWONlE
         fUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpG3/LJQdrB9d9GoKK0UK2P/oKuMEQBwfoP9aXOA1A+sXgQPOPrOICTOloLYyoJfRqVcFUAh8tX0NlGcw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/pm96puS0eaTUTEnVhZ3OU0mhvEEdVr+XPIOPQ0KKRDNyFi6o
	g/SrPYssJwFOedJGYuO+sOQ/wScYFlPGmL04C7gk24EILaMqX3VqPiPI
X-Gm-Gg: ASbGnct/L+oT7v5Q4Ja6FkvbVW0Q2mOXfrZHGh2UMYs/L+NxjMg714NpsbfkMSzeC/K
	b62Y10cZuY57iE7VQ8yGKXgilE3vOa54t3fYyBy8Imi8nsVQZt36L5y6k+QVWDUgQlkVfWVM4Xi
	yZg/JF0A6PAlpZrbQ0IQrDUFKC04GKlsLH4KnJxp8TEnUSfQg16SykD6Jy4xf9HW+RxkUaP+T0H
	VFd0b6sLxAVMRnsjfpKbSJwqS3VkfgTxJqpWVp2uU4RZKNP6zVsqfoIH4XiUE/P7C5MFfN4icEl
	nXy8uHJ5vuXarqoaqHrdfhdcCbfsMxlyAeWDPa1t8C0giBGoBNs/9JeAoStyQZ00HHKUiwI2eHq
	f/C8Rri1g7n8+j7KAA0HGIoy40m1fSgPMgL7Di+8Hdaa8+OphdPdUqbPSo47FUO6G+En/
X-Google-Smtp-Source: AGHT+IGXa3L1SWxkZTnlyx1w4BEvo8LnYJCQl11jQhxF60PeWT+4RjpJebmC/Vi8BeBawEBpCpZoXA==
X-Received: by 2002:a05:6512:2310:b0:55a:271e:965c with SMTP id 2adb3069b0e04-55a271e97f2mr1332318e87.55.1752762484050;
        Thu, 17 Jul 2025 07:28:04 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:02 -0700 (PDT)
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
Subject: [PATCH v3 07/12] kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
Date: Thu, 17 Jul 2025 19:27:27 +0500
Message-Id: <20250717142732.292822-8-snovitoll@gmail.com>
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

LoongArch needs deferred KASAN initialization as it has a custom
kasan_arch_is_ready() implementation that tracks shadow memory
readiness via the kasan_early_stage flag.

Select ARCH_DEFER_KASAN to enable the unified static key mechanism
for runtime KASAN control. Call kasan_init_generic() which handles
Generic KASAN initialization and enables the static key.

Replace kasan_arch_is_ready() with kasan_enabled() and delete the
flag kasan_early_stage in favor of the unified kasan_enabled()
interface.

Note that init_task.kasan_depth = 0 is called after kasan_init_generic(),
which is different than in other arch kasan_init(). This is left
unchanged as it cannot be tested.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v3:
- Added CONFIG_ARCH_DEFER_KASAN selection to enable proper runtime control
---
 arch/loongarch/Kconfig             | 1 +
 arch/loongarch/include/asm/kasan.h | 7 -------
 arch/loongarch/mm/kasan_init.c     | 7 ++-----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 4b19f93379a..07130809a35 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -9,6 +9,7 @@ config LOONGARCH
 	select ACPI_PPTT if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_DEFER_KASAN
 	select ARCH_DISABLE_KASAN_INLINE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index 62f139a9c87..0e50e5b5e05 100644
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



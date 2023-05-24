Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA370EDA6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:10:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR15P2RrPz3fBS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:10:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UF8PmRqz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UF8PmRqz;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR12q5Tyrz3f6q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:08:35 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5289cf35eeaso4072119a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908513; x=1687500513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF/yqgmO0OQmx/RXJ7rKmP80tBqdzMLehuYCltJdPfQ=;
        b=UF8PmRqzrtN4ASUn74FYkIANH2u8pIYq904IGeL44nmKfrWFqd2ccB2ryqxtAinad7
         W+NRDj6UHTB8xspiNPNKBRIo9RCZEguooz4ArbkqzCavUw/zjVyDZP5n009JQqMDETmj
         joXwztiK08JsvWQJwdLTQqAgA+Ol7j2XFZvp8azgnBZaBl3k4e72ntL24f1rUiHe+9+S
         0XTAw4W6soaWptvbGBfm2IjZzq6Pt7/JpGoK5u5a3qfe0Kp2j2TctgxC/nsSqSG6lktf
         /GqDRYxpNVQzwhz6DlSwZitoV9ioS4FgERCG2ZKsE+638c4D9YgBnN+zKpxNKKiu9D83
         b0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908513; x=1687500513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF/yqgmO0OQmx/RXJ7rKmP80tBqdzMLehuYCltJdPfQ=;
        b=V/snSdQ5/kpem7vTtKQLQ5WzGuMow5pVhsvsc/e5UiyTajZZcAwd+B7hSEe5bCXor6
         DeZNCfJe8QRtdg9ZnrgSJetQDtU96H2nZfTOEXRiqtshg+xWwWJp4HA9e0WiOhDg7D5C
         aR3OqZQwrCX4Ns/Um7ey7jDJsNyszSH9Z62vhrhJgjWhAbni6z5KXaMa2Ru8yZ1AZkYe
         Ahaaqtwl7zARV6dIkO/UPMcehFTDJx9HEZGvr8fjD+wYNNY7ZcdnnfplMyHsCjuiC1dX
         UswpQqfpM2zSC1FrmwDdkbA89JXBrasuiEC2o/B5H76/O/tW4tk1QysL8/Wri3GFpIYE
         pbZg==
X-Gm-Message-State: AC+VfDyzJH2fGIXHw8osp5bqymjXWgdjAa8L10U/M8zZVZcXfn1qaQ37
	cIvzMW/974cmY4xijxSSgMeG42IL3u0=
X-Google-Smtp-Source: ACHHUZ6DFXDPXPO0d2Iev7kqR06ozgfgiHVN51Fn0PtFjY9YaGODbrECoY8Y7seIH13Rox5j6QQWZA==
X-Received: by 2002:a17:903:234a:b0:1ac:a88a:70b6 with SMTP id c10-20020a170903234a00b001aca88a70b6mr21730776plh.31.1684908513162;
        Tue, 23 May 2023 23:08:33 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c14900b001aaecb74f82sm7793019plj.72.2023.05.23.23.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:08:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s: Use dec_mm_active_cpus helper
Date: Wed, 24 May 2023 16:08:19 +1000
Message-Id: <20230524060821.148015-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524060821.148015-1-npiggin@gmail.com>
References: <20230524060821.148015-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid open-coded atomic_dec on mm->context.active_cpus and use the
function made for it. Add CONFIG_DEBUG_VM underflow checking on the
counter.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
 arch/powerpc/include/asm/mmu_context.h   | 1 +
 arch/powerpc/mm/book3s64/radix_tlb.c     | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 570a4960cf17..5cf0e9c953b3 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -261,7 +261,7 @@ static inline void radix_init_pseries(void) { }
 #define arch_clear_mm_cpumask_cpu(cpu, mm)				\
 	do {								\
 		if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {		\
-			atomic_dec(&(mm)->context.active_cpus);		\
+			dec_mm_active_cpus(mm);				\
 			cpumask_clear_cpu(cpu, mm_cpumask(mm));		\
 		}							\
 	} while (0)
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 57f5017111f4..37bffa0f7918 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -127,6 +127,7 @@ static inline void inc_mm_active_cpus(struct mm_struct *mm)
 
 static inline void dec_mm_active_cpus(struct mm_struct *mm)
 {
+	VM_WARN_ON_ONCE(atomic_read(&mm->context.active_cpus) <= 0);
 	atomic_dec(&mm->context.active_cpus);
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 90953cf9f648..8160c1630c3d 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -808,7 +808,7 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 	 * that's what the caller expects.
 	 */
 	if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {
-		atomic_dec(&mm->context.active_cpus);
+		dec_mm_active_cpus(mm);
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
 		always_flush = true;
 	}
-- 
2.40.1


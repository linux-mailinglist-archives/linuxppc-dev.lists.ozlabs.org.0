Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C446C70EDA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR16J53TWz3fNP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:11:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jnqwi6DJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jnqwi6DJ;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR12t3clwz3f5r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:08:38 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae40dcdc18so4212045ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908516; x=1687500516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNTKzgNHoYsYBJ1w6ox2ZWziujVaGJw7eJ2ap0bcafU=;
        b=jnqwi6DJC4WUuMuWbbNEgZvR/B264VWRneOlrpnRbq3cAzVd2M3AAb7bJigwLL3BAu
         fqSgWCIvvx98ehItGimgQt6DIQKYdcZ4f4iN3ihDidmTBWepEtES21u6s3iHGINuwC7o
         MuPP4pwqyUsBfo5HOVlztqY3fS5Xlf9i4Pb5L4B8otXtuwZDQnyK7KpUFUEeAS+lbUWi
         VHtLBlCcTjT4ju8++iGdv5SG+zslN/iiGVn02HNRWIkn1kqqLySPcNlQ27lqW8O7I3RH
         u8LuWzdKPEiKDFHIa4CQDHM1xHjULEhKSDEeubi1ui04Xt3mPKFC7lApNlcuvahyreTa
         msoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908516; x=1687500516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNTKzgNHoYsYBJ1w6ox2ZWziujVaGJw7eJ2ap0bcafU=;
        b=YCyKRGjsczrP7d+DmaG6rCP/5pZL47nh24CH3UDCVuCBzTaeyIWjLI26IzZbGjzcA8
         J6JIzXlBE01rvLBnsNrj9VHrQFqfjm9Jc6eDC4D51rPCpAXRkzMIEQBM55Oy1AZcu8gD
         6vpPEBDrz9WYUd5uz292Pg0VSFZZn+hJH0Kx6yU1nvDsM+uL15hLxTuDoDKuqrCHQcuy
         3Ao9SPb6IhoBG7A3YDR18XgANT8U+Uj8bcLEZ7CW5oqPPLoVLbvKE/BTu1XO1ouahD8a
         6amZfbjOL8FARlnnSU3m58ovsdpgCEU8c0bcSmGcsO08BEGIhpIk55gN3IyjLOa5rLbF
         an/Q==
X-Gm-Message-State: AC+VfDxCiEVw1V4EXpXlEhLeDnOqQwdB5ynkyv+bQhWM68+jM1gx+fFj
	bmwWQqp+m5SmkBqJIs2w66W3jUYH/VA=
X-Google-Smtp-Source: ACHHUZ51XEqCLrHiWbknpM3feLfj7paXYm9dZfTfOigiY7HGI0Tx1SVUWuZ+wp8wJUWCKIFPrvFcIw==
X-Received: by 2002:a17:902:e5ce:b0:1a6:4127:857 with SMTP id u14-20020a170902e5ce00b001a641270857mr20731309plf.5.1684908515832;
        Tue, 23 May 2023 23:08:35 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c14900b001aaecb74f82sm7793019plj.72.2023.05.23.23.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:08:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc: Add mm_cpumask warning when context switching
Date: Wed, 24 May 2023 16:08:20 +1000
Message-Id: <20230524060821.148015-4-npiggin@gmail.com>
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

When context switching away from an mm, add a CONFIG_DEBUG_VM warning
check to ensure this CPU is still set in the mask. This could catch
bugs where the mask is improperly trimmed while the CPU is still using
the mm.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/mmu_context.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 894468975a44..b24c19078eb1 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -43,12 +43,13 @@ static inline void switch_mm_pgdir(struct task_struct *tsk,
 void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 			struct task_struct *tsk)
 {
+	int cpu = smp_processor_id();
 	bool new_on_cpu = false;
 
 	/* Mark this context has been used on the new CPU */
-	if (!cpumask_test_cpu(smp_processor_id(), mm_cpumask(next))) {
+	if (!cpumask_test_cpu(cpu, mm_cpumask(next))) {
 		VM_WARN_ON_ONCE(next == &init_mm);
-		cpumask_set_cpu(smp_processor_id(), mm_cpumask(next));
+		cpumask_set_cpu(cpu, mm_cpumask(next));
 		inc_mm_active_cpus(next);
 
 		/*
@@ -101,6 +102,8 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 	 * sub architectures. Out of line for now
 	 */
 	switch_mmu_context(prev, next, tsk);
+
+	VM_WARN_ON_ONCE(!cpumask_test_cpu(cpu, mm_cpumask(prev)));
 }
 
 #ifndef CONFIG_PPC_BOOK3S_64
-- 
2.40.1


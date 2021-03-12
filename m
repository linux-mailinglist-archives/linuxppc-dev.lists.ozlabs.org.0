Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD5338B75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 12:28:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxk8n5p0Cz3dH1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 22:28:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R4SHxwx1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R4SHxwx1; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxk8P0hvPz3cKT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 22:28:19 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id m186so7200477qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KilxK7cdzAcDImsrYn4FRTgOx1aju2O33SCteVknzS4=;
 b=R4SHxwx1Y6xGLxcY2c4ZD2u01Z350Kb2+LnLijpNN5celAQnC09BWElPHqx+Oc32x2
 x803J/e9v8ZYvtX8FFCNQGNLXZsxBEreZLANcIBYJpjYK0QfDR9eVQaTq/WaqjgW1I5Y
 uxKHXpJx1zE6C2OvaFS3j0InWMwhlIgjr2DQyTRltwwXlSzkvxd0Zm+Drrgu0y+RHwHY
 7JpV3SzJXj08Ch59RnVuQz5F23YV2pDqhQKcLQnHfIaFhMIs0L6iBmmYCO2mIjMoEi0Z
 qfJQ2vMOqRTsWoxQzM03RVGpQnlXZs9Shm/qpUTwZiZZVx8Aj+ywgfleV6wnvf1ZMxI8
 rgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KilxK7cdzAcDImsrYn4FRTgOx1aju2O33SCteVknzS4=;
 b=iM0Gm5pQGZx14aTYWH3dW5+s0koKKKZQ/duwjSJFyiAw7GSmEd2Df2mY9cCU3yzW81
 uSWI7vi2PLxB1c0zBg65u/Ky6TEssID6PLIjww2R/GcgMo0dWb5vs2Ja3/wB95C4sdoJ
 8eYO9l644XlF+MIRo/Efijk5oz/PYBifBcGAVHo6KtFRT6957OOWTaltipMlS4qpPawZ
 MU78THwuKj06U3MAJ/JoR2LGOjFibXHA1/GPPTvBKaMjz0Xz7xa9TtUh3xNLSkFWfu7W
 jtTQXZJQu5Zn9/TAHiMbfQFgcW5Rh3c9QI9cmkVPpJClJ3BX+kXFa85hiC1kRf+ypHZn
 lQRw==
X-Gm-Message-State: AOAM5307CYqcvThfOuzHuv8Wnpl6BS+wo7ZRr5NaG8b2G/p4EwpkvHrx
 jdO6OwpwJ/DejUbOEK28Elc=
X-Google-Smtp-Source: ABdhPJzvjzi04rjt+//P5Mvj0gHfU4HRRyBBNMjnDwsxCvwU+FpBxBKZ6pU7UFby9PbTjgdeFxTiGg==
X-Received: by 2002:a37:4716:: with SMTP id u22mr12417015qka.21.1615548497535; 
 Fri, 12 Mar 2021 03:28:17 -0800 (PST)
Received: from localhost.localdomain ([37.19.198.63])
 by smtp.gmail.com with ESMTPSA id s2sm3826926qti.54.2021.03.12.03.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 03:28:16 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 npiggin@gmail.com, unixbhaskar@gmail.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: mm: book3s64: Fix a typo in the file mmu_context.c
Date: Fri, 12 Mar 2021 16:55:37 +0530
Message-Id: <20210312112537.4585-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/detalis/details/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/mm/book3s64/mmu_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 0c8557220ae2..c10fc8a72fb3 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -119,7 +119,7 @@ static int hash__init_new_context(struct mm_struct *mm)
 		/* This is fork. Copy hash_context details from current->mm */
 		memcpy(mm->context.hash_context, current->mm->context.hash_context, sizeof(struct hash_mm_context));
 #ifdef CONFIG_PPC_SUBPAGE_PROT
-		/* inherit subpage prot detalis if we have one. */
+		/* inherit subpage prot details if we have one. */
 		if (current->mm->context.hash_context->spt) {
 			mm->context.hash_context->spt = kmalloc(sizeof(struct subpage_prot_table),
 								GFP_KERNEL);
--
2.26.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 471943F1865
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 13:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr2tN1bQ7z3cMX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 21:42:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HiAgE7Kd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HiAgE7Kd; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr2rG4J72z3bW7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 21:40:12 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id u1so3684620wmm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FO+lf3R/yjc9KGpGIWIOuNRXRBvu2rIu+mbHK5sUlLs=;
 b=HiAgE7KdhsVN8wOgbXI3aTxGbM4SVbP3/MgUGYmbRYOdUN7j0IBITf8DJuDd/WRSX3
 ei1oOKPqzbpQ7J/ea0n10NGQjVvlhR2zrW2BgHJ0Ieyjr5Px0iSYYk0XuhI2e7+tllF7
 Z2FMFvN+4TgFjiMaUz7MoDfyVewMke+UZbFfKowCo+ZJwT7dxlpjQVelv5cErUbTj6B2
 Wq6qiCdNCmGHyAp/6TK5kaPGW4xJ3WEsHJGyfrPyjdciizc0eAVOWM4gkI92O/ny2YaF
 0/4kINHGepsUB1QFUelgu3kOdStUdTDeGahulKWYB91bt85Zd9uCwYSkcVNtwtOU9pxD
 IefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FO+lf3R/yjc9KGpGIWIOuNRXRBvu2rIu+mbHK5sUlLs=;
 b=M2TxtoltLCTzuc+Cp3c0OVMexExfLofZmetDZsjqqyqkwp3Mo/X5DaULkrJ7/lrO5u
 DHXbHaYq4ODRH7Z/zD3P3DmOLozaKRRCmP1/DPN3G26IRXyRigOn5Q9BtHYHsxKKfdUv
 7w/rexSJc6DpzEYQYzaVnVmf5pBeQShm44poU9eAj0ADLhZvkc0aHVGb69eXT0HRwLSm
 TkQlq1/w/y+WF2c6fkn6WKfCIUbRBuxWXEZTaGNMSNBBnc2ZiTnutr/yTDApK1taKV+Q
 Jo4V6gah7dYpc/GU7wHwz1ulWfwE+CNKpbZz0Sh6IBUXno+7QtgxyYCYF9OwZyH9kohX
 YoYg==
X-Gm-Message-State: AOAM530PvtAYU2LevCq1jUWSnOAtVRDTTEqxJ4AEvlZIUDLcOrx7QdKr
 YXudEwNzvwlp7I2kSeYjC1Y=
X-Google-Smtp-Source: ABdhPJyxKopaR6HtUR6X5E06d0TM/76Uxg1B0Ih/1vlvj9BWdq72+EoGJs3R1ghyv0SDVl4evA11Nw==
X-Received: by 2002:a1c:3909:: with SMTP id g9mr13187347wma.63.1629373209476; 
 Thu, 19 Aug 2021 04:40:09 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id b13sm2650891wrf.86.2021.08.19.04.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:40:09 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc: rectify selection to
 ARCH_ENABLE_SPLIT_PMD_PTLOCK
Date: Thu, 19 Aug 2021 13:39:54 +0200
Message-Id: <20210819113954.17515-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
selects the non-existing config ARCH_ENABLE_PMD_SPLIT_PTLOCK in
./arch/powerpc/platforms/Kconfig.cputype, but clearly it intends to select
ARCH_ENABLE_SPLIT_PMD_PTLOCK here (notice the word swapping!), as this
commit does select that for all other architectures.

Rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK instead.

Fixes: 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6794145603de..a208997ade88 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,7 +98,7 @@ config PPC_BOOK3S_64
 	select PPC_HAVE_PMU_SUPPORT
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
-	select ARCH_ENABLE_PMD_SPLIT_PTLOCK
+	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.26.2


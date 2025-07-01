Return-Path: <linuxppc-dev+bounces-10011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55082AEFB52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 15:57:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWl2v6rmrz30FR;
	Tue,  1 Jul 2025 23:57:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751378247;
	cv=none; b=TXbxNJnFxumXzPsDz2ShTQxKimMwLrM9mmLXa7qkQBwP/90lDBhK96Q4zyaDczJC3PXNcQR00tAbl3LEzmOOybJ0Mp+JP4wL2ANDdMpiTgpzvBUSvwQWsl4VudkG7r9HW7HJBjG8GsQIt9wAO0cKRiEv6CH9n7WcPL9Xq1pReRF/i4piyRSsHAtmLVqplyq/axj5Rn9RSqGHOKJed27rw6GcZRH5ITYMbL7ebtiqwQSBaAUh+woF6CxQAfZ6CzJ++gH9FQpb34CXxrcDqFFZcpMNyfMXzGpgpeac1WiGzySlBtTHWStuDrQ4RUN9VmNJou+CjMpnzTJnHEvy/5EsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751378247; c=relaxed/relaxed;
	bh=V3vZ9R0uTy7fJQAGMm1n+hXS6eJOFIoIbjbMiil+6MI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRyfqFGWxHYrVuj5HPwPBhchtKFJzn5YXbDcJtmfD/ISDKeKjzNA0NNqsrATplCVWqjKLXuyCHwBb7UMnIm7iWAjz7AHc+x+x5EWxVctNmpWYCcBp5phCfIk3Uoidwb1m5xzgt6Ia7EgieBB8rkH6sBPEHWC44GljJq9iEX438AEqm/0lsEIbhENLFupGDi7sCz/UA11irepMeMh8pn9VzfYUaKzNqzPeIN3mXFFvTqDJfFcOgoP7A55RiaEDasfkQ5O7L0RylDvsalNi8B7gXseOPQsdNmJAYN4EQq3JfJnty2/7zkqDhD6X+wqM7cdKEqlcKKeK2YrUPJ2nUdkJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWl2v18jMz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 23:57:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA1D22E98;
	Tue,  1 Jul 2025 06:56:40 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CABC3F58B;
	Tue,  1 Jul 2025 06:56:54 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/23] powerpc/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:56:08 +0100
Message-Id: <20250701135616.29630-16-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/ptrace/ptrace-view.c | 74 ++++++++++++------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index c1819e0a6684..0310f9097e39 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -568,114 +568,114 @@ static int pkey_set(struct task_struct *target, const struct user_regset *regset
 
 static const struct user_regset native_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		USER_REGSET_NOTE_TYPE(PRSTATUS), .n = ELF_NGREG,
 		.size = sizeof(long), .align = sizeof(long),
 		.regset_get = gpr_get, .set = gpr_set
 	},
 	[REGSET_FPR] = {
-		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG), .n = ELF_NFPREG,
 		.size = sizeof(double), .align = sizeof(double),
 		.regset_get = fpr_get, .set = fpr_set
 	},
 #ifdef CONFIG_ALTIVEC
 	[REGSET_VMX] = {
-		.core_note_type = NT_PPC_VMX, .n = 34,
+		USER_REGSET_NOTE_TYPE(PPC_VMX), .n = 34,
 		.size = sizeof(vector128), .align = sizeof(vector128),
 		.active = vr_active, .regset_get = vr_get, .set = vr_set
 	},
 #endif
 #ifdef CONFIG_VSX
 	[REGSET_VSX] = {
-		.core_note_type = NT_PPC_VSX, .n = 32,
+		USER_REGSET_NOTE_TYPE(PPC_VSX), .n = 32,
 		.size = sizeof(double), .align = sizeof(double),
 		.active = vsr_active, .regset_get = vsr_get, .set = vsr_set
 	},
 #endif
 #ifdef CONFIG_SPE
 	[REGSET_SPE] = {
-		.core_note_type = NT_PPC_SPE, .n = 35,
+		USER_REGSET_NOTE_TYPE(PPC_SPE), .n = 35,
 		.size = sizeof(u32), .align = sizeof(u32),
 		.active = evr_active, .regset_get = evr_get, .set = evr_set
 	},
 #endif
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	[REGSET_TM_CGPR] = {
-		.core_note_type = NT_PPC_TM_CGPR, .n = ELF_NGREG,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CGPR), .n = ELF_NGREG,
 		.size = sizeof(long), .align = sizeof(long),
 		.active = tm_cgpr_active, .regset_get = tm_cgpr_get, .set = tm_cgpr_set
 	},
 	[REGSET_TM_CFPR] = {
-		.core_note_type = NT_PPC_TM_CFPR, .n = ELF_NFPREG,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CFPR), .n = ELF_NFPREG,
 		.size = sizeof(double), .align = sizeof(double),
 		.active = tm_cfpr_active, .regset_get = tm_cfpr_get, .set = tm_cfpr_set
 	},
 	[REGSET_TM_CVMX] = {
-		.core_note_type = NT_PPC_TM_CVMX, .n = ELF_NVMX,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CVMX), .n = ELF_NVMX,
 		.size = sizeof(vector128), .align = sizeof(vector128),
 		.active = tm_cvmx_active, .regset_get = tm_cvmx_get, .set = tm_cvmx_set
 	},
 	[REGSET_TM_CVSX] = {
-		.core_note_type = NT_PPC_TM_CVSX, .n = ELF_NVSX,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CVSX), .n = ELF_NVSX,
 		.size = sizeof(double), .align = sizeof(double),
 		.active = tm_cvsx_active, .regset_get = tm_cvsx_get, .set = tm_cvsx_set
 	},
 	[REGSET_TM_SPR] = {
-		.core_note_type = NT_PPC_TM_SPR, .n = ELF_NTMSPRREG,
+		USER_REGSET_NOTE_TYPE(PPC_TM_SPR), .n = ELF_NTMSPRREG,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_spr_active, .regset_get = tm_spr_get, .set = tm_spr_set
 	},
 	[REGSET_TM_CTAR] = {
-		.core_note_type = NT_PPC_TM_CTAR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CTAR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_tar_active, .regset_get = tm_tar_get, .set = tm_tar_set
 	},
 	[REGSET_TM_CPPR] = {
-		.core_note_type = NT_PPC_TM_CPPR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CPPR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_ppr_active, .regset_get = tm_ppr_get, .set = tm_ppr_set
 	},
 	[REGSET_TM_CDSCR] = {
-		.core_note_type = NT_PPC_TM_CDSCR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CDSCR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_dscr_active, .regset_get = tm_dscr_get, .set = tm_dscr_set
 	},
 #endif
 #ifdef CONFIG_PPC64
 	[REGSET_PPR] = {
-		.core_note_type = NT_PPC_PPR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_PPR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = ppr_get, .set = ppr_set
 	},
 	[REGSET_DSCR] = {
-		.core_note_type = NT_PPC_DSCR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_DSCR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = dscr_get, .set = dscr_set
 	},
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	[REGSET_TAR] = {
-		.core_note_type = NT_PPC_TAR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TAR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = tar_get, .set = tar_set
 	},
 	[REGSET_EBB] = {
-		.core_note_type = NT_PPC_EBB, .n = ELF_NEBB,
+		USER_REGSET_NOTE_TYPE(PPC_EBB), .n = ELF_NEBB,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = ebb_active, .regset_get = ebb_get, .set = ebb_set
 	},
 	[REGSET_PMR] = {
-		.core_note_type = NT_PPC_PMU, .n = ELF_NPMU,
+		USER_REGSET_NOTE_TYPE(PPC_PMU), .n = ELF_NPMU,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = pmu_active, .regset_get = pmu_get, .set = pmu_set
 	},
 	[REGSET_DEXCR] = {
-		.core_note_type = NT_PPC_DEXCR, .n = ELF_NDEXCR,
+		USER_REGSET_NOTE_TYPE(PPC_DEXCR), .n = ELF_NDEXCR,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = dexcr_active, .regset_get = dexcr_get
 	},
 #ifdef CONFIG_CHECKPOINT_RESTORE
 	[REGSET_HASHKEYR] = {
-		.core_note_type = NT_PPC_HASHKEYR, .n = ELF_NHASHKEYR,
+		USER_REGSET_NOTE_TYPE(PPC_HASHKEYR), .n = ELF_NHASHKEYR,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = hashkeyr_active, .regset_get = hashkeyr_get, .set = hashkeyr_set
 	},
@@ -683,7 +683,7 @@ static const struct user_regset native_regsets[] = {
 #endif
 #ifdef CONFIG_PPC_MEM_KEYS
 	[REGSET_PKEY] = {
-		.core_note_type = NT_PPC_PKEY, .n = ELF_NPKEY,
+		USER_REGSET_NOTE_TYPE(PPC_PKEY), .n = ELF_NPKEY,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = pkey_active, .regset_get = pkey_get, .set = pkey_set
 	},
@@ -843,92 +843,92 @@ static int gpr32_set(struct task_struct *target,
  */
 static const struct user_regset compat_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		USER_REGSET_NOTE_TYPE(PRSTATUS), .n = ELF_NGREG,
 		.size = sizeof(compat_long_t), .align = sizeof(compat_long_t),
 		.regset_get = gpr32_get, .set = gpr32_set
 	},
 	[REGSET_FPR] = {
-		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG), .n = ELF_NFPREG,
 		.size = sizeof(double), .align = sizeof(double),
 		.regset_get = fpr_get, .set = fpr_set
 	},
 #ifdef CONFIG_ALTIVEC
 	[REGSET_VMX] = {
-		.core_note_type = NT_PPC_VMX, .n = 34,
+		USER_REGSET_NOTE_TYPE(PPC_VMX), .n = 34,
 		.size = sizeof(vector128), .align = sizeof(vector128),
 		.active = vr_active, .regset_get = vr_get, .set = vr_set
 	},
 #endif
 #ifdef CONFIG_SPE
 	[REGSET_SPE] = {
-		.core_note_type = NT_PPC_SPE, .n = 35,
+		USER_REGSET_NOTE_TYPE(PPC_SPE), .n = 35,
 		.size = sizeof(u32), .align = sizeof(u32),
 		.active = evr_active, .regset_get = evr_get, .set = evr_set
 	},
 #endif
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	[REGSET_TM_CGPR] = {
-		.core_note_type = NT_PPC_TM_CGPR, .n = ELF_NGREG,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CGPR), .n = ELF_NGREG,
 		.size = sizeof(long), .align = sizeof(long),
 		.active = tm_cgpr_active,
 		.regset_get = tm_cgpr32_get, .set = tm_cgpr32_set
 	},
 	[REGSET_TM_CFPR] = {
-		.core_note_type = NT_PPC_TM_CFPR, .n = ELF_NFPREG,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CFPR), .n = ELF_NFPREG,
 		.size = sizeof(double), .align = sizeof(double),
 		.active = tm_cfpr_active, .regset_get = tm_cfpr_get, .set = tm_cfpr_set
 	},
 	[REGSET_TM_CVMX] = {
-		.core_note_type = NT_PPC_TM_CVMX, .n = ELF_NVMX,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CVMX), .n = ELF_NVMX,
 		.size = sizeof(vector128), .align = sizeof(vector128),
 		.active = tm_cvmx_active, .regset_get = tm_cvmx_get, .set = tm_cvmx_set
 	},
 	[REGSET_TM_CVSX] = {
-		.core_note_type = NT_PPC_TM_CVSX, .n = ELF_NVSX,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CVSX), .n = ELF_NVSX,
 		.size = sizeof(double), .align = sizeof(double),
 		.active = tm_cvsx_active, .regset_get = tm_cvsx_get, .set = tm_cvsx_set
 	},
 	[REGSET_TM_SPR] = {
-		.core_note_type = NT_PPC_TM_SPR, .n = ELF_NTMSPRREG,
+		USER_REGSET_NOTE_TYPE(PPC_TM_SPR), .n = ELF_NTMSPRREG,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_spr_active, .regset_get = tm_spr_get, .set = tm_spr_set
 	},
 	[REGSET_TM_CTAR] = {
-		.core_note_type = NT_PPC_TM_CTAR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CTAR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_tar_active, .regset_get = tm_tar_get, .set = tm_tar_set
 	},
 	[REGSET_TM_CPPR] = {
-		.core_note_type = NT_PPC_TM_CPPR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CPPR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_ppr_active, .regset_get = tm_ppr_get, .set = tm_ppr_set
 	},
 	[REGSET_TM_CDSCR] = {
-		.core_note_type = NT_PPC_TM_CDSCR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TM_CDSCR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = tm_dscr_active, .regset_get = tm_dscr_get, .set = tm_dscr_set
 	},
 #endif
 #ifdef CONFIG_PPC64
 	[REGSET_PPR] = {
-		.core_note_type = NT_PPC_PPR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_PPR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = ppr_get, .set = ppr_set
 	},
 	[REGSET_DSCR] = {
-		.core_note_type = NT_PPC_DSCR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_DSCR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = dscr_get, .set = dscr_set
 	},
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	[REGSET_TAR] = {
-		.core_note_type = NT_PPC_TAR, .n = 1,
+		USER_REGSET_NOTE_TYPE(PPC_TAR), .n = 1,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.regset_get = tar_get, .set = tar_set
 	},
 	[REGSET_EBB] = {
-		.core_note_type = NT_PPC_EBB, .n = ELF_NEBB,
+		USER_REGSET_NOTE_TYPE(PPC_EBB), .n = ELF_NEBB,
 		.size = sizeof(u64), .align = sizeof(u64),
 		.active = ebb_active, .regset_get = ebb_get, .set = ebb_set
 	},
-- 
2.34.1



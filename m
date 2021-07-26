Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0463D5186
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY4qw1xQXz3bN9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bEfUBBxn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bEfUBBxn; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY4qV6Ck1z2yN5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:17:41 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id b6so11019357pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AA8ZQipvfgqlppLnbOgj5/+0kVQcwsWeFBDKc2UG4ik=;
 b=bEfUBBxnzt363dIXTdDKZQvfcVX6WzKbuWpRvIrjKuDpOA8yArswvdOFfMbfgkvKO8
 9oW2jlntJRo6T90DSidI/+6RsOVhCjhs8Kv2FUjI5Y+41FtnlwRZKZhLM5fbrAMfWZEk
 HSTCbkAveMlNpt6l0OBRCS1rhJsvxuvcXiFQYQs+iMMgUjCkd3OeKKIUathABjFsdi+s
 I8MbYKbSml25Jz6G1WIyedxWe2blW5nHMmNdHiGzpD8pxBJynEoNvrPWCN/FeluCiONd
 zilGkxH/CTVLErOD2YJz8wg6RtNPLJ5GThQ3vAP1ASwppw+z876OAFSMTTrI5IrMvp/D
 x5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AA8ZQipvfgqlppLnbOgj5/+0kVQcwsWeFBDKc2UG4ik=;
 b=n51ZVPdGA5jZAzyeqdLsLmqnR+LCoy4OggaXKsJsk9pVhclpI2S3FHVqMDYfOoT6JP
 1pGU8t8BXMFSc4AtLAcGRK2mqDPCTpIg5h2myP3IT8/39Rme7y8tOs9esVzjEkt23/05
 lPflHWnYOkqpVUNRkdppIOuc2W7mb9+UgoMnoX9tKf1cPjJE/f7VNfxkdGDe9tJbbYl7
 3qn+pU9JWRVkrfBu2bfeV+DV21KOaFAmMCMedM0nWhQByYZpx0sYqPvSMBGpc9AGAgn5
 nbJxpQmDe3W1U5Xe+v6oLMZNpQ/Cwn76CNnwV4ABzZDDWjT4zmX0zSpNoo+XTBRFPemz
 nM3g==
X-Gm-Message-State: AOAM5336uk8k8BrD0zLQ7UdFcb+iDne5U4jCmQ/t+FmPkSl3eLGJ2NH6
 I+Fh7WuaHQdTMA8ywi2aQzKyqENpD2o=
X-Google-Smtp-Source: ABdhPJxtaswoBLn2CzNs5sKkNVcssUUnBSy6VzOd29vYKwyIEltKvld3R+FsX+xcpbGvDNCeLREhpQ==
X-Received: by 2002:a63:1a0f:: with SMTP id a15mr16256316pga.330.1627269459448; 
 Sun, 25 Jul 2021 20:17:39 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id 10sm39123026pjc.41.2021.07.25.20.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:17:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s: POWER9 DD2.3 CPU feature flag fixes
Date: Mon, 26 Jul 2021 13:17:29 +1000
Message-Id: <20210726031730.729934-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DD2.3 missed out on getting its feature flag bits.

This meant when booting with dt-cpu-ftrs, CPU_FTR_P9_TM_HV_ASSIST is
missing (unless the firmware contains it, which mine does not seem to).
And when booting without, CPU_FTR_P9_TM_XER_SO_BUG is set.

In practice this doesn't make any difference to pseries guests, only
powernv.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputable.h |  2 ++
 arch/powerpc/kernel/cputable.c      | 22 ++++++++++++++++++++--
 arch/powerpc/kernel/dt_cpu_ftrs.c   | 14 +++++---------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index e85c849214a2..46bae9624784 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -440,6 +440,8 @@ static inline void cpu_feature_keys_init(void) { }
 #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
 			       CPU_FTR_P9_TM_HV_ASSIST | \
 			       CPU_FTR_P9_TM_XER_SO_BUG)
+#define CPU_FTRS_POWER9_DD2_3 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
+			       CPU_FTR_P9_TM_HV_ASSIST)
 #define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
 	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
 	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index ae0fdef0ac11..9ab97d1fd5a2 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -487,11 +487,29 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check_early	= __machine_check_early_realmode_p9,
 		.platform		= "power9",
 	},
-	{	/* Power9 DD2.2 or later */
+	{	/* Power9 DD 2.2 */
+		.pvr_mask		= 0xffffefff,
+		.pvr_value		= 0x004e0202,
+		.cpu_name		= "POWER9 (raw)",
+		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
+		.cpu_user_features	= COMMON_USER_POWER9,
+		.cpu_user_features2	= COMMON_USER2_POWER9,
+		.mmu_features		= MMU_FTRS_POWER9,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.num_pmcs		= 6,
+		.pmc_type		= PPC_PMC_IBM,
+		.oprofile_cpu_type	= "ppc64/power9",
+		.cpu_setup		= __setup_cpu_power9,
+		.cpu_restore		= __restore_cpu_power9,
+		.machine_check_early	= __machine_check_early_realmode_p9,
+		.platform		= "power9",
+	},
+	{	/* Power9 DD 2.3 or later */
 		.pvr_mask		= 0xffff0000,
 		.pvr_value		= 0x004e0000,
 		.cpu_name		= "POWER9 (raw)",
-		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
+		.cpu_features		= CPU_FTRS_POWER9_DD2_3,
 		.cpu_user_features	= COMMON_USER_POWER9,
 		.cpu_user_features2	= COMMON_USER2_POWER9,
 		.mmu_features		= MMU_FTRS_POWER9,
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 358aee7c2d79..af95f337e54b 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -764,18 +764,14 @@ static __init void cpufeatures_cpu_quirks(void)
 	 * Not all quirks can be derived from the cpufeatures device tree.
 	 */
 	if ((version & 0xffffefff) == 0x004e0200) {
-		/* DD2.0 has no feature flag */
-		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
+		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_0;
 	} else if ((version & 0xffffefff) == 0x004e0201) {
-		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
-		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
+		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_1;
 	} else if ((version & 0xffffefff) == 0x004e0202) {
-		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_HV_ASSIST;
-		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_XER_SO_BUG;
-		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
+		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_2;
 	} else if ((version & 0xffff0000) == 0x004e0000) {
-		/* DD2.1 and up have DD2_1 */
-		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
+		/* DD2.3 and up */
+		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_3;
 	}
 
 	if ((version & 0xffff0000) == 0x004e0000) {
-- 
2.23.0


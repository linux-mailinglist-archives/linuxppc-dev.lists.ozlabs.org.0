Return-Path: <linuxppc-dev+bounces-11519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05168B3C7B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLqZ1sG8z304h;
	Sat, 30 Aug 2025 13:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526074;
	cv=none; b=aa8cKCH/rkrEC/tw1YMJsIX0IJ70++AXFkv+umhzzMAVGFDN94DnQGxnSZy9SUkhbb5yQ3QQbWiu8yyONfrMr98piJHS/ugRC+GbzUmalGV6A6WUlQSgMofyphsle0+yn1ap9qLfxk2mQeSPzAotoBeZa99fk7hkPDaglMhXNG06I77P9ryJNL2MwNlfmKWWlT6MQhAlFvOq45F5koEaR2ezO4r9h41tiIYDaaNUP8kCpLOOthAwZjCOSoixABcgbJhjHwGmrA8IhLtFFTxMojZ5t5FO2mr21y54BFVAq1p2a9Kd/iqyr3A54Z9XwrQl2qTb/t0OHC8s+IaZq3UlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526074; c=relaxed/relaxed;
	bh=87trs5ufqLUhNG1A5zeuN4+VaQpiYCWdt2Jj+O5cjyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOad/eXc3Fk+Ha9GrIYcEKN073ooANm0gEJ1v/Fs/HUSClf/WE6B8B8rIVRWjuYvLqFOcNJ6LdgSXqtOuifqFQlTVUaN2mSrIryAcAVjwyc6hhtrKGxrHqzb81ArEg5QujIkZenO5nNLkzhHB3/tz7M2sEBt/Som5uT81jEANoga7u7/+Lr32xY92lamf7fsKlkUrnT4lphZXqBIfOEP3Uia8Wx55vWBm0tvnNg7po9F+Qpnt24/Wz65VfqnFwJVqwrS3cu/5Xhtza4OzulCdUCYLZwy/+QbunfwfR9dGqApXaifuxpNmdcIBphkKM/zrItXsb2Hx3usFGu3MH8xMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iOHnINHD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iOHnINHD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLqY3zmHz2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:33 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4c738ee2fbso1791852a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526071; x=1757130871; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87trs5ufqLUhNG1A5zeuN4+VaQpiYCWdt2Jj+O5cjyo=;
        b=iOHnINHDYCOdaO5KOyG32ftnN/MSmJUII8AFLotInjhre7g+fOCP9c2JU7iPsGeIlp
         2BJvchxJeXRfMbr/Jg6f5GNkfnHNzPvw4CWUfacCpEemKMMGEUASStayfJXIgkJSiGe2
         SnpCwHlxLN6lg9s4QVWLBdhxXJzLuWH1F9pLyZ3nQhxI8PdSROFXJ4nIgpzSbx3/9wIx
         VPUK1hTKH4ImZxBJD1g5JBTQDANZ2eLDhzrE+eXTUerKUX0p2Kvd3riA+voz/urOskg+
         k/lGbNJs/ITbk9WwQ1kX/vGU3GbI5vqiJANamX1E/D0Cy2Fpmt1uCkDvT7DRREwp2X1X
         LF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526071; x=1757130871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87trs5ufqLUhNG1A5zeuN4+VaQpiYCWdt2Jj+O5cjyo=;
        b=KgV5FXQmGzPzk7JVAqrztEnZRAo4bE0oXwAkaOSvi4S3fFo+YLwlLJb+kRozW0imUG
         rfNrA7HLY9OpY7tnYpfwdQHNwzrKe8jZw5qySnRbb2wkSUMxecS9l8C93zjmcv/mwXt2
         MvKrnD+5zZY8BVcpGGPwvPd7gCZ7BriVP35DHcZsoN1lEIb0RMKCp8UEYaBLja93L2I5
         m3ikWjzYJvVFs1psHkYZqYR8r2eJ8Y04uOq5ffZibtbcDP0b/fBunMmC3LDKUTT5YZZL
         Dn9yRzWMwvibhLDSTftKznSvbPujtVhFcVO95Xx3k5jMIY9gW+wwk5Bvfs/hRWmQUtda
         AacA==
X-Gm-Message-State: AOJu0YwW64G6cfiMSiirYn9GgTJTdc5dgmmrASMRV4XEobEePBgiaWfe
	Yt83ur5DDOcMLXddOHT2NAlz8nHtmUQVij+mSmV8XKG21u/dNizqsNkcNUzfXg==
X-Gm-Gg: ASbGncvKUPM+iWG0PR9ZGu/2MnlAnkD4tIp9efH2U5xCniaytzCZoHwxzmnkGJZzlYz
	zZNZBlu+X0NNxaJiz8JG4x4o4QJaGI9Nspq1t5mvEL2q701bBQv4WdED6UTDdIrD2r8sTlQm6xB
	dp2c9etjloSNfYYJnt1Xbk5HGqAQ8L6oGUj6KW2fVyHSv4bFIWElU+F/Dn1EfXXm0n+7EweWgRV
	K/XEoPiWPVubC0HKwVtNSW9jrMnAVWHQjdeKewPBCkeM+NZKPKdFv/O6xlqz6ccRX+5ImaN7SML
	LHf7lglplLazWRBbRxTXdmcWnVaVxAeV5oKjhrPnZooNDN9C38hvVez79kp6+HySD4O1uITG1nR
	M1jEaiWS7TEPqzsaQFGs0zUCneg==
X-Google-Smtp-Source: AGHT+IHc1XSKwmEeOchTcrVIYHxY5wq4YqdjaTAOjh634alaFC0OPhAW86YkM3KvEPchtHm7yDtELw==
X-Received: by 2002:a17:903:28c:b0:249:1213:6725 with SMTP id d9443c01a7336-24944aef6f6mr11286455ad.50.1756526070970;
        Fri, 29 Aug 2025 20:54:30 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:30 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 7/8] powerpc/book3s64/slb: Add no_slb_preload early cmdline param
Date: Sat, 30 Aug 2025 09:21:46 +0530
Message-ID: <8a654cb9cc8bfc872df0cff5558c787ec44c8f28.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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

no_slb_preload cmdline can come useful in quickly disabling and/or
testing the performance impact of userspace slb preloads. Recently there
was a slb multi-hit issue due to slb preload cache which was very
difficult to triage. This cmdline option allows to quickly disable
preloads and verify if the issue exists in preload cache or somewhere
else. This can also be a useful option to see the effect of slb preloads
for any application workload e.g. number of slb faults with or w/o slb
preloads.

For e.g. with the next patch where we added slb_faults counter to /proc/vmstat:

with slb_preload:
slb_faults (minimal initrd boot): 15
slb_faults (full systemd boot): 300

with no_slb_preload:
slb_faults (minimal initrd boot): 33
slb_faults (full systemd boot): 138180

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/powerpc/mm/book3s64/hash_utils.c           |  3 +++
 arch/powerpc/mm/book3s64/internal.h             |  7 +++++++
 arch/powerpc/mm/book3s64/slb.c                  | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..9a66f255b659 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7135,6 +7135,9 @@
 			them frequently to increase the rate of SLB faults
 			on kernel addresses.

+	no_slb_preload	[PPC,EARLY]
+			Disables slb preloading for userspace.
+
 	sunrpc.min_resvport=
 	sunrpc.max_resvport=
 			[NFS,SUNRPC]
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 495b6da6f5d4..abf703563ea3 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1319,6 +1319,9 @@ static void __init htab_initialize(void)
 	if (stress_slb_enabled)
 		static_branch_enable(&stress_slb_key);

+	if (no_slb_preload)
+		static_branch_enable(&no_slb_preload_key);
+
 	if (stress_hpt_enabled) {
 		unsigned long tmp;
 		static_branch_enable(&stress_hpt_key);
diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index c26a6f0c90fc..cad08d83369c 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -22,6 +22,13 @@ static inline bool stress_hpt(void)
 	return static_branch_unlikely(&stress_hpt_key);
 }

+extern bool no_slb_preload;
+DECLARE_STATIC_KEY_FALSE(no_slb_preload_key);
+static inline bool slb_preload_disabled(void)
+{
+	return static_branch_unlikely(&no_slb_preload_key);
+}
+
 void hpt_do_stress(unsigned long ea, unsigned long hpte_group);

 void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 780792b9a1e5..297ab0e93c1e 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -42,6 +42,15 @@ early_param("stress_slb", parse_stress_slb);

 __ro_after_init DEFINE_STATIC_KEY_FALSE(stress_slb_key);

+bool no_slb_preload __initdata;
+static int __init parse_no_slb_preload(char *p)
+{
+	no_slb_preload = true;
+	return 0;
+}
+early_param("no_slb_preload", parse_no_slb_preload);
+__ro_after_init DEFINE_STATIC_KEY_FALSE(no_slb_preload_key);
+
 static void assert_slb_presence(bool present, unsigned long ea)
 {
 #ifdef CONFIG_DEBUG_VM
@@ -299,6 +308,9 @@ static void preload_add(struct thread_info *ti, unsigned long ea)
 	unsigned char idx;
 	unsigned long esid;

+	if (slb_preload_disabled())
+		return;
+
 	if (mmu_has_feature(MMU_FTR_1T_SEGMENT)) {
 		/* EAs are stored >> 28 so 256MB segments don't need clearing */
 		if (ea & ESID_MASK_1T)
@@ -414,6 +426,9 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)

 	copy_mm_to_paca(mm);

+	if (slb_preload_disabled())
+		return;
+
 	/*
 	 * We gradually age out SLBs after a number of context switches to
 	 * reduce reload overhead of unused entries (like we do with FP/VEC
--
2.50.1



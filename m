Return-Path: <linuxppc-dev+bounces-13567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E6C20CDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:01:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6k80pwCz3dgN;
	Fri, 31 Oct 2025 02:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836448;
	cv=none; b=jnOAPq8HHoKFv496Mj0hXo/PunB9Pv2/Q0Y5bYVeawZPobBdtlC8arlfZ2LZpsbMixjL+/E2C+q8rqoDyCT86UYtgEELxxm+q4teChcXIhHzDocL8VUKsi1bbSB0jD9kxr11jGoUj0gQSBhtiBnoxhnLO45BjwGOsoIWEsM3PHEnq2zVHL+G8A5JaZSy1wVRDDHJBpEFSRXSyh1S63bP3oKAB/jKiUCjFilmbWfbOsJbgQDUW3oaVH/Tojzjl7/rlZkVfYvoBtV1uGO2Hbsc6R1s7K7bwHTvPHZJWjt9GbmodVAoPi6hPBxVvtDXjgFTgHaoRWBIhsJAud4bRmPm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836448; c=relaxed/relaxed;
	bh=oCipIC9WFm0f9e5RB25gND+2zc75b0TjPaSX55WpJDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBsriiaa/nNa/V4KeMTJNYvNcsVuuo6PdF98Smt55X+CLmtgDK4hECj4YtjMnKb6Z0TPJcSbhvEsD+e5KLIIMIrScAahXKNEhi6K+HW0pLcPMTqHUu9Djxry1AqP6o9sHC4voAMsw2V7Ir7axP+s/UrwDCYpt6MVx6HTw3SqxEaMKL8LI7yCN1e4udBmTp99N2xlJTEqjhVzE7z68PK0/BqFfmPd4Xfb4gAg9zMM78WyJRVs/Fd1Xrn5zP7FW4hN10AphLm7yXXrTvfggAf2GEufdhiSO1+5TKZ6K8LJdb51nljF6XIfC+Rz306Gnulpd6Bm006YF8NBKDAjdePUug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GaYCSJuu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GaYCSJuu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6k72r7Tz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:47 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1241120b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836445; x=1762441245; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCipIC9WFm0f9e5RB25gND+2zc75b0TjPaSX55WpJDs=;
        b=GaYCSJuuWiKJf3G/peWHZTcg6DuZ/XjD/0Etzc71LpO/P265wSDlnXBymGI/WtJZC0
         60rZ66q2GX5LPE8htMR3qrf0bWPMl69pi5SKKZqNmuICOHmmlO0RSy5Dh4uk1jdiAdhF
         R4bx9WW6k69PMv/mICK3zZCz4REL1l5wPK9YeYidtrd1uU7tqZePOZqpB4+WX6z7FCLj
         ma1z5+ABCLWAcRdeDX1g7S3uRL6ABnHGHY+0pBgbYzr3CxWlTslY10Rh4NnFshwSXwSq
         hqlaY2JJTfFn5ja8TmlMaVnBU8L6sgzrNeg34J5HPSx2T+Ak3ytBStlJof5Yl8BvgZGD
         Ma3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836445; x=1762441245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCipIC9WFm0f9e5RB25gND+2zc75b0TjPaSX55WpJDs=;
        b=KJ8K8Qq/btvZVkkGThjbfU7GLLI59hTonQXdodjqALN8zoCJkGNvtoQQZUJx7j58qj
         XeBsgg3JC9LBEHl/e7U3QRtbFt93r0j2dGy12hWmDIhwSJvb2iIX4lSel84lEEToBxs0
         WGa2l5XoK+WdrKAmOK7NPKZblEJ3p6vmPV16o9d8slmiAczjostVcutjvrrEeQo/DQaO
         a25gkN8XBJQgv5OyhwhJilKFd1JKZO0cTmpPF8FgtAbAx7Q+OdkZgQeHz4px9xFm9tcZ
         PyCWKPncoDbGqsXmc4+ft69CICRB0QAcirQd2R8y4weibQuNOZq+eIYiedTNDLSoGU3Z
         JI3w==
X-Gm-Message-State: AOJu0Ywz8QY7k6FSMaHU5586nwbBAR7UMhYlhlnhqml6iHKFAM6Xrp+t
	Th/v6VwcwpaLf2K/kv8Zar3lZD/rYHwH4Hq8/OIH5a6f5XCUUa7+YfWkwEwFGqDa
X-Gm-Gg: ASbGnctgKJdV168sKjdMW39ONoAWHjVIs2Bs1nEmz6bSGbgy9NBWgkw58vUQB2ZncDF
	CmTwha/KQWHJrPeUCe5ZltgsAkDYBNdPE3sv324PgAcTeRfCEONcbFecJXjy8RuWigTfwp4Vb8I
	PEnIbX5opMzkLLTJ790ZniC2zWA5WiVh/Z25vCo9Oh/eqv8AOLSPZ6qEAOZ4mltLcBMfS6h45Ah
	YGwLKGhvF2jndLv5hVN1W9VxGnNPeTiuUzjDAryr6VsxoYT5ajFvNrxJeTypBtmFSXW7S6/eIic
	Iz6iKRCLpxPPwnwLPkMy13R2pYOYJ/+Uj+P7d17nKsjxhzyFmJyda2OftNHGQTdiQhGuCu5OcpK
	Hn6CBY2o+wuSmrh3Em06K4bqFtnUlI2QKko7XdYphO/ee/sjKF46Z4C0I2eoC+9kChUVRvMoeB/
	EWYOCC
X-Google-Smtp-Source: AGHT+IHIpxIlOryhwu6fmZF5XODVJYrmlU8HwW1+Vjtlq3ujZOYWhmT2e6Izhy+8slBzufWavTWzMA==
X-Received: by 2002:a05:6a00:b70f:b0:772:2988:31d8 with SMTP id d2e1a72fcca58-7a755f84e05mr234094b3a.2.1761836441501;
        Thu, 30 Oct 2025 08:00:41 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:40 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 11/11] powerpc/64s/slb: Add no_slb_preload early cmdline param
Date: Thu, 30 Oct 2025 20:27:36 +0530
Message-ID: <de484b55c45d831bc2db63945f455153c89a9a65.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/powerpc/mm/book3s64/hash_utils.c           |  3 +++
 arch/powerpc/mm/book3s64/internal.h             |  7 +++++++
 arch/powerpc/mm/book3s64/slb.c                  | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..0b0bb73d1cc1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7192,6 +7192,9 @@
 			them frequently to increase the rate of SLB faults
 			on kernel addresses.

+	no_slb_preload	[PPC,EARLY]
+			Disables slb preloading for userspace.
+
 	sunrpc.min_resvport=
 	sunrpc.max_resvport=
 			[NFS,SUNRPC]
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 31162dbad05c..9dc5889d6ecb 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1329,6 +1329,9 @@ static void __init htab_initialize(void)
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
index 042b762fc0d2..15f73abd1506 100644
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
@@ -412,6 +424,9 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)

 	copy_mm_to_paca(mm);

+	if (slb_preload_disabled())
+		return;
+
 	/*
 	 * We gradually age out SLBs after a number of context switches to
 	 * reduce reload overhead of unused entries (like we do with FP/VEC
--
2.51.0



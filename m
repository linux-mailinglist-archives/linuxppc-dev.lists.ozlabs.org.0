Return-Path: <linuxppc-dev+bounces-11517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463AB3C7AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLqP0D1pz301N;
	Sat, 30 Aug 2025 13:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526064;
	cv=none; b=cvnJNleNTCFyiiG3tx+ZqHN5T1FesSpVzq384HW8d1KGpN+Ln0peEw+VJDk8VYsHyxn/qy51U3b4LHzVnxu9jNwCVVNTSQibOT7ng3IInYcxbIABm2BmrgjICy2o56wnMB3jlB4yGWSlr0lV67DN6JGLTDc3ZR2Vco53dDvjqZjJRwybr5mlGRV1T9MbTEnRooDxEoHcxbKa81tVpjTOHD2mM+dt+RXB28HpJA5qxhV/RC5A3QsnLlUlE3YfUK5XkMv6pD/JSv3swQY1EwT4oZ7veNvI39fkRvNEy8JJo8YCZUvSJd8fR3bUULFvL2MTA49cqvTe0ZNa8dkXn4d4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526064; c=relaxed/relaxed;
	bh=UnEjBvCBPfdd66tSGMGFkkclxXHLvfhPSBG7DN3zyyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2L9eh3FgU6p9as+hykMWBS+GItkwSNze/l0od/Hf28Q1nWGYFGpIeEz09Omlz96llFmL2gNJzxsI2vizsDWTpk+dRWMH/8UgsFfvJ71Q+fOH/KiMpge7ePewLcTBL2WCX47/vMddyTl8y4d59i6gfkRbe0qg30NiMSynJuwaXjOH4JSSnM+iEzGDWR6+oqxYVUSqUt7aIRWlwD9n8VcLdObPLr048NteUghcg/uBuArafeiiSEXJL/mYBbsHr5+MUYhSMmA14CbX2NP3WAf0aEmgvN1popHi5gnTzgNJu4ymeeVmM9kAI/R+K/u/CId7E5iB+PcUpACRvCGv7YSfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cz3JarRG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cz3JarRG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLqN2vp2z2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:24 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso2263039a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526062; x=1757130862; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnEjBvCBPfdd66tSGMGFkkclxXHLvfhPSBG7DN3zyyI=;
        b=Cz3JarRGtHLyvud8IyOxzgOahrHO0FuKs78SJ/MvYOV42QOajc8wPpt8XIAhm50zgf
         sGUKeRqn/ZcesM4aITgpCtRvFwldsUyUXI8XQSIb7zWfVkUKiKWRn+xG1qWi45Dh4ifh
         0fHEtxh5QpHGO/ZChoqd4kBZKBvUsuXrSNQ4qIakAA0MGM5kr5G4Geg6iEzV8MbYqcOY
         IWfkZifZVuxGl55QH6ZwLkqNOkdyu4Lyrc0vvfIdheOxoTJiW/S51FkR96tQMGCUP9am
         KdUQWs5NIqm9zTiGpwiAeel4L2//utHYnAR+bofNFj2LEM4/kgFnqMkZuQElezt7GK4h
         Ikvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526062; x=1757130862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnEjBvCBPfdd66tSGMGFkkclxXHLvfhPSBG7DN3zyyI=;
        b=DYyoVPYLRkYD0/Jqe55Af8+4lYy9qbeplP2kb46hDf874oa9x71Si2ZthwX9LNse0p
         F2xs/KQv3VGOTETmMrrDpyJxh6wsVmW8NEcIZ89qWtvFwxe1yXZt5+7gokWLmU+9p0qA
         ii8mclKj5d0HJHMQp6jK7U+DXkAEp37YD6DrIV0M+X4uXChrmCNqViF5hb6gr2AyDLEz
         ukzbdFV3sq6yXbwERX5xUfDSPP/Xk9ur2KbkLqiyg5fCOymAhinVHJLwt1n4Zw2t1vSF
         H9aCKZLBwIDBM5Eou4E2VFpGzvnjKZ7Nm52Om5z8jKLVp4Wtzd7aGkXFqTVmr6HTekLh
         OQ8A==
X-Gm-Message-State: AOJu0YxOed/cRpvfRKavjLEHlPYh+ghLulGq0bsOgKCDLQsi3d6MdIS8
	HlQMR3a496SVBMwrzaSslsT+fZJ7uOIKKADVKYT7/G+0aeuGkBFDIOBbTyJLNg==
X-Gm-Gg: ASbGncu6/Menr4WQWLmRAzNNPvC52oYWh3NrkqD8ww97ZvuDDYQbg1yFbjXjaTgDH5W
	JuQGQlLxSDYToinai2kyvibt9/LYLyrME1bgEAQEcwtc2PXGKZTwVpIpDZ1o9+iqeBZ/hd6uykJ
	ADunjcI9jKLTkPGBYImCbZHBESD0nCL11lxhUUN1XGB8Iz8l3piYD1/KXweNFI/hySKRbx09uiL
	6WqbmKR7iYZYGPiB3cnxhDU7aPOtco2HxhtbK1mqpXpXJEY+0K9AjfW3s5jljJcd1me6Ne+H4a9
	Wm7KZJacIY62I38AlIcpnUhqf1dJZlibYnANYA9mNes5KY4E+7PQ/dVLiEA0fx+8x92SIpNvp37
	gwxl/Fo6FR/P5Lso=
X-Google-Smtp-Source: AGHT+IH+po0XYsGsDUXmUdlcqDccU/lKfxCdlmrXeZaEF5Hg4Rrs6dyUCCF3JmCysXOM45C8Ze7TWQ==
X-Received: by 2002:a17:90b:48d0:b0:327:dce5:f635 with SMTP id 98e67ed59e1d1-328156dfca5mr1297394a91.25.1756526061640;
        Fri, 29 Aug 2025 20:54:21 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:20 -0700 (PDT)
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
Subject: [RFC 5/8] powerpc/ptdump: Dump PXX level info for kernel_page_tables
Date: Sat, 30 Aug 2025 09:21:44 +0530
Message-ID: <3c3dfc8d2e6c45f9d0fc4a3f969b93a3b7520c46.1756522067.git.ritesh.list@gmail.com>
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

This patch adds PGD/PUD/PMD/PTE level information while dumping kernel
page tables. Before this patch it was hard to identify which entries
belongs to which page table level e.g.

~ # dmesg |grep -i radix
[0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000005400000 with 2.00 MiB pages (exec)
[0.000000] radix-mmu: Mapped 0x0000000005400000-0x0000000040000000 with 2.00 MiB pages
[0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000100000000 with 1.00 GiB pages
[0.000000] radix-mmu: Initializing Radix MMU

Before:
---[ Start of kernel VM ]---
0xc000000000000000-0xc000000003ffffff  XXX   64M   r      X   pte  valid  present  dirty  accessed
0xc000000004000000-0xc00000003fffffff  XXX  960M   r  w       pte  valid  present  dirty  accessed
0xc000000040000000-0xc0000000ffffffff  XXX    3G   r  w       pte  valid  present  dirty  accessed
...
---[ vmemmap start ]---
0xc00c000000000000-0xc00c0000003fffff  XXX    4M   r  w       pte  valid  present  dirty  accessed

After:
---[ Start of kernel VM ]---
0xc000000000000000-0xc000000003ffffff  XXX   64M PMD  r      X   pte  valid  present  dirty  accessed
0xc000000004000000-0xc00000003fffffff  XXX  960M PMD  r  w       pte  valid  present  dirty  accessed
0xc000000040000000-0xc0000000ffffffff  XXX    3G PUD  r  w       pte  valid  present  dirty  accessed
...
---[ vmemmap start ]---
0xc00c000000000000-0xc00c0000003fffff  XXX    4M PMD  r  w       pte  valid  present  dirty  accessed

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
 arch/powerpc/mm/ptdump/8xx.c      | 5 +++++
 arch/powerpc/mm/ptdump/book3s64.c | 5 +++++
 arch/powerpc/mm/ptdump/ptdump.c   | 1 +
 arch/powerpc/mm/ptdump/ptdump.h   | 1 +
 arch/powerpc/mm/ptdump/shared.c   | 5 +++++
 5 files changed, 17 insertions(+)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index b5c79b11ea3c..1dc0f2438a73 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -71,18 +71,23 @@ static const struct flag_info flag_array[] = {

 struct pgtable_level pg_level[5] = {
 	{ /* pgd */
+		.name	= "PGD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* p4d */
+		.name	= "P4D",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pud */
+		.name	= "PUD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pmd */
+		.name	= "PMD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pte */
+		.name	= "PTX",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	},
diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
index 5ad92d9dc5d1..79c9a8391042 100644
--- a/arch/powerpc/mm/ptdump/book3s64.c
+++ b/arch/powerpc/mm/ptdump/book3s64.c
@@ -104,18 +104,23 @@ static const struct flag_info flag_array[] = {

 struct pgtable_level pg_level[5] = {
 	{ /* pgd */
+		.name	= "PGD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* p4d */
+		.name	= "P4D",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pud */
+		.name	= "PUD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pmd */
+		.name	= "PMD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pte */
+		.name	= "PTE",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	},
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index b2358d794855..0d499aebee72 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -178,6 +178,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 	pt_dump_seq_printf(st->seq, REG "-" REG " ", st->start_address, addr - 1);
 	pt_dump_seq_printf(st->seq, " " REG " ", st->start_pa);
 	pt_dump_size(st->seq, addr - st->start_address);
+	pt_dump_seq_printf(st->seq, "%s ", pg_level[st->level].name);
 }

 static void note_prot_wx(struct pg_state *st, unsigned long addr)
diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
index 154efae96ae0..88cf28c4138e 100644
--- a/arch/powerpc/mm/ptdump/ptdump.h
+++ b/arch/powerpc/mm/ptdump/ptdump.h
@@ -13,6 +13,7 @@ struct flag_info {

 struct pgtable_level {
 	const struct flag_info *flag;
+	char name[4];
 	size_t num;
 	u64 mask;
 };
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index 39c30c62b7ea..92d77f3e5155 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -69,18 +69,23 @@ static const struct flag_info flag_array[] = {

 struct pgtable_level pg_level[5] = {
 	{ /* pgd */
+		.name	= "PGD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* p4d */
+		.name	= "P4D",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pud */
+		.name	= "PUD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pmd */
+		.name	= "PMD",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	}, { /* pte */
+		.name	= "PTE",
 		.flag	= flag_array,
 		.num	= ARRAY_SIZE(flag_array),
 	},
--
2.50.1



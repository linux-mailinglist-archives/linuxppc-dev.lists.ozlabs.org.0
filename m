Return-Path: <linuxppc-dev+bounces-13565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2552C20CD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:01:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jx16fvz3dXB;
	Fri, 31 Oct 2025 02:00:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836437;
	cv=none; b=k2NRi9aQyhyYiSkKTs96wMoUTAZ5dfiQnHxd+3KTkYI8Aly4X5D0zndBcmxwS7OCIdbYDdil4pf3mY8sovPqpeenrNyLFUFvV53m85JR1SYwGTHuGSi8jlWPDI9iRLriz9VhOY5CWuOJbVuoFDyeaSJM4ae+GqkVv/8zxtfRkieRCVVB125WCwQLisspt3B4OFA4USknIoW3HpZp+abh3ckQUqJ7rxlnVzRi2HeYcXzb2rkyRZbPd6Hgt24MpNgYsYOCGgbh06C1kJIN0Q0NEN/SC8TdVS64oB7PxwP2wvnvviTJ4hbA3Xq1GuecQdadGK/yU/fUDEGQ4MAB1Z5SXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836437; c=relaxed/relaxed;
	bh=fWI7maNMcmN5xeLR6bdgC2ruBo8bnMsFwv48U2+cLNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyjDGD8MN3YakPqQZykFBhBZm1NcreyOMvmT32nMWcaRGU6iOyPQVIk0xZRcQtI4Gkv0yrNE2y2NfbyJy5IvW5liyLuGNHBiF8nV8zSdJFu1rn/4Hi8Xex8KlmuNjUbw3VDyIKrv8G5pPrXqZxvrWDZNtF03dxENaFR1YfljbEOLLlNUiBWHzQ/dtSPV8zRL/QrM+Z5ZWvvzrmTp6gCAeQMz6WG52bZgzXvqNtBfwqbN3MRALlsWPoMZbNmCrupfbaNoLSwPlW4hMSBlgedBA7p1SHY7wAMtQHqnV7fpYxy9nURa72tywKgqcZl20B7sSqb6Hexx5k8IizgyvzB1mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H0ypIMFK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H0ypIMFK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jw3wBBz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:36 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-781997d195aso883693b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836434; x=1762441234; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWI7maNMcmN5xeLR6bdgC2ruBo8bnMsFwv48U2+cLNU=;
        b=H0ypIMFKlRrskc2eHKWGndbjrI/nvmFNYmq8+UEaak2nXhIsYfBdeuJWOVs0yPMm+V
         3cFQTueg92LiGiULmncAfARYRo7q8Qp+vcq+MpeMn76L3bBF+qjgwiwMOlP1QPYS+7St
         59y3bbpTn9+C/xOB1cbvZDaAbj5pwJjAYk6ZottWBb/uOdYS93YeRePweiRZNSiNB/j+
         T6/ZP9plkE4P8zfj2BfN6aZMdSZhP5j3OGv+EIOoOwRD5dWzDSVphjj8lSsw10nq/npf
         09QnzjXpxHMdCCJRNr4zWa4d/UgYFKPptoXNetlW4ZP/nbaXgbLUPFDekS4Uv1+d29WS
         G/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836434; x=1762441234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWI7maNMcmN5xeLR6bdgC2ruBo8bnMsFwv48U2+cLNU=;
        b=tJmQ2NoJcAqPN2h3utsj8baepFuIn7K46pXkrvJbqSLoIweR6ZEmHpy2Q5lx/0LnWQ
         uHmJDvK6WZRjiBUywRQN2goieSBZjmOYaoa51mVZjenia2EG04AynQsVOvWNMAbmMUSb
         WveKy09XGLcshkuqVERSxygXTFwu9cLUl+RJHOgg3ZUbjCcQPmUppF3l2ZBtpzBacliF
         +SzUJxCnZ5SY5JdJ9wFZhp/phlYFPfg+lJ07S15q6TyKnTAP8rTx4gLVdeg7L38oM0tO
         WXj+IkaiiGmSWTyuc9Tq1k4HSlGqmygHClgjfhVwUIEDN2hda9asbKUX/jQ/rzYjDLjI
         s3Tw==
X-Gm-Message-State: AOJu0YxIDOr7BNYEBh34LOJw7VayyCkDy7oyscjEWzKyiwxF4nHmJhax
	aDUspidDAmtBzEwudKmr1uSgrkQiY5kiRnXxainhAdXDpxQii/EmW+VX+YE6RTnI
X-Gm-Gg: ASbGncskM0iGvowCRSL9F+ttCZpTUZZ3v0g7sdoyT/EetDfHSYMyDT4WKdmog8LwrKI
	rA1CPz8FOIFMhN4htiAAUZ3zqHBftRk/OlEou1o2sSlH/hfZWJvmNuN+TBya/IrctN+/6nA8QQt
	I3wZyEzAj9IZGl5gwN4iRK0Zi6kMqMbaXkZrANX04pQzVGOoKdFbH0gFNlaZ/T0MW8Z+9ExovKr
	dkYmVIzkNXVEe/H6RfcoSkQyBYQ4FwDOSgaWd2O5kLTuFpEuoJUQEqbhBqjYlYxmORb1TqA68T3
	FbXlu1jAPCJ7B0neeYbbzSZKyjQmvSvLkvINEcweB9FFell96X9fmyJxqYTl0GN/rVF4uqZbyE5
	RHm3eu0+XqR1ZYPTUzWeSWkK3JWIpUxOGpeuEBHoCUWS8nr4MvmCHGUYGlp6jsE2i6t+P9w==
X-Google-Smtp-Source: AGHT+IGpFaKcbmxln0j+SgF4zGhCseZR3G1Q9Kby3pLq29gM93QK+RrQueqhH3BIOm4y9cxlIretDg==
X-Received: by 2002:a05:6a00:1743:b0:7a2:7237:79ff with SMTP id d2e1a72fcca58-7a4e290d77cmr8301540b3a.7.1761836433229;
        Thu, 30 Oct 2025 08:00:33 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:32 -0700 (PDT)
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
Subject: [PATCH v2 09/11] powerpc/ptdump: Dump PXX level info for kernel_page_tables
Date: Thu, 30 Oct 2025 20:27:34 +0530
Message-ID: <95defb675ee5607ef3923a1e6aeac39311b8fad4.1761834163.git.ritesh.list@gmail.com>
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
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/ptdump/8xx.c      | 5 +++++
 arch/powerpc/mm/ptdump/book3s64.c | 5 +++++
 arch/powerpc/mm/ptdump/ptdump.c   | 1 +
 arch/powerpc/mm/ptdump/ptdump.h   | 1 +
 arch/powerpc/mm/ptdump/shared.c   | 5 +++++
 5 files changed, 17 insertions(+)

diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index 4ca9cf7a90c9..ff845f251724 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -71,18 +71,23 @@ static const struct flag_info flag_array[] = {
 
 struct ptdump_pg_level pg_level[5] = {
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
diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
index 6b2da9241d4c..e8a21c6dc32e 100644
--- a/arch/powerpc/mm/ptdump/book3s64.c
+++ b/arch/powerpc/mm/ptdump/book3s64.c
@@ -104,18 +104,23 @@ static const struct flag_info flag_array[] = {
 
 struct ptdump_pg_level pg_level[5] = {
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
index 4232aa4b57ea..12aa9eca8b0c 100644
--- a/arch/powerpc/mm/ptdump/ptdump.h
+++ b/arch/powerpc/mm/ptdump/ptdump.h
@@ -13,6 +13,7 @@ struct flag_info {
 
 struct ptdump_pg_level {
 	const struct flag_info *flag;
+	char name[4];
 	size_t num;
 	u64 mask;
 };
diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
index 58998960eb9a..edc69da19b85 100644
--- a/arch/powerpc/mm/ptdump/shared.c
+++ b/arch/powerpc/mm/ptdump/shared.c
@@ -69,18 +69,23 @@ static const struct flag_info flag_array[] = {
 
 struct ptdump_pg_level pg_level[5] = {
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
2.51.0



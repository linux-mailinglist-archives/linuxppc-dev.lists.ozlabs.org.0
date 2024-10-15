Return-Path: <linuxppc-dev+bounces-2250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D443099DB9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGpv70zvz3bxl;
	Tue, 15 Oct 2024 12:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956055;
	cv=none; b=DBnpl2lc/G1Ubo9Hp10CEMeAN9o6ixseir9e83ME8cabjYzLhXOtHjP3E/ayBoPTggFpeLxoyMidGGk8t38jbEXqQTR0f167s2KfFsIkWd0FNHJ4ur0VpFSzhpBHejdDaEz6CmtCRvWZa7ywm6Cos7L8M2iBvFqGQVXV3MARLFqUmy4zyL7eJKJE7E4VdEsvP0905a+mHVTQDOfBfb8v4VljAX5X0Ui36taDscQv/lOQc727+VU5hoXSeUqmh7DgyGLuu5YhLEiGxW4YfrdxQzwkgaD12D2pZc83J1hSP9aycH1OpCdP8qVKe+RobPY9E+HwLiK8sTcKEe/1hXRUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956055; c=relaxed/relaxed;
	bh=U+q0qzhvgy5Htf+jNoj0jpwh62QEw37SjQucvD3DcJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcrKBs5M1k4sTYvEMhGikIZHTNksyF07u17UWrjsFM5slOjX2a6cuhl8pm3xo8qWkVgdReVe1IxMwz+2qvkQHcTmCapWWBk6LodYw1U1Swe/sfJBC4vC86MRMMQ2TTTkFkWyfELL/TaT9NvYMXfP+Y8tMIOpNKJpXwDsZd9/hTKTIgrp15ROqsEEKdwOv2LQ+m/tvODc+rQTi3hCzWaTAB+1HTR/OZxaR3BNj77VWFTBfMYQCe0B5jY9bfqMSiuNknqS6d+y0yg1egJTOAIM1ZqGUMv0vfrCX8wsSeh8hAZCshFKfDx8PknvfwGpEwY7HhS9Zt1y1PlMzo3f7K7now==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B6a4Bg9c; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B6a4Bg9c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGpv1Nzlz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:15 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7ea9739647bso603107a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956051; x=1729560851; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+q0qzhvgy5Htf+jNoj0jpwh62QEw37SjQucvD3DcJc=;
        b=B6a4Bg9czwElzDyyBpUUe8QvNAXT0qX2YgTpWSoE22PlYe479ZIyg3uprEphbFF4FC
         C85zl1ljLbor0kLnNmVq3B0kkDJmjvRlJAV66TjWEqkdauwGAtcT/dtSQoOlHah56GzT
         oUWbLUS25eUl1l/DGhR1aGT1HsuKLkVoYz4ueYYVKybpQxhd9QEVzGBDAbpUV0YEza9t
         a6G9KFLM28LhStV63rwLk4lQPHxWYZz8L4B2jMlQoxSK3SWnVVKMVpwL1RznlAsseyVl
         TuL1CxO9OdWMgoccSQ5sah7kFXCaIuy7SlXjs2cHWHCj2qH0oOzPqMUkA5rhdToBRlws
         YvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956051; x=1729560851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+q0qzhvgy5Htf+jNoj0jpwh62QEw37SjQucvD3DcJc=;
        b=Gcm0Tc1Tv48nF9+lrb7rjcJbbwnTg3DTv13fv9yI1EpnX5u4W7jwgkUxFnyshanPua
         xVGnD8A6JDHY+2Ir99BhpMeICc15Cb05cC7xvRzr7w7XKhBc7ilwFRdt6saddHqhOMRx
         3CMLNPK0oqVqcVu9VfY4fANhu4whawUHa0B6oKi75SqTnuHukUYYfAbV1dzyAYu2Ccfi
         t94Z3klZLIbcLydncsawugRoe/LFCm6NfCDvSg5W738C+0/KOQyVV/18FZ9odl1KRoD8
         L3zn6ikMH+e1oiwl88krj8JQw/q/qWIDpaWyC15P4yUsgAOACZPqteMWP5IgdVKa9O0f
         EqvA==
X-Gm-Message-State: AOJu0YxDPwksrWb41P2UN+pBxWQCThUS1XlzoGiwlnJWy+yvyAVU9+01
	+iMx0kqbl+wQ9dEzvlQaoFw9jK6fSFd975vwNHUEkGTMpOChPxvNp2w09Q==
X-Google-Smtp-Source: AGHT+IEG9dZAng0ihOIRx501nnz2kIcPdMnvgADTGVh5vNpZ9v3ZsQlVB5geCgNicOYeTFxr8a+CGw==
X-Received: by 2002:a05:6a21:710a:b0:1cf:9a86:6cb7 with SMTP id adf61e73a8af0-1d8bcf2c37bmr19861897637.20.1728956051333;
        Mon, 14 Oct 2024 18:34:11 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:10 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC RESEND v2 05/13] book3s64/hash: Add hash_debug_pagealloc_add_slot() function
Date: Tue, 15 Oct 2024 07:03:28 +0530
Message-ID: <7fc9a78423fceda0bfd07f80583a7c9c0938e339.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This adds hash_debug_pagealloc_add_slot() function instead of open
coding that in htab_bolt_mapping(). This is required since we will be
separating kfence functionality to not depend upon debug_pagealloc.

No functionality change in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 82151fff9648..6e3860224351 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -328,6 +328,14 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
+{
+	if (!debug_pagealloc_enabled())
+		return;
+	if ((paddr >> PAGE_SHIFT) < linear_map_hash_count)
+		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
+}
+
 int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
@@ -353,6 +361,7 @@ int hash__kernel_map_pages(struct page *page, int numpages,
 {
 	return 0;
 }
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot) {}
 #endif /* CONFIG_DEBUG_PAGEALLOC */
 
 /*
@@ -513,9 +522,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-		if (debug_pagealloc_enabled() &&
-			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
-			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
+		hash_debug_pagealloc_add_slot(paddr, ret);
 	}
 	return ret < 0 ? ret : 0;
 }
-- 
2.46.0



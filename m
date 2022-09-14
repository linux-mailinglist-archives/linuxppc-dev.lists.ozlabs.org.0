Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 682985B8C38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPsb3RxQz3c74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:49:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAeSAk/1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAeSAk/1;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqj68Lrz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:48:01 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id ge9so3469777pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+F7LKKo6dcwAnq4akvLNV1O1Dd3/7gNACx9QbDE55TI=;
        b=fAeSAk/1KW2QLjuXTGjn999UjL47hmKmjlnVKM5nB0bf+a498iA8Mh2296ejh0oQ2I
         qioY6P8Crj3XoZo8NS1oTHVuYt5OKsqHsNH/6X5CIa1afhYnwRGxNB4k7FlG3laoG+qL
         gW2RIMrKdopRLyzT/9WbagLKCrN7jEZkt6aNXmtPHz0K+/PNcatonwIPJ5uFhIm+b0S7
         P/4GqcUwajz0DK5gjHEyHtl5aroD+fFyke/IZO8NSz+AzSzdoPA+cEMWfHGB6qzFDJd2
         EJkhOg1XjKl71a0IogXq9Iigigz2BpNlVYxg3OgSlKfs+/K8PGGVO+oeh83IHrwhV1Mz
         /OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+F7LKKo6dcwAnq4akvLNV1O1Dd3/7gNACx9QbDE55TI=;
        b=NIV6+2/goazeAtClZDJQn7lR6Qg+LcHiV6JbA1HU0XsstCbuv3MDNNMhGtmWZUM+Le
         Qokd6LAqPg8biJVpO01DaNg9sYPUtab/vYkBn0Cxpf3KiO3FdHByuXhLVsM9P545OPzW
         kbLl9W6u0A374VYs7FPeTnNiqpzgl15TXbbKaeIH5+hmyEC5Z9hSnIeIj9YU39BsbzlY
         FvHqmzy9Ij/v2pmWDlBUMyy4exRmzLdWdhyYTNQyX/kGZhgTcUapO0HMrTgM7KI15phn
         yw26SNRB2GRKaJKH55uFw53Gp2tgKl5A3AP/8CDmE22f6zjEMiQJqrcREafDmMSpZaBJ
         ue2w==
X-Gm-Message-State: ACgBeo015vj02Zdb86YX4/QS/KoJZeKlzmf32D7mmwmVr4neeCW9IVQt
	jo6OtKLLJQEwQBBLPvGdAPVahYuvR5M=
X-Google-Smtp-Source: AA6agR7oeSZunMsYO2+DikG/FkvtJXGtDT4a1Nq5R9vSWj+rpHM/aTYw+++g0kd9kJR9WBNkUKJjzQ==
X-Received: by 2002:a17:902:e312:b0:176:9348:1f6e with SMTP id q18-20020a170902e31200b0017693481f6emr37287864plc.14.1663170478550;
        Wed, 14 Sep 2022 08:47:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:47:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/7] powerpc: move __end_rodata to cover arch read-only sections
Date: Thu, 15 Sep 2022 01:47:41 +1000
Message-Id: <20220914154746.1122482-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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

powerpc has a number of read-only sections and tables that are put
after RO_DATA(). Move the __end_rodata symbol to cover these as well.

Setting memory to read-only at boot is done using __init_begin,
change that that to use __end_rodata.

This also affects boot dmesg, is_kernel_rodata(), and some other checks.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S        | 3 +++
 arch/powerpc/mm/book3s32/mmu.c           | 2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 arch/powerpc/mm/pgtable_32.c             | 5 ++---
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index fe22d940412f..90ac5ff73df2 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -210,6 +210,9 @@ SECTIONS
 	}
 #endif
 
+	. = ALIGN(PAGE_SIZE);
+	__end_rodata = .;
+
 /*
  * Init sections discarded at runtime
  */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index a96b73006dfb..e13b883e4e5b 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -240,7 +240,7 @@ void mmu_mark_rodata_ro(void)
 	for (i = 0; i < nb; i++) {
 		struct ppc_bat *bat = BATS[i];
 
-		if (bat_addrs[i].start < (unsigned long)__init_begin)
+		if (bat_addrs[i].start < (unsigned long)__end_rodata)
 			bat[1].batl = (bat[1].batl & ~BPP_RW) | BPP_RX;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index ae008b9df0e6..28332001bd87 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -541,7 +541,7 @@ void hash__mark_rodata_ro(void)
 	unsigned long start, end, pp;
 
 	start = (unsigned long)_stext;
-	end = (unsigned long)__init_begin;
+	end = (unsigned long)__end_rodata;
 
 	pp = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL_ROX), HPTE_USE_KERNEL_KEY);
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 698274109c91..2305f34bcc33 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -228,7 +228,7 @@ void radix__mark_rodata_ro(void)
 	unsigned long start, end;
 
 	start = (unsigned long)_stext;
-	end = (unsigned long)__init_begin;
+	end = (unsigned long)__end_rodata;
 
 	radix__change_memory_range(start, end, _PAGE_WRITE);
 }
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 3ac73f9fb5d5..112af8c5447a 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -158,10 +158,9 @@ void mark_rodata_ro(void)
 	}
 
 	/*
-	 * mark .text and .rodata as read only. Use __init_begin rather than
-	 * __end_rodata to cover NOTES and EXCEPTION_TABLE.
+	 * mark .text and .rodata as read only.
 	 */
-	numpages = PFN_UP((unsigned long)__init_begin) -
+	numpages = PFN_UP((unsigned long)__end_rodata) -
 		   PFN_DOWN((unsigned long)_stext);
 
 	set_memory_ro((unsigned long)_stext, numpages);
-- 
2.37.2


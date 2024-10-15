Return-Path: <linuxppc-dev+bounces-2253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD199DBA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGqB12kxz3c4l;
	Tue, 15 Oct 2024 12:34:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956070;
	cv=none; b=J6hPg5/9nQRqsORUlTEBoHji85aXFUl++0JmRslWrwcA9ocBrtjR1DpAgAwu2YwRCnuRjIe3LnPSUtw5Jw5TgJVK9yoy5H0B7iHZ+g89g8xmV6nOShNCWO7jyX0CzmfaC8hwcd3c26NBruwr3aaaXTzaBCkfWOkcF//pYB4QyL3yBT2boUy/fGkLdnxmooFbm98QtAvBw43d+wl/LNFmx/pjdeNAMy4VEt8d94pXcCctob1DDTGZ3DM2gbdSV4/PHsaW1+PrLcbzhjiB7Haw6neVeTzuZBEf9/u8rBVqLF8eyKSQVu2bYTNrooNu7cjjjhkaangMhI3ytKiSmMmZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956070; c=relaxed/relaxed;
	bh=ww6ZbzhcNbPuRWG0GzwKnAEreEL780mKVa0cmRg0+f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbSdxODPGDvgBBHHHwOfAknzz0gQ8WvyAuklLnX3JpAqwdk08guVWbdrYFxLSLjDKi5gYupxRFc1a13IX80BfrOvuBTILrV3U8hwkKAHDNmPkstQ22lnpTP6k4UbNbmuNylBvsgiEaAkxCa9hI7U6RGeGA+6QRGifqbdD9cZGp4ma7esx5DVEYdGtrlKgud5pAEpVilRbtQ6SuCCFE6HmWgl1kLc1JfrMZXX8RKFafHCHKpGVYb4IsdhUmJ3OD8UqwaM5LxV2ZDT8MLSL2K847fUU2XaYAS2fvoCwK+rk3Z6itd05jAjPpcB1qSSQIWiXTJiKgJksnPg8mBFxpS6bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PKiNr3kL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PKiNr3kL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGq91bNHz3c4f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:29 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso3347986a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956066; x=1729560866; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ww6ZbzhcNbPuRWG0GzwKnAEreEL780mKVa0cmRg0+f0=;
        b=PKiNr3kL0OHbD2sQ4fpQcvCnccyPpSljSyhWmatLZfrjmr7FVaIQCbwahgtUanQKLs
         Ibk4pVjZu6jJQyjINx0UUS3ht+B4xNdM2zhqhqsRE0Igs4m5SiEcWUso9ZLr1bAFnx6W
         raCYef/P99ExJPyHbZIs8joQG6tmrqXmTQJ6RlWS6H7IZbWbKx8JtI7zNbdsLbz8+sQv
         wwnHzrt605lyeoSCccVDgc8tba1O2JyFVhpYKLa/mLnkfOKgDjxmFdfQoXDEjMheSr6u
         DlXDyzLlvvyvkBSCtiCHKeF4KDQMsofCMZ5y4itaKt5NnxVgWnbGkxG4c46vbquLND+T
         2pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956066; x=1729560866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ww6ZbzhcNbPuRWG0GzwKnAEreEL780mKVa0cmRg0+f0=;
        b=Ae3O493O4wf1n2QM5doB2XE1ICWkZ1vgkuTpkqvDm4SMOls4/aA3B9T+o1osaLQwbC
         5aLNgzUMRXKURN7KD9JLKgDeGrzME/dbgREX16Mz1KlKJXSTkASNVkDecydOT9Et9MGL
         GssHk0CSlxxPuFMYPw5vpeqeJrKqfJD5VWSYiA8OvRPW4AwBWQmCrug1MgMPVwRYqKpi
         EyATqjr/Ur+oBvPmJs9Ragro4LnuBbpOug2PrwGoU84Jt9gmXTBvqVS0V/P+rydROCP3
         jgSzsa8zqinN69FfQSRNAuQpEaEcTfcvrH89dsCRjtwxaiwKLr6gNWVOID5mV4v3AKlQ
         vJHQ==
X-Gm-Message-State: AOJu0YzcdsuJsRTyUxPFZ6CLRZBmXfJW0nKlVr9JHKUiU+iWY8NDFVBu
	si/10nFAgVOBaj3mhCGW0KvCcgS290e/K2kho00trA7MCT6QS6EGqB8vnQ==
X-Google-Smtp-Source: AGHT+IHGZTaTUSSUJMjQoBpL1FZpf4KVi65Lqy7OyMEzvzFSJ0mjrxB0rW6XRaLy1i6Ch9oXLcIlMw==
X-Received: by 2002:a05:6a20:2d0b:b0:1d8:b060:37c6 with SMTP id adf61e73a8af0-1d8bce4272amr19010970637.0.1728956065840;
        Mon, 14 Oct 2024 18:34:25 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:25 -0700 (PDT)
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
Subject: [RFC RESEND v2 08/13] book3s64/hash: Make kernel_map_linear_page() generic
Date: Tue, 15 Oct 2024 07:03:31 +0530
Message-ID: <0ecad6f4f0d71fd8eb92b437315e981d23a14bca.1728954719.git.ritesh.list@gmail.com>
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

Currently kernel_map_linear_page() function assumes to be working on
linear_map_hash_slots array. But since in later patches we need a
separate linear map array for kfence, hence make
kernel_map_linear_page() take a linear map array and lock in it's
function argument.

This is needed to separate out kfence from debug_pagealloc
infrastructure.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 47 ++++++++++++++-------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index da9b089c8e8b..cc2eaa97982c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -272,11 +272,8 @@ void hash__tlbiel_all(unsigned int action)
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
-static u8 *linear_map_hash_slots;
-static unsigned long linear_map_hash_count;
-static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-
-static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
+static void kernel_map_linear_page(unsigned long vaddr, unsigned long idx,
+				   u8 *slots, raw_spinlock_t *lock)
 {
 	unsigned long hash;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
@@ -290,7 +287,7 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 	if (!vsid)
 		return;
 
-	if (linear_map_hash_slots[lmi] & 0x80)
+	if (slots[idx] & 0x80)
 		return;
 
 	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
@@ -298,36 +295,40 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 				    mmu_linear_psize, mmu_kernel_ssize);
 
 	BUG_ON (ret < 0);
-	raw_spin_lock(&linear_map_hash_lock);
-	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
-	linear_map_hash_slots[lmi] = ret | 0x80;
-	raw_spin_unlock(&linear_map_hash_lock);
+	raw_spin_lock(lock);
+	BUG_ON(slots[idx] & 0x80);
+	slots[idx] = ret | 0x80;
+	raw_spin_unlock(lock);
 }
 
-static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
+static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long idx,
+				     u8 *slots, raw_spinlock_t *lock)
 {
-	unsigned long hash, hidx, slot;
+	unsigned long hash, hslot, slot;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
 	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-	raw_spin_lock(&linear_map_hash_lock);
-	if (!(linear_map_hash_slots[lmi] & 0x80)) {
-		raw_spin_unlock(&linear_map_hash_lock);
+	raw_spin_lock(lock);
+	if (!(slots[idx] & 0x80)) {
+		raw_spin_unlock(lock);
 		return;
 	}
-	hidx = linear_map_hash_slots[lmi] & 0x7f;
-	linear_map_hash_slots[lmi] = 0;
-	raw_spin_unlock(&linear_map_hash_lock);
-	if (hidx & _PTEIDX_SECONDARY)
+	hslot = slots[idx] & 0x7f;
+	slots[idx] = 0;
+	raw_spin_unlock(lock);
+	if (hslot & _PTEIDX_SECONDARY)
 		hash = ~hash;
 	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
-	slot += hidx & _PTEIDX_GROUP_IX;
+	slot += hslot & _PTEIDX_GROUP_IX;
 	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
 				     mmu_linear_psize,
 				     mmu_kernel_ssize, 0);
 }
 
+static u8 *linear_map_hash_slots;
+static unsigned long linear_map_hash_count;
+static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static inline void hash_debug_pagealloc_alloc_slots(void)
 {
 	if (!debug_pagealloc_enabled())
@@ -362,9 +363,11 @@ static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
 		if (lmi >= linear_map_hash_count)
 			continue;
 		if (enable)
-			kernel_map_linear_page(vaddr, lmi);
+			kernel_map_linear_page(vaddr, lmi,
+				linear_map_hash_slots, &linear_map_hash_lock);
 		else
-			kernel_unmap_linear_page(vaddr, lmi);
+			kernel_unmap_linear_page(vaddr, lmi,
+				linear_map_hash_slots, &linear_map_hash_lock);
 	}
 	local_irq_restore(flags);
 	return 0;
-- 
2.46.0



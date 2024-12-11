Return-Path: <linuxppc-dev+bounces-4021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B79EDB76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:29:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sH30cVGz30fM;
	Thu, 12 Dec 2024 10:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959711;
	cv=none; b=T/ewTZPjL1BHi7DAc1rLiPulsHAm9jQumXwbQ4/kxE54SMHJ4uH+/ZR7ld+4TLaui+lm/x3wxWfIcL3Qe6CY8GpW+ggtpDPo/d5dihcgZLjNDyWOzeohd2hT9tWv7I1DgNZfhH1T6qHvsT2DH4naKI9ALDiPIDOOA9PI3sQPIXqz8fIRpITRXpMowcHXVc0MMC5sWZ2aiMY07Lu5UR41ZM/B6lnS0ba2JtkBEWyjn0Q7m2xTnwQIoPjhTzsR/rd1fl1u6lXbQYH68k/XBHvp3hMVcMuDZxRyeNLeLGtyLwu+i8uwwz7jKysB79o+Sa3xJMbrtUELj52HcVyE5p6tOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959711; c=relaxed/relaxed;
	bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HSaE/sgyCSbGWDGcx5aUHp6pMDjk8GPC3gLzeb05E96DFxgSnpvc73Ia0abjZ11u8FGXuWw31SQwE202i4ciBTxCZUeIHR2197NjlEZeNwpIHVwFnSV1qA5QfAkem1VSz/yYO+1rz3pYmAcUeG2iWxPGUrRSZ/VQBwZkvjr6II5HKpMZd4WuqOFBMZEgrXBKqKtd0Ejjl6iV+iTm7NbwRmneqx2oAEtO+UsaPzR36QGJ6KXWG1H372KVHvZ/VEykmLHkMmwIfPwVNzmiK19MXVTwsliOsct46LQT0KzvIU+WPBOZO0pz231hW4Rnx66WySHmbkkw8uk9JDdv4+PCbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cZGcrz6D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3hcbazwskdacrhslzozpunonvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cZGcrz6D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3hcbazwskdacrhslzozpunonvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sH21k5jz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:30 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7eaac1e95ffso33106a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959708; x=1734564508; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=;
        b=cZGcrz6DbhlSTLri9mgHgB+paA4jcc1Xh07Lsiw/HC27gXDCB6i6m0Py3vwlHtnSkL
         H7BVXIPgFTNuKnxRkOrO3dq3VXvQ67D3GLNoAR/VRCQFLoFDlW6wA0TMUxOO1MKas35n
         wFw5V4sqbRneGEQTVKyUftQRMUVVRaErxMZy20JBnG0Br2C+hHMsDczcQVlTmHg98+vY
         kY3OKudWCEVneQqbSA5+1+1BYTf/sJbRNineW4ByoeFLUhzmOPRQICvtR3KNEucQ5cWl
         oWzeYChhMT0rMj0fYBGFQKv3lSd2ngLhJgHDiUyLe4kN5Z+SFzVOcm46muz6zHnFMDaC
         uBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959708; x=1734564508;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHbDZ++mGE8tEdFCxijZAS2pZkYuZT5989Fg2aOx0oY=;
        b=Tpolttm5YR4UwZr+H3HR0f6a3YoxVW13DirsBdep/NIlF/F2W6SBZJXIc81qnqwH4b
         MCljvLaA0b9W5+fZxCvwi5/7uV/JD5gF3Q8Nd9hSmonQ6o+IeUSdzOXBX4AdeZPBIpnw
         KSJkJMWT3Pip1daHFigjZ7x7d6hQVhuKdUYMGs2OnFctj3QJDg//tyCy1387nZNuShXQ
         YfOQLvx8PnAxZ9c13eDxDjr2fHeGUH0ujAlwtcuugZUsADwr+4qVD7261wtH/Mv7QQTy
         FcUE2ROTUTrxWkM/XLJdhhIm9IDNJ1Z/IlxPK/KeZG6/gtnDMbALaAlgenOZQHVos5Dt
         94Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUz8V95Dnotmz7dN6Zs+s5RhAptxG/9qSXnwdglFnPSiVV9xX+mlXZLhq12mSrmqUu4IlJFw+uY2hhEFZ8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNhnCLakQk6PGisW5uZYgfIc8+3/Oa3nopdY8me+XQ55jHDJu2
	H7FP0aVUvIh33WxkmiRoMcgX+t2qMO5j4AHpP8e6TSl1LlxsEsY8bV8AJbm19fkkFlN7+faMvrL
	V1AewDd82ym3Wi/dHBd41Kg==
X-Google-Smtp-Source: AGHT+IGlmctwmnr0LOvk4eyOoUS2Mz0NPFGCSegKhSqs8wGodxRb0W3o7XrsirlslhQ66CcLZRwSCG2H88EXSdEssw==
X-Received: from pgbdl12.prod.google.com ([2002:a05:6a02:d0c:b0:7fd:1eba:c2dd])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:150b:b0:1e0:d89e:f5cc with SMTP id adf61e73a8af0-1e1ceaabbb2mr1312325637.11.1733959708164;
 Wed, 11 Dec 2024 15:28:28 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:54 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
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
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP")
fallsback to PAGE_SIZE alignment instead of THP alignment
for anonymous mapping as long as a hint address is provided by the user
-- even if we weren't able to allocate the unmapped area at the hint
address in the end.

This was done to address the immediate regression in anonymous mappings
where the hint address were being ignored in some cases; due to commit
efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").

It was later pointed out that this issue also existed for file-backed
mappings from file systems that use thp_get_unmapped_area() for their
.get_unmapped_area() file operation.

The same fix was not applied for file-backed mappings since it would
mean any mmap requests that provide a hint address would be only
PAGE_SIZE-aligned regardless of whether allocation was successful at
the hint address or not.

Instead, use arch_mmap_hint() to first attempt allocation at the hint
address and fallback to THP alignment if there isn't sufficient VA space
to satisfy the allocation at the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/huge_memory.c | 17 ++++++++++-------
 mm/mmap.c        |  1 -
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2da5520bfe24..426761a30aff 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1097,6 +1097,16 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	loff_t off_align = round_up(off, size);
 	unsigned long len_pad, ret, off_sub;
 
+	/*
+	 * If allocation at the address hint succeeds; respect the hint and
+	 * don't try to align to THP boundary;
+	 *
+	 * Or if an the requested extent is invalid return the error immediately.
+	 */
+	addr = arch_mmap_hint(filp, addr, len, off, flags);
+	if (addr)
+		return addr;
+
 	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
 		return 0;
 
@@ -1117,13 +1127,6 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (IS_ERR_VALUE(ret))
 		return 0;
 
-	/*
-	 * Do not try to align to THP boundary if allocation at the address
-	 * hint succeeds.
-	 */
-	if (ret == addr)
-		return addr;
-
 	off_sub = (off - ret) & (size - 1);
 
 	if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
diff --git a/mm/mmap.c b/mm/mmap.c
index 76dd6acdf051..3286fdff26f2 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -814,7 +814,6 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 	if (get_area) {
 		addr = get_area(file, addr, len, pgoff, flags);
 	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
-		   && !addr /* no hint */
 		   && IS_ALIGNED(len, PMD_SIZE)) {
 		/* Ensures that larger anonymous mappings are THP aligned. */
 		addr = thp_get_unmapped_area_vmflags(file, addr, len,
-- 
2.47.0.338.g60cca15819-goog



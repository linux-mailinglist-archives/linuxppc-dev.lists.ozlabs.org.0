Return-Path: <linuxppc-dev+bounces-888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D3968E34
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 21:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyJFs74VJz2yLT;
	Tue,  3 Sep 2024 05:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725304145;
	cv=none; b=MEcNxs1OrjxUHy8rl72JqAChln0nAFR/qaVKwQyRTpvjOOlY46Eic7F5Eqstf5TTUcrAUBq6mu5Cyv7fix11K+GqmLqSvr2xHuVtG+Ww/NygPvj1DQPN09XUJz67Qohp8zaEAiNtRmVbZ2uX+Z6Mi8S4K++kzVLgSJPlz+jds+s+KoGc8nGbzqUflMaqscJO95Q95zMJgfGson9DuUMD398pEEFjBBfYx4o6FgLhnofWSxXB29Bqlqj8kZSjnpdq8f4hF/VhqVrizRL+S1Pu5w3zjzZXVOXb0Yr4bTuW/8BwgweYvsyf6Fv/qs9ifbQP3CzxQUIt+h/0Eay6h3USHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725304145; c=relaxed/relaxed;
	bh=dv2m7wDXPS+Km/Z6zIsCY4XQSEFAckNB98z2E/oK1VY=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc; b=bzwmAP51sKKUJLNvr5Cte6NuB+o7T2dZeg49gU3ogq2XNWd4nj0t5OS48FASFC2MUqMw9z2pEcdC/UrVVXpHXQ1NzgOC8C1v17XsdSXeXA5JdZQVR3H7ICWSRlahf030f34TDEGjWgndj19QYXh+WIB0PkTWfiTJvdvO5P0jWlI2AfI0FSmXYNVZSKMGmcSuJ4KIhe0jPQt6to3X5qISdInygALMQKnFQVCaTQrTWSjQLJ0YxYkmJxM5UNsqBIvw2SUAHiWfnmbcl7QCrJIBTbjuOqCe4eb3DdUlnoOel0n4jj90hWIrA6eHFJZ/hdjjOkKzi/PZLquZSFoek4tpZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ufsKnZLL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ufsKnZLL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyJFs3q1lz2xbF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 05:09:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FFE5A431CC;
	Mon,  2 Sep 2024 19:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF47C4CEC9;
	Mon,  2 Sep 2024 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725304143;
	bh=nejS97KnA2Qms3Gvgo3SMj9sJCiVfLci6/Mfi/Rsw8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ufsKnZLLQwEHAwpacZdtysRg/9QTknqhrlzPG0gTIS2ybE0mNRT06SNEuUXiZCc52
	 rL+kMleAwcxpyJCXunOkVdq2gkI0N4rXboHt0oCmSgcGWyIDtKyzqE1RLH6FGpCehJ
	 Nca5DzLVoAyJkCzqFoxcM2eyWPTVeaxie9bJU/MGsXST6olZu3DlCT9zPLmzlDYiDo
	 26pYLD97shqH/Vu3qR8DrMi1U/FYh0ChQcfnXrx7ZvWkDhG+mSHja+QAtiFSNdNyh4
	 wOsgcVvHRsT0fJO5jdxMGCUzxcJPTzigqd/TdNVNvI1OlUf5pvD6mFYRBg0yAvRUbY
	 6Q9pMzCUd4xCg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Sep 2024 20:08:14 +0100
Subject: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=4018; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nejS97KnA2Qms3Gvgo3SMj9sJCiVfLci6/Mfi/Rsw8U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm1g0v9w9lBiTjIu5lnJumAd7oKheioErj5Av8o9p9
 xjbw4dqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtYNLwAKCRAk1otyXVSH0FX7B/
 9slZJSbOLk1zaWaFIlxJH7fsKOjdUxsEOGWqCfQQ7SzheizYCzQY9YUFbpp6x55PbW9KNdQ/ikhexU
 ts50XikTINzfTgQ5Nv4584Ko0cc5QH9Vvp0f0XFS3G8wep0Uq6vKMRlTzj2D8sUxFbzP65JLa882Vz
 pTQ7zTU/tzgbq3wMWfLtM/IqmqQJPSikIxU5k6R1bMD0jw/s2LwtAq5lD5a/g30apMg/klNkyAShDn
 JdrvWvSR2DLgHDfOSFSLUlLXNVTd61W01f/ngaSuv3L1ymol4mTPWXexFqqN6BKbYj9tM2RHTYuHDn
 LkE9GrCLQjRp0t+wnKJpiI8cN1kT2+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In preparation for using vm_flags to ensure guard pages for shadow stacks
supply them as an argument to generic_get_unmapped_area(). The only user
outside of the core code is the PowerPC book3s64 implementation which is
trivially wrapping the generic implementation in the radix_enabled() case.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/powerpc/mm/book3s64/slice.c |  4 ++--
 include/linux/sched/mm.h         |  4 ++--
 mm/mmap.c                        | 10 ++++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index ada6bf896ef8..87307d0fc3b8 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -641,7 +641,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 				     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
-		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
 
 	return slice_get_unmapped_area(addr, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 0);
@@ -655,7 +655,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 					     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
-		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
+		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
 
 	return slice_get_unmapped_area(addr0, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 1);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index c4d34abc45d4..07bb8d4181d7 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -204,11 +204,11 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags);
+			  unsigned long flags, vm_flags_t vm_flags);
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags);
+				  unsigned long flags, vm_flags_t vm_flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
 					 struct rlimit *rlim_stack) {}
diff --git a/mm/mmap.c b/mm/mmap.c
index 7528146f886f..b06ba847c96e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1789,7 +1789,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags)
+			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
@@ -1823,7 +1823,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
-	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
+					 vm_flags);
 }
 #endif
 
@@ -1834,7 +1835,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags)
+				  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
@@ -1887,7 +1888,8 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			       unsigned long len, unsigned long pgoff,
 			       unsigned long flags, vm_flags_t vm_flags)
 {
-	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
+	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
+						 vm_flags);
 }
 #endif
 

-- 
2.39.2



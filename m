Return-Path: <linuxppc-dev+bounces-997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2596C4C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTNq3ftRz2ygy;
	Thu,  5 Sep 2024 03:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725469451;
	cv=none; b=grOihX2l3PZHHiKwSEE8bGDda7y5RVeoOJCi4JFP2WluYeYfy51THWMkxqX6IUUtyx2qmAdZhthgSmmvKa+6/Ch2OcZOV8/uTZ5LH8W6DByoQtXUYg4GqIfcKQyV86VNXRxdM80T9hATZ/pdPoys+4kYr8pdyZyzQqFnfW4+btlvb/OikF+E1Eg5wRzjwn4J/DiphhLrbztB9I+hgGij2cqD+zDhgiaH1SlnW4DB202TV0D0n2n1E/Ie3piYvh6z3RTgcC3IMJJjXInQQs4U+zGJ20ZUHaHMtWzwO/kgWUptERjDjAtDCffbOscmMMC5Lcfm6djcN/dYLsjQZwR91A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725469451; c=relaxed/relaxed;
	bh=Bz3C7ip+vOqdYUBtFwXjoZBVCb+Y80r5zgvbfNPVBHc=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc; b=BBD7XRki5qA3UdZQnEidNQUzLZhze5Ccrxw84xqj0W0VBnVj7IaVs15JVnZJ2bheFIJE9kSYmZGxCbqbi67j7pu1Jt+/jdS6ULociS0//An+oP/br4ky0m0vBG9Y/5naYdIbFc3hNX5JS4Qi/k78aVCNbG01bD1X4TCR9YX2yh9Htly6HsQImBNNcdnXhjunMQ2Yw5IbzRtlvDbx99os7ZSxzqbhdgPSsdRVS9gkdWzePVeHJReaaceA1IIdKHaALTr9XZY4SHfyPWMVztZUe8Soxm2LjFDr1RyFXfCVPkNEj9zoqqJl4SVqPa6/0DXXhaQGEYDcYrzSsabYc6P72g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F1QsO8bB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F1QsO8bB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTNq0RQBz2xY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:04:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7D67A4460D;
	Wed,  4 Sep 2024 17:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1404DC4CEC6;
	Wed,  4 Sep 2024 17:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469448;
	bh=68K3QvD0tkKZDAR0UpFpD5XCk8KfcxipD1vhxu8hMF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F1QsO8bBJsx0AmPMFiW+aZLLp30OJ6WLUYtazU9cKiD6dYSxRrM5367mxKhnrYiYR
	 85yB8fFfMOjKTBpSlO8MxTRyv/+24AMKHEZNs759hHseiBj/tQt8LtzNo3gCqV7zJC
	 uQh2rfX5CP6fSwpG+0wWFMriyE1+Q3TPMGbaKlm0vf/W8yTi6YtQEtz57I1nH30eGI
	 uk1925ANdluBVwDdwvc2Uf445CgIHw/GtnY5jubFmpPqI82baUpZ0luZINbPivJThF
	 /Qam2M175ofqQE8+/UGiTVrujbpbV7dCEBmi8Bo0pRE+eOwh3Yh5xEtK4CuLi+kg5V
	 YjDq5wP3d56DQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Sep 2024 17:58:00 +0100
Subject: [PATCH v2 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
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
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-2-a46b8b6dc0ed@kernel.org>
References: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
In-Reply-To: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=4205; i=broonie@kernel.org;
 h=from:subject:message-id; bh=68K3QvD0tkKZDAR0UpFpD5XCk8KfcxipD1vhxu8hMF4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLomVTv4ECj2BO6KAA82Rg2LfwONZpcDKcZ/rOe
 Hb8SxguJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS6AAKCRAk1otyXVSH0NQyB/
 9kxVcf9SZZ8gEenXIUM2v+Sc6WxUmySDKe8lr2m+hILlbK4d90FD7dZLYCCDeqEkNNrGh6dxpDiVEV
 hgDmQdrZolUYW4Y/p0jjVeCPzreQXwXMZ8W7N1D5N/l3wwkb+vqQ2RrrMKJvOtbhi0bp2xlKOK1YUk
 Xa2D8ExFcS60FeUbuVMhU7VgyzPwDG2vup548nR3kM6HbkaB9mUGdYgfOtvd53NRTyvp0fcvcw/+v1
 p7p/kh7y4x1kYmGXa2Fhb2LKN3b8Jefvr2v8QIwR+T8VtgPWj4GQAuO+p7ai3SjpR3X5Rsd6NwJmYS
 YFA9nPiuXiHzme8MHUHh0LCDrrUpLW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

In preparation for using vm_flags to ensure guard pages for shadow stacks
supply them as an argument to generic_get_unmapped_area(). The only user
outside of the core code is the PowerPC book3s64 implementation which is
trivially wrapping the generic implementation in the radix_enabled() case.

No functional changes.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
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



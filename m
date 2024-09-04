Return-Path: <linuxppc-dev+bounces-998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AA796C4C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTP21Stdz2yhg;
	Thu,  5 Sep 2024 03:04:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725469462;
	cv=none; b=DTQa5sos7cSPsLfzaK/ewnMdCofMEJ77BUaDwsI8sUni9PfboyNPRsUGnQHyGDFaV4O4snhbJIzuIewy6oysl2fmMWI9tNtKIEYSgcqERK2vVHn68qVfB+7Mws+7cT9jB6t6/3s0fTFS88yRR9b5FZn25DSGTl2/dW5YulyrkzQDJMg+4/6+VItvmZYBKnge+oWyPF03+VWXOczw9RZhzY7Z9pOVxn7KF5CrCDVfDVkQ86sbswJun7FRHI7QoQ6lVp2EPIUSA3Yrfo7GEJYeqXMXWtTgeUKPLWOocxeh4+5PzWK9zjGecT7uNyekWs0+Kq90jNhf7cBkm/WQsdZAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725469462; c=relaxed/relaxed;
	bh=Ul49FK2RHtYF8Fcv+TVD25yje83riXzdVSo3gED9n88=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc; b=UKOpHzw0WMemAtC3oqJLnIjAgdgT+sZfGgwy5IR+pvG5QSfHoRWOvaiVToQimeIEABs4eJCGdghZWGiJFmHpuMrD3Ya3C3LsNGdl5M4GkJ+QLFsXJjxc7yUsnyMAHraiFHr1cqA+mRmjIliAJVFwcXrbrYeacUH4WrTge4ygvHIGA4V4bxoK2pLDkC6rv2E9HmetG7WCXz9Jflz0cmeHZMeUQcEDsf+gl8nobFk72r0a0yMZ2MN/fL+ltBQ24H2ogHV3+RIm4EG/413SD6D1Kv+zdaTPLqWyi9HbMT8+XpxX7CkTPTUyoYLWvHibYccx2VuoCCwkWsxuYTXOv4O69A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XMng1+N5; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XMng1+N5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTP15pBJz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:04:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 857485C5711;
	Wed,  4 Sep 2024 17:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2ECC4CECB;
	Wed,  4 Sep 2024 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469458;
	bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XMng1+N5KmI2Uyam4ahGOmJ7SA6LJYTXKVjx7qG8VnUZ/zUuGhRBCUkXKze2d/h2W
	 qvk9lXkZAy6Y05LO0D8t2nFprSfQ7TcDWzQJu8SE80qNBE+/r6k3g83BIKWOzMfOt/
	 Dvpd5qWmKHpFvZ2SytdtRA/ewzxfCdXGeHxRiiWyHN4p2CWQTl0lHTEU4UgysXWzN2
	 eTOvyqyDhTsz/6ctIBuFArpRcUT1qm+ZYrAJVgsZe+irs/+81QH88lWveZJX5wrZrg
	 OTOm7mY8GpWO9fbBe5Sz+TeGAp/qLFj/uFen9cZ5SvcQauQXuNRCmgGBYLVs1L2zqm
	 CIGueYv9nSccQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Sep 2024 17:58:01 +0100
Subject: [PATCH v2 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
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
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-3-a46b8b6dc0ed@kernel.org>
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLp8oAy9lYwTYiPgligR57zoDd7L+at5nOq93BI
 UyufcpKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS6QAKCRAk1otyXVSH0OADB/
 0ch6Ppo1cUyP74KOdaZaA30djq+AGYfXlBTOUWViXVC9fGK3bpaqsBB0Cfo7Fu6OsGVc21oO0/yUH1
 YrAVYn6NPOHjgywpcI1TnkgqUaxfBOur+h4alPeKfO22P8IGuFmDQWUyfu/9w5PhhvsetXQF8HjY3+
 VA0L3qH2XKq516PsycNgfFI7aYDz9EL8tCzzuTsMp8jhgeTHcVNNcxzbWDDBDU5qQBsU5P9IwQfOAx
 OuEH/w/+Xqho79dLxhqBNChGpSjBv7foaNTf0PLA9gi1zV9CAxhWJ6oVaByM60hUmP9mC93njCQXlg
 DUm9swJvc4113Ub/xAIxFMCk0q1OCk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

As covered in the commit log for c44357c2e76b ("x86/mm: care about shadow
stack guard gap during placement") our current mmap() implementation does
not take care to ensure that a new mapping isn't placed with existing
mappings inside it's own guard gaps. This is particularly important for
shadow stacks since if two shadow stacks end up getting placed adjacent to
each other then they can overflow into each other which weakens the
protection offered by the feature.

On x86 there is a custom arch_get_unmapped_area() which was updated by the
above commit to cover this case by specifying a start_gap for allocations
with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
use the generic implementation of arch_get_unmapped_area() so let's make
the equivalent change there so they also don't get shadow stack pages
placed without guard pages. x86 uses a single page guard, this is also
sufficient for arm64 where we either do single word pops and pushes or
unconstrained writes.

Architectures which do not have this feature will define VM_SHADOW_STACK
to VM_NONE and hence be unaffected.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 mm/mmap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b06ba847c96e..050c5ae2f80f 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1753,6 +1753,18 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	return gap;
 }
 
+/*
+ * Determine if the allocation needs to ensure that there is no
+ * existing mapping within it's guard gaps, for use as start_gap.
+ */
+static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
+{
+	if (vm_flags & VM_SHADOW_STACK)
+		return PAGE_SIZE;
+
+	return 0;
+}
+
 /*
  * Search for an unmapped address range.
  *
@@ -1814,6 +1826,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
+	info.start_gap = stack_guard_placement(vm_flags);
 	return vm_unmapped_area(&info);
 }
 
@@ -1863,6 +1876,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.start_gap = stack_guard_placement(vm_flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.39.2



Return-Path: <linuxppc-dev+bounces-889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBBF968E3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 21:09:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyJG561tpz2yN3;
	Tue,  3 Sep 2024 05:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725304157;
	cv=none; b=AeTjsZoHaQBqaX3/8zGHpBEaLm6a6V8l9DdY+D9N8/Jfry5b8QfDxCOeJcwSugX0q8OJMcqMsvRxOTCu2rm3VE8N7Y49thDnX/tofX3/hz9nNhwdUFrYQXVsMam3ETVcymCHPZI4Wr3u8s8XkwQrc/uHDafPVDyW3rRTkrc8CYPbD5MkKD8GjMIfJDDsMfL7mC2AYBSJx0jYVi11NauGZassykbFiVA3J2fE/qU+Mh27cwOK2AafEDIORQERVF2+4HX3dSQM46cs67ay37NfUkiNxxbwHw9rZ/OZkwhNJ3RWp8hu3DogtK45tV81U8uiCXmpJLUz2bUgGVpPbmSiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725304157; c=relaxed/relaxed;
	bh=skKtGoHZba1B1jgyPh2jyqZ4+CsPg9VpbHI8ZnDusRw=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc; b=HESehz3yacN3I6VMikbz6huhvVok/5I616sL5uhldESwuNHPvLuQdlasZ5tOSzDEvwqk5q4YqxaYpTzI1u4zSVomnV1qKJoBFwkGIYgCfuMQAl+IwBsaZ886lzZYSdSTX81Ng2WFiAf1KnlapxR5MRk7nKJrIEjjrvu30dhc38pDscIvJsrIptYOELEsDeaEL0WjzAskAdVMFpstlKN9B4ISOKKOMLEAlVWBbz66xQPej/TilX4usUcrmPLfSsjp33JV6MUc0FjWL8Ip9hrUZiuQya9yOf0fbSI74ghvfwkZSxfyweZ2eu2jfEcuIl6TyTOFzYey9M6V4H5SiH7PPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N9sI26+Y; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N9sI26+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyJG538HMz2xbF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 05:09:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35BFC5C5786;
	Mon,  2 Sep 2024 19:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C9CC4CEC8;
	Mon,  2 Sep 2024 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725304155;
	bh=0/hF44fORO0Gery9A2B+FBHrfD+c3aFRzdrAQPNITJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9sI26+YB1BFPD9a0+oQnaOYoEp8JD6VMjANXfF4vZthYCbAVo/geEan5PCYE/5YG
	 KyNtsWx0ZmtF4GI6OmQqvHuRlOVg8nJg01jLUUvrGS8k0qXeZSz9H6+XV52mPp5OT9
	 SiFxv0FaUoXnD8v0PwGJEyUEBBupfs/d/2YxBDJJeebGN6LeO2fcg3zg8MsSGoraop
	 tcocc1osS+PVlcQOrKjq5qbDCptBphGD5397tCq3uoQScdTyYNG0/L00MB3+u9eT91
	 Po9TaiUwdOyyXQuJiSHGiI3yZh0UNZiv/JBij7SxkXKL2T4XOAiQx7+fQg9SMU8IKV
	 ZubyoBQssJRwg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Sep 2024 20:08:15 +0100
Subject: [PATCH 3/3] mm: Care about shadow stack guard gap when getting an
 unmapped area
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
Message-Id: <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
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
 Mark Brown <broonie@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0/hF44fORO0Gery9A2B+FBHrfD+c3aFRzdrAQPNITJE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm1g0waix/xDVLlXSaTD4u/rRM+Xov1S4sJqN9L4bW
 qlKpuiaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtYNMAAKCRAk1otyXVSH0D8aCA
 CF9K7LlaivE2EybLobtlEVyd3x4/yQFEmQzQPnmLchhUTmpNDtOjAWH5nWJB5csnuTjOxnJKPohxjU
 OlGKNnXZ4xzXd0tKckj2SwQe75FXPlRlPAsaelj3L+B0sFx+eaxKOJptUrnxX0L5qOqpZ7yxSSg7Lp
 QqS957ontDIGI1sWL7Jr883SmGUsD3O1znFCoOJSJgM0E4BSv5EsC6tkrAy58jG3VQAOqtDHm5b8r9
 9yDRusfPXLA88jssbTu7Bg4R1DSDS6OnJlDIn0c2CKKk/Cw+o6jzMxTmxntZMd5Iiz1JndFzNYziYB
 5TydVe5LsQPAyaA9p8ecpXQVC+h/i/
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
placed without guard pages.

Architectures which do not have this feature will define VM_SHADOW_STACK
to VM_NONE and hence be unaffected.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b06ba847c96e..902c482b6084 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1753,6 +1753,14 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	return gap;
 }
 
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
@@ -1814,6 +1822,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
+	info.start_gap = stack_guard_placement(vm_flags);
 	return vm_unmapped_area(&info);
 }
 
@@ -1863,6 +1872,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.start_gap = stack_guard_placement(vm_flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.39.2



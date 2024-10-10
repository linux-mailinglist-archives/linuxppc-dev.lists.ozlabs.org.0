Return-Path: <linuxppc-dev+bounces-1924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1D997E15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKY3Hwxz3bnL;
	Thu, 10 Oct 2024 18:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543729;
	cv=none; b=GhjEuDnbTXv1MxqJyzribD9aJMoWqVd+VgT4zUTVe4N4QqXbzACQlYokBMcODN5vhAdtFVH7u2eHUXmCnQkR7lQ3TKckspATJSfeo7mLMmH/E5xPaDS+iTloomp4w4/bl79CO4wXLI7cpxZvSSVPhBfsHidNxy+xFKHCAe+mnOIDzvkhdjxqxJtDRcRTY3F9SRXaCNEQtW8JblZXmgMyTE0TNqDW5fx0WX1uyfa/57IafG91ZXIFHUE4cmKLLbIapr6czSKlf7HHa/mAjAZwpucJK8zduVN6StUFYXbKK4A3I0hbHK0iSDK++v7Hj+4NeZ67hLOe5tsxMkxjL6YMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543729; c=relaxed/relaxed;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKco+KQUE6nJoKKpVteRTdrYpvkiQTpWwBGaHQbAJcFai9zdspCBcvy1Jszsiz2WMGEnV84U28FTOBquzNiF9hxyrv7jlT0DuQW+V2lylF/7JpCpwzEb+OjlKD+89PKWtWlb7nAXP/G4mq/GaTSOpRUJTdoRrC4chayCCx5JSvyetAvjeOAUMek2oghHZFLxcK3GuTA64iNtyBTZFhv/5Odo8XOYxc4ZSGF3pdTsdUMnpJ/w30cKpKVuswzBZ0PvDvYm1N/ueXhAMDHsIOTg15yGqIyTDj1jGv/B3rkR/BvPY0yLzIVYmaW+UIkehjkznpmFBixeNvMWEoxgS6hNpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=C8zvqEjo; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W7xf0VzJ; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=C8zvqEjo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W7xf0VzJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKX450Bz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	b=C8zvqEjo7kb3/oHoz3hb2Om0uiUtYkl55IA9xwWdquAqygCrWODizYf4D6Rw7jAt2zVOuw
	n7OdnQnUgrc5pfjJNzC8YT11DgZ9fsFPnsueJ9GqEwL6Uv3bPMrgzEMM3rMIHS3Eh+NaO1
	ZEvhWra78hEda0HGQg1WZpdvR2Rw7ZGbVaWHYkFpAne47VwHgM7hKauWlVU7QH/0ke03uk
	eAC9PGrgijetGH32veinriyNtlvyjUprCUzGdLAb+F1DETCn4G0iL/b+IIcvg09SEIeVnP
	3SKWPVlgZzjTuXN2WypHhNvHFMn2f7io0CQaEph0qAZpR7XpDnLXrw/lcof30g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yg1Ny2tTSYsDQ8zQCSNx/jJFJpXIxfnXxTsLb9B9k=;
	b=W7xf0VzJWJPfLuV3guK71mDn+icBDuyZaH32+yBjMmN1PYalZOV/xzGWjl0tLIzAZUBcGH
	IdmG4ZQGtWVr/cAA==
Date: Thu, 10 Oct 2024 09:01:04 +0200
Subject: [PATCH 02/28] csky/vdso: Remove arch_vma_name()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-2-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=956;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=uTttyYxVmC9yRNmwzxocSlf0ZjyD8nT16PDerFELjlM=;
 b=WCeLreUXzlZ5+MKodzNN22RGiDxtcpRTA/LR4S/eEW4/gG78TAak0Hv5qP+iXIr4pQIw1CbRC
 NsfVsXwXTuzBlj98CEUA7UytkjzUZXv0jKFFlmkIBdO3GkDqiFYYz81
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

All callers of arch_vma_name() also get the name via vm_ops, which for
these VMAs will use the name from 'struct vma_special_mapping'.
Therefore the custom implementation is unnecessary and can be removed in
favor of the default implementation from kernel/signal.c.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/csky/kernel/vdso.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/csky/kernel/vdso.c b/arch/csky/kernel/vdso.c
index 92ab8ac6a5960e30b660530ae9b10137d5872369..c54d019d66bcaf8ac4633067076679d83b67a8f8 100644
--- a/arch/csky/kernel/vdso.c
+++ b/arch/csky/kernel/vdso.c
@@ -82,10 +82,3 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	mmap_write_unlock(mm);
 	return ret;
 }
-
-const char *arch_vma_name(struct vm_area_struct *vma)
-{
-	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
-		return "[vdso]";
-	return NULL;
-}

-- 
2.47.0



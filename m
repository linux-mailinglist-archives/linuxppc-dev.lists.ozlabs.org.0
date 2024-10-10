Return-Path: <linuxppc-dev+bounces-1930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A1997E37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKc55C5z3bqM;
	Thu, 10 Oct 2024 18:02:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543732;
	cv=none; b=c9gM1i4bNr8zUuXpMdNuzpPO2p/y7xNosRH9JFqaCnDZIoR/HzkiATrBjy7R4DOW2UxxNl/zwzBWqE8cAUHcguR8HtHTsnnzirclU6aV//Cx5zmmm9fW3Czi0eUJ/pwKEblXbn7sddIipatQQdboShbF1C9/6dCCMBL/VHuestOTsqWjQGd5kigHRS+pmZdzkMokU+n3gGLRcMm6ijTjeEZ09GSm7+DT9H1GBPI0IobfOXLgVOzkPZ0Ykj7KjQfefVi74f3kfPCIoaw05ghofl687TzHRZvqI01YD6+2gUqmmotLaRqVCIFOCKTFCj5ULXY3LfudTTrukqg0CF0p3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543732; c=relaxed/relaxed;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaWKGOsX8oc1M8KZtl9t4VkpAFQkA6f4/eAWRdEo5ol6AhcDA/I+KTXSrZ2tddCYOQ5tewnEOlqeyqmL82ldaG4GjNA/4PRozQezcjq5sowDkGTfXbL2NvWWWEd6wWOud32F8xmadbO8/DVHOVIxwt7uBpUTA2krbr58DPC0NBBZVkJR9HWPB5UN6JoX3eMk4Vnmcnhejx9Z1TN9/ntPXRSTf1oH6rKik3NqLD9zl7ZD6FjqfAncbr/qcsl8rmKiRTWvP35JMP+/dc9qU4+TPE+Sxjl2v2sF4CnNXm4h9UQEteeUXhKLMJXfgJKorxCMRu8rscI1ygdFDk8Ng8Rlsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tklXBa7x; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4KV9SqG+; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tklXBa7x;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4KV9SqG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKb5SLsz3bn9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:11 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	b=tklXBa7xWPl+94ERFSx5VYFVU6R2SM+ueh7GGooFNR6Mp7U7q+HRsvN4m5KNEiANvjBB32
	8bo3I3tg+ABsVYW3oWyHT48H0ysVjbAC4Xy51Sty7YUC9+/eOMfH7BDXI9d4wghh8FLABS
	YjH2GLE3On43Z3aBpofYG2nQUmPAdm6dup09L3ZaRfeJJI2OnA0Y54Lpl05YZpIUtWybL9
	+MTHCX3NKefTyQQXjbWoFEVVCVX0klqqcDGcmaITXKcLnmVvtf3nsXkMKn4SoQnNIKqBG5
	v9bnr3FOLLd/zj8gKdKRFHfjToA67jwOVYMa8bN5Vz2YWXJ5Q5uDbXUS2qKfrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+0Ixkoq+3kCnb3BLWSof6YiJ2FC6UBnlc7AlGu3hjs=;
	b=4KV9SqG+okf/1Ooh0DC9aya12Po7rP+0eNk/wrqju5ibqZTy9FUvHZqgGqiLHiD8XPBHt0
	Hn5PUudGn66tgQAw==
Date: Thu, 10 Oct 2024 09:01:12 +0200
Subject: [PATCH 10/28] x86/mm/mmap: Remove arch_vma_name()
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
Message-Id: <20241010-vdso-generic-base-v1-10-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dMMe+I6fcjh0GGIC72EgiCzXdt0VcHRiCFHYCaqC+kg=;
 b=m9t57qVudUvQD7qumicgQPp+/WUG5fIfqupzAy4yMaYthYPm9/oO8yU7qpoE5ULp19HrG7r/s
 +zUDjxBFvCqBxs4uey8HDMXMTjnS0wBto/zlOtGPRIl8B5vfTM+9eGR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This function does not contain any logic, delete it so the equivalent
weak definition from kernel/signal.c is used instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/mm/mmap.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/mm/mmap.c b/arch/x86/mm/mmap.c
index a2cabb1c81e1aec2fc82339c1092bf8b8167908a..b8a6ffffb4519cd77f6a540562ef6d3efa4e7b0f 100644
--- a/arch/x86/mm/mmap.c
+++ b/arch/x86/mm/mmap.c
@@ -163,11 +163,6 @@ unsigned long get_mmap_base(int is_legacy)
 	return is_legacy ? mm->mmap_legacy_base : mm->mmap_base;
 }
 
-const char *arch_vma_name(struct vm_area_struct *vma)
-{
-	return NULL;
-}
-
 /**
  * mmap_address_hint_valid - Validate the address hint of mmap
  * @addr:	Address hint

-- 
2.47.0



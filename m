Return-Path: <linuxppc-dev+bounces-1942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150F997E5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKl5pZCz3btl;
	Thu, 10 Oct 2024 18:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543739;
	cv=none; b=LroFD46Z7FKPgFCNWXmpQZOOhJB9JqZKE7BHRUF6JTrCcz3RnBm1uJmGe6XtEikLzAhecmi56h1PpCzchtOwg+95lRa6QWSQJ46R/hSULd/mjXihzqJpdmW5YJs0kTXii8rgXQPmPrAChsedOdLKrr6tqvvH983nYXSydnpDQSeKOX1t4SLoWFZSV2MwFAd7xAEz2FeN1NAfVcOmWG6B9UMlJ+SdWuX40MUi6aoIh3ikGEEceQdbMayiqVKDwKRcGLh+VyKKNLt5UGc0E5kxnXCw8YXnnGIsMDiyJCQnarJ+3OlygBt+G39VpbDoCM5pOuDyPwpwx10whSLDwSFsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543739; c=relaxed/relaxed;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuydaX3TxrpxKa4+fKZ6q25hmxCWHsV3i0mls+o+ZkWfBbazhJ2n5rpjJDug4zOTqFqXjCR9RCAZyIlenAsVGziajkzmPhNq7500BffqVRwRsbtCDRO25p4ldrCq2Wj+SuXMK+aaNMEY3tkwOAmnroblwviIteth1rn0KkdYF9M13ObNytZi5p9O4FlXoMY3EsbnegwWvN6UZkJYhTkLqklQWghI4HnXwUERF5yOLgdCidbnCkTIvFMzk3GLPE/XQlao2U1I2PH7PslwXeaBjKj7VsYowaNJtuHZnziOjUjCaSbGV8wqg4LhS0MYADeiMlFMebwX8nZyd/1E3EJcGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VUkjSFBk; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=d3/0sfbJ; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VUkjSFBk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=d3/0sfbJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKl0wlYz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:19 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	b=VUkjSFBk2MQwzN+ejztrVxQKhRHQ+9Yl/6wxSFJwKQcH9II+0ehbH0LPd0MM6vQoZ/HDO3
	AQEr2gejOYAR2XAGB/sSNVekevUe6V1wcGFw/QL+DLmC9N99X8j5fyvXaPipiVRRc5Yf4O
	2pSZstOJBdCblxxzLGpOQ4jtJFNtb0KRN+2tpga3h86cWvTE6FK95XshBy3V5sBp1pQfAw
	lD8vKj8R6WKLzfjFUkxp6JxMmVY9z2fhJ2R8eY9/ZtCjHbSjayyacu2J3HORJcdf18+jz4
	VXyUxfxScOWvjlPDHn6Gwvam4Q+L7qGpCm+XbyjKpJEpwm1H+HJi1H8JSzzFgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	b=d3/0sfbJfcCoywGbj+ofl3ZPzDeWOe3+X1t86Ir5PG/WJxdDRPOcIBAdlleGtqmDvX4E/l
	LIXafBtIM6E7x2CA==
Date: Thu, 10 Oct 2024 09:01:24 +0200
Subject: [PATCH 22/28] powerpc: procfs: Propagate error of
 remap_pfn_range()
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
Message-Id: <20241010-vdso-generic-base-v1-22-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1079;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ILVVV4C4Cn6a/ycb+VwQKK6Cv18zEgAwyS7MEYqbXP8=;
 b=rFDW1DuF1EN9zH9ReKWGHDOnqsiH+sp/YP1SF/BKn15kPFCLbQRqr8F1aO3GxLRfzj/ugXTr9
 m+/fZDMJUB6DZ3liFKdAy994YFnGHbTZc+LlsXSeuQdIxLarPfK3zOJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

If the operation fails and userspace is unaware it will access unmapped
memory, crashing the process.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/kernel/proc_powerpc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index b109cd7b5d01fbe6870b60e60965effa86ecf3b6..910d2082e05fd86bd1146815d4b67633a6f2b459 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -33,10 +33,9 @@ static int page_map_mmap( struct file *file, struct vm_area_struct *vma )
 	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE)
 		return -EINVAL;
 
-	remap_pfn_range(vma, vma->vm_start,
-			__pa(pde_data(file_inode(file))) >> PAGE_SHIFT,
-			PAGE_SIZE, vma->vm_page_prot);
-	return 0;
+	return remap_pfn_range(vma, vma->vm_start,
+			       __pa(pde_data(file_inode(file))) >> PAGE_SHIFT,
+			       PAGE_SIZE, vma->vm_page_prot);
 }
 
 static const struct proc_ops page_map_proc_ops = {

-- 
2.47.0



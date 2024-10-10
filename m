Return-Path: <linuxppc-dev+bounces-1931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F6997E3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKc6VQRz3bqh;
	Thu, 10 Oct 2024 18:02:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543732;
	cv=none; b=FUyooaNYGwj5DyBAR+xM3L5J4mbUGGB8l8GhRoonGVc8IFfjciGmPmI2USMONSODHLAnYLA3FrZz3zGmyWeba+92mVGXZZ9Gp4TIKHS8RZdHp/Nin9721yb66jn3+ZAxl1PWgtemYG82lX51u8RApBrCM77iATlIj3wXZA+MzefBXF5rw6Gwalp2WAYpQMlwjhXUlQK7DNdUKdwq8VFxdGhem6XCZDGvLIxAwbS/j4EPn/uk9V9lsBLFhWAi6biNYhLZHPjkYAwXM+B82XOMXHPhHrnlkc6aZB2B1UTWPPq9945N94wbicoXgbIE6OrF6E5IUIDRfNSh68EZ9e0/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543732; c=relaxed/relaxed;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFD+V96aZNaNNCVTjdaFDMhcO0YaJ2lSu6NkAWNIRUJq3p6vCOSc3+Xp99aI64RQeilMwgdc/p/vi7UQxSSOvb0bh9LE0hUHzoM/u5VqYBZLLe2nNkKQbXeC1Sbf6Gfbrq0EUTeFHruxmTP0HArKuih4sm8mnVw5AHTXy3xdT9K1KAbXdVnL6l8o2ChdLfUxI5+yyYuqW8rRlEIRS/4Bte0DLEOBHvFcozoRBpcgO+y1yrKAu79T9YDoskEY45xnk+yJnw/iSou0AC/0WxaBwYVrgbi79ZHlVhFm7ZAYcgHdc94DhT5yhWhs1EVj8PTVHuWsQhU2p+fBVYeJwd/Hnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q9YOUPVl; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TAio2B7l; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q9YOUPVl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TAio2B7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKb6qd9z3bqD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:11 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	b=Q9YOUPVlbRgarYFZCEn3UByLmZ+tdONBS0jm2Njl7NuYL217YwE9aEGuhhDzPYtI8auXWI
	6EUH0gAxMTswBA+hCJ/uSBXpp7rUJ8dUnVNaSglS6YJ/pO2jv181FiW9TruX1n6wnuoymG
	QBNjWPWFl1HtIKdmgkFMRMM/SW/gJLEcl8Z/NpCXVDRm+Pxerg1xyOrNdLRu8a7tLi/yaQ
	MWZJoK6aQUPZXe+0hirbZKdMT4aFxmGegPMU1LhVE1mlW2YU9zKGaO6JXofmppA0mqxP2D
	O6Q6Q4kN//3QwEoHxIC/FfTFI6FZqd3kyhX/Z5SgGRZn950eO4RGgG8ruOhaTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhJhmDhOtFZRa5lN3xjZ1GIvTXwzfeBQ6s2WuntEo2A=;
	b=TAio2B7lTV1K9VxvAcZ6eNE+Q36Yw79samXTeYefVjIJKo5jhM0OyGWf0mAgAZBaDq9RrV
	oo6TB75HhFT+wsDQ==
Date: Thu, 10 Oct 2024 09:01:11 +0200
Subject: [PATCH 09/28] MIPS: vdso: Avoid name conflict around "vdso_data"
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
Message-Id: <20241010-vdso-generic-base-v1-9-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1337;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kTMXixxVJlfX+2o4JjaS2yYnPzAKaCOR1RKXEsusUJ0=;
 b=HVksjM017my4j/baEMdnqIYnTkC5X6ULTM3kipfeka7LvdRE8rDfL1D4EZZQQ5t3NMAkzyRXH
 Z4a3SXUt+vfCNgB3baUfOvVrwy2M2av2cDJKG1sBSM0vWJN6JEF8iOb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic vdso/datapage.h declares a symbol named "vdso_data".
Avoid a conflict by renaming the identically named variable in genvdso.c.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/vdso/genvdso.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/vdso/genvdso.c b/arch/mips/vdso/genvdso.c
index 09e30eb4be8605581f9ea40b757dd4e576ed0c2a..d47412ea6e6736b8714f7db7e4cfe7c18bf12c04 100644
--- a/arch/mips/vdso/genvdso.c
+++ b/arch/mips/vdso/genvdso.c
@@ -270,7 +270,7 @@ int main(int argc, char **argv)
 
 	/* Write out the stripped VDSO data. */
 	fprintf(out_file,
-		"static unsigned char vdso_data[PAGE_ALIGN(%zu)] __page_aligned_data = {\n\t",
+		"static unsigned char vdso_image_data[PAGE_ALIGN(%zu)] __page_aligned_data = {\n\t",
 		vdso_size);
 	for (i = 0; i < vdso_size; i++) {
 		if (!(i % 10))
@@ -286,7 +286,7 @@ int main(int argc, char **argv)
 
 	fprintf(out_file, "struct mips_vdso_image vdso_image%s%s = {\n",
 		(vdso_name[0]) ? "_" : "", vdso_name);
-	fprintf(out_file, "\t.data = vdso_data,\n");
+	fprintf(out_file, "\t.data = vdso_image_data,\n");
 	fprintf(out_file, "\t.size = PAGE_ALIGN(%zu),\n", vdso_size);
 	fprintf(out_file, "\t.mapping = {\n");
 	fprintf(out_file, "\t\t.name = \"[vdso]\",\n");

-- 
2.47.0



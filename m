Return-Path: <linuxppc-dev+bounces-1936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCE997E50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:03:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKg20JGz3bsY;
	Thu, 10 Oct 2024 18:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543735;
	cv=none; b=WRSP0wCBncFxHEvRGe1KRm3NiWSqKQK5FM4WGC2ev/zZEi7tKVU/YK4/fYADzVPE2ar0oGF99lKeIc7dJsqxif+cmaMoM15ihAIyeR5nFOW5je1CrRqNIfcVSG/2Vx57j8KhnByEdivm1RlGug3k+h+8toMyhWbGD5kwBENf4RYJpAkY7h+PIhqDSWjOu9FzO1PydzsryVDRPFND3B7pIoQd3lUbW8rOxHNeJgLJNpk2oKr39tI0DKxtm4sGWSvZNWSxyf+LOGdws3Y2qF+sKxVU9XiwiCMUyAaSBBlsEl4/juw7dMK91UJEUDoxWg1v+kbKrAMJImnH5nWGHa8xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543735; c=relaxed/relaxed;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h86rL/sXt4xo9JsxNgz7w4j4L+Ye6dbF+BPQd+0ts51QAOfT71Dw3byKVmr4ge+rDP8n1d/MYLxrVI9/Nl2hwOfs6O5HAJxRrndiQIr+4eb4SMnuaaLhO+L0zLtUZQ05aZGckkVJl3o+Ev+6G4mTVnfrLhG7HJdO3kZc7nvcN1AOHdGitgK+qZcJmPOQnli+TZ0yUJ27QRJHiG88Jj/DvaMJrRd+azDw4vEF+9hB7OwtFnlGT3OWRXBGFwV8gP8cr0wd76hZi7iHwdd5OhmAXg846L7yakxm6NCaagUF0dTqXFmXmCKy5ln5A6QYPamRDoMvWCyI+SiB9mwdx02q8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fHO6dB5+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nVceqz6a; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fHO6dB5+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nVceqz6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKf2VD5z3brm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:14 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	b=fHO6dB5+tJ5AREGbwdyrnC2qHTYIrMf/mNnwcKcW1LGxv8M1u6qQnVRKVnH5V+qcoYbaQ2
	3iiPafwMCXtkU0L392d1SnJNd/mGnPRV/RJrO3tzoGn/XAbrr4Tzv3pKW8+oj2h9tvgdy5
	CxdFvbJh4+4zIeHcC+yfj3qMVcDM7gQVu/7xbTW8aDNo0w7z0OssIyjNtWqt0AiQ1+PHOh
	Ywnn52yHb4Liib84kgA/AFgG7w6LvN3YrVYf7h9Alq2jcCQMgDVM+p00BSb7gRQvNC4Mmh
	uGWkAlX9s/3WkavRgVvqIGC7m+1Cp/19u8iF4aI9dhxJLBYjNkAw2kJeS6S+mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bpx3H6OAW30r2M4gvHlf4N1YsIPw8mw3FdRSSKpTbMo=;
	b=nVceqz6aoyJ/HPcQx81U9eTkPYPq3uxROiMVUFhWBsYE9y2x+6JUxjov/AHRlCNW3C1bdh
	ousQJBYc6nl11kDQ==
Date: Thu, 10 Oct 2024 09:01:19 +0200
Subject: [PATCH 17/28] x86: vdso: Move the rng offset to vsyscall.h
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
Message-Id: <20241010-vdso-generic-base-v1-17-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1867;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Np140vGUYm0GdbZeMo/M6YRpqMe7CZ/gv0PibQOMjpk=;
 b=0upqYpRkuYFgrPBW3kR6OrNCpDY5Ss/cEAnk/yBBoRvvML2YQfAHXOqqTYZKYHuk1pq8g9LV8
 8YXoRNL497eB8wR/8v3imo4szSlPYBMVDCYzRvobgH+wYrzKXmyU5S7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

vvar.h will go away, so move the last useful bit into vsyscall.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 1 +
 arch/x86/include/asm/vdso/vsyscall.h  | 3 ++-
 arch/x86/include/asm/vvar.h           | 2 --
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index acce60732e541f49dfc21d75e1b525c8a74f2341..c7e194b6e47def3bfa681b3ec5d45cfffbe839d2 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <asm/vdso.h>
+#include <asm/vdso/vsyscall.h>
 
 /*
  * Linker script for vDSO.  This is an ELF shared object prelinked to
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 5d6760746d15b0e12c7bf0eb727241e7576ca9c7..6e210e05f9f323e3e9ceca8a04d5f21fb6d04781 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -2,12 +2,13 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
+#define __VDSO_RND_DATA_OFFSET  640
+
 #ifndef __ASSEMBLY__
 
 #include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 #include <asm/vgtod.h>
-#include <asm/vvar.h>
 
 extern struct vdso_data *vdso_data;
 
diff --git a/arch/x86/include/asm/vvar.h b/arch/x86/include/asm/vvar.h
index b605914f4d4347c16344e5b5e063697538d4895e..d95cf92296ef6acf66089a734465eda4cba9154c 100644
--- a/arch/x86/include/asm/vvar.h
+++ b/arch/x86/include/asm/vvar.h
@@ -19,8 +19,6 @@
 #ifndef _ASM_X86_VVAR_H
 #define _ASM_X86_VVAR_H
 
-#define __VDSO_RND_DATA_OFFSET  640
-
 #ifdef EMIT_VVAR
 /*
  * EMIT_VVAR() is used by the kernel linker script to put vvars in the

-- 
2.47.0



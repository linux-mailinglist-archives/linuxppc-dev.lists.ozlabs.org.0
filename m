Return-Path: <linuxppc-dev+bounces-13846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19DC3A005
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:03:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmY41kwz3dX5;
	Thu,  6 Nov 2025 21:02:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423340;
	cv=none; b=loyqId1frJwaG41Jrg+gYx7lPzgI6f+sDusE90wRAS3M0BD8ckaOCbV9Vna17NrrOCgT/eCteDZ799Nz5ccWU2j/hrGcFyQAeVRkxdy+5AGM/A6owNV2LB29XrbyhyHVEfBuf0JhmZMwLBcJ8nUvf+WGAwPZ4ASq1JKHM+Xipa/I44nHC7wjnAYCNeMdVxk6Huo3QDr1IHhQ77kgmoaF6jst4BTqxc5KGLj6swi1Ol7PLK4/QPdmnD0VLw/aXRlyD+rFzXgIUj9duCrwx+TXdNRHNIuvxb9+SGB3PjZ4900pjRzg7qrIT77fy0IFoJE1VF+EemUFoK1uvzmiluXlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423340; c=relaxed/relaxed;
	bh=zITwWc4LhpB6MTMFwwJ6zmjgQYWiyWcgw0BJYatvoIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2/rmLhWhv6evG2Nke1qrSdBXHLJid8afxuDmKo2vg+T5fivje5bY6jCwddg9ZSv1HSLgYKVZK/zWRm4F1xWpDDjZBcD56d3C0s+M3LcWIJNfScXd//b/+xuGJTgyk22Brms0hWphc9GPE996loMQCiAfEA3620yE3UeSxrzcXjOppeV7nmE9XEERIE/igsdtUN4yGb7zF8F3HPitysbAccm/t52aBK8jIfg0OQlJxgd3Jeo97E2tACF7R3e2WT7SowIO/oycglH5h1oTUufjhmiOypu5WwrlW3Tdn/iB38pzA4DuZU7nexydH07TodZR07FU6CS9MSzLaoNtUFz3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r72mNKpq; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KohBsW0g; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r72mNKpq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KohBsW0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmV6zpbz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:18 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zITwWc4LhpB6MTMFwwJ6zmjgQYWiyWcgw0BJYatvoIY=;
	b=r72mNKpqhkG66222iGMKNZg3zEx92HGs2QQlUBSAJefL+cGuI6bSxuDCCEpGffzLkCTVq0
	KcsR4We5mwu5J9LZNE4vnLmkn+zjfph+xqzGZByaWqwd3NAjeCnsowmhB6mIlOKrgxzvta
	Q0AZ35JLg7vQ4LjC8UtQOH/k/Ao8nVZG1oMDrU8W3GJ6NoHRlfQWI7L4OTjdDYoTBztJ8t
	p7eaGXouxRfjdOwgTFAcsN1KWwiMs7L/7FYQfWnV3ujOBBWrFzjfGsLqxqdms2ujkxEiq3
	nDo8KvZrPg9KWPQKHwFdeXCXSyfofm6Rv4OgsovYw+EaDTXKx7itV3TvlQ2eUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zITwWc4LhpB6MTMFwwJ6zmjgQYWiyWcgw0BJYatvoIY=;
	b=KohBsW0g7RMFzp9xaVEpdH9H/fcxzJZnkRmX84ScYqj5YMfWniYqu35sLAeDw+RLt0h9l5
	htX2w1JuhcS7VQBA==
Date: Thu, 06 Nov 2025 11:02:02 +0100
Subject: [PATCH v5 09/34] MIPS: vdso: Add include guard to asm/vdso/vdso.h
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251106-vdso-sparc64-generic-2-v5-9-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1073;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mn0D+ppD5Vc5LKBIM4oGC50cwygKOdY5SYRBUbfzmNA=;
 b=zLcxfpqTtQW1K0iHGESlW5MOjML5SVksV/gtWNVysiqi4nNtkPxje8wJhR9gRA8EjMUoknlgN
 7d6gc0Enq4YCrHnrWWCblHOBsFPTiFT6QCRXf383m9pqeDj71uXEAcp
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

An upcomming patch will lead to the header file being included multiple
times from the same source file.

Add an include guard so this is possible.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/mips/include/asm/vdso/vdso.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index 6889e0f2e5db950c3ee8b4f12c15466e76a09a42..ef50d33f3439aa4c8486758012a1e9e71fa38fc4 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -4,6 +4,9 @@
  * Author: Alex Smith <alex.smith@imgtec.com>
  */
 
+#ifndef __ASM_VDSO_VDSO_H
+#define __ASM_VDSO_VDSO_H
+
 #include <asm/sgidefs.h>
 #include <vdso/page.h>
 
@@ -70,3 +73,5 @@ static inline void __iomem *get_gic(const struct vdso_time_data *data)
 #endif /* CONFIG_CLKSRC_MIPS_GIC */
 
 #endif /* __ASSEMBLER__ */
+
+#endif /* __ASM_VDSO_VDSO_H */

-- 
2.51.0



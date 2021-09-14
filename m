Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4A40AD3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:13:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82M0313Cz3cGj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:13:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bWOE2Fcg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bWOE2Fcg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82J02fX4z2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:11:12 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A9D61151;
 Tue, 14 Sep 2021 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621470;
 bh=0gZ7g4PrdHovHhvTbvNDdx6ByPhH72YCH9mSQcGy7nc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bWOE2FcgJCPImZMVbgRai97mW40puruvu263BNQpF0CEHWNMsO826h665RsNX/7Jr
 aqgwL0RlnK8VJxV7LLj9nd6yswsVqUQGV82MtpUJjfx0LwA9SHq4rk56b2jwiD+VgK
 cqD25xaieY1IenKCbr7MoLWsXxwK0Kgak0Wck7CgA3p0h7TjmCFBrR0IgSRbuA3fZ2
 yxbWKo/wj1bx49qHZiMF7N3XdoVIlTNx/u0Q/KzGeXlYQxfFlk8VTcGg1gTg5W6lci
 FGMqXMPbJDkb4kUSIPn3rntL0eeF3iDCcqaD/ilJ9Dh7doCYOr//PRPgiPV1swNdk9
 8bmEuLMDGLldA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
Date: Tue, 14 Sep 2021 14:10:32 +0200
Message-Id: <20210914121036.3975026-5-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The CPU field will be moved back into thread_info even when
THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
of struct thread_info.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/powerpc/include/asm/thread_info.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index b4ec6c7dd72e..5725029aaa29 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -47,6 +47,9 @@
 struct thread_info {
 	int		preempt_count;		/* 0 => preemptable,
 						   <0 => BUG */
+#ifdef CONFIG_SMP
+	unsigned int	cpu;
+#endif
 	unsigned long	local_flags;		/* private flags for thread */
 #ifdef CONFIG_LIVEPATCH
 	unsigned long *livepatch_sp;
-- 
2.30.2


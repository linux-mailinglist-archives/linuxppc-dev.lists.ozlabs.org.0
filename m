Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940A40AD27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 14:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H82Jt3bybz2yw0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 22:11:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eUi18+jG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eUi18+jG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H82Hf00rwz2xjR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 22:10:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF0126112E;
 Tue, 14 Sep 2021 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621452;
 bh=ctJUbexNag4Ww69LjFDSR84qdpCMaKBOhiN3IwJaXws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUi18+jGcKYL2ZIvzB4Tdp9umFvvNxr8SxEbgK2vtVURDyopcc4j8SVgQHYRl+oSd
 jD1HDDdHCS0X2qFkxVSwjhCpW6s8Hp96/ONOJXprkzVEv8iiCPPpPOYqaeQC++qK+F
 gMuM2eHySUa6p6L2J2o9DQ8lStY2DIvZxyAiwjDg113m5y+NwLSEqaJgx8B5T++7Lg
 UVHXMyz3FmlndLNHzJ7jUxNrZyF0581QLC+4yGgW9GL8aZV0rNJVKBxnvp5vmlGZgc
 uCZQvfC/GHAQYEp5nHmE0lrfk4JBdK+S+UglEzmm10Apwya4T9Lm64gd4aM4NsUaOa
 Su6kXY2gKmo+A==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
Date: Tue, 14 Sep 2021 14:10:29 +0200
Message-Id: <20210914121036.3975026-2-ardb@kernel.org>
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
THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
struct thread_info.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/thread_info.h | 1 +
 arch/arm64/kernel/asm-offsets.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 6623c99f0984..c02bc8c183c3 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -42,6 +42,7 @@ struct thread_info {
 	void			*scs_base;
 	void			*scs_sp;
 #endif
+	u32			cpu;
 };
 
 #define thread_saved_pc(tsk)	\
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 551427ae8cc5..cee9f3e9f906 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -29,6 +29,7 @@ int main(void)
   DEFINE(TSK_ACTIVE_MM,		offsetof(struct task_struct, active_mm));
   DEFINE(TSK_CPU,		offsetof(struct task_struct, cpu));
   BLANK();
+  DEFINE(TSK_TI_CPU,		offsetof(struct task_struct, thread_info.cpu));
   DEFINE(TSK_TI_FLAGS,		offsetof(struct task_struct, thread_info.flags));
   DEFINE(TSK_TI_PREEMPT,	offsetof(struct task_struct, thread_info.preempt_count));
 #ifdef CONFIG_ARM64_SW_TTBR0_PAN
-- 
2.30.2


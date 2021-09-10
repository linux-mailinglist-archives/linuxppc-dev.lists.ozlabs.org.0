Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC44060B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:18:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5GgQ2Jzcz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:18:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dN5hLI/s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dN5hLI/s; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Gdc4zGNz2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:16:52 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F44611F0;
 Fri, 10 Sep 2021 00:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233010;
 bh=zRNPrIJPMys1yGBpPoJKSZ2qh4utv8xyC8Y4IzEi6UY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dN5hLI/sWsS+Pr1DgluMH8vMeyn7wrJppErkIz0oQAhjWpAtHx6DZfD3aesFAzq1q
 sYGzMnOEZ6KvuSjVn2BjW8YvK7VciXAaTBog7Jq9lnRQznqWUFLyIoPUCCBxqkgYQw
 xnJtHzH8n1HSKZI+EgUdhSY2l2JNiAo90W1BCblPaAcvq5Lj3FwYFbIi77lUJ+zo+K
 S6ojLZCCykawIvtDyVpNqqXyM6+eFXEN4d5EIsX9dFM0kLTmEufCML938bU6V3MpgV
 THu1LGibtuliEmHDISx2WRKFctGQwt9WBa6AwbzTxLoIVFI5vT2dYdxr0bCbeO41o4
 8w8wOF8WOHL7Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 37/99] powerpc: Always inline radix_enabled() to
 fix build failure
Date: Thu,  9 Sep 2021 20:14:56 -0400
Message-Id: <20210910001558.173296-37-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, "Erhard F ." <erhard_f@mailbox.org>,
 Jordan Niethe <jniethe5@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jordan Niethe <jniethe5@gmail.com>

[ Upstream commit 27fd1111051dc218e5b6cb2da5dbb3f342879ff1 ]

This is the same as commit acdad8fb4a15 ("powerpc: Force inlining of
mmu_has_feature to fix build failure") but for radix_enabled().  The
config in the linked bugzilla causes the following build failure:

  LD      .tmp_vmlinux.kallsyms1
  powerpc64-linux-ld: arch/powerpc/mm/pgtable.o: in function `.__ptep_set_access_flags':
  pgtable.c:(.text+0x17c): undefined reference to `.radix__ptep_set_access_flags'
  powerpc64-linux-ld: arch/powerpc/mm/pageattr.o: in function `.change_page_attr':
  pageattr.c:(.text+0xc0): undefined reference to `.radix__flush_tlb_kernel_range'
  etc.

This is due to radix_enabled() not being inlined. See extract from
building with -Winline:

  In file included from arch/powerpc/include/asm/lppaca.h:46,
                   from arch/powerpc/include/asm/paca.h:17,
                   from arch/powerpc/include/asm/current.h:13,
                   from include/linux/thread_info.h:23,
                   from include/asm-generic/preempt.h:5,
                   from ./arch/powerpc/include/generated/asm/preempt.h:1,
                   from include/linux/preempt.h:78,
                   from include/linux/spinlock.h:51,
                   from include/linux/mmzone.h:8,
                   from include/linux/gfp.h:6,
                   from arch/powerpc/mm/pgtable.c:21:
  arch/powerpc/include/asm/book3s/64/pgtable.h: In function '__ptep_set_access_flags':
  arch/powerpc/include/asm/mmu.h:327:20: error: inlining failed in call to 'radix_enabled': call is unlikely and code size would grow [-Werror=inline]

The code relies on constant folding of MMU_FTRS_POSSIBLE at buildtime
and elimination of non possible parts of code at compile time. For this
to work radix_enabled() must be inlined so make it __always_inline.

Reported-by: Erhard F. <erhard_f@mailbox.org>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
[mpe: Trimmed error messages in change log]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=213803
Link: https://lore.kernel.org/r/20210804013724.514468-1-jniethe5@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 27016b98ecb2..8abe8e42e045 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -324,7 +324,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 }
 #endif /* !CONFIG_DEBUG_VM */
 
-static inline bool radix_enabled(void)
+static __always_inline bool radix_enabled(void)
 {
 	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
 }
-- 
2.30.2


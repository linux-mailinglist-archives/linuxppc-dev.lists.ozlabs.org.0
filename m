Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95D850D8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 07:43:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NEVB8Lya;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYFK94R4lz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 17:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NEVB8Lya;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYFJS1gMVz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 17:42:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707720166;
	bh=HPIKIlgH7qVN2nwc0zwVmUXEOTYvZzJH/gucpWhgTr4=;
	h=From:To:Cc:Subject:Date:From;
	b=NEVB8LyaWIRstrQIhM8dr53vkzCcWoJcN+A16FbVds78uv8n3aCBbuJqWwq0OfIiH
	 c4wCrD8CUmH/QE9sYsplfQYPq/6v6ZU2TUNBtYlpgtqCrr2ZxfztooU38hKCcaVbcE
	 /FyCogMs0i+YB1KAN6mZrV+u26OAyDw7WkSZEaAt/uPgwJjq1ZtNfqrtvkSh9xEQiV
	 vCRif5t6x4H6G/6fR+njx0tkkI4Ifnu33SGMqqr/aQ54+FiZ0NZvsyMfhhWf7bb8oJ
	 vHA4yf4OVqF4n8/3mLgl3OGz56izzyxnu5Ig11UbiqIpBzBI2p34ZqfLIMQQzSnZCD
	 Zcsuwzdl3EOnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TYFJQ4KZ7z4wcH;
	Mon, 12 Feb 2024 17:42:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/kasan: Limit KASAN thread size increase to 32KB
Date: Mon, 12 Feb 2024 17:42:44 +1100
Message-ID: <20240212064244.3924505-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
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
Cc: spoorthy@linux.ibm.com, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KASAN is seen to increase stack usage, to the point that it was reported
to lead to stack overflow on some 32-bit machines (see link).

To avoid overflows the stack size was doubled for KASAN builds in
commit 3e8635fb2e07 ("powerpc/kasan: Force thread size increase with
KASAN").

However with a 32KB stack size to begin with, the doubling leads to a
64KB stack, which causes build errors:
  arch/powerpc/kernel/switch.S:249: Error: operand out of range (0x000000000000fe50 is not between 0xffffffffffff8000 and 0x0000000000007fff)

Although the asm could be reworked, in practice a 32KB stack seems
sufficient even for KASAN builds - the additional usage seems to be in
the 2-3KB range for a 64-bit KASAN build.

So only increase the stack for KASAN if the stack size is < 32KB.

Link: https://lore.kernel.org/linuxppc-dev/bug-207129-206035@https.bugzilla.kernel.org%2F/
Reported-by: Spoorthy <spoorthy@linux.ibm.com>
Reported-by: Benjamin Gray <bgray@linux.ibm.com>
Fixes: 18f14afe2816 ("powerpc/64s: Increase default stack size to 32KB")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index bf5dde1a4114..15c5691dd218 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -14,7 +14,7 @@
 
 #ifdef __KERNEL__
 
-#ifdef CONFIG_KASAN
+#if defined(CONFIG_KASAN) && CONFIG_THREAD_SHIFT < 15
 #define MIN_THREAD_SHIFT	(CONFIG_THREAD_SHIFT + 1)
 #else
 #define MIN_THREAD_SHIFT	CONFIG_THREAD_SHIFT
-- 
2.43.0


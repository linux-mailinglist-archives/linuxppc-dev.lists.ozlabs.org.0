Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D254376C27
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 00:11:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcPm60xRrz2yY8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 08:11:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gb8JLH6P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gb8JLH6P; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcPlk5FBYz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 08:10:42 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 808A260BD3;
 Fri,  7 May 2021 22:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620425440;
 bh=/5Z2nTypaGPm1iUklcmpyCaywzQFUCDFz30ObBTQeAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gb8JLH6PnPCyUuTjt1zravgHEauccOMo//1gm4Ob+XzgibOh2sZwvcFPjbOBr3KLH
 Hr8Kg5SPDDvXO1eDoc76mzoMI0DmJZ5bauY1FOtJ9Y+VQgoUxIbjjWFhUqWtm0ZE6U
 ccrgFVWUJH2I6z4ByC/VgauJEc4z8U4C5DUol4HvhxuyWw6DePMNZyjXwT2UhEK5dl
 JR0tzl941Va7JqTmikcPsN2NF2Pwr2w3XAbYyu9skFzFhyqZRwbs9IVsZdHNNdwGg3
 TXdxlS/2t6ZEjHmmAlX6xMmrB99X9yY15pd7fjNbJ7D46GJ8NsvgQbIGg0M5H1eQlm
 j+OrtSAeUv7jw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Subject: [RFC 05/12] powerpc: use linux/unaligned/le_struct.h on LE power7
Date: Sat,  8 May 2021 00:07:50 +0200
Message-Id: <20210507220813.365382-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210507220813.365382-1-arnd@kernel.org>
References: <20210507220813.365382-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Little-endian POWER7 kernels disable
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS because that is not supported on
the hardware, but the kernel still uses direct load/store for explicti
get_unaligned()/put_unaligned().

I assume this is a mistake that leads to power7 having to trap and fix
up all these unaligned accesses at a noticeable performance cost.

The fix is completely trivial, just remove the file and use the
generic version that gets it right.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/unaligned.h | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/unaligned.h

diff --git a/arch/powerpc/include/asm/unaligned.h b/arch/powerpc/include/asm/unaligned.h
deleted file mode 100644
index ce69c5eff95e..000000000000
--- a/arch/powerpc/include/asm/unaligned.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_UNALIGNED_H
-#define _ASM_POWERPC_UNALIGNED_H
-
-#ifdef __KERNEL__
-
-/*
- * The PowerPC can do unaligned accesses itself based on its endian mode.
- */
-#include <linux/unaligned/access_ok.h>
-#include <linux/unaligned/generic.h>
-
-#ifdef __LITTLE_ENDIAN__
-#define get_unaligned	__get_unaligned_le
-#define put_unaligned	__put_unaligned_le
-#else
-#define get_unaligned	__get_unaligned_be
-#define put_unaligned	__put_unaligned_be
-#endif
-
-#endif	/* __KERNEL__ */
-#endif	/* _ASM_POWERPC_UNALIGNED_H */
-- 
2.29.2


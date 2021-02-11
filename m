Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A056E318D20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 15:19:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbzKG6CpCzDvV9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbyjg5hd4zDwhW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 00:52:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Id9DP67a; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dbyjg2JKcz9sSC; Fri, 12 Feb 2021 00:52:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613051527;
 bh=4qjzymK/2LwowFvCwiMNyozTw7FJgvyxejKQsKY45d4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Id9DP67aifYfNbPPhkXFdeTytqnqxSRd9vOKoi1zK9hzcjzApCs00vrw74jIh0wT2
 Eu+UELjkj/BD01B+ZOKkxwndlbredYttPs2ouJg8IKKQGQeme7rssBCm8QH0gj0w6K
 2kYDyw3C64cryeqABgbvyrtrBUY5OE269ecXbcL7597MqszR8dAD+nIKfTA4Xsv+q6
 Z3JCzLzBI+NcwSboq2csy1HBX8kJpuVPB+3i7KCRfryB8hGu0eXyN5chUNLsJ8dD/c
 bMMFXxScBgDfibaADoLhfFQ2cWOGOsUxsLlQpI6f5MXOfyS9+WpkzrQevuNJcVgPEw
 hUT6Q0AFb3qWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/mm/64s: Allow STRICT_KERNEL_RWX again
Date: Fri, 12 Feb 2021 00:51:30 +1100
Message-Id: <20210211135130.3474832-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211135130.3474832-1-mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have now fixed the known bugs in STRICT_KERNEL_RWX for Book3S
64-bit Hash and Radix MMUs, see preceding commits, so allow the
option to be selected again.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..7d6080afbad6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,7 +135,7 @@ config PPC
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
-	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC32 && !HIBERNATION)
+	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_COPY_MC			if PPC64
-- 
2.25.1


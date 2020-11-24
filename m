Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB862C257E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 13:17:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgNLj2sn6zDqYt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 23:17:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgN5h12dlzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 23:06:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qJF165E3; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CgN5f5Wy9z9sTR; Tue, 24 Nov 2020 23:05:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CgN5f3Gssz9sVH; Tue, 24 Nov 2020 23:05:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606219558;
 bh=UFB5goYMCSNWLA3ekhjEPCzg/ejfWWNKc/J0LqLxKfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qJF165E3VOErhVY56Dlx2r1cpuVGF0e6BhJJOzp3AyNJfEABQNiEetG51MF8a8Rin
 Nkv7iJrNGrGLQ4ZhJlOs6kRAIwKWDmYrUZGv1is4qVoMTeKpvYcAXtFVGPoKKGokkr
 JcL6FNz1ojMe41dRYwHjBE3K3pqbdXFN3T2G8rh5sd/IGsCcxat6Hs7dKGi24NHEcU
 ZY2wfKbFnynHoSkTwMfbqjBodYLlCmsDJv20dfliWNwOP/V1oUIU5q7/Hlq42KLzt5
 JFEJ+srd0rWITHw9Oo4qOEeHJf/cWWT2tCugjFeg7qA1wzxjDXTsEid34AEexGiPRW
 sB44ocbq34gNg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/3] powerpc: Update NUMA Kconfig description & help text
Date: Tue, 24 Nov 2020 23:05:47 +1100
Message-Id: <20201124120547.1940635-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124120547.1940635-1-mpe@ellerman.id.au>
References: <20201124120547.1940635-1-mpe@ellerman.id.au>
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
Cc: rdunlap@infradead.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the NUMA Kconfig description to match other architectures, and
add some help text. Shamelessly borrowed from x86/arm64.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4d688b426353..7f4995b245a3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -659,9 +659,15 @@ config IRQ_ALL_CPUS
 	  reported with SMP Power Macintoshes with this option enabled.
 
 config NUMA
-	bool "NUMA support"
+	bool "NUMA Memory Allocation and Scheduler Support"
 	depends on PPC64 && SMP
 	default y if PPC_PSERIES || PPC_POWERNV
+	help
+	  Enable NUMA (Non-Uniform Memory Access) support.
+
+	  The kernel will try to allocate memory used by a CPU on the
+	  local memory controller of the CPU and add some more
+	  NUMA awareness to the kernel.
 
 config NODES_SHIFT
 	int
-- 
2.25.1


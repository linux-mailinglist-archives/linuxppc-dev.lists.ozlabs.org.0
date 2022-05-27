Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72205535F2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 13:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8j6d2XrBz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 21:21:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V1wKhBdK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8j625P16z305H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 21:20:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V1wKhBdK;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L8j624Mt2z4xYN;
	Fri, 27 May 2022 21:20:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653650442;
	bh=5F2Uvpm/VkWepYItVl1ZLxm2rHF9a4lb9tCQqLm8qYI=;
	h=From:To:Subject:Date:From;
	b=V1wKhBdKSjYzaA29iJWkk/sbE1cmwxVM06rhtOL+W5ZKgzks3M2GKI6yKGHOCF4t1
	 s50YJ0D2ujWJYtbf4hTJsafSBWn1yx7wfAY+N3xutXYbQtTr6MgkWnbgK8b+qu4mb0
	 1VqIIdj0qpg3IVV2KfijdtgcS/Vor97ViMYiqh63GwvCnxArHoTwXcRrP8mknDgPVg
	 l9NYRLohK076dRcoK4IA8SL9YZzOwBFTN7CTgbzpWaybw3dCJDnuzgDPOSyilUKD/G
	 3zBJjl/1wg/F3CQOKau+JPjQJ5Hfxf59SYVE3oLo2HgLzNShucNozX/tQtk7vEoQaQ
	 CtcOOY+HrTXwQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Include cache.h directly in paca.h
Date: Fri, 27 May 2022 21:20:35 +1000
Message-Id: <20220527112035.2842155-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

paca.h uses ____cacheline_aligned without directly including cache.h,
where it's defined.

For Book3S builds that's OK because paca.h includes lppaca.h, and it
does include cache.h.

But Book3E builds have been getting cache.h indirectly via printk.h,
which is dicey, and in fact that include was recently removed, leading
to build errors such as:

  ld: fs/isofs/dir.o:(.bss+0x0): multiple definition of `____cacheline_aligned'; fs/isofs/namei.o:(.bss+0x0): first defined here

So include cache.h directly to fix the build error.

Fixes: 534aa1dc975a ("printk: stop including cache.h from printk.h")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/paca.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 03330b7d835f..4d7aaab82702 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -12,6 +12,7 @@
 
 #ifdef CONFIG_PPC64
 
+#include <linux/cache.h>
 #include <linux/string.h>
 #include <asm/types.h>
 #include <asm/lppaca.h>
-- 
2.35.3


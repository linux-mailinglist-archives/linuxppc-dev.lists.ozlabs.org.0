Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F15814862
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 13:45:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p028LLFF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss88N0rScz3dTH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 23:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p028LLFF;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss87W4Zk8z3cWt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 23:44:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702644295;
	bh=ZbNUQcJBnFYDjt8DqRZb690YTN+Yerf1ziIZEyZ/aFk=;
	h=From:To:Cc:Subject:Date:From;
	b=p028LLFFmSypXdSf5eQppnhuXxGpim1xqRZkdhtLAxpY23ZFzTWkSL8T/RdmI8sLL
	 QZwz/IDzaaWsAE4icbVRfMLR29J9FF12OF1IZbHHsniZQ6iqqLUv8MCRZHbg/eeaeR
	 mJ/r0zQqoGs1G3DcyNm6Ae9zn6XqZmKEA+pJtX/2vhk7BKw61zCVqjXNKXfogQRhzB
	 XvGZyAzRD9weGxEqE8IWKL5w6kAhsrAdMpNFGzt9ffyftFsOvN9ma8RCFDANZDitx0
	 TDKU6x3COGie6OLcT1f43fFUSltCQ4wfUkXPqQ9DUGwSQRRUAWQZcvs0akdCdwNbrh
	 YjLEF/m1dokWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ss87W3Y79z4xG8;
	Fri, 15 Dec 2023 23:44:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Increase default stack size to 32KB
Date: Fri, 15 Dec 2023 23:44:49 +1100
Message-ID: <20231215124449.317597-1-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are reports of kernels crashing due to stack overflow while
running OpenShift (Kubernetes). The primary contributor to the stack
usage seems to be openvswitch, which is used by OVN-Kubernetes (based on
OVN (Open Virtual Network)), but NFS also contributes in some stack
traces.

There may be some opportunities to reduce stack usage in the openvswitch
code, but doing so potentially require tradeoffs vs performance, and
also requires testing across architectures.

Looking at stack usage across the kernel (using -fstack-usage), shows
that ppc64le stack frames are on average 50-100% larger than the
equivalent function built for x86-64. Which is not surprising given the
minimum stack frame size is 32 bytes on ppc64le vs 16 bytes on x86-64.

So increase the default stack size to 32KB for the modern 64-bit Book3S
platforms, ie. pseries (virtualised) and powernv (bare metal). That
leaves the older systems like G5s, and the AmigaOne (pasemi) with a 16KB
stack which should be sufficient on those machines.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..2df545c1446e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -858,6 +858,7 @@ config THREAD_SHIFT
 	int "Thread shift" if EXPERT
 	range 13 15
 	default "15" if PPC_256K_PAGES
+	default "15" if PPC_PSERIES || PPC_POWERNV
 	default "14" if PPC64
 	default "13"
 	help
-- 
2.43.0


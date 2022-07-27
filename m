Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB95828C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 16:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtGW53k7Bz3c3Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 00:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oIWzbOfL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtGTH1MfKz3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 00:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oIWzbOfL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtGTB5r62z4x1Y;
	Thu, 28 Jul 2022 00:32:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658932351;
	bh=g0nOdustMSutcYgoqQHDz+1g34vVMSLoXgyqTZdaCjg=;
	h=From:To:Cc:Subject:Date:From;
	b=oIWzbOfLLjg3QrKdRt4KEHiHO8A+VEGiDGQMP6uPkIRzh/M4bK08cXjQ6KLsx1wOT
	 usLOhEzXtM8VPIuJek1FyXekJoW84/qK/9PqHhjxuowwzLICvVkbYkJAj6AW22ju2B
	 QQqIRjMQWcXWtPYXTd5rnUC73EU1MJMqkIGd1zoGvxGrj4Tl/YdvrjS1YPuGaHCUqN
	 +DyyKMb4z+QZCy8Zlya12camjMrLlSDmgjDaNoj677qnkjYv4Op2maWONEJjaOx2XW
	 /ja6SQxUdziZfV4ybnyrqKC0TuGoSBczI34O+dPF8yO+iBIJ9UHks9Ue/D5iXoVtuu
	 /aLGiPPTAQVMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 1/3] powerpc/powernv: Avoid crashing if rng is NULL
Date: Thu, 28 Jul 2022 00:32:17 +1000
Message-Id: <20220727143219.2684192-1-mpe@ellerman.id.au>
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
Cc: Jason@zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a bare-metal Power8 system that doesn't have an "ibm,power-rng", a
malicious QEMU and guest that ignore the absence of the
KVM_CAP_PPC_HWRNG flag, and calls H_RANDOM anyway, will dereference a
NULL pointer.

In practice all Power8 machines have an "ibm,power-rng", but let's not
rely on that, add a NULL check and early return in
powernv_get_random_real_mode().

Cc: stable@vger.kernel.org # v4.1+
Fixes: e928e9cb3601 ("KVM: PPC: Book3S HV: Add fast real-mode H_RANDOM implementation.")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/rng.c | 2 ++
 1 file changed, 2 insertions(+)

v6: New patch, though change log based on Jason's original.

diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 3805ad13b8f3..2287c9cd0cd5 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -63,6 +63,8 @@ int powernv_get_random_real_mode(unsigned long *v)
 	struct powernv_rng *rng;
 
 	rng = raw_cpu_read(powernv_rng);
+	if (!rng)
+		return 0;
 
 	*v = rng_whiten(rng, __raw_rm_readq(rng->regs_real));
 
-- 
2.35.3


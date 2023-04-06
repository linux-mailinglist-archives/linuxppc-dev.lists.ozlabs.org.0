Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A36D9B48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pskyp1ZdHz3gcc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:53:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PERGucNT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psknv4Jzsz3fZG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PERGucNT;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Psknr2BzMz4xFZ;
	Fri,  7 Apr 2023 00:45:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680792352;
	bh=xPxa877hnQ/ia2BPQZXawdRAt1BVSr9MAYE3vUoMiCM=;
	h=From:To:Cc:Subject:Date:From;
	b=PERGucNT5wNEHwGDTCppTfkLRzkC8lfXfZ4hLd0Kwz8KF9tYXZHlwTm0tgJm+Ck+F
	 E7ClYoQVTAq1fKAhosfoG2RT+t+/fn3HuJYsSDQBEH3SwzYdFRG/zJpvd89HM5iIfD
	 /YUQFcC4r2EY/m/rBweeTjDEXsD9eLbj9kJGIDHftuXh3r2njGlTG6zyhh70kYCgp2
	 A316fNfar/OySOclvVeAVbo0y421BhYm88VgP9BiRjfmvT6s2RDZahma9QDYZS75WP
	 10iMH5vAPvQpDV+1O+KxWCv2XI7daErGiFjoHxk2wjVzesMM8Mm5UWQI+FyT997Qxg
	 ln+h0XcYhsJyQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/4] powerpc/64: Mark prep_irq_for_idle() __cpuidle
Date: Fri,  7 Apr 2023 00:45:32 +1000
Message-Id: <20230406144535.3786008-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Code in the idle path is not allowed to be instrumented because RCU is
disabled, see commit 0e985e9d2286 ("cpuidle: Add comments about
noinstr/__cpuidle usage").

Mark prep_irq_for_idle() __cpuidle, which is equivalent to noinstr, to
enforce that.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/irq_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index c788c55512ed..2ab0e8d84c1d 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -354,7 +354,7 @@ EXPORT_SYMBOL(arch_local_irq_restore);
  * disabled and marked as such, so the local_irq_enable() call
  * in arch_cpu_idle() will properly re-enable everything.
  */
-bool prep_irq_for_idle(void)
+__cpuidle bool prep_irq_for_idle(void)
 {
 	/*
 	 * First we need to hard disable to ensure no interrupt
-- 
2.39.2


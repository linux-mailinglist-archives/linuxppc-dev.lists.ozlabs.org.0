Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7245B7A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:42:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzbdt1Fd5z3c5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:42:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SOmVvXqg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbdH0L9Hz2yNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:42:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SOmVvXqg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzbdG6RWvz4xbd;
 Wed, 24 Nov 2021 20:42:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637746930;
 bh=BqEKEZt+wcLamQfDZRfEhCqQqCnm+UYasLx06AkzySA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SOmVvXqgYxpmFnJcxujOC7Oc9nBJzVEPXmRQ+x5X6yd7AzZr3/Syxq6aVz9xHzBhq
 RLMqmQT50lEWWftcyD6jc+HNGPRgFmG37nSvj/NjWmW5uRCIEEeyemMSJIRDuEWYvw
 RsH++bthID14oGcPZh7B36zO65i/KyEeyot/DYHPqmxB+I4jWkQWJ1/O/fW+hKkMu+
 mK35RrI3rxfpR5uMk9jZgZ5dA8IbhdxgM9rPBshTMsts5V91xj6TW5Nk5KLpwfXyEb
 Xq6AxZkdOosgRgrcq/EkcbkOaICTmoN+JDloxSXUi20brRfpgT54owXN2hbgMuvgDS
 Y5SKf9zcb/NoQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/6] powerpc/85xx: Make mpc85xx_smp_kexec_cpu_down() static
Date: Wed, 24 Nov 2021 20:32:50 +1100
Message-Id: <20211124093254.1054750-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124093254.1054750-1-mpe@ellerman.id.au>
References: <20211124093254.1054750-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To fix the W=1 warning:
  arch/powerpc/platforms/85xx/smp.c:369:6: error: no previous prototype for ‘mpc85xx_smp_kexec_cpu_down’

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/85xx/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 83f4a6389a28..0abc1da2c14f 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -366,7 +366,7 @@ struct smp_ops_t smp_85xx_ops = {
 #ifdef CONFIG_PPC32
 atomic_t kexec_down_cpus = ATOMIC_INIT(0);
 
-void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
+static void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
 {
 	local_irq_disable();
 
@@ -384,7 +384,7 @@ static void mpc85xx_smp_kexec_down(void *arg)
 		ppc_md.kexec_cpu_down(0,1);
 }
 #else
-void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
+static void mpc85xx_smp_kexec_cpu_down(int crash_shutdown, int secondary)
 {
 	int cpu = smp_processor_id();
 	int sibling = cpu_last_thread_sibling(cpu);
-- 
2.31.1


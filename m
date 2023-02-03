Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB568A600
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 23:18:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7qmN2jDpz3fJB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:18:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sMuRLeIe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sMuRLeIe;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7qVT2f07z3fBC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 09:06:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A3C8662042;
	Fri,  3 Feb 2023 22:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2DFC4339B;
	Fri,  3 Feb 2023 22:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461967;
	bh=NaTK1tR+V9DMn/hY0B5jpg7IE7MnPmPMawuvFBlMv1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMuRLeIeuX4e5NoLB6UdKdvNaRzHIa+b94PsGTQMufoRN5QA/zc/CEM69PsZyUbp1
	 MaysKmxIVcsGQzwrmnkKG0GvRbA9cxT/bDuVaZX4cKX13vFQry04JZub/7YbMzEr99
	 cLtBs39kcPbv3AEn9JqZbGlrlVJEq7+r29QctelrKOb+I+n2J4leC7FZUu7ApYfmKA
	 q7vw8T+tBdwQiLYoZGWf3XGbln2suP3atmYw9fVnFbsEtKD9GU9f/vEgJntOx59T3k
	 AYHnExlZzIdcgOgQulPOWNAktDPoSoVgTe6X9UFvqEgEZQgGo8/EaJPnZcpKZQib90
	 Jc9u1vCBV+1cA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 14/22] sh/cpu: Mark play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:23 -0800
Message-Id: <bba33f5055a1f5130d8d08ca019f3144c6345f1a.1675461757.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-type: text/plain
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/sh/include/asm/smp-ops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
index 63866b1595a0..97331fcb7b85 100644
--- a/arch/sh/include/asm/smp-ops.h
+++ b/arch/sh/include/asm/smp-ops.h
@@ -24,7 +24,7 @@ static inline void plat_smp_setup(void)
 	mp_ops->smp_setup();
 }
 
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	mp_ops->play_dead();
 	BUG();
@@ -43,7 +43,7 @@ static inline void register_smp_ops(struct plat_smp_ops *ops)
 {
 }
 
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	BUG();
 }
-- 
2.39.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6E8695A5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:13:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGC8q6Xpnz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lSg8bVoi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lSg8bVoi;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGC1y3ByZz3c7B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:07:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2F4E61474;
	Tue, 14 Feb 2023 07:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12C5C433A7;
	Tue, 14 Feb 2023 07:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358419;
	bh=3mR91vFTYi4rZMGRYXhJgaTgkFrCc+v4wRJPGBILCHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lSg8bVoi1sh/I6LONG4iulI3+H5Ch/fv8oDbHX3Iz0jLvADbdNJ6D9Sz4m9UcKyBI
	 u8j3EjXkJ36I1pjLPkbtpMMmXURLhpf0+V6yaLVf1isw74nA6CnSOlvkxRCip1ngGU
	 95eXUsVxMrlU6SstBN4ziVQPwIQ8/17wMlV2LoZUpRs3AjK1TEzUHxr9L1Unx2Bc2c
	 iPW6u9juO9foAwGO5JJByMvXfPQB1Lpxb4CcPYBA8FAJBUrIQBu6A2r//KGsu7LfUt
	 1HyKwkSfkaRwk/DdZ7zy/c/F59Cd3SGJj/k7oluBq9g8jtnPj9mSreXUy0dUR7bYBo
	 6iq/gvWezobbQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/24] ia64/cpu: Mark play_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:40 -0800
Message-Id: <7575bb38417bd8bcb5be980443f99cab29319342.1676358308.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
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
 arch/ia64/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index f6195a0a00ae..78f5794b2dde 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -201,7 +201,7 @@ __setup("nohalt", nohalt_setup);
 
 #ifdef CONFIG_HOTPLUG_CPU
 /* We don't actually take CPU down, just spin without interrupts. */
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	unsigned int this_cpu = smp_processor_id();
 
@@ -219,7 +219,7 @@ static inline void play_dead(void)
 	BUG();
 }
 #else
-static inline void play_dead(void)
+static inline void __noreturn play_dead(void)
 {
 	BUG();
 }
-- 
2.39.1


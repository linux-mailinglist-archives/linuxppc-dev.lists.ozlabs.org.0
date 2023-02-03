Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5568A5E4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 23:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7qhB4zwtz3fGn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:14:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bWyWlCGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bWyWlCGQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7qVJ0Fv0z3f96
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 09:06:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5114D62028;
	Fri,  3 Feb 2023 22:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7129AC433A7;
	Fri,  3 Feb 2023 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461958;
	bh=xE5ZmRzKMxAFPrHiSIoJTZlCDR5ti+ono/cm0PWjfeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWyWlCGQ8ixOuALZdKCzLss/6SMXhh1P0jHxv5K8dz+pGFJWRKFe/rDpdYt/pbEBy
	 Cv20t60IqNd4k2OPeeakryqDZQBCSnCIFbZYn4w8Wh4hZfyxfuwPiu4jwkipYMyAjx
	 3wjdyLJq2+oQSUZX9lPMnbCOK9kacUFdHpR/7gDTkVlFBlenq2ALG85m81cnxhAlqT
	 DUmyvxZm4cJjdO0Y03EgNOuJPyX9ZAC+k2Whi2B9zytn0fu/YSFoO3CbU5ghN7eGNf
	 AnlKFwVCJfplEUcEgqGsH3y9cSX006B8L7WqnSyPF5fCyXIzVXK57ufqsSU1oTeXrl
	 yrsQBm2IXfrYQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/22] mips/cpu: Expose play_dead()'s prototype definition
Date: Fri,  3 Feb 2023 14:05:18 -0800
Message-Id: <a532966831383927f5f4fbec0a1e13304588685a.1675461757.git.jpoimboe@kernel.org>
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

Include <asm/smp.h> to make sure play_dead() matches its prototype going
forward.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/mips/kernel/smp-bmips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index f5d7bfa3472a..df9158e8329d 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -38,6 +38,7 @@
 #include <asm/traps.h>
 #include <asm/barrier.h>
 #include <asm/cpu-features.h>
+#include <asm/smp.h>
 
 static int __maybe_unused max_cpus = 1;
 
-- 
2.39.0


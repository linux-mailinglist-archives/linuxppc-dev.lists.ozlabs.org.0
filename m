Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F0695A89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:22:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGCN902Fwz3ffL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:22:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcUSoKqU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcUSoKqU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGC2M5fTfz3c6Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:07:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 700BCB81C11;
	Tue, 14 Feb 2023 07:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B3EC433AA;
	Tue, 14 Feb 2023 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358440;
	bh=lVxYhY4OwwDPhm8BTwwcRy+JxjuJw8OgWEbHa0amaW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcUSoKqULJqLPku9lRFSHdbPaNeODYe/R1sZzjrR3VRHqcq59Tm9wERqJ6PlHQrjn
	 5GeWqya8mNwLITuoLWSAvRpjgR3SdVziUkPO9YsYEIi1QSukk7EUS9aKdkfWfOxlAO
	 wYjLK997WLSPPi0UzLKNSA6lD26mGt+cEcDEsvqdQMTTD3geXcDD/U9CExxmKiegju
	 C8HPMNKcuZCM+retZCnUY1hx60pKE2mQSPyq6ne+xt6jgv18ltv46AT4IlPKwLgjF+
	 KccGkJXMroepuqfZj6Fbx4rYWNFKt9XuiLi9CgivFSVeZiuhzrxK+XEv+28NZ52XHL
	 ujubifvv+6/4A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/24] x86/cpu: Make sure play_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:51 -0800
Message-Id: <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
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

After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
return"), play_dead() never returns.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/smp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index b4dbb20dab1a..8f628e08b25a 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
 static inline void play_dead(void)
 {
 	smp_ops.play_dead();
+	BUG();
 }
 
 static inline void smp_send_reschedule(int cpu)
-- 
2.39.1


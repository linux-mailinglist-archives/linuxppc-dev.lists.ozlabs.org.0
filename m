Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158768A611
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 23:22:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7qsZ3vkbz3fnT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:22:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k65vkzVP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k65vkzVP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7qVf597Zz3fCG
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 09:06:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 045EF62021;
	Fri,  3 Feb 2023 22:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265AEC433D2;
	Fri,  3 Feb 2023 22:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461976;
	bh=qzio4RRFUV3T4RxMjX88Z4lXma5TBrgxzmQ4rFvXUQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k65vkzVP6z141oLnhjfrwBtKaSVH4NDImaR6KsAo5tm4t33CTjXSkk1Kc002UVteN
	 xjJFsLbbmrzV/oEDThT0uVKwXiyt81xJhbaZw5d1W0aCS8iJi8ZN1n47ZmOxdaXlne
	 brWwWunBne264Md4i+0bg1dx7gUqkbA9IFbPGDydUxEo11sw9DVpvqZHgK2MDBJDej
	 trULeFzTKyDLcTkcAA8D9XSzTnv4n/e1IfgE/o/RMoSp7z0wipVfyAtH77G7/nVsy4
	 343nx2w/X70+IGMD3m7acnwGo130O5HOl5lHXueR8i/o1BQV7Ek1JE0i3Q3oOf9k9F
	 DgZNg3mMxOn+w==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 19/22] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Fri,  3 Feb 2023 14:05:28 -0800
Message-Id: <13cfde410b50047d778f535d12d928813e92c745.1675461757.git.jpoimboe@kernel.org>
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

cpu_die() doesn't return.  Make that more explicit with a BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/xtensa/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index 4dc109dd6214..7bad78495536 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -341,6 +341,8 @@ void __ref cpu_die(void)
 	__asm__ __volatile__(
 			"	movi	a2, cpu_restart\n"
 			"	jx	a2\n");
+
+	BUG();
 }
 
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.39.0


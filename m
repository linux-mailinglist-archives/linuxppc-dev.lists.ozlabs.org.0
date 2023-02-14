Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D41695A85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGCL04SqZz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:20:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MDsB0lHr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MDsB0lHr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGC2G4nv9z3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:07:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDD0E6146E;
	Tue, 14 Feb 2023 07:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFFFC433EF;
	Tue, 14 Feb 2023 07:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358436;
	bh=Ps4PGBv5yPXgtfxfiozPFQBkOC0Om6bfqHZoaR0a8Wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MDsB0lHraBham/iBQwdl/0Ii9dk8Fs9DMdBLbIn4m+kNU0Ocm8Gn9vAEo2FfPFAGg
	 MXid5BhOlSnx6jtD07OvEM0AQjNL6xK96ztsfJaaJbji01ahTN77Njrk8qiVs4WrQZ
	 RGqCdA/2a/guY2gP+hj7f+21EdwRYt7sXIbtaE1Ukcp1q+Gh6DgkQ64wn1A5vJLc+V
	 odxmo+I5tHChoineV/Y+LwKEiWgmUKi/aJU+aQ/l6vUIO1+ZQ8XYX80Bv/mo2ZVL6d
	 4DsM/ppaCL0pPFKUsMcO3kYD7KJFpXSTX3GxGujVjrt5tnDm1VdYU8uBZ+R1xQzCB4
	 rNYx73prqIL/A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/24] sh/cpu: Expose arch_cpu_idle_dead()'s prototype definition
Date: Mon, 13 Feb 2023 23:05:49 -0800
Message-Id: <3d9661e97828fb464a48d4becf18f12604831903.1676358308.git.jpoimboe@kernel.org>
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

Include <linux/cpu.h> to make sure arch_cpu_idle_dead() matches its
prototype going forward.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/sh/kernel/idle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/kernel/idle.c b/arch/sh/kernel/idle.c
index 3418c40f0099..114f0c4abeac 100644
--- a/arch/sh/kernel/idle.c
+++ b/arch/sh/kernel/idle.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 2002 - 2009  Paul Mundt
  */
+#include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mm.h>
-- 
2.39.1


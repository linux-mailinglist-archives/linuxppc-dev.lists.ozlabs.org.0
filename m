Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4E699C91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 19:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHkNy4KvGz3f5L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:43:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gKpTH6Xm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gKpTH6Xm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHkMz58VHz3f54
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 05:42:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED7462074;
	Thu, 16 Feb 2023 18:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2134C433D2;
	Thu, 16 Feb 2023 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676572972;
	bh=TlkXm7VNtzsJ7EfaEbNCQ0jrF6Prk2gRLM56xZV0kHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKpTH6Xma+bwkChOl4NLqIndv0Q0HNEGdo6fSGe2zx9UY2BJokLjGScUyDUFIyjs9
	 wHG7zTGmWy1W1NXsvoAG52q2DP0SVTJfLhB/sg40zsXEkiXxqQfCmiK5HkoaXoi50K
	 RajXDINrwduwnFFcetLEurxPZRsCdQSD9lXzw5lPbEjrfxkkYiP49ODJA32x+gCeCZ
	 Qz7xF5LCN8Pkp+5JWe3iXQAVfIJDqbiEKe6CoSERnlnc9RX8jR98iPo7qWnXozME9c
	 lzv2gmFirTvDhgkYO8L7uGcZgBqTJWPnxzROBXQ924iZHTN2zPNmp9qGv97dKbm8K7
	 3PR4cj03EaGxg==
Date: Thu, 16 Feb 2023 10:42:49 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2.1 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Message-ID: <20230216184249.ogaqsaykottpxtcb@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
 <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
 <20230214181101.3a2tscbmwdnwbqpu@treble>
 <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kern
 el@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Include <asm/smp.h> to make sure play_dead() matches its prototype going
forward.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/mips/cavium-octeon/smp.c | 1 +
 arch/mips/kernel/smp-bmips.c  | 1 +
 arch/mips/kernel/smp-cps.c    | 1 +
 arch/mips/loongson64/smp.c    | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 89954f5f87fb..4212584e6efa 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -20,6 +20,7 @@
 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
 
 #include <asm/octeon/octeon.h>
 
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
 
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index bcd6a944b839..6d69a9ba8167 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -20,6 +20,7 @@
 #include <asm/mipsregs.h>
 #include <asm/pm-cps.h>
 #include <asm/r4kcache.h>
+#include <asm/smp.h>
 #include <asm/smp-cps.h>
 #include <asm/time.h>
 #include <asm/uasm.h>
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 660e1de4412a..4e24b317e7cb 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -14,6 +14,7 @@
 #include <linux/cpufreq.h>
 #include <linux/kexec.h>
 #include <asm/processor.h>
+#include <asm/smp.h>
 #include <asm/time.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
-- 
2.39.1


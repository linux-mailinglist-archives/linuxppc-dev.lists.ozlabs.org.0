Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA87695A91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:25:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGCR91nDpz3fWx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:25:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qtoom7YB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qtoom7YB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGC2R5SjKz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:07:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E42A261465;
	Tue, 14 Feb 2023 07:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F595C433A7;
	Tue, 14 Feb 2023 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358445;
	bh=1pqvhflGCMe/wrdXOMGr/PebbGgnoXhSUZ8eiEoomNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qtoom7YBj3WBm4M85syos7pcETmxlT1MO3MRIBzB66grdniTPurXhV+aT1FnjslmP
	 cMp8MWlimGazyrts9GCWRE8gcSjSDK92J9KS5PhgvRRjWcdrU9y1ofmCeleW/ftCC/
	 Wbj9tPEch8OC7fzaBaluyhN4gvUOnlPmYj2fushMqqylVs5lB0xce5ctDacvlOLhw1
	 gXV0gp4IRLXlK+aa4b1o04FzIlzpIDShD/Axowf7OBsRnGemMDdukKh93uEPCVtkqh
	 aPBcMAbBB6Dy6grAZpPwHtPBnbks1EAiqjozMkYpQDepqD0nDE14RN33E32CXChkal
	 EPgyHn2BysIww==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/24] xtensa/cpu: Mark cpu_die() __noreturn
Date: Mon, 13 Feb 2023 23:05:54 -0800
Message-Id: <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
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

cpu_die() doesn't return.  Annotate it as such.  By extension this also
makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/xtensa/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/include/asm/smp.h b/arch/xtensa/include/asm/smp.h
index 4e43f5643891..5dc5bf8cdd77 100644
--- a/arch/xtensa/include/asm/smp.h
+++ b/arch/xtensa/include/asm/smp.h
@@ -33,7 +33,7 @@ void show_ipi_list(struct seq_file *p, int prec);
 
 void __cpu_die(unsigned int cpu);
 int __cpu_disable(void);
-void cpu_die(void);
+void __noreturn cpu_die(void);
 void cpu_restart(void);
 
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.39.1


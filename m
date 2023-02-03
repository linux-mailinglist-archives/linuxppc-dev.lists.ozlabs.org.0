Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F468A614
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 23:24:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7qvb5kzbz3fk3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YYnlpQSI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YYnlpQSI;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7qVl0DZ0z3fCh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 09:06:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 10A1AB82C38;
	Fri,  3 Feb 2023 22:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00232C433AA;
	Fri,  3 Feb 2023 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461978;
	bh=ikmsAPzcHbKm4BPXAk4vCHLoc1MwBOQvSdhyskC8aqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YYnlpQSIhXfIuZtmwX80cwYo8HEVkuAoZxxjLbmDEqRvH2RxesFNwaeIQN8SzGBzW
	 vLLgsYhL0lS45Fyp9Ve74Sw7eovpDoz9Guf5+yE5xWhW9jMzSmF6nhwFbdConwpN/q
	 D9yipeu6g+D7RAafGUb1qRd6MBnXP+1xEKWp3ZVkISd4WH7IqGChCY1svitqCGUU2L
	 JdWz9fBXaPuCoakVUsltIf7yUwqSNv7WF803g7r/quj+PbB+xvBjdfXD9xeqxTxmh5
	 kyPlNWlqjarxCrasQl1DO4ameVNS+OQy/bXqd6w2fDPppGX9mt+KVd1ga0sKukW8F6
	 dCgB90Ai6peWA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 20/22] xtensa/cpu: Mark cpu_die() __noreturn
Date: Fri,  3 Feb 2023 14:05:29 -0800
Message-Id: <f49d0092aa9eb23fe495c697bd49b2553220fa29.1675461757.git.jpoimboe@kernel.org>
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
2.39.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBA68A608
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 23:19:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7qpP3nt5z3fkJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:19:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbvLI9SG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbvLI9SG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7qVY3bMtz3f8v
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 09:06:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C396062022;
	Fri,  3 Feb 2023 22:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E24C433D2;
	Fri,  3 Feb 2023 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461971;
	bh=NrR4P0DY0KkRcvJJpvaBPY8nrqhj1/4WEFbiWkgx25U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbvLI9SGR0mrEEcDvsTWGmRFY+xC5m55RleQxz9+JQteyCjIJS4oyATHgaLDKg8iT
	 Mrcrj1tUqkDKFgDxhiACotXzzd+Ubb/npyitm47+khhnGTg6xyDpHKD0vy1jIB9u/5
	 Kl5ByQZatrNlKTDjf0rI7hwfhuNbRiRVWk5imgdvp/hM5rNayYJmTUSlZKkk4SlpVs
	 hNm1EBHVifr87GODpz8fpV5UZtd7OqZtrW9RwJeMKf5neI0Evpzkv/91pLQ3MbT6JX
	 YQvfjazaZO7Yyom9jcaMJyey9HktA0dUciIGj3r15+QMSD68NRS+h08TN3KaJVaVuz
	 sRz7u8p3VLZNw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/22] sparc/cpu: Mark cpu_play_dead() __noreturn
Date: Fri,  3 Feb 2023 14:05:25 -0800
Message-Id: <eccdec6e86daed65bedd77f9c3e540503e1ed648.1675461757.git.jpoimboe@kernel.org>
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

cpu_play_dead() doesn't return.  Annotate it as such.  By extension this
also makes arch_cpu_idle_dead() noreturn.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/sparc/include/asm/smp_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/smp_64.h b/arch/sparc/include/asm/smp_64.h
index e75783b6abc4..505b6700805d 100644
--- a/arch/sparc/include/asm/smp_64.h
+++ b/arch/sparc/include/asm/smp_64.h
@@ -49,7 +49,7 @@ int hard_smp_processor_id(void);
 
 void smp_fill_in_cpu_possible_map(void);
 void smp_fill_in_sib_core_maps(void);
-void cpu_play_dead(void);
+void __noreturn cpu_play_dead(void);
 
 void smp_fetch_global_regs(void);
 void smp_fetch_global_pmu(void);
-- 
2.39.0


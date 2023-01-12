Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3E668563
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtHm429wZz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HX4zIGc7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtFjJ1X8vz3f9x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 06:58:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=g+drg6uUsP6YHX5z1pA/AishyJbSIL0Ic60jCQj0FKI=; b=HX4zIGc7CNEnvS4rGn7W0D9vH+
	BqXSKBVzbOjdJmVjwKxM7CErrgFVSVz/1+bUhTtJLxqBqKUls/dfAKcxdlM/GqAKIZgPcyyvtiYC/
	xNsvs3jEkA3Tc7wTD9dKX7AqQVMoK3zZGnoIRVPe2/ByXxJkmUGz2mgC+xq8GzDIl2mMQh/SS0wBb
	n8VTeRISnPcLdiCi2mz8Xah5kZu27M2Y+yFi7mr7Ut1y4VkoQunAEfDpTHMkZnAblbze/EQp4/W3m
	gMbvO683icMip+ILGDnrJ2cs/cFkJS4BJyY9lEGJ3v9cTLztSTyffVlb60q8QCxYTmdvnOk8RO/+K
	ZD1kTYwg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pG3ha-0045wt-0G;
	Thu, 12 Jan 2023 19:57:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 51C39300C50;
	Thu, 12 Jan 2023 20:57:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 810012CD066F0; Thu, 12 Jan 2023 20:57:08 +0100 (CET)
Message-ID: <20230112195542.458034262@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 20:44:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v3 51/51] context_tracking: Fix noinstr vs KASAN
References: <20230112194314.845371875@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Fri, 13 Jan 2023 07:59:45 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, nsekhar@ti.com, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.
 org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky
 @oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristians
 son@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vmlinux.o: warning: objtool: __ct_user_enter+0x72: call to __kasan_check_write() leaves .noinstr.text section
vmlinux.o: warning: objtool: __ct_user_exit+0x47: call to __kasan_check_write() leaves .noinstr.text section

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/context_tracking.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -510,7 +510,7 @@ void noinstr __ct_user_enter(enum ctx_st
 			 * In this we case we don't care about any concurrency/ordering.
 			 */
 			if (!IS_ENABLED(CONFIG_CONTEXT_TRACKING_IDLE))
-				atomic_set(&ct->state, state);
+				arch_atomic_set(&ct->state, state);
 		} else {
 			/*
 			 * Even if context tracking is disabled on this CPU, because it's outside
@@ -527,7 +527,7 @@ void noinstr __ct_user_enter(enum ctx_st
 			 */
 			if (!IS_ENABLED(CONFIG_CONTEXT_TRACKING_IDLE)) {
 				/* Tracking for vtime only, no concurrent RCU EQS accounting */
-				atomic_set(&ct->state, state);
+				arch_atomic_set(&ct->state, state);
 			} else {
 				/*
 				 * Tracking for vtime and RCU EQS. Make sure we don't race
@@ -535,7 +535,7 @@ void noinstr __ct_user_enter(enum ctx_st
 				 * RCU only requires RCU_DYNTICKS_IDX increments to be fully
 				 * ordered.
 				 */
-				atomic_add(state, &ct->state);
+				arch_atomic_add(state, &ct->state);
 			}
 		}
 	}
@@ -630,12 +630,12 @@ void noinstr __ct_user_exit(enum ctx_sta
 			 * In this we case we don't care about any concurrency/ordering.
 			 */
 			if (!IS_ENABLED(CONFIG_CONTEXT_TRACKING_IDLE))
-				atomic_set(&ct->state, CONTEXT_KERNEL);
+				arch_atomic_set(&ct->state, CONTEXT_KERNEL);
 
 		} else {
 			if (!IS_ENABLED(CONFIG_CONTEXT_TRACKING_IDLE)) {
 				/* Tracking for vtime only, no concurrent RCU EQS accounting */
-				atomic_set(&ct->state, CONTEXT_KERNEL);
+				arch_atomic_set(&ct->state, CONTEXT_KERNEL);
 			} else {
 				/*
 				 * Tracking for vtime and RCU EQS. Make sure we don't race
@@ -643,7 +643,7 @@ void noinstr __ct_user_exit(enum ctx_sta
 				 * RCU only requires RCU_DYNTICKS_IDX increments to be fully
 				 * ordered.
 				 */
-				atomic_sub(state, &ct->state);
+				arch_atomic_sub(state, &ct->state);
 			}
 		}
 	}



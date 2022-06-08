Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7A544036
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 01:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJPLz4NJKz3chb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 09:58:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E4ma1UJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ96q3Kwhz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 00:47:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=lz2MUgDITA4yYb0U+PMz5bsqmEWyVbYbLXt1grP5wdc=; b=E4ma1UJky4lYLkF7WsmuwBiBAR
	ZNOCNP37EHcDipS0h5pGpc7Z83q2l0F9r1qoT2IwS4JaVORLNk9Y8kD1/G4PQ/WPrdROyQRafl+bw
	8kEHexR7OAoHvsHpcXrvfDNKNmCb7vZaRmG5jCMjvkiVnlyjOoCZYPiCN2YUEe0s+KCLCMKw1lusn
	c//k/ch+ZMfy68BfHEU9q/SBuHFmKkFeZQNGD+V4Ey9G51j7RCAyIzKlUBl1/EhiN9VFEuwMKKqHS
	exZwnsJXFjdzNoY07XCZXRHpvxrUSpp80Ad7Sk+AHygZ2w1HtBhHyFFImsUsvO1nkQsZm+y1UkgzW
	W9tgnQAA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywx6-0066Do-Kq; Wed, 08 Jun 2022 14:46:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0CE1C302F57;
	Wed,  8 Jun 2022 16:46:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id CB17620C119BB; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144518.199614455@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH 36/36] cpuidle,clk: Remove trace_.*_rcuidle()
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:55:19 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualizatio
 n@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com

, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dab
 belt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

OMAP was the one and only user.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/clk/clk.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -978,12 +978,12 @@ static void clk_core_disable(struct clk_
 	if (--core->enable_count > 0)
 		return;
 
-	trace_clk_disable_rcuidle(core);
+	trace_clk_disable(core);
 
 	if (core->ops->disable)
 		core->ops->disable(core->hw);
 
-	trace_clk_disable_complete_rcuidle(core);
+	trace_clk_disable_complete(core);
 
 	clk_core_disable(core->parent);
 }
@@ -1037,12 +1037,12 @@ static int clk_core_enable(struct clk_co
 		if (ret)
 			return ret;
 
-		trace_clk_enable_rcuidle(core);
+		trace_clk_enable(core);
 
 		if (core->ops->enable)
 			ret = core->ops->enable(core->hw);
 
-		trace_clk_enable_complete_rcuidle(core);
+		trace_clk_enable_complete(core);
 
 		if (ret) {
 			clk_core_disable(core->parent);



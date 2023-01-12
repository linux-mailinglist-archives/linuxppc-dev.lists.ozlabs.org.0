Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3485C6685C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtJ680df8z3gQc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:46:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ew9S6ssy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ew9S6ssy;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtGNP2chcz3c88
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 07:28:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D4D4B82014;
	Thu, 12 Jan 2023 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08847C433EF;
	Thu, 12 Jan 2023 20:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673555327;
	bh=ZbPNLkIUkQwHXCbvQoI2XLaF4ww/POIlS320Sa4a75I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ew9S6ssyQxA/qOEa20QKNGKB4XNqKcj4gZvqGJH+zAG+P+Etqd7vw/znf/4NWIiTQ
	 Bk5xIf0TF8vpJTdsWmpqMzyz2u9CW3n58vVXYINgKQ8Ys9ny0OlUoy7YWJiSRsWGNl
	 RTVY7ppda94AJFEtcKo4HqFchiKjjT19SH8zBk8fjiY0YWgeKj83yZBlXudb2eSa64
	 q4IvtFH0u1VXC5cZIoMU1HyoWnUF84ag01Ib966jn6Jq4C3CU5IEq54tzZpHoOhssE
	 fZa0d21POZJLgjX5QB2TV2LFJLbEPppv5c9Y86RzgOUX6eeUDwPcIKdJkOiovDkAI3
	 X6K2ZCEAo7m+Q==
Message-ID: <cd75c97ac883283fb0764f5862a6377f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230112195541.844982902@infradead.org>
References: <20230112194314.845371875@infradead.org> <20230112195541.844982902@infradead.org>
Subject: Re: [PATCH v3 41/51] cpuidle,clk: Remove trace_.*_rcuidle()
From: Stephen Boyd <sboyd@kernel.org>
To: peterz@infradead.org
Date: Thu, 12 Jan 2023 12:28:44 -0800
User-Agent: alot/0.10
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
Cc: juri.lelli@redhat.com,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, rafael@kernel.org,
	catalin.marinas@arm.com, linus.walleij@linaro.org, nsekhar@ti.com,
	bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
	agordeev@linux.ibm.com, srivatsa@csail.mit.edu,
	linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	vincent.guittot@linaro.org, chenhuacai@kernel.org,
	linux-acpi@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org,
	linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com,
	mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
	linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de,
	linux-omap@vger.kernel.org, dietmar.eggemann@arm.com,
	andreyknvl@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org,
	tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-trace-kernel@vger.kernel.org, mark.rutland@arm.com,
	linux-ia64@vger.kernel.org, alim.akhtar@samsung.com,
	dave.hansen@linux.intel.com,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
	thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com,
	linux-s390@vger.kernel.org, vschneid@redhat.com,
	john.ogness@linutronix.de, ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl,
	daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org,
	frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org,
	kernel@pengutronix.de, gor@linux.ibm.com,
	linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
	shorne@gmail.com, chris@zankel.net, dinguyen@kernel.org,
	com@lists.ozlabs.org, Ulf Hansson <ulf.hansson@linaro.org>,
	alexander.shishkin@linux.intel.com, lpieralisi@kernel.org,
	atishp@atishpatra.org, linux@rasmusvillemoes.dk,
	kasan-dev@googlegroups.com, borntraeger@linux.ibm,
	festevam@gmail.com, boris.ostrovsky@oracle.com, khilman@kernel.org,
	linux-csky@vger.kernel.org, pv-drivers@vmware.com,
	linux-snps-arc@lists.infradead.org, mgorman@suse.de,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	ulli.kroll@googlemail.com, linux-clk@vger.kernel.org,
	rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com,
	tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
	konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com,
	sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net,
	dalias@libc.org, tony@atomide.com, amakhalov@vmware.com,
	linux-mm@kvack.org, glider@google.com, hpa@zytor.com,
	sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com,
	anton.ivanov@cambridgegreys.com, jonas@southpole.se,
	yury.norov@gmail.com, richard@nod.at, x86@kernel.org,
	linux@armlinux.org.uk, agross@kernel.org, mhiramat@kernel.org,
	aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com,
	richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi,
	openrisc@lists.librecores.org, acme@kernel.org,
	paul.walmsley@sifive.com, linux-tegra@vger.kernel.org,
	namhyung@kernel.org, andriy.shevchenko@linux.intel.com,
	jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com,
	monstr@monstr.eu, bristot@redhat.com, andersson@kernel.org,
	linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de,
	johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org,
	deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Peter Zijlstra (2023-01-12 11:43:55)
> OMAP was the one and only user.
>=20
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Frederic Weisbecker <frederic@kernel.org>
> Tested-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

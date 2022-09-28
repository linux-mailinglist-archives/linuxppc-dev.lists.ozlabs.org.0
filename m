Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C03485EF4F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 14:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdXDf51Hdz2xh0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 22:07:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T+jczSmR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T+jczSmR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md48012RTz3bfC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 04:02:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A797EB820E8;
	Wed, 28 Sep 2022 18:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3512EC4314C;
	Wed, 28 Sep 2022 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664388119;
	bh=+R+5Ns222VYKCsIAXm0EtGUD9zLCQPxIpEujC1GgACo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T+jczSmRmP4Jxjbhv5PnAHtWfgjdIVMDvRVFXllGU3Uar4sIJPl+PNHC8v7SBqn9R
	 TJzzWFyZCkLCT1HNMt9sAUZuSZLsznAA4rL6mFHHzFqozKCb0E5JPUr6blFpYaotWd
	 FjnONkJ70opZE0eiBgxOzAPt+zpaayYsakbq2e0o7ogQFF48ymmbK0Tel3A6If0/fr
	 1Agzaag1gHBTm8jFoWO3jg4RjGLm4by83oZrZ08NNFlPE5u2xGrqdvyxoNpVHU9/bY
	 gq89+ULQCWOwAGBGH+gmzfv5n1SxR6G68zYk0n9w/5FlOwHfcKsoAjdntyPP7H0MoA
	 +zhOXdJVALI/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220919101522.975285117@infradead.org>
References: <20220919095939.761690562@infradead.org> <20220919101522.975285117@infradead.org>
Subject: Re: [PATCH v2 39/44] cpuidle,clk: Remove trace_.*_rcuidle()
From: Stephen Boyd <sboyd@kernel.org>
To: peterz@infradead.org
Date: Wed, 28 Sep 2022 11:01:57 -0700
User-Agent: alot/0.10
Message-Id: <20220928180159.3512EC4314C@smtp.kernel.org>
X-Mailman-Approved-At: Thu, 29 Sep 2022 22:07:17 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org,
	catalin.marinas@arm.com, linus.walleij@linaro.org,
	bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
	agordeev@linux.ibm.com, srivatsa@csail.mit.edu,
	linux-arch@vger.kernel.org, vincent.guittot@linaro.org,
	chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org,
	geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org,
	mattst88@gmail.com, borntraeger@linux.ibm.com,
	mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
	linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de,
	linux-omap@vger.kernel.org, dietmar.eggemann@arm.com,
	andreyknvl@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
	svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com,
	linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
	thierry.reding@gmail.com, et@lists.ozlabs.org, kernel@xen0n.name,
	cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com,
	john.ogness@linutronix.de, ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de,
	daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org,
	lenb@kernel.org, linux-xtensa@linux-xtensa.org,
	kernel@pengutronix.de, gor@linux.ibm.com,
	linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
	shorne@gmail.com, chris@zankel.net, dinguyen@kernel.org,
	bristot@redhat.com, alexander.shishkin@linux.intel.com,
	fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org,
	linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com,
	will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org,
	linux-csky@vger.kernel.org, pv-drivers@vmware.com, davem@davemloft.n,
	linux-snps-arc@lists.infradead.org, mgorman@suse.de,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	ulli.kroll@googlemail.com, linux-clk@vger.kernel.org,
	rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com,
	tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
	ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org,
	dalias@libc.org, tony@atomide.com, amakhalov@vmware.com,
	konrad.dybcio@somainline.org, bjorn.andersson@linaro.org,
	glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
	vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com,
	jonas@southpole.se, yury.norov@gmail.com, richard@nod.at,
	x86@kernel.org, linux@armlinux.org.uk,
	".kernel.org"@lists.ozlabs.org, mingo@redhat.com,
	linux-perf-users@vger, aou@eecs.berkeley.edu, hca@linux.ibm.com,
	richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi,
	openrisc@lists.librecores.org, acme@kernel.org,
	paul.walmsley@sifive.com, linux-tegra@vger.kernel.org,
	namhyung@kernel.org, andriy.shevchenko@linux.intel.com,
	jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com,
	monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com,
	anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net,
	linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Peter Zijlstra (2022-09-19 03:00:18)
> OMAP was the one and only user.
>=20
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

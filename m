Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6425ED243
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 02:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McdL149Lmz3fGv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 10:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
X-Greylist: delayed 533 seconds by postgrey-1.36 at boromir; Tue, 27 Sep 2022 16:30:53 AEST
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc8rs34HGz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 16:30:53 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id E879B80E0;
	Tue, 27 Sep 2022 06:13:36 +0000 (UTC)
Date: Tue, 27 Sep 2022 09:21:54 +0300
From: Tony Lindgren <tony@atomide.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 37/44] arm,omap2: Use WFI for omap2_pm_idle()
Message-ID: <YzKWgjNLWSmDss/h@atomide.com>
References: <20220919095939.761690562@infradead.org>
 <20220919101522.842219871@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919101522.842219871@infradead.org>
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:50:40 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, vir
 tualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, linux-snps-arc@lists.infradead.org, mgorman@suse.de,
  jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko
 @linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Peter Zijlstra <peterz@infradead.org> [220919 10:09]:
> arch_cpu_idle() is a very simple idle interface and exposes only a
> single idle state and is expected to not require RCU and not do any
> tracing/instrumentation.
> 
> As such, omap2_pm_idle() is not a valid implementation. Replace it
> with a simple (shallow) omap2_do_wfi() call.
> 
> Omap2 doesn't have a cpuidle driver; but adding one would be the
> recourse to (re)gain the other idle states.

Looks good to me thanks:

Acked-by: Tony Lindgren <tony@atomide.com>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F4D5E57A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 02:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXxXJ2LL4z3cjM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 10:50:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qaUYBCa8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qaUYBCa8;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXxRN62v3z3bgh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 10:46:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C90763340
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 00:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E826C4315C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663807562;
	bh=2bH5aOcexI7rmLPjoykcAnkew/OWwytHkYzPwWB/jQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qaUYBCa8ZYQI7GFr3vNdl7b4/PNzeOP9Pl2wTB/4OC6mUC/FIDhddHDVnhJyCLZDw
	 YQge6B5Td0P7VO9PjXCnxo31fcUlfOUeOzuNgueaOnxtVyoeE+Kw885ZbDXxjh+Kxz
	 nG8xhYs4MfH8znO0LxccUTvFyIcklL8qxJgHgHzEwD28BpML95SM926I5BVMpBRfGy
	 EClfn8JhrAFiO2xWjdeYnkuQSHDKC+N7GbQ87Gnwaucrl4yjzE6eDQWXlwcBRoA5Iv
	 jLegSRu7TSsZLQytF1F6DuVm9kAdHW2MlxTQNgWpbKQ1zMRvmGVdyaWmNwNcIB2j62
	 KBXRDapx3EsAg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-12803ac8113so11641992fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 17:46:02 -0700 (PDT)
X-Gm-Message-State: ACrzQf0pM/NsKxxWs8QZoamJ4XgNPXGwoROBfylSAPoDLMewGdtjRCJ5
	uuE/393o+RerrkRCUcxzaNEp1fJHktOGOG1zM2M=
X-Google-Smtp-Source: AMsMyM5wVf/J3OOqRLb4f8q+r+SKS9nQRSK3lKOefa1IGuaM19Jt2C1f8Xzw1tF39UCQAq/htt5QaEfcl4EevNt8Lqo=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr6779719oao.112.1663807550798; Wed, 21
 Sep 2022 17:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101520.802976773@infradead.org>
In-Reply-To: <20220919101520.802976773@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 22 Sep 2022 08:45:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQxxRQZLV+uJThCZSByUQ0oSoASgwsUggbsR3wHTqrqzg@mail.gmail.com>
Message-ID: <CAJF2gTQxxRQZLV+uJThCZSByUQ0oSoASgwsUggbsR3wHTqrqzg@mail.gmail.com>
Subject: Re: [PATCH v2 07/44] cpuidle,psci: Push RCU-idle into driver
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 22 Sep 2022 10:49:33 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualization@lists.l
 inux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse
 .de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@
 linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Sep 19, 2022 at 6:17 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, at least twice, before going idle is daft.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/cpuidle/cpuidle-psci.c |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -69,12 +69,12 @@ static int __psci_enter_domain_idle_stat
>                 return -1;
>
>         /* Do runtime PM to manage a hierarchical CPU toplogy. */
> -       ct_irq_enter_irqson();
>         if (s2idle)
>                 dev_pm_genpd_suspend(pd_dev);
>         else
>                 pm_runtime_put_sync_suspend(pd_dev);
> -       ct_irq_exit_irqson();
> +
> +       ct_idle_enter();
>
>         state = psci_get_domain_state();
>         if (!state)
> @@ -82,12 +82,12 @@ static int __psci_enter_domain_idle_stat
>
>         ret = psci_cpu_suspend_enter(state) ? -1 : idx;
>
> -       ct_irq_enter_irqson();
> +       ct_idle_exit();
> +
>         if (s2idle)
>                 dev_pm_genpd_resume(pd_dev);
>         else
>                 pm_runtime_get_sync(pd_dev);
> -       ct_irq_exit_irqson();
>
>         cpu_pm_exit();
>
> @@ -240,6 +240,7 @@ static int psci_dt_cpu_init_topology(str
>          * of a shared state for the domain, assumes the domain states are all
>          * deeper states.
>          */
> +       drv->states[state_count - 1].flags |= CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
>         drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
>         psci_cpuidle_use_cpuhp = true;
>
>


-- 
Best Regards
 Guo Ren

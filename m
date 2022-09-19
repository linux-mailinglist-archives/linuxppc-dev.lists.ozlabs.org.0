Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832B5BD741
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWfQD2DrWz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 08:25:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6l84clV/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6l84clV/;
	dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWNQ64gCTz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 21:54:37 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id k9so14635551ils.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gUsv6szv6dsUeM9asVJnwaGmSGG17UchvxqwxLA3h8g=;
        b=6l84clV/ev4Ho0Nth4fVfA2YCUlnkvOSgxbqusFUXjXpfQuFFf0cscM9H6JstjQMUy
         xw7M8POcVaD8G3v3xGng54KrmjSgvwQL7sqhL179TVnFSdqvL9DEfhAXmZU08DpaVB+z
         zSiunmo3VbmTof1vxAp/v47yQ2WgOGXeXG6GB3Gf7pE1ScGjC0bqV7TAtd/m+fpfq3CI
         YOLPMuA/GgjNIfHOrOGhD0cM6H3P5LBBOn3aCDWtNVZfJPWoGE1cWKKtEz9Dpfs/6i2d
         YxcNqnYUQtbiNuONYqqIai1SFElgvUv464Vcz0iTXK3yncl0+rss3soTmcg3IhW6Gf/K
         H/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gUsv6szv6dsUeM9asVJnwaGmSGG17UchvxqwxLA3h8g=;
        b=Cq2KovEmcyH/3b4mzAajj3DJRRcikH0h7ra2zcxU2OfROWRUJGawaxJ3COQSJ1yG3u
         T3LlRq8yIXnu0TrYW7DVz+1Y5bhMovboaavTzkiz4m6ErU8j5N3U0JG3uTwZYILwjFsL
         sBRfXWPN1OlYWyostRPuF0Axa5J4Ez3xZb9TkT7y69kPHXOBTSCUp4KeRU/AunC8eYy3
         0wkvpc0oNnji57IN1j/wgOUZfPVpn0plw39kZJSwkIspzkhO5EcTLKaJEAo3PtJ+qlFa
         7vZUJciLipRR3SOdGTz4ZgjOXYF2ZUAvK1yMzkMr+hJQ2HPhjz+C4kyc2kIM2s4a+v56
         hczg==
X-Gm-Message-State: ACrzQf1NkB5yUw33LsMo76u2E6DK9hs41kMS8xHYo0Bj6Pb53XLi1LJZ
	0UIH3ga0IxtRTSbH1O9nLco5g8hhEScc8mjUgrFTzQ==
X-Google-Smtp-Source: AMsMyM5SaQPoV1xlIMZRfmPqKRzR7kAhfhGoUGwZ5KM3JobcN8dh6yNRCyMvHHbKVsfAJAruxygcE1W13IXNCB18i9o=
X-Received: by 2002:a92:c04d:0:b0:2f5:1175:c7a3 with SMTP id
 o13-20020a92c04d000000b002f51175c7a3mr5681407ilf.165.1663588472670; Mon, 19
 Sep 2022 04:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101520.669962810@infradead.org>
In-Reply-To: <20220919101520.669962810@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 19 Sep 2022 17:24:19 +0530
Message-ID: <CAAhSdy004HaNUNYRD8tcn24LZWdTmOVkF1QN14uLmSw1UXuXqA@mail.gmail.com>
Subject: Re: [PATCH v2 05/44] cpuidle,riscv: Push RCU-idle into driver
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:59:18 +1000
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
 tualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradea
 d.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.
 com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, linux-hexagon@vger.kernel.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 19, 2022 at 3:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, at least twice, before going idle is daft.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Looks good to me.

For RISC-V cpuidle:
Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -116,12 +116,12 @@ static int __sbi_enter_domain_idle_state
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
>         if (sbi_is_domain_state_available())
>                 state = sbi_get_domain_state();
> @@ -130,12 +130,12 @@ static int __sbi_enter_domain_idle_state
>
>         ret = sbi_suspend(state) ? -1 : idx;
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
> @@ -246,6 +246,7 @@ static int sbi_dt_cpu_init_topology(stru
>          * of a shared state for the domain, assumes the domain states are all
>          * deeper states.
>          */
> +       drv->states[state_count - 1].flags |= CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[state_count - 1].enter = sbi_enter_domain_idle_state;
>         drv->states[state_count - 1].enter_s2idle =
>                                         sbi_enter_s2idle_domain_idle_state;
>
>

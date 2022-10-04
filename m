Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C875F4213
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 13:37:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhbKV3WH5z3dt7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 22:37:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OhrgekEJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OhrgekEJ;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhZjl5PNsz2xf6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:10:01 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 129so12439521pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Z7fvRiwPcYU72K21mcsEeWsle1VHrp2FoZLK7rnaPdE=;
        b=OhrgekEJA2e8cdAwMtySnzVGP1IXX7u0VkwcrOOu54GZ2JxdWY9lEfVkhASIMdH6iJ
         3CS7i3bHpSnDattX7vdcbOy/0Ru61hlzqZKw12qszXyQ8c8k8+VbmoP3khJqXB2u34OK
         r0R6w3Chhty48bs5fIPiEqpNsjqgSOd25DYZPmh/eJumMJEGGWz83W+3fdR0JwF+vFO5
         mEEbHpfpQY24Mu19zAFZi2TsiyCRpZk9s0G1O2wNLxMVY3JMpx0s8hV3tsChMbk0eh7y
         zwRqOOW8NupYp/v5bTpNygY4XFLMrr9CtK+i2O/hqSFWvl5B0S5XIVxlEXDh/AnokWSK
         1UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Z7fvRiwPcYU72K21mcsEeWsle1VHrp2FoZLK7rnaPdE=;
        b=QYxnlg42ulpnDz7ja5GhFvT9vPHOQBFzswt73WV/Pe8EB9GP0E6IZLrATRdsC0WDrm
         VTefY1evYz46e/xHX5+dNNSRXRhDYfZ2MjjcOwMDpXnaZNyyH1ChJTdH4YbswahjcTug
         sUWUdUP/rTXyb7r1C3PmBirZ1HnB49eRrjTS3Bx3JI+T2PazKVbeOGlSY1tXlEUKwXXW
         RUj3es11wUuCaNFfU9eyJtZf4UD8+6d0JJKziZV/V9vR5O2tv2fovAIU7a0ODFgPnl38
         E1NJATT9nyxtsw7oLZz0cEOUaQBdP/Pob2YywJyMFtdd/PArmyWlU0DjEBnv9GhSyog6
         tJnA==
X-Gm-Message-State: ACrzQf310ssShdxYjWRc4d7n5ZNy+2jpLIXErlt1r6HuwKDHO2SWraIc
	fLUpEesIPwr5A6VfRYhqLFnX5MeYlJu9yGAoukqPiw==
X-Google-Smtp-Source: AMsMyM7VbOFlVrwp8sat5c2fOoVrC6O5AG2BNs0Q/N/ssPahKqJyAog1GJURpNPkzC/i2wh0dKpKol7XCM05LlISp3k=
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id
 v13-20020a63464d000000b004415968cd0emr18985801pgk.595.1664881798027; Tue, 04
 Oct 2022 04:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101522.975285117@infradead.org>
In-Reply-To: <20220919101522.975285117@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 13:09:21 +0200
Message-ID: <CAPDyKFqoBJPgehVODY0DGuUcnqJE5rpZjRPfdMCzOP0=JrvKNw@mail.gmail.com>
Subject: Re: [PATCH v2 39/44] cpuidle,clk: Remove trace_.*_rcuidle()
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Oct 2022 22:33:53 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, linux-sh@vger.kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, lpieralisi@kernel.org, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, kernel@pengutronix.de, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel
 .com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, jolsa@kernel.org, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, chenhuacai@kernel.org, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, mturquette@baylibre.com, paul.walmsley@sifive.com, linux@rasmusvillemoes.dk, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.
 pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, anup@brainfault.org, ryabinin.a.a@gmail.com, linux-alpha@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, hpa@zytor.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, amakhalov@vmware.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, agross@kernel.org, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, atishp@atishpatra.org, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyu
 kov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, linux-hexagon@vger.kernel.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Sept 2022 at 12:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> OMAP was the one and only user.

OMAP? :-)

>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/clk.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -978,12 +978,12 @@ static void clk_core_disable(struct clk_
>         if (--core->enable_count > 0)
>                 return;
>
> -       trace_clk_disable_rcuidle(core);
> +       trace_clk_disable(core);
>
>         if (core->ops->disable)
>                 core->ops->disable(core->hw);
>
> -       trace_clk_disable_complete_rcuidle(core);
> +       trace_clk_disable_complete(core);
>
>         clk_core_disable(core->parent);
>  }
> @@ -1037,12 +1037,12 @@ static int clk_core_enable(struct clk_co
>                 if (ret)
>                         return ret;
>
> -               trace_clk_enable_rcuidle(core);
> +               trace_clk_enable(core);
>
>                 if (core->ops->enable)
>                         ret = core->ops->enable(core->hw);
>
> -               trace_clk_enable_complete_rcuidle(core);
> +               trace_clk_enable_complete(core);
>
>                 if (ret) {
>                         clk_core_disable(core->parent);
>
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

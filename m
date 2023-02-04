Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805968A77E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 02:13:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7vft0sBMz3f87
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 12:13:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NjHUnR2S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NjHUnR2S;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7vdv25ncz3cF8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 12:12:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5774A6204C
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 01:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73BBC433B4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 01:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675473165;
	bh=0asfVCpuy+ETCtLElPtYddrgJX0d+emBWsKYbAvgUSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NjHUnR2SMV6z1nYlDsx18pdaYVqRNoWc0qy+JZKYvWy9A2/aNWDT/Zcc1VuN3LpBk
	 BHO7a+UWkrCbr7tIMsbiJcW08mJQrutSae8sjzbY2yTquduGD1S75JptE2V94CuHZ9
	 dttGDlygN+PlAgKrEnBbh02BTSkPcbJjD/mmZ2OjVdwp+2zUSzzJYuLie36CRMRH2m
	 BCNEg1yW8DiqcrRuXnMz7q97kPUCf/igZlztYEFMXkxu4lTgwVsHT2Y4vPB+fv2I45
	 treDdxLfVm4Xo9kIGz/U0PB3fSsQxF7GAvG09BPdoaWSqVqEDw/Bl5+LonXCOZV8EM
	 8X69FQT7ZO2hA==
Received: by mail-ej1-f43.google.com with SMTP id m2so19963778ejb.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 17:12:45 -0800 (PST)
X-Gm-Message-State: AO0yUKWe1fzQilEZOaErnFjtbqAlDn9MGoK6Sn7MorrlQfQxBZ2earnP
	cnJgwYvLtvilwiW6rDgi2/QFHlavhYi1d7uwOU4=
X-Google-Smtp-Source: AK7set8d2wN/FrByoELlHyIqk75D2M0EbNicNZv8b+fs1zPJUylkd4dAYoofH/2BIYKRkzzgrVhuEwXH3PfZW7NSuUo=
X-Received: by 2002:a17:906:8419:b0:884:c19c:7c6 with SMTP id
 n25-20020a170906841900b00884c19c07c6mr3300870ejx.120.1675473163646; Fri, 03
 Feb 2023 17:12:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675461757.git.jpoimboe@kernel.org> <f860f3a1c1a53c437a99abc53e8f1a798aef6881.1675461757.git.jpoimboe@kernel.org>
In-Reply-To: <f860f3a1c1a53c437a99abc53e8f1a798aef6881.1675461757.git.jpoimboe@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 4 Feb 2023 09:12:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com>
Message-ID: <CAJF2gTSKe3ve4_rsOYpmSBOyUSU5rpLHyijn9i2-i+WfLqxzYw@mail.gmail.com>
Subject: Re: [PATCH 05/22] csky/cpu: Make sure arch_cpu_idle_dead() doesn't return
To: Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kernel@vger.kernel.org,
  linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 4, 2023 at 6:05 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> BUG().
>
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/csky/kernel/smp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
> index b45d1073307f..0ec20efaf5fd 100644
> --- a/arch/csky/kernel/smp.c
> +++ b/arch/csky/kernel/smp.c
> @@ -317,5 +317,7 @@ void arch_cpu_idle_dead(void)
>                 "jmpi   csky_start_secondary"
>                 :
>                 : "r" (secondary_stack));
> +
> +       BUG();
Why not:
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index f26ab2675f7d..1d3bf903add2 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -285,6 +285,7 @@ static void do_idle(void)
                        tick_nohz_idle_stop_tick();
                        cpuhp_report_idle_dead();
                        arch_cpu_idle_dead();
+                       BUG();
                }

                arch_cpu_idle_enter();

>  }
>  #endif
> --
> 2.39.0
>


-- 
Best Regards
 Guo Ren

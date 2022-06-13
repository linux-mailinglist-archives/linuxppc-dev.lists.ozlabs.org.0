Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C15484D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 13:32:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM8YS2z2Mz3brp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 21:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hln/7KIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=jiangshanlai@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hln/7KIU;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM4R20X5tz308C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 18:26:21 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id x6-20020a1c7c06000000b003972dfca96cso2625473wmc.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3JSggHLDbkXyuZCKaU+uQ7H5KVpBjE3ZWWl/F0t3JyI=;
        b=hln/7KIUboOODQa9/Iv7zWAXFI8kFLhiLL+AWnA7ZL0itAJaB93eguKFQupB8Lv94a
         mnMuLqlfVsMy6aSBFmNweaacWKXWw7aT6TScazfBGhspJqqH/PMOPWdnnnaxNLaf842d
         D+3NPCattkXMe8VyippSy6AVlz1Q90Igxi/lQII1yr2hkIK0YZRpsj0TKs2Px7tXlVgY
         915w6r1r+N9IHNGMPf7O4C6rOlcjLzR4xSEqc3Zfq8tMbY0ayFsU19Cug+0HkT25Saig
         zkxTdXbzsbpEfsV6HhW0WtRME3JJZVdyKx57BtFZ0WE2gh0TSNH76QSkgUTVIoEuHNxT
         f/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3JSggHLDbkXyuZCKaU+uQ7H5KVpBjE3ZWWl/F0t3JyI=;
        b=lIV6THk+L6WMesHoiSKWEMvnMifUEEyCh0NZ177rO55i/NEVINe8XGciIYDdAQ2rIX
         uBBAxhiu9RL4Rqmn7AfYwmFS8HrDU8WWDZpzbFnSIgn/lS7a5u8eVM+409kmZHurcKX1
         9WwdGodjRT4w4Ume7jXDx9YCOfmHd+r1sPYZJFLTXWxP8/42zr/3Ot4WfGZsf60Pj+Fv
         BbewE8FnhG4nP0k84sJ6Y9OcFe1rUatM8QzQ/tE6NtDDBP7fyEIRJA/36hi+A3uGg1+S
         sZCV0Knapo1TKDB+mB5kefCSmzXbDUOxNuH6pvtBJAo8wo00o6T1h5Bf0OF3XwCBlrVt
         +H5w==
X-Gm-Message-State: AOAM530rajDWOdyizk1/V2tKPPPhOLjBMNWEzcfvelS6MM1zr1Lw37cA
	ByTvjc1Qxp5VsyoLtqnYNQrv74UxyCY7ymoSfAc=
X-Google-Smtp-Source: ABdhPJxgJ3qlsWHXb4q5Q9LeHOXh1hQWbFNdZBk/6atfvyd1YyWRPGtuhT6/ZUDmb0vG1CLuyzfEgHlG2xi/itwptM8=
X-Received: by 2002:a05:600c:1c9a:b0:39c:7db4:90c3 with SMTP id
 k26-20020a05600c1c9a00b0039c7db490c3mr13053942wms.161.1655108772491; Mon, 13
 Jun 2022 01:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.251109029@infradead.org>
In-Reply-To: <20220608144517.251109029@infradead.org>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Mon, 13 Jun 2022 16:26:01 +0800
Message-ID: <CAJhGHyCnu_BsKf5STMMJKMWm0NVZ8qXT8Qh=BhhCjSSgwchL3Q@mail.gmail.com>
Subject: Re: [PATCH 21/36] x86/tdx: Remove TDX_HCALL_ISSUE_STI
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 13 Jun 2022 21:27:22 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, Huacai Chen <chenhuacai@kernel.org>, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme <acme@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, Richard Henderson <rth@twiddle.net>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kern
 el.org, Dave Hansen <dave.hansen@linux.intel.com>, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, Alexander Shishkin <alexander.shishkin@linux.intel.com>, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrov
 sky@oracle.com>, khilman@kernel.org, linux-csky@vger.

kernel.org, VMware Inc <pv-drivers@vmware.com>, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>, linux@armlinux.org.uk, Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, paulmck@ker
 nel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org, Juergen Gross <jgross@suse.com>, monstr@monstr.eu, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, ink@jurassic.park.msu.ru, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 10:48 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Now that arch_cpu_idle() is expected to return with IRQs disabled,
> avoid the useless STI/CLI dance.
>
> Per the specs this is supposed to work, but nobody has yet relied up
> this behaviour so broken implementations are possible.

I'm totally newbie here.

The point of safe_halt() is that STI must be used and be used
directly before HLT to enable IRQ during the halting and stop
the halting if there is any IRQ.

In TDX case, STI must be used directly before the hypercall.
Otherwise, no IRQ can come and the vcpu would be stalled forever.

Although the hypercall has an "irq_disabled" argument.
But the hypervisor doesn't (and can't) touch the IRQ flags no matter
what the "irq_disabled" argument is.  The IRQ is not enabled during
the halting if the IRQ is disabled before the hypercall even if
irq_disabled=false.

The "irq_disabled" argument is used for workaround purposes:
https://lore.kernel.org/kvm/c020ee0b90c424a7010e979c9b32a28e9c488a51.1651774251.git.isaku.yamahata@intel.com/

Hope my immature/incorrect reply elicits a real response from
others.

Thanks
Lai

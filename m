Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A645DC6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 15:35:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0L4y4CJKz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 01:35:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RbYDWieN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=hurricos@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RbYDWieN; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0L4J21kLz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 01:34:39 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id bi37so16849205lfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaKq1SHLVv1pyKxYBpQNsaPlGoNltUIwD+WbJ6K1+wo=;
 b=RbYDWieN8veOpwcV9xBZKQbY0q7IqVSGrvRJEKxV/oIMhOfE45XGlQ6sbXVSAIkYZu
 jDOyVLz++2+uJoIy3vZ+nH8n0lut5Zl4BPtMtzbgDFJC1gbs4xiTaP99zzJ5VQ7Xg31V
 vyskf0Ylo71UCZeBZIl4h9j3V8fkB4fhzfmMHpJX/jp9WtT7FyKI5K1gkRBMiMboKUws
 K5cytmF53X3WCeeRGbsgJ8A9kRM+cvhlv3m6baGcddMSwechj10QjHTbucfGCjbXvO05
 6BrB8As9d7X8f4LIuM0G9Y1mZGc9YMM2hE8HA82Fj6l3CNaFSTbPB8Gf0FytHwmpj47H
 Zx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaKq1SHLVv1pyKxYBpQNsaPlGoNltUIwD+WbJ6K1+wo=;
 b=D+0UZC7pmd65RNfojxdpEEPWlwU8cbZ+zrJfqkgqTcsKiRH8kFMikyd5FnExlb49Wt
 rJuHytYGgFl27YXqHv27MlS++yoI7qZq9E2EXlEoAmVfUl8CWazofYezVIHZQHY9dMYB
 UpW5jlrK2PqmZt5aOWPhR+b8k5LWqM3+mEbWTx6aSWCfPMrOMMMRUVOBPsX6ui/Jv1sd
 /QgbECytTD8lxHvyvl9ur5uc/avEoxWD3suzOflZ+SCyXwx0+Ou33X6HS69/Sb1byR8F
 D5jXLjUGcTAWM5gCmyQXriNCcvkFogA43E8Fv3DJyqlEEHovGcA2qe/3BogAccr9QT+o
 HZtA==
X-Gm-Message-State: AOAM533rTMj7h8ngfjWZJtsb+wxBf3q5s1klqXcNMdAJ1fwy09Lvytaj
 Vc/EF3Wg/HAIkJivOn8rjH7ZxBQ2CplP0Oopquo=
X-Google-Smtp-Source: ABdhPJwLwwA8vd8vbkhvaM4jZC23HZ+KfKFHQIXHRQ5Q3d0hzvfVT0bLW6e4Fv8dvgDCuTsIzVWqCl0ABvAitEhKNSI=
X-Received: by 2002:a05:6512:6c7:: with SMTP id
 u7mr23644540lff.261.1637850872398; 
 Thu, 25 Nov 2021 06:34:32 -0800 (PST)
MIME-Version: 1.0
References: <CANA18Uxu5dUYOkDmXpYtLc8iQuAYMv1UujkmEo1bkhm3CqxMAA@mail.gmail.com>
 <3c7523a3-2de2-3a76-2f46-9e4cf38f40b6@huawei.com>
In-Reply-To: <3c7523a3-2de2-3a76-2f46-9e4cf38f40b6@huawei.com>
From: Martin Kennedy <hurricos@gmail.com>
Date: Thu, 25 Nov 2021 09:34:20 -0500
Message-ID: <CANA18Uyba4kMJQrbCSZVTFep2Exe5izE45whNJgwwUvNSEcNLg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc:85xx: fix timebase sync issue when
 CONFIG_HOTPLUG_CPU=n
To: Xiaoming Ni <nixiaoming@huawei.com>
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
Cc: chenjianguo3@huawei.com, wangle6@huawei.com, chenhui.zhao@freescale.com,
 Christian Lamparter <chunkeey@gmail.com>, oss@buserror.net,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Yuantian.Tang@feescale.com, paul.gortmaker@windriver.com, paulus@samba.org,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 liuwenliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi there,

Yes, I can test this patch.

I have added it to my tree and removed the reversion, and can confirm
that the second CPU comes up correctly now.

Martin

On Thu, Nov 25, 2021 at 2:23 AM Xiaoming Ni <nixiaoming@huawei.com> wrote:
>
> On 2021/11/25 12:20, Martin Kennedy wrote:
> > Hi there,
> >
> > I have bisected OpenWrt master, and then the Linux kernel down to this
> > change, to confirm that this change causes a kernel panic on my
> > P1020RDB-based, dual-core Aerohive HiveAP 370, at initialization of
> > the second CPU:
> >
> > :
> > [    0.000000] Linux version 5.10.80 (labby@lobon)
> > (powerpc-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0
> > r18111+1-ebb6f9287e) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Thu
> > Nov 25 02:49:35 2021
> > [    0.000000] Using P1020 RDB machine description
> > :
> > [    0.627233] smp: Bringing up secondary CPUs ...
> > [    0.681659] kernel tried to execute user page (0) - exploit attempt? (uid: 0)
> > [    0.766618] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
> > [    0.848899] Faulting instruction address: 0x00000000
> > [    0.908273] Oops: Kernel access of bad area, sig: 11 [#1]
> > [    0.972851] BE PAGE_SIZE=4K SMP NR_CPUS=2 P1020 RDB
> > [    1.031179] Modules linked in:
> > [    1.067640] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.80 #0
> > [    1.139507] NIP:  00000000 LR: c0021d2c CTR: 00000000
> > [    1.199921] REGS: c1051cf0 TRAP: 0400   Not tainted  (5.10.80)
> > [    1.269705] MSR:  00021000 <CE,ME>  CR: 84020202  XER: 00000000
> > [    1.340534]
> > [    1.340534] GPR00: c0021cb8 c1051da8 c1048000 00000001 00029000
> > 00000000 00000001 00000000
> > [    1.340534] GPR08: 00000001 00000000 c08b0000 00000040 22000208
> > 00000000 c00032c4 00000000
> > [    1.340534] GPR16: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00029000 00000001
> > [    1.340534] GPR24: 1ffff240 20000000 dffff240 c080a1f4 00000001
> > c08ae0a8 00000001 dffff240
> > [    1.758220] NIP [00000000] 0x0
> > [    1.794688] LR [c0021d2c] smp_85xx_kick_cpu+0xe8/0x568
> > [    1.856126] Call Trace:
> > [    1.885295] [c1051da8] [c0021cb8] smp_85xx_kick_cpu+0x74/0x568 (unreliable)
> > [    1.968633] [c1051de8] [c0011460] __cpu_up+0xc0/0x228
> > [    2.029038] [c1051e18] [c0031bbc] bringup_cpu+0x30/0x224
> > [    2.092572] [c1051e48] [c0031f3c] cpu_up.constprop.0+0x180/0x33c
> > [    2.164443] [c1051e88] [c00322e8] bringup_nonboot_cpus+0x88/0xc8
> > [    2.236326] [c1051eb8] [c07e67bc] smp_init+0x30/0x78
> > [    2.295698] [c1051ed8] [c07d9e28] kernel_init_freeable+0x118/0x2a8
> > [    2.369641] [c1051f18] [c00032d8] kernel_init+0x14/0x124
> > [    2.433176] [c1051f38] [c0010278] ret_from_kernel_thread+0x14/0x1c
> > [    2.507125] Instruction dump:
> > [    2.542541] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> > XXXXXXXX XXXXXXXX
> > [    2.635242] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> > XXXXXXXX XXXXXXXX
> > [    2.727952] ---[ end trace 9b796a4bafb6bc14 ]---
> > [    2.783149]
> > [    3.800879] Kernel panic - not syncing: Fatal exception
> > [    3.862353] Rebooting in 1 seconds..
> > [    5.905097] System Halted, OK to turn off power
> >
> > Without this patch, the kernel no longer panics:
> >
> > [    0.627232] smp: Bringing up secondary CPUs ...
> > [    0.681857] smp: Brought up 1 node, 2 CPUs
> >
> > Here is the kernel configuration for this built kernel:
> > https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob_plain;f=target/linux/mpc85xx/config-5.10;hb=HEAD
> >
> > In case a force-push is needed for the source repository
> > (https://github.com/Hurricos/openwrt/commit/ad19bdfc77d60ee1c52b41bb4345fdd02284c4cf),
> > here is the device tree for this board:
> > https://paste.c-net.org/TrousersSliced
> >
> > Martin
> > .
> >
> When CONFIG_FSL_PMC is set to n, cpu_up_prepare is not assigned to
> mpc85xx_pm_ops. I suspect that this is the cause of the current null
> pointer access.
> I do not have the corresponding board test environment. Can you help me
> to test whether the following patch solves the problem?
>
> diff --git a/arch/powerpc/platforms/85xx/smp.c
> b/arch/powerpc/platforms/85xx/smp.c
> index 83f4a6389a28..d7081e9af65c 100644
> --- a/arch/powerpc/platforms/85xx/smp.c
> +++ b/arch/powerpc/platforms/85xx/smp.c
> @@ -220,7 +220,7 @@ static int smp_85xx_start_cpu(int cpu)
>          local_irq_save(flags);
>          hard_irq_disable();
>
> -   if (qoriq_pm_ops)
> + if (qoriq_pm_ops && qoriq_pm_ops->cpu_up_prepare)
>                  qoriq_pm_ops->cpu_up_prepare(cpu);
>
>          /* if cpu is not spinning, reset it */
> @@ -292,7 +292,7 @@ static int smp_85xx_kick_cpu(int nr)
>                  booting_thread_hwid = cpu_thread_in_core(nr);
>                  primary = cpu_first_thread_sibling(nr);
>
> -           if (qoriq_pm_ops)
> +         if (qoriq_pm_ops && qoriq_pm_ops->cpu_up_prepare)
>                          qoriq_pm_ops->cpu_up_prepare(nr);
>
>                  /*
>
>

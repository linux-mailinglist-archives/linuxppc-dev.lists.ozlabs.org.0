Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62E4D5839
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 03:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF99m3JfNz3bW7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 13:39:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lSDH6JbZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lSDH6JbZ; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF9913mP9z2xTq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 13:38:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E4B0B827DB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 02:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16A1C340FE
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 02:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646966301;
 bh=Jl8zmUlue4qqSpvupSe770nwEDFbxuYU+7Bv15ArLNk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lSDH6JbZLjCrBKwhP5l06T0OkCO9oN/A8aEEjauCFSKrSGqZSLjhPkfyba8lYXT8b
 qYNbLTfBYoaFYS9/EdstBjbcmkW1UfcrGbXKAA3XzivX2N/X7M8/MG2dJGhgzUj1xe
 JwIgADZuHHJQV+vkPugE9tLJ05ZgR4K+s7Tqg3OYy0S0d/gkDWxZGRTQdcVyEyVTta
 XcdW+bJU/6F0zGvwFWhD4c7+eaOFthHqbXVWvY103F1BoVPLPmpdBFX9VrRB9dX0cQ
 RFdNXU0aoXtMTFwXmsyOd8jEdA/NcC/+rOGDrpxxb7LrGBkBTS5gvraGhc0yhF8ir3
 59IUblFQhb99Q==
Received: by mail-vs1-f51.google.com with SMTP id a186so8162592vsc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 18:38:21 -0800 (PST)
X-Gm-Message-State: AOAM530Vrcit704TnSjd1l3blpKx4z8MDjgY3WY0gH8ZtmJPcqDWIoq4
 /81qY6spxV5Ef/+1qC1VVnjkd2Nh3dEiM5rToT8=
X-Google-Smtp-Source: ABdhPJzYUvUjuAFq8XvtZ71Qsvionf8y5EprAZIyEokbvQbCG5RE3xULelpIsGE/d8q0ktAquLt4SKjjcxqaZOgU8Ls=
X-Received: by 2002:a05:6102:806:b0:31e:2206:f1c with SMTP id
 g6-20020a056102080600b0031e22060f1cmr3912870vsb.59.1646966300562; Thu, 10 Mar
 2022 18:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
In-Reply-To: <20220227162831.674483-14-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Mar 2022 10:38:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
Message-ID: <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Christoph Hellwig <hch@lst.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Feb 28, 2022 at 12:30 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> If the current task is in COMPAT mode, set SR_UXL_32 in status for
> returning userspace. We need CONFIG _COMPAT to prevent compiling
> errors with rv32 defconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/process.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..54787ca9806a 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>         }
>         regs->epc = pc;
>         regs->sp = sp;
> +
FIxup:

+ #ifdef CONFIG_COMPAT
> +       if (is_compat_task())
> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> +       else
> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
+ #endif

We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
set SR_UXL at all. SR_UXL is BIT[32, 33].

>  }
>
>  void flush_thread(void)
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

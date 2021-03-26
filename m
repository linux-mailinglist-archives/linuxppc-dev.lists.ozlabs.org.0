Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740634AB6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:27:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Qnq1vh1z3c0P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:27:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eg+BwZGA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Eg+BwZGA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6QnN4Qq6z3btQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:27:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAF3161A33
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616772421;
 bh=PgZvub/EEgXyOMtj36/Ui5nnRJqFFaiQoQ/VbltMCjA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eg+BwZGAwSyILfvPcAOTVne302pKV2q+cmm5Ihp4Me5aUHSjUNGW3+nDtB8R91wcm
 C2DZ9VNhmbn0jETV9GNehbOwe3JTYKhoqjnh/MiS11ee4oxdvW0wRf2ZrWgUDyfJma
 hWNpN/TDOWiJIBIfJozhEVq7FS6Mk6XBvB49orLZFW6uYQR5hUuZGCCK5sAk8SD5SC
 UeP3y50GhNpSvcc4yWyh8y4La1rfFodfJDuofdgE1ai4ujHIVkZF7oQxbAyMF7RCJU
 u626vT1IL6nOSZEgmRmqhiGrDEBDKZfd4AiSGwBgBRCvns974kHSj2o73ajFlbU9P5
 x5eyEjjSzm5/A==
Received: by mail-ed1-f45.google.com with SMTP id bx7so6729938edb.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:27:01 -0700 (PDT)
X-Gm-Message-State: AOAM531sWFKuFJHvA06ze0rlYybov/vPL6qE9AomSu4N5MPTazuuMfZO
 USqIxqufW42z3fFnUMobr6/uDXnmOF0uDbyYjA==
X-Google-Smtp-Source: ABdhPJwqjia+Et0ifS4Qa3YP7BG89nAuXW50XJw7Bv12OLaUbiQxEkJ38eyAu5ZhN7DqGhRVJR72+O39P4k/LsEHPLw=
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr16004050edd.258.1616772420155; 
 Fri, 26 Mar 2021 08:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
In-Reply-To: <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:26:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Message-ID: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 8:20 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/03/2021 =C3=A0 15:08, Andreas Schwab a =C3=A9crit :
> > On M=C3=A4r 26 2021, Christophe Leroy wrote:
> >
> >> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> >> index f8f15332caa2..e7c91ee478d1 100644
> >> --- a/arch/riscv/kernel/setup.c
> >> +++ b/arch/riscv/kernel/setup.c
> >> @@ -20,6 +20,7 @@
> >>   #include <linux/swiotlb.h>
> >>   #include <linux/smp.h>
> >>   #include <linux/efi.h>
> >> +#include <linux/cmdline.h>
> >>
> >>   #include <asm/cpu_ops.h>
> >>   #include <asm/early_ioremap.h>
> >> @@ -228,10 +229,8 @@ static void __init parse_dtb(void)
> >>      }
> >>
> >>      pr_err("No DTB passed to the kernel\n");
> >> -#ifdef CONFIG_CMDLINE_FORCE
> >> -    strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> >> +    cmdline_build(boot_command_line, NULL, COMMAND_LINE_SIZE);
> >>      pr_info("Forcing kernel command line to: %s\n", boot_command_line=
);
> >
> > Shouldn't that message become conditional in some way?
> >
>
> You are right, I did something similar on ARM but looks like I missed it =
on RISCV.

How is this hunk even useful? Under what conditions can you boot
without a DTB? Even with a built-in DTB, the DT cmdline handling would
be called.

Rob

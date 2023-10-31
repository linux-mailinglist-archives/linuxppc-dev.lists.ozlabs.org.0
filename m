Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F497DD3A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 18:00:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uqUame4h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKbxN6R26z3cVl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 04:00:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uqUame4h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKbwT51mPz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 03:59:52 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c5720a321aso76628511fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698771584; x=1699376384; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1msu0XLPfxYyrCyNfhD0Uq6UkNb/JK/LpR3MQT3fxE=;
        b=uqUame4hvn9ngoEms7HMEIl/zBCeL28uXia4fyYG5KFYfa8tAhd92Vtruzqnal0G5V
         llT9qkjpykR8+v1oH/EjdnXTCusdfioO1DHLNbV3GK7QIBGXa8SEUp2ImOmIQZ74azB6
         ikmuYJqbnesFBnTeKAjefY22TnRfKhIsN7kw3bPiMJ1T+9bGVkV5ZaKKJvSJOwi7EbdS
         uAnACnjZoTOHRo+nyzWo8nAqnjQads85mexOR7rpwOsv497jmIJHOQroJfrBQFptmcP9
         JvC0k2d6mUQtjstZCsfcPPoMfb2zJe7KZkihDNq9i51ZUQ8dwcaQJLsyFuRl7O6MDxi2
         xVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698771584; x=1699376384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1msu0XLPfxYyrCyNfhD0Uq6UkNb/JK/LpR3MQT3fxE=;
        b=jnAWcwPjTHahs4JTbNH+qrs79Kjl/OM0iSpXtLj23WWy0YOqvWvJV7f9k45uismQKV
         gUIehrEWKv64kKtCEnAcUYTtAr7mmt8qxkkGLhE4Rzbi/244rZ5o4NCstyKTOVxoTduf
         9MVAiYpnjK4A1zs7BIzgcV+gXuBJsEMCUuZr4T/OBT/QLyQkyfdvuE67biCC2pDs9Qz+
         sAzs8qT0VpIYrD3FKlaSE+Jw8BxcNjCE0OuVzhqpudeauscKUCNeocp+YrjcVvw5HhQe
         cqY0Fcn2etA+D6MU0SJVei6sjFXWyqmAJDu4Vek2U0dCsTFivzuy5l9oiBh55tK3amoU
         xF7w==
X-Gm-Message-State: AOJu0Ywpycvu0jLzkoiRIlzO+qR7XtptoCegHlW16CZu0mHWTVwFQCJH
	1+j5YlHB69DFsFOPV0dYQsCMpmo6HsnVCFSPLBKHnA==
X-Google-Smtp-Source: AGHT+IHLIz0pr6WKKR+ZsxS8Jtz2q5ragSw8mJcMwBSONHmfqEdgVJkTVZPiOeuf1EKEJ3svVloqdmz8lejmf3V/0F0=
X-Received: by 2002:a2e:84d0:0:b0:2c5:6df:8b24 with SMTP id
 q16-20020a2e84d0000000b002c506df8b24mr11271542ljh.41.1698771584386; Tue, 31
 Oct 2023 09:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <202310282050.Y5D8ZPCw-lkp@intel.com> <20231031145600.GA9161@bhelgaas>
In-Reply-To: <20231031145600.GA9161@bhelgaas>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 31 Oct 2023 09:59:29 -0700
Message-ID: <CAKwvOdmrFL4QQvttb8+xxV4hQp3fGovnFx222g+Q5aPpzV3Ahw@mail.gmail.com>
Subject: Re: [pci:controller/xilinx-xdma] BUILD REGRESSION 8d786149d78c7784144c7179e25134b6530b714b
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023 at 7:56=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> [+cc powerpc, clang folks]
>
> On Sat, Oct 28, 2023 at 08:22:54PM +0800, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.gi=
t controller/xilinx-xdma
> > branch HEAD: 8d786149d78c7784144c7179e25134b6530b714b  PCI: xilinx-xdma=
: Add Xilinx XDMA Root Port driver
> >
> > Error/Warning ids grouped by kconfigs:
> >
> > clang_recent_errors
> > `-- powerpc-pmac32_defconfig
> >     |-- arch-powerpc-sysdev-grackle.c:error:unused-function-grackle_set=
_stg-Werror-Wunused-function
> >     |-- arch-powerpc-xmon-xmon.c:error:unused-function-get_output_lock-=
Werror-Wunused-function
> >     `-- arch-powerpc-xmon-xmon.c:error:unused-function-release_output_l=
ock-Werror-Wunused-function
>
> This report is close to useless.  It doesn't show the complete error
> message, it doesn't show how to reproduce the issue, and the pci -next
> branch (including controller/xilinx-xdma) doesn't reference any of
> these functions:
>
>   $ git grep -E "grackle_set_stg|get_output_lock|release_output_lock" | c=
at
>   arch/powerpc/sysdev/grackle.c:static inline void grackle_set_stg(struct=
 pci_controller* bp, int enable)
>   arch/powerpc/sysdev/grackle.c:        grackle_set_stg(hose, 1);
>   arch/powerpc/xmon/xmon.c:static void get_output_lock(void)
>   arch/powerpc/xmon/xmon.c:static void release_output_lock(void)
>   arch/powerpc/xmon/xmon.c:static inline void get_output_lock(void) {}
>   arch/powerpc/xmon/xmon.c:static inline void release_output_lock(void) {=
}
>   arch/powerpc/xmon/xmon.c:             get_output_lock();
>   arch/powerpc/xmon/xmon.c:             release_output_lock();
>   arch/powerpc/xmon/xmon.c:                     get_output_lock();
>   arch/powerpc/xmon/xmon.c:                     release_output_lock();
>   arch/powerpc/xmon/xmon.c:             get_output_lock();
>   arch/powerpc/xmon/xmon.c:             release_output_lock();
>   arch/powerpc/xmon/xmon.c:             get_output_lock();
>   arch/powerpc/xmon/xmon.c:             release_output_lock();
>
> That said, the unused functions do look legit:
>
> grackle_set_stg() is a static function and the only call is under
> "#if 0".

Time to remove it then? Or is it a bug that it's not called?
Otherwise the definition should be behind the same preprocessor guards
as the caller.  Same for the below.

>
> Same with get_output_lock() and release_output_lock(): they're static
> and always defined in xmon.c, but only called if either CONFIG_SMP or
> CONFIG_DEBUG_FS.
>
> But they're certainly not related to controller/xilinx-xdma, so I'm
> going to ignore them.
>
> Bjorn
>
> P.S. Nathan & Nick, I cc'd you because of this earlier report that
> also mentioned grackle_set_stg():
> https://lore.kernel.org/lkml/202308121120.u2d3YPVt-lkp@intel.com/



--=20
Thanks,
~Nick Desaulniers

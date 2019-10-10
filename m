Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E7D2B06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 15:18:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ps9866j7zDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 00:18:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Avgp6ASJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ps3n4M5YzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 00:13:56 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id i76so3661381pgc.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4/r0wpYn9OIJlXJtqHCxBzqSKxCwGkTAKdU7jPnstQQ=;
 b=Avgp6ASJth07z1ARd5ouF7+OXPSVaPonqb5tFrFiS1i9U4BWTSqPRcqogQ00Mz+Ss9
 wTEiM/mTQS/uTkKUTCcmdnqHDcE1O0AdZbiSYKojbouD6GFt2UV3aLHp6TPDwD7iz7NK
 Bp95K6T1+cLa7fJWD1PdOdeEM4vGxnpqfuooA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4/r0wpYn9OIJlXJtqHCxBzqSKxCwGkTAKdU7jPnstQQ=;
 b=rrbi8k0+Msi6ZNBDPdvH8f38YtHcStEo8xW5s4z4NL8xal5mHTXPx86E+ele6sNfcm
 2TxmXrHFa0tiJkkKBYQymXDzZ8YHz3irNSQeBJ/6f2AZRfssb4rzSgS92vx5fZ1WHXtQ
 1WToE9p+yJe822KyUaGl38WrTZBn5Hdz6ymT1nrwouWlwv1QhCXOV7yjxZXo07U3i5I0
 zNthGTmL8aEY/JhZZcyxjlUEnxArZNpydU15N0QZIJlNz3gLBCvcDAZwjxkXOc8Wlu8r
 S0n2nT6vjorPWB+YIchWfE4M5aDmi5R270M+ugLLZrwg/kjCkw1z5cR20J/VgEbLqxqm
 xljg==
X-Gm-Message-State: APjAAAWiT4dd39JAskBsWjeXQ5LuXoCjf3D9nBH6uO0KUzlSdAKDexPu
 +NOFKQng8IsvPz2VnwwWg1HMMA==
X-Google-Smtp-Source: APXvYqxkJBkMFHoGiOHs6ok2r2MauQ4vVjcJ/xOokef3vBLJBIRsoGc/NW6tmREcyGdgsvW4RIMwmw==
X-Received: by 2002:a17:90a:bd01:: with SMTP id
 y1mr11356203pjr.108.1570713232042; 
 Thu, 10 Oct 2019 06:13:52 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id y138sm7424803pfb.174.2019.10.10.06.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:13:51 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/4] powerpc: Enable STRICT_MODULE_RWX
In-Reply-To: <20191004075050.73327-5-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
 <20191004075050.73327-5-ruscur@russell.cc>
Date: Fri, 11 Oct 2019 00:13:46 +1100
Message-ID: <874l0gvj3p.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Russell,

Tested-by: Daniel Axtens <dja@axtens.net> # e6500

Because ptdump isn't quite working on book3e 64bit atm, I hacked it up
to print the raw PTE and the extracted flags. After loading a module, I
see the supervisor write bit set without module RWX, and it cleared with
module RWX. Modules still seem to work, which is good.

There is one small quirk which I mention only for completeness, and it
comes from arch/Kconfig:

config STRICT_MODULE_RWX
	bool "Set loadable kernel module data as NX and text as RO" if ARCH_OPTIONAL_KERNEL_RWX
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
	depends on ARCH_HAS_STRICT_MODULE_RWX && MODULES
	default !ARCH_OPTIONAL_KERNEL_RWX || ARCH_OPTIONAL_KERNEL_RWX_DEFAULT

64bit Book3E doesn't have ARCH_OPTIONAL_KERNEL_RWX, so the option
doesn't show up in the config menus. Instead, we always get the default,
which is for it to be enabled. That's probably not a problem (so long as
I haven't missed some edge case), but it is a bit weird.

I don't think you can fix this without either hacking up arch/Kconfig
or actually implementing Strict RWX for book3e. I think both of those
are cures worse than the disease, so I think just let it be for now.

Regards,
Daniel

> Whether STRICT_MODULE_RWX is enabled by default depends on powerpc
> platform - in arch/Kconfig, STRICT_MODULE_RWX depends on
> ARCH_OPTIONAL_KERNEL_RWX, which in arch/powerpc/Kconfig is selected if
> ARCH_HAS_STRICT_KERNEL_RWX is selected, which is only true with
> CONFIG_RELOCATABLE *disabled*.
>
> defconfigs like skiroot_defconfig which turn STRICT_KERNEL_RWX on when
> it is not already on by default also do NOT enable STRICT_MODULE_RWX
> automatically, so it is explicitly enabled there in this patch.
>
> Thus, on by default for ppc32 only.  Module RWX doesn't provide a whole
> lot of value with Kernel RWX off, but it doesn't hurt, either.  The next
> step is to make STRICT_KERNEL_RWX compatible with RELOCATABLE so it can
> be on by default.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/Kconfig                   | 1 +
>  arch/powerpc/configs/skiroot_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8f7005f0d097..212c4d02be40 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -135,6 +135,7 @@ config PPC
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
> +	select ARCH_HAS_STRICT_MODULE_RWX
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index 1253482a67c0..719d899081b3 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -31,6 +31,7 @@ CONFIG_PERF_EVENTS=y
>  CONFIG_SLAB_FREELIST_HARDENED=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_STRICT_KERNEL_RWX=y
> +CONFIG_STRICT_MODULE_RWX=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODULE_SIG=y
> -- 
> 2.23.0

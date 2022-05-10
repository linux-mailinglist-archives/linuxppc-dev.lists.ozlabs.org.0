Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D85210CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 11:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCL64Mlfz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 19:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hWPUeHvR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hWPUeHvR; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCK82JVMz3bxH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 19:23:55 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id j6so14434547pfe.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fwW2OYuCO6BhpQG4lw7eWWD08MPxOosZgKs5DxeLyvA=;
 b=hWPUeHvR3zpON8ZPC/lKtq0fanM+o0ugkon8UlyAhjUGmZs1koZpOiu0VCMmhaLuGk
 7T4+s9zvHcKPasPMIBCtk6BaM9UksEYVLxcJaUGII3K8yyhNRUihuMhxtwe5aC9r+aRF
 wsCmegdX1UBUqGML+xijNAl3GR2L21G3tRyk83nppRYurFz+d+Nlf9Ujyj3GWFZ70d4/
 D46WoxCZQjymB98uRNiOqk8xn5bB/2ykF6QGHOfQAASYjnbt1w2LkRFcw0Ixw6e+SgZ2
 daP3LwUh5WIDSKk6wVOxspZxC4ClUHs1cHsCVJlV/QyWiK+nAhnGyo3fkxa6x3OJKT9t
 fYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fwW2OYuCO6BhpQG4lw7eWWD08MPxOosZgKs5DxeLyvA=;
 b=PICkwEIR/ChZZ3t/MYULwDTZjulJMSQWu6u9uu1cfka9dOI4Ya3axFZaaKUjOZk+lQ
 zITUiN7a1EpdaJM+2Wxwy5CwmuqkvEcmVcj5E/dUV+Yohtgx+anj015oUuN2TZzytlL0
 BnBtEZF7HFMDeQ3x9nVVJRkSrN5lzaWL3sxdI6I7eZdYrOVjiyPISaRTtU9ECmENBfU5
 dAbzi5WuwqWWY/BIfzOQdWniWCHmG+eyDlNlWNYLd520VVdANDSS2J78TrUQeFf4R49x
 LxuhG1QWXZKYlUFwlAS80cYyi2Z4Pgqb1iOOToC/iHojlZSXpYp4UMamrdCkNq2R5j3x
 fI/Q==
X-Gm-Message-State: AOAM533R/esl6yHiJV8jLtyOWYtT4N+1PY2Plt9iZ96D2h6i2gQOu59r
 zEXhGP0ZuyLvfQVN9G+LNsw=
X-Google-Smtp-Source: ABdhPJzZ50IWH7+3XmC5UqtlB581OSBYhLhdUb6/3oKLtPmKiLL0upHCitWsK3a8ztxxgwu4OFjp4w==
X-Received: by 2002:a63:4459:0:b0:39d:3808:7c84 with SMTP id
 t25-20020a634459000000b0039d38087c84mr16250090pgk.130.1652174632424; 
 Tue, 10 May 2022 02:23:52 -0700 (PDT)
Received: from localhost (193-116-127-232.tpgi.com.au. [193.116.127.232])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6300cd000000b003c14af5060dsm10093971pga.37.2022.05.10.02.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:23:51 -0700 (PDT)
Date: Tue, 10 May 2022 19:23:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH -next] powerpc: add support for syscall stack randomization
To: benh@kernel.crashing.org, christophe.leroy@csgroup.eu,
 mark.rutland@arm.com, mpe@ellerman.id.au, paulus@samba.org,
 tglx@linutronix.de, Xiu Jianfeng <xiujianfeng@huawei.com>
References: <20220505111932.228814-1-xiujianfeng@huawei.com>
In-Reply-To: <20220505111932.228814-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
Message-Id: <1652173338.7bltwybi0c.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Xiu Jianfeng's message of May 5, 2022 9:19 pm:
> Add support for adding a random offset to the stack while handling
> syscalls. This patch uses mftb() instead of get_random_int() for better
> performance.

Hey, very nice.

>=20
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> ---
>  arch/powerpc/Kconfig            | 1 +
>  arch/powerpc/kernel/interrupt.c | 3 +++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 5fc9153927ac..7e04c9f80cbc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -192,6 +192,7 @@ config PPC
>  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <=3D 14
>  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <=3D 14
>  	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_MMAP_RND_BITS
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 784ea3289c84..459385769721 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -4,6 +4,7 @@
>  #include <linux/err.h>
>  #include <linux/compat.h>
>  #include <linux/sched/debug.h> /* for show_regs */
> +#include <linux/randomize_kstack.h>
> =20
>  #include <asm/kup.h>
>  #include <asm/cputime.h>
> @@ -82,6 +83,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
> =20
>  	kuap_lock();
> =20
> +	add_random_kstack_offset();
>  	regs->orig_gpr3 =3D r3;
> =20
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))

This looks like the right place. I wonder why other interrupts don't
get the same treatment. Userspace can induce the kernel to take a=20
synchronous interrupt, or wait for async ones. Smaller surface area=20
maybe but certain instruction emulation for example could result in
significant logic that depends on user state. Anyway that's for
hardening gurus to ponder.

> @@ -405,6 +407,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, s=
truct pt_regs *regs)
> =20
>  	/* Restore user access locks last */
>  	kuap_user_restore(regs);
> +	choose_random_kstack_offset(mftb() & 0xFF);
> =20
>  	return ret;
>  }

So this seems to be what x86 and s390 do, but why are we choosing a
new offset for every interrupt when it's only used on a syscall?
I would rather you do what arm64 does and just choose the offset
at the end of system_call_exception.

I wonder why the choose is separated from the add? I guess it's to
avoid a data dependency for stack access on an expensive random
function, so that makes sense (a comment would be nice in the
generic code).

I don't actually know if mftb() is cheaper here than a RNG. It
may not be conditioned all that well either. I would be tempted
to measure. 64-bit *may* be able to use a bit more than 256
bytes of stack too -- we have 16 byte alignment minimum so this
gives only 4 bits of randomness AFAIKS.

Thanks,
Nick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819A435A44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 07:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbQg3yJ9z3c6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 16:20:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BEI9e8mq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BEI9e8mq; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZbQ21ntdz2yb3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 16:19:36 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id r17so5107912qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 22:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3n0qFCHlKLqFgecNBS7D37VmfKYsuSHhAvp64zbJfz0=;
 b=BEI9e8mq7vkncy20gcG5cd6EW0hL6oG7oDiaRauUGaVv02XQbLfpjkZD1Pp99sodrU
 pTk/eOfJ3h23rWsFKc6KNrpslVrxjR6jO2phPjEtgaKet67KAc65szZdProxXPVbpD4k
 qvvmo55M4kJDu8XDpzKOAq2u6Hxxe+boQgWJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3n0qFCHlKLqFgecNBS7D37VmfKYsuSHhAvp64zbJfz0=;
 b=2tJEi/BKMSlLIYpnfNMkZBT0E2Ce+wfMak5U3SYNgibzTRnTOQVUv99xkguVQKFhNe
 s4AVL6suOnU9AChjCO/z7S/Fq7PRZS03wSyyszFBs3TGyAbbhqLezpfA4bcu2czHzGns
 C0SvnvFBkAtjB7m0sung4H88IB4HoUUEpARRoKrhKVrXJoOcI382lxxvgNePi0ajY3g4
 oeCkGvdw28tVz2N0fXvK5VniAxa+MEHW4EzlaGqzTbYLNRlGGtNoLOsIL0PMGr7UYTMG
 AQCl7ggS3f6EKvTqycyoFe8B4dC8NSu+M/dovE/wZUIkn93ze9Vk3iz32XkHtY2HcZeh
 YdDg==
X-Gm-Message-State: AOAM5304qNgpdsoDjCw3EdF6/GugQuTczxkv7bvbVNeTcRcHnqtAUB5r
 1QFGob3O5gtcSHVwKYCtTeXd3bLIvFrC+DLvpmY=
X-Google-Smtp-Source: ABdhPJz+U83SzdfeqgZ7DbM1TSNZb6571iqAp9L6zVOsr5nj4egTMEF0eCUA/8YVg3dGKoq43xtBuSKgdvhl+3KcPK8=
X-Received: by 2002:a05:622a:307:: with SMTP id
 q7mr3780845qtw.25.1634793572491; 
 Wed, 20 Oct 2021 22:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-17-npiggin@gmail.com>
In-Reply-To: <20211021035417.2157804-17-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 05:19:20 +0000
Message-ID: <CACPK8XfuR6QqyP-Bj8S6APbVNugTJLZuARfNHN6Knqe+-MeKSA@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] powerpc/microwatt: Don't select the hash MMU code
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Oct 2021 at 04:04, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Microwatt is radix-only, so it does not require hash MMU support.
>
> This saves 20kB compressed dtbImage and 56kB vmlinux size.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/configs/microwatt_defconfig | 1 -
>  arch/powerpc/platforms/microwatt/Kconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
> index 6e62966730d3..7c8eb29d8afe 100644
> --- a/arch/powerpc/configs/microwatt_defconfig
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -27,7 +27,6 @@ CONFIG_PPC_MICROWATT=y
>  # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
>  CONFIG_CPU_FREQ=y
>  CONFIG_HZ_100=y
> -# CONFIG_PPC_MEM_KEYS is not set
>  # CONFIG_SECCOMP is not set
>  # CONFIG_MQ_IOSCHED_KYBER is not set
>  # CONFIG_COREDUMP is not set

We still end up with CONFIG_PPC_64S_HASH_MMU=y in the config as it
defaults to y.

We should disable in the defconfig it so your new changes are tested
by that defconfig:

+# CONFIG_PPC_64S_HASH_MMU is not set

I boot tested your series on Microwatt with microwatt_defconfig (with
and without that option set) and ppc64le_defconfig.

Cheers,

Joel

> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> index 823192e9d38a..5e320f49583a 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -5,7 +5,6 @@ config PPC_MICROWATT
>         select PPC_XICS
>         select PPC_ICS_NATIVE
>         select PPC_ICP_NATIVE
> -       select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
>         select PPC_UDBG_16550
>         select ARCH_RANDOM
>         help
> --
> 2.23.0
>

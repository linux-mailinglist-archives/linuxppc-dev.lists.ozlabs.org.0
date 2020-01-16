Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9E13D1F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:12:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynlj2RxYzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:12:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynKX4ZcGzDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=M7f7ZugV; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynKV6BG4z8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:53:34 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynKV4Y7lz9sRQ; Thu, 16 Jan 2020 12:53:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=M7f7ZugV; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynKV21Zcz9sPW
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:53:34 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id 5so17631590qtz.1
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h6IMwIsANtAz9q3osy8pDG529TqtQn8XgfErOB2lPHw=;
 b=M7f7ZugVQNfl0IDdVSStiAvUpbuxoERFPhsAZTg0aZDAqYig/4bl4rfvPzRbzLyinp
 ws/eQj3K/vEko8jPemuYm67LOiIs50bfrcNhex7QaPQzO1kQX5cXRny+FUBmOfSOluvZ
 valopak7YxOzlqlosvlp2URRcswA3oQgzXwh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6IMwIsANtAz9q3osy8pDG529TqtQn8XgfErOB2lPHw=;
 b=mhqioiQtGWDpPPKK8wgkdC8jdHrlw8Zkd/Rq7T0E8qbjd30bmaziYeTs4de27RsCZh
 mmg9zAsihIYDESt0hpIYlzgmqJFsrrRl8MjFoNJpWPTQYOircOrJ+3TV6iIJS13mcWHY
 dycxyf2MhHXCAG4kvWY6pcRk8sYZa+sZtz0oHNcSZ6pwWgIS7vftKqoffpYTMlHv71u8
 6zi1lFD/B7SfgDkOUzeOROEAerCBDxgcZrfThtJbmChZFT9yPzter/Wvr6hGpHJNQshj
 SH4BkyvcyEIP5xPthuWndbaOc7k2hftC4nIA4wFqH6YF/dKuboHf5S/vbZRzIrofuROH
 zlxg==
X-Gm-Message-State: APjAAAV1iQXUM08m0b8W8CmVbdwYfG/+V17SZv5QE8WrmkHL+7VUgMIo
 6SOOMZEbmlnj10dPQ5zPlAfad7JjEKWGJGFvaQc=
X-Google-Smtp-Source: APXvYqyu2lo0Olq6jffV9aWGrnl2mOMEij9FfzLS3Nv9h0DTHQqzFAc8SNgJ8w7nQpGcu/drPPh3SljmBqdYJcXMinU=
X-Received: by 2002:ac8:4151:: with SMTP id e17mr226304qtm.234.1579139611617; 
 Wed, 15 Jan 2020 17:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-8-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-8-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:53:19 +0000
Message-ID: <CACPK8Xe3hv-NNDoTgM5OSmGLSZFL9yzo7yr9f7SppbN8-heByA@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] powerpc/configs/skiroot: Disable xmon default &
 enable reboot on panic
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 at 01:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> If the skiroot kernel crashes we don't want it sitting at an xmon
> prompt forever. Instead it's more helpful to reboot and bring the
> boot loader back up, and if the crash was transient we can then boot
> successfully.
>
> Similarly if we panic we should reboot, with a short timeout in case
> someone is watching the console.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/configs/skiroot_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index bd661a9a9410..12c96c8b0c1d 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -29,6 +29,7 @@ CONFIG_ALTIVEC=y
>  CONFIG_VSX=y
>  CONFIG_NR_CPUS=2048
>  CONFIG_CPU_LITTLE_ENDIAN=y
> +CONFIG_PANIC_TIMEOUT=30
>  # CONFIG_PPC_VAS is not set
>  # CONFIG_PPC_PSERIES is not set
>  # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
> @@ -293,6 +294,7 @@ CONFIG_LIBCRC32C=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_STACKOVERFLOW=y
> +CONFIG_PANIC_ON_OOPS=y
>  CONFIG_SOFTLOCKUP_DETECTOR=y
>  CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
>  CONFIG_HARDLOCKUP_DETECTOR=y
> @@ -301,5 +303,4 @@ CONFIG_WQ_WATCHDOG=y
>  # CONFIG_SCHED_DEBUG is not set
>  # CONFIG_FTRACE is not set
>  CONFIG_XMON=y
> -CONFIG_XMON_DEFAULT=y
>  # CONFIG_RUNTIME_TESTING_MENU is not set
> --
> 2.21.1
>

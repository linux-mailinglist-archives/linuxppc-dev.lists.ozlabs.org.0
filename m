Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7703713D1E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:08:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynfc6VgbzDq5k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:08:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynHM6BmczDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:51:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MwlUFr5B; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynHL5PTTz8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:51:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynHL4jj0z9sRQ; Thu, 16 Jan 2020 12:51:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MwlUFr5B; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynHL404Lz9sR4
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:51:42 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id dc14so8355636qvb.9
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GbWhdreFf83qEerDjZhLd5oxK+H/XAciTDOWvCH+4v8=;
 b=MwlUFr5BnEPdi68D2N767FVBs2xpalihub85saRaqusnhqR5OUuraEs67uU27DPprT
 AmKb1V69Hfwf3m4EqB4VYtMpY8sXQ6EzS9hhLPpRyZL+1vYrh8jZh1gqfKYkNjODgjw4
 yHtB2XsRM7hLec3mv72dIFyAXdNluvd2TywjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbWhdreFf83qEerDjZhLd5oxK+H/XAciTDOWvCH+4v8=;
 b=H0wQwz7xE/5qA3Z3zH7C2lzpThDFxVfuWv5nKDkXTWYX3VFNzRUbZrscfU00wOxOzh
 rBn90vKC1o+NnaOk60JfJafJ5RiK5a+lSp+s60Yw3qoHzOXeln7EgAo2t27xVAuc66V2
 qyYRu3WovTr0gHN4uHgLSmCpySgP1gHP+uXzKPWZBm7ylcXY2+uQCfLnkHE3jilSEzUD
 kTzKws4p+dGv9gj01jc5Yeh8pL47Vqd19//Zkb9rXHFAufgXQpigDNx9jpf4fBgFSCMr
 ANZg8KWDpFYxGBqDn8GBQd0wNQa1Dm04mJD12M67M6n8zgsNk4HEq9e+W7Pq66pNloXY
 G4uA==
X-Gm-Message-State: APjAAAV3AWWsREApyfjnyuHDy9kW1XswtuHmhxWLsX3D2QKNl9o1Hby3
 FUhf4GcQ12ki+ZGCgtKYx1XEEDGnKpbtIvLqz44=
X-Google-Smtp-Source: APXvYqxsu0tV0hxq7bJxVuXryYpbJIQ4la9TCs9VLoAdHjUUMIPPIYtar128OigdpyFb2Cz8g3EM/ADsGbzNxrwAUFI=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr351905qvo.20.1579139498564;
 Wed, 15 Jan 2020 17:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-9-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-9-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:51:26 +0000
Message-ID: <CACPK8XfyVmhiBTj9JnYv_H5zNsg4pA4=LW73nRFHW8=ejtw=-g@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] powerpc/configs/skiroot: Enable some more
 hardening options
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
> Enable more hardening options.
>
> Note BUG_ON_DATA_CORRUPTION selects DEBUG_LIST and is essentially just
> a synonym for it.
>
> DEBUG_SG, DEBUG_NOTIFIERS, DEBUG_LIST, DEBUG_CREDENTIALS and
> SCHED_STACK_END_CHECK should all be low overhead and just add a few
> extra checks.
>
> Unselecting SLAB_MERGE_DEFAULT causes the SLAB to use more memory, but
> the skiroot kernel shouldn't be memory constrained on any of our
> systems, all it does is run a small bootloader.

Why do we unselect it?

> SLAB_FREELIST_RANDOM, and SLUB_DEBUG_ON will add some overhead to the
> SLAB allocator, but nothing that should be meaningful for skiroot.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/powerpc/configs/skiroot_defconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index 12c96c8b0c1d..59c2de904fda 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -23,6 +23,8 @@ CONFIG_EXPERT=y
>  # CONFIG_AIO is not set
>  CONFIG_PERF_EVENTS=y
>  # CONFIG_COMPAT_BRK is not set
> +# CONFIG_SLAB_MERGE_DEFAULT is not set
> +CONFIG_SLAB_FREELIST_RANDOM=y
>  CONFIG_SLAB_FREELIST_HARDENED=y
>  CONFIG_PPC64=y
>  CONFIG_ALTIVEC=y
> @@ -293,6 +295,8 @@ CONFIG_LIBCRC32C=y
>  # CONFIG_XZ_DEC_SPARC is not set
>  CONFIG_PRINTK_TIME=y
>  CONFIG_MAGIC_SYSRQ=y
> +CONFIG_SLUB_DEBUG_ON=y
> +CONFIG_SCHED_STACK_END_CHECK=y
>  CONFIG_DEBUG_STACKOVERFLOW=y
>  CONFIG_PANIC_ON_OOPS=y
>  CONFIG_SOFTLOCKUP_DETECTOR=y
> @@ -301,6 +305,10 @@ CONFIG_HARDLOCKUP_DETECTOR=y
>  CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
>  CONFIG_WQ_WATCHDOG=y
>  # CONFIG_SCHED_DEBUG is not set
> +CONFIG_DEBUG_SG=y
> +CONFIG_DEBUG_NOTIFIERS=y
> +CONFIG_BUG_ON_DATA_CORRUPTION=y
> +CONFIG_DEBUG_CREDENTIALS=y
>  # CONFIG_FTRACE is not set
>  CONFIG_XMON=y
>  # CONFIG_RUNTIME_TESTING_MENU is not set
> --
> 2.21.1
>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDC1E29EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 20:21:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wj321kz3zDqLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 04:21:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UK4byS9S; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wj1563HlzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 04:19:52 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 23so10509250pfy.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUWGqAktyAyVHVqHB7sEGDJU8Vip0ew9s4nviisTZjU=;
 b=UK4byS9SomgW1uBVGBHJ9uwSnCx9ri/X9BdHgScEhyeiZZoYkwF3afAuHW9nZN3dYt
 buK34zsM7VFhZEBQHinc+3CzabwvZtZ+gtaBJ3Zq1pzZW2cnjY+J3q/tNoMp1mxyAdYT
 V6tzZiGyUOBorKb0rEV1aRVL7zrrtE4XHGdk7Fc36mHiLBxtutdYyffvnVQTUasOVehl
 41Qu7WvMybf6choeBt3gNcUI/v5+30Jk09X6lpaxu3/T4Zm2gPZgn4Zzmxx44YopskD2
 veWwQl2UwncslmMgJB5vhN3WEALjJ8HyI83tW/f+9UGNsX24pPLMAEDKTW3jK17+DST1
 6/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUWGqAktyAyVHVqHB7sEGDJU8Vip0ew9s4nviisTZjU=;
 b=BxVNnmU88VFWnf+bRpYqkVxc/3L2bSSBNbeO+Nqg4TTLlYGncjLbIUxZJ7IWHIZwq2
 bu7HP0cteCZDeqap52eHODrZARBudxyAGpJx7twAbot2kl4A7LJzRYJ4ccm6IsJMat2y
 PRb0PBPiyGWASvaPB7hwWvr8fpEFc33K6wp346+DTweYKMGDoXNZ0wuqWa9+znyvMKhq
 vN8WUER7LDdDXGSX95uNVp8M0WxqmfvTTFb9wJB4eScBreBeESgA3hHwAtgSaUy8xPXJ
 8obTVq1jFzvqfl2jfdvIF0MbgPY/VPcSJAFgmohet8SY8ECJh+74h3sVTMHjDtQDxrq2
 +AgQ==
X-Gm-Message-State: AOAM532O6awqo9cgerGyjvFVSQ/0aIdEny5icXacPbzzhMXgCqRDCYoU
 XNZxNSZ14IzGnNlTcKFnXpN6iRcVg+dktW4XF2DLCQ==
X-Google-Smtp-Source: ABdhPJxvpXi922kx/E0rTAVTJOD5CCWsatBhE5BzJo32JyfBZNoNexeIGUAW8li/1aX7Zk80smUdSP8+SPOAWNpANcc=
X-Received: by 2002:a63:f00d:: with SMTP id k13mr147710pgh.263.1590517189321; 
 Tue, 26 May 2020 11:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200413190644.16757-1-natechancellor@gmail.com>
In-Reply-To: <20200413190644.16757-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 May 2020 11:19:38 -0700
Message-ID: <CAKwvOdkwQSCr8E3Cx3nBfw8_xsd861a3W8jOt1CCQU-_XJS12Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/wii: Fix declaration made after definition
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: kbuild test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 12:07 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> A 0day randconfig uncovered an error with clang, trimmed for brevity:
>
> arch/powerpc/platforms/embedded6xx/wii.c:195:7: error: attribute
> declaration must precede definition [-Werror,-Wignored-attributes]
>         if (!machine_is(wii))
>              ^
>
> The macro machine_is declares mach_##name but define_machine actually
> defines mach_##name, hence the warning.
>
> To fix this, move define_machine after the is_machine usage.

s/is_machine/machine_is/

With that fixup, you may add my reviewed by tag.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: 5a7ee3198dfa ("powerpc: wii: platform support")
> Reported-by: kbuild test robot <lkp@intel.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/989
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/powerpc/platforms/embedded6xx/wii.c | 25 ++++++++++++------------

^ I can run Linux on my Wii...think of the possibilities!

>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
> index 67e48b0a164e..a802ef957d63 100644
> --- a/arch/powerpc/platforms/embedded6xx/wii.c
> +++ b/arch/powerpc/platforms/embedded6xx/wii.c
> @@ -172,19 +172,6 @@ static void wii_shutdown(void)
>         flipper_quiesce();
>  }
>
> -define_machine(wii) {
> -       .name                   = "wii",
> -       .probe                  = wii_probe,
> -       .setup_arch             = wii_setup_arch,
> -       .restart                = wii_restart,
> -       .halt                   = wii_halt,
> -       .init_IRQ               = wii_pic_probe,
> -       .get_irq                = flipper_pic_get_irq,
> -       .calibrate_decr         = generic_calibrate_decr,
> -       .progress               = udbg_progress,
> -       .machine_shutdown       = wii_shutdown,
> -};
> -
>  static const struct of_device_id wii_of_bus[] = {
>         { .compatible = "nintendo,hollywood", },
>         { },
> @@ -200,3 +187,15 @@ static int __init wii_device_probe(void)
>  }
>  device_initcall(wii_device_probe);
>
> +define_machine(wii) {
> +       .name                   = "wii",
> +       .probe                  = wii_probe,
> +       .setup_arch             = wii_setup_arch,
> +       .restart                = wii_restart,
> +       .halt                   = wii_halt,
> +       .init_IRQ               = wii_pic_probe,
> +       .get_irq                = flipper_pic_get_irq,
> +       .calibrate_decr         = generic_calibrate_decr,
> +       .progress               = udbg_progress,
> +       .machine_shutdown       = wii_shutdown,
> +};
>
> base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
> --

-- 
Thanks,
~Nick Desaulniers

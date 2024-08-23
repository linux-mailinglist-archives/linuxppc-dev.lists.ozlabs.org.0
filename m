Return-Path: <linuxppc-dev+bounces-476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0995DE8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 16:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrfyC4bF4z2xxy;
	Sun, 25 Aug 2024 00:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724418840;
	cv=none; b=ltgNafJJv8kDm3bOpnVluFsWd0Rs8uUCEP7f2+v2wSE+xdTxnSy7s6TIQmSo7Slv5e6jNrG1zrMeyxjZrc8iowBBeqIrnleT51plGLo5bSU/zd2l739WYer3zPRcKA6fslwdh/rAquNTaBWMQMgiv/URBT9L+a2xqsql9CrCPVQXdJBAh5p+SMH9JZ8l5rYHXTf0koWd67lk1LdHWH8bQGMTTjYLDBiv5zLWp1fbfKEYJ9b5GFexvaSx1Z7d8QLuvtP57g/5F0Fxor6NRgRc9jGbWIb7xvh1pQjU1Jwx6D5gl5I31Z8qIxT75nQHvbC913SuQ674zokBDt3NIxwv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724418840; c=relaxed/relaxed;
	bh=VRXshE5FXx/w57L6jYhRTv5oTpv9rEAiuwveGGFv1n8=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=jFLTbbe1x30nedqSH96hTbbhAxEQ7GwHDNrYzruuyuUxAVdKqAeIGJZZL1SEKiIELM/LZO9H9ybQA7J4f4Xplp5NzJsnaITQ/C3Ly+09XUyotm3tDmomV7WXazKgNc8qqarpP4NKlzaWGWkjfDBDI9M8LUCX/0FyX4TQasApg80ybAE3nYRMAJjJ3KOYBYYHJr7sn/T0mLP6GAYnSOUcUvM6RaSpHBhrvOJXFZyoEVPcu7HH/roSvo5EoWopOU3AjVH6aDrjntmOplKFuC4rEmEhflGvazlj5ZPJlCwk6SdFtJVWFEIIipAg4rhgff2Jk6KgsXokTWLWGTuuFFsoKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.182; helo=mail-yb1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.182; helo=mail-yb1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr0rl5STHz2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 23:13:58 +1000 (AEST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e11693fbebaso2083587276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 06:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418835; x=1725023635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRXshE5FXx/w57L6jYhRTv5oTpv9rEAiuwveGGFv1n8=;
        b=tghP158/XiJoKRe8617M/O9FXltUvvxuMw/dLwUZRJ5I2UkM/TjIYVXgP6iC/0o0Xr
         6RV+wvDfc4T/TwS9MzPt+F8a3EI4xZ2wB2F4DZ7c8jcmiPQFLkWJCLTh8k8v63RhW1SY
         A2noc5JaUrUs74nYw5thm3f8cJ2Z4GO737MoyqQmDnJJPkMS3RxmSba6qSa/gPWmcqkn
         luPAmAOw0hbdY0Wge0N6GQVbIOmzPymGVhJ1Zd7vcOsJw+mI6vC6+xXcNpr+DEcvYOUi
         g0OVISB2zYyJBn8BUmXrrvSGfWA/EejPF/4J3Hw0Uq8rhehbWajLg2PxbZU6mcMY0TLO
         eKWg==
X-Forwarded-Encrypted: i=1; AJvYcCWT6gTuNvZlD15IACd3jxvhkO5yFGrU5iBW0Pp9VrHwdKT+Mrp7wUNn/TbmPaLVaQqiTi1aUTHXwH/TVnk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvKRiBC45wKsZaIYFbenw22AwZaSwxLs+VcXY5HTTdhALGKaqR
	FOEfG+Fjfl2DSOx2drHXfyj4+Hc5Wy97thUWz+KtFJlv9bivCnPsb+ckUbZ3
X-Google-Smtp-Source: AGHT+IEHzioscVGQ+niCOK2i69eX6x+JkoQbBojprQTuP4Qx8g/aTtPeyJB9/Zckt9FaSFT7FMfj6A==
X-Received: by 2002:a05:6902:2488:b0:e16:4dc7:aad3 with SMTP id 3f1490d57ef6-e17a83e2745mr2281021276.27.1724418834866;
        Fri, 23 Aug 2024 06:13:54 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e43fdabsm675117276.3.2024.08.23.06.13.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 06:13:54 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6c3f1939d12so15082887b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 06:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeabnwALFMaUx/J9CpdeQcl0wmnvsme+IWGWjwwE/7YcpuRjnx190a/BBENVX3WvoPdonJsNmzQF+/67s=@lists.ozlabs.org
X-Received: by 2002:a05:690c:4d04:b0:6b1:3bf8:c161 with SMTP id
 00721157ae682-6c62538d076mr24871437b3.13.1724418833900; Fri, 23 Aug 2024
 06:13:53 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240823125156.104775-1-dave@vasilevsky.ca>
In-Reply-To: <20240823125156.104775-1-dave@vasilevsky.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 15:13:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
Message-ID: <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is unlikely
To: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: glaubitz@physik.fu-berlin.de, bhe@redhat.com, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, mpe@ellerman.id.au, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Reimar_D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, Aug 23, 2024 at 2:54=E2=80=AFPM Dave Vasilevsky <dave@vasilevsky.ca=
> wrote:
> Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
> Open Firmware. On these machines, the kernel refuses to boot
> from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.
>
> Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
> default to off for them. Users booting via some other mechanism
> can still turn it on explicitly.
>
> Also defaults to CRASH_DUMP=3Dn on sh.
>
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Reported-by: Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
> Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
> Fixes: 75bc255a7444 ("crash: clean up kdump related config items")

Thanks for your patch!

> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -97,7 +97,7 @@ config KEXEC_JUMP
>
>  config CRASH_DUMP
>         bool "kernel crash dumps"
> -       default y
> +       default ARCH_DEFAULT_CRASH_DUMP
>         depends on ARCH_SUPPORTS_CRASH_DUMP
>         depends on KEXEC_CORE
>         select VMCORE_INFO

IMHO CRASH_DUMP should just default to n, like most kernel options, as
it enables non-trivial extra functionality: the kernel source tree has
more than 100 locations that check if CONFIG_CRASH_DUMP is enabled.

Letting it default to enabled also conflicts with the spirit of the
help text for the symbol:

          Generate crash dump after being started by kexec.
          This should be normally only set in special crash dump kernels
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
          which are loaded in the main kernel with kexec-tools into
          a specially reserved region and then later executed after
          a crash by kdump/kexec. The crash dump kernel must be compiled
          to a memory address not used by the main kernel or BIOS using
          PHYSICAL_START, or it must be built as a relocatable image
          (CONFIG_RELOCATABLE=3Dy).
          For more details see Documentation/admin-guide/kdump/kdump.rst

          For s390, this option also enables zfcpdump.
          See also <file:Documentation/arch/s390/zfcpdump.rst>

What is so special about CRASH_DUMP, that it should be enabled by
default?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


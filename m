Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E07BFA4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 13:49:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=ZYTc6dm9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Z2C20TWz3c4l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=ZYTc6dm9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=daniel@ffwll.ch; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Z0d23H4z3c5m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 22:48:16 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40651b22977so9665685e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1696938491; x=1697543291; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qeq+CWrwPWSdPs7u52cPWH+iL7zE4yXXVbL0GY/hrf4=;
        b=ZYTc6dm9FPAFda0dqjHMeCDSLy0ksSiG/sU+J8dRiJS+Ov5ZPBJrVHfKXsj6cT8Z+l
         DoLgiIBfBeVTcgSdzTKly3Mr0kqjuNgRzwkUBYIjDw1uQMIXtMMQsH3M1GlqOf3AFw3H
         qxQvyJi5kErE9MpRaWv0P0CZCQRqe0FoavFYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696938491; x=1697543291;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qeq+CWrwPWSdPs7u52cPWH+iL7zE4yXXVbL0GY/hrf4=;
        b=chtEhP3cO5UsQX/8BMsIWpSyRx2QJ0X+as+Rr2N+09Dago2jHl5ohiAaB3yPiO60j+
         dj08T98PgQANr6lQ9H2huWG2z8X2l+B2xcpZEnoQVWBU9MTj7F8S4sLPJKj8+6OTB50I
         8emFN5tuo6A6vkk3hz4WWFvjxbG8rVRr4zORUgX0R6JgDqHxJ6BXpRndxo9sW4q/S4p8
         mDZYTKKMo48QKxPHpdxJWzVHiRKbQXa4hG98C3JOHZKvvuteiI51tJRqmvNZ9dojTx3h
         ykz3TZl3wuzBbhq0EI3zFGKNC+Dh8edp3SQofEwPE14EYIulVp2BhlSlswcgZiQlPqGV
         Ay6g==
X-Gm-Message-State: AOJu0YzLnwkKcccFO3wMQc1p2MXQiwNGJPkzEXKbFBxytTWzN9MAKbkv
	xKNp/3fNUtzOOUdhZ5Hnebk5gQ==
X-Google-Smtp-Source: AGHT+IHSPZ4F6W9A3ZHvZu/x94TDI5DewSSycnSK8EH04IOCCRrNbnju9CZ5CNGfePnoo7+rHPyYdQ==
X-Received: by 2002:a05:600c:3c96:b0:403:334:fb0d with SMTP id bg22-20020a05600c3c9600b004030334fb0dmr16107480wmb.4.1696938491335;
        Tue, 10 Oct 2023 04:48:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b00323293bd023sm12587864wro.6.2023.10.10.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 04:48:10 -0700 (PDT)
Date: Tue, 10 Oct 2023 13:48:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v3 0/9] video: screen_info cleanups
Message-ID: <ZSU59yPUO_Fu39o5@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Deepak Rawat <drawat.floss@gmail.com>,
	Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Khalid Aziz <khalid@gonehiking.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org
References: <20231009211845.3136536-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009211845.3136536-1-arnd@kernel.org>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Javier Martinez Canillas <javierm@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Thoma
 s Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 09, 2023 at 11:18:36PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> v3 changelog
> 
> No real changes, just rebased for context changes, and picked up the Acks.
> 
> This now conflicts with the ia64 removal and introduces one new dependency
> on IA64, but that is harmless and trivial to deal with later.
> 
> Link: https://lore.kernel.org/lkml/20230719123944.3438363-1-arnd@kernel.org/
> ---
> v2 changelog
> 
> I refreshed the first four patches that I sent before with very minor
> updates, and then added some more to further disaggregate the use
> of screen_info:
> 
>  - I found that powerpc wasn't using vga16fb any more
> 
>  - vgacon can be almost entirely separated from the global
>    screen_info, except on x86
> 
>  - similarly, the EFI framebuffer initialization can be
>    kept separate, except on x86.
> 
> I did extensive build testing on arm/arm64/x86 and the normal built bot
> testing for the other architectures.
> 
> Which tree should this get merged through?

I guess if no one else volunteers (Greg maybe?) I can stuff this into
drm-misc ...
-Sima

> 
> Link: https://lore.kernel.org/lkml/20230707095415.1449376-1-arnd@kernel.org/
> 
> 
> Arnd Bergmann (9):
>   vgacon: rework Kconfig dependencies
>   vgacon: rework screen_info #ifdef checks
>   dummycon: limit Arm console size hack to footbridge
>   vgacon, arch/*: remove unused screen_info definitions
>   vgacon: remove screen_info dependency
>   vgacon: clean up global screen_info instances
>   vga16fb: drop powerpc support
>   hyperv: avoid dependency on screen_info
>   efi: move screen_info into efi init code
> 
>  arch/alpha/kernel/proto.h                     |  2 +
>  arch/alpha/kernel/setup.c                     |  8 +--
>  arch/alpha/kernel/sys_sio.c                   |  8 ++-
>  arch/arm/include/asm/setup.h                  |  5 ++
>  arch/arm/kernel/atags_parse.c                 | 20 +++---
>  arch/arm/kernel/efi.c                         |  6 --
>  arch/arm/kernel/setup.c                       | 11 +--
>  arch/arm64/kernel/efi.c                       |  4 --
>  arch/arm64/kernel/image-vars.h                |  2 +
>  arch/csky/kernel/setup.c                      | 12 ----
>  arch/hexagon/kernel/Makefile                  |  2 -
>  arch/hexagon/kernel/screen_info.c             |  3 -
>  arch/ia64/kernel/setup.c                      | 53 ++++++++-------
>  arch/loongarch/kernel/efi.c                   |  3 +-
>  arch/loongarch/kernel/image-vars.h            |  2 +
>  arch/loongarch/kernel/setup.c                 |  3 -
>  arch/mips/jazz/setup.c                        |  9 ---
>  arch/mips/kernel/setup.c                      | 11 ---
>  arch/mips/mti-malta/malta-setup.c             |  4 +-
>  arch/mips/sibyte/swarm/setup.c                | 26 ++++---
>  arch/mips/sni/setup.c                         | 18 ++---
>  arch/nios2/kernel/setup.c                     |  5 --
>  arch/powerpc/kernel/setup-common.c            | 16 -----
>  arch/riscv/kernel/image-vars.h                |  2 +
>  arch/riscv/kernel/setup.c                     | 12 ----
>  arch/sh/kernel/setup.c                        |  5 --
>  arch/sparc/kernel/setup_32.c                  | 13 ----
>  arch/sparc/kernel/setup_64.c                  | 13 ----
>  arch/x86/kernel/setup.c                       |  2 +-
>  arch/xtensa/kernel/setup.c                    | 12 ----
>  drivers/firmware/efi/efi-init.c               | 14 +++-
>  drivers/firmware/efi/libstub/efi-stub-entry.c |  8 ++-
>  drivers/firmware/pcdp.c                       |  1 -
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  7 +-
>  drivers/hv/vmbus_drv.c                        |  6 +-
>  drivers/video/console/Kconfig                 | 11 +--
>  drivers/video/console/dummycon.c              |  2 +-
>  drivers/video/console/vgacon.c                | 68 +++++++++++--------
>  drivers/video/fbdev/Kconfig                   |  2 +-
>  drivers/video/fbdev/hyperv_fb.c               |  8 +--
>  drivers/video/fbdev/vga16fb.c                 |  9 +--
>  include/linux/console.h                       |  7 ++
>  42 files changed, 183 insertions(+), 252 deletions(-)
>  delete mode 100644 arch/hexagon/kernel/screen_info.c
> 
> -- 
> 2.39.2
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Khalid Aziz <khalid@gonehiking.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: x86@kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-efi@vger.kernel.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-hyperv@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

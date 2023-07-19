Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D975970E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 15:35:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tnwmFnox;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5cJp6y6Wz30fp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 23:35:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tnwmFnox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5cHv6TdXz2ytP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 23:34:49 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31716932093so1030953f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689773685; x=1692365685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iqyJ1tyt/zGintHwIRAOam+B9iGxWukjiMScggaplw=;
        b=tnwmFnoxmhunQP8kjZ6qRl/OGitVUDE3mJI4J0Bb9Bp8DUXPw7FUvoH4SJaponnIjO
         79/V5ps+CVomWPG8NqwqNbIO27SABfwVaVw3Mb6qZ7VdwIgmflhthWPDxDkyN+f84CyN
         Zq8sLp3Svrl/2foju6LSuOvdNyrJH3ic0TqeIW8z8qycFVYogIcRSsPJoWCvYQP1w8aL
         n/t1wnClJAh/vfLOvbGFPdk/C5OweTX/OB/xQHUXjfxicXFF43koJxJP4T8yqxoolLPE
         XjzgJzV1MbjftRFqHKBTG8TuBD/B+I1enQDU1ce3L3gmKkUdxXiX6YtiZQRcIeH2Vk5D
         97zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689773685; x=1692365685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iqyJ1tyt/zGintHwIRAOam+B9iGxWukjiMScggaplw=;
        b=ietMRDE823x0s4eU2mU4tqIElsk1a28BeiFfDcel5ob9EtZR3z81y5kYjBWggJfQPb
         09hNVdQTFS5+QiAB1sMGZLQyVplpudKkBqt2CuLxXXGNGXepRgA2r3PerRuSfssgTvun
         R2a0SL3wvWxdS6A+rAmSWbj0w4a+0UOtpNYd83PPQ4AGLrFZ4kR+3gIetmjrO2le+a2D
         zxz5PwY8mNn1WgOf3yxmrGP5rbh8JBY5BoVz+YoIBGP6yjWKlkO8rCFsc6F9MpEqfua1
         xuh3RuUvw9USFV61C+qZv5AvXQ2NtD05FkPGjccBdgcOemH2d5evU3xh0Znife2qbdKy
         Gydw==
X-Gm-Message-State: ABy/qLa+LxTLoN+72ZSl7uZ4GIdXNQYawb44Ljrw1bePjPDsL+D6S+kq
	xS5THc7obv3QKohi+AOmGWaMLg==
X-Google-Smtp-Source: APBJJlFyZliGO0KLF5ziGaA7+vZ36hbi8ZslxYYTzzyedsAOYH9vMG5lUGP70/h12j9uhl/y1hPRvg==
X-Received: by 2002:a5d:5906:0:b0:314:f1c:90bc with SMTP id v6-20020a5d5906000000b003140f1c90bcmr2067900wrd.69.1689773684758;
        Wed, 19 Jul 2023 06:34:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.201.220])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d5682000000b00314367cf43asm5360910wrv.106.2023.07.19.06.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 06:34:44 -0700 (PDT)
Message-ID: <f918a76f-324a-5c91-7dcc-5f5d43b247f6@linaro.org>
Date: Wed, 19 Jul 2023 15:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] vgacon, arch/*: remove unused screen_info
 definitions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230719123944.3438363-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, Palmer Dabbelt <palmer@rivosinc.com>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/7/23 14:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of architectures either kept the screen_info definition for
> historical purposes as it used to be required by the generic VT code, or
> they copied it from another architecture in order to build the VGA console
> driver in an allmodconfig build. The mips definition is used by some
> platforms, but the initialization on jazz is not needed.
> 
> Now that vgacon no longer builds on these architectures, remove the
> stale definitions and initializations.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/csky/kernel/setup.c          | 12 ------------
>   arch/hexagon/kernel/Makefile      |  2 --
>   arch/hexagon/kernel/screen_info.c |  3 ---
>   arch/mips/jazz/setup.c            |  9 ---------
>   arch/nios2/kernel/setup.c         |  5 -----
>   arch/sh/kernel/setup.c            |  5 -----
>   arch/sparc/kernel/setup_32.c      | 13 -------------
>   arch/sparc/kernel/setup_64.c      | 13 -------------
>   arch/xtensa/kernel/setup.c        | 12 ------------
>   9 files changed, 74 deletions(-)
>   delete mode 100644 arch/hexagon/kernel/screen_info.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


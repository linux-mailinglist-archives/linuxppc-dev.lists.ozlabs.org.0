Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9404FB5CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 10:17:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcMDF5VdRz3bp0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 18:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcMCm3dSYz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:17:23 +1000 (AEST)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQuPJ-1nI37w0xl9-00O0bJ for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr
 2022 10:17:19 +0200
Received: by mail-wm1-f53.google.com with SMTP id r64so9364453wmr.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 01:17:18 -0700 (PDT)
X-Gm-Message-State: AOAM532867dxiFo/2Ay6HCoVVa9D+83gsEvEdz6UE5ouBjXCbIpY8R5S
 gSKY+XxCeO/QpZLRPGDB7dS8yxKcZu1NNG7VQGs=
X-Google-Smtp-Source: ABdhPJy8pZ33Oo4WMqzog99X6GEoaGOwT8j6RrqVFPFQMKNLVzUDT5uefzJG9yX4chyyPY6S/2CLyUh5Dj13t8S9ykA=
X-Received: by 2002:a05:600c:4e11:b0:38c:bd19:e72c with SMTP id
 b17-20020a05600c4e1100b0038cbd19e72cmr28194884wmq.174.1649665038229; Mon, 11
 Apr 2022 01:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220410161035.592-1-rdunlap@infradead.org>
In-Reply-To: <20220410161035.592-1-rdunlap@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Apr 2022 10:17:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2FXx8MmqW=gdYVBHWa6yRUATPX442RmGi04tW7-jj_fw@mail.gmail.com>
Message-ID: <CAK8P3a2FXx8MmqW=gdYVBHWa6yRUATPX442RmGi04tW7-jj_fw@mail.gmail.com>
Subject: Re: [PATCH v2] macintosh: via-pmu and via-cuda need RTC_LIB
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Xngrrg5M4P7G9BuHYbLoGUqbjO8hMi354iW2z0i7u2EhDiDL1Tc
 O4E1l2Tt9BT8q1bGIpq2ff09MBoOhVizZ5LfF7e6d1wCedFed2L5HAuV3DDG8fT+TQSkL3e
 OHnsgSAvvhUmka4nuPZOoCwh4ACSPfOe2fG3cyOTK7VecmmmS8QZP8KqVo1jZlEWFKk2m/K
 cpyoyy7rPAUhcDPmFJHrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jJN00eh7vMI=:diQenXMc1zKdssGOZR0qz9
 YtK/MOWNFfAWW4cmTs0ucOoYfzfgjsAAXAyfPW4Yxlq6L6CqiMVVIQbtBF4tXl+iQC5gC/1UU
 n709OJ94OqGayglwCm93B+MGyodLHKwADEKea5Vj6hqFe9MNR79X2AGLNnUo82wPIsqIhM0gb
 wz8BlgINigMaDAuatH2yqBdupm4JPvNlUwRBAK39ycfqjjf8SW/q5jirkZQtLJX/EsAHR8N3k
 e9K0DS51Ht5GGZBGQJXtIygL7p5zf6+oYsOoP1gGHFn4oDNBuf02QWrW9koshIGk+cuTIvPyt
 bHJabTS3y1y16OW3AkvNvp3gRbHOyyhJ2NjsvygWM2uKqmpY/N9TBE3UDPHP+x41elOz/+IEp
 njZzuPn/M4887Emta4JeNCcUCqHRO4kUp9qkGAgpBdHopiJPRekvyusoVkuF83o7zkvwjOsRK
 yK113LeteD8j7FHolCvoxN42LfkBQz+AV5HZ753lJqjmiH459ryGxCDpzeMbQfV/29WJ97Y4r
 C7mfZo12ezquwHo6Y3EVQOPZhIqcx32Q6s3+mx7Bul7RTvE9YYoZLx4j3O+kVsEZ8s7MPmbIo
 CC3mBnLW0pQSWU0ZUoujq25KJnMocVhMtXoAMFYrafsF6bnqWAlcIV3bK+Mu8g92Ab2cO/rXe
 5L+hCPKi8HPpTYfc09zWQwh9o4i2V622oZqCgQgeRIaEKkt0dJ6jdj7GY3gbfNZkadepSV7VM
 TMach2ytLGKHL7JgGtzyVcMfiEW42cNflZmGAmNNhjL11UPhHlItJv2Y3Io/bHeGGw6+U7ler
 z5OLFafqTk1TzWfrctYmopbQ6JJvnByot0xUjXo+oonelFBOxQ=
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Finn Thain <fthain@linux-m68k.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 10, 2022 at 6:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix build when RTC_LIB is not set/enabled.
> Eliminates these build errors:
>
> m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
> drivers/macintosh/via-pmu.c:1769: undefined reference to `rtc_tm_to_time64'
> m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
> drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'
>
> Fixes: 0792a2c8e0bb ("macintosh: Use common code to access RTC")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> v2: use RTC_LIB instead of open-coding the call to rtc_tm_to_time64()

This sounds like a step in the right direction. Note that there is
another open-coded rtc_tm_to_time64() in read_persistent_clock64(),
it might be worth changing that one as well and just always including
RTC_LIB, though that's a separate issue.

Acked-by: Arnd Bergmann <arnd@arndb.de>

> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -44,6 +44,7 @@ config ADB_IOP
>  config ADB_CUDA
>         bool "Support for Cuda/Egret based Macs and PowerMacs"
>         depends on (ADB || PPC_PMAC) && !PPC_PMAC64
> +       select RTC_LIB
>         help
>           This provides support for Cuda/Egret based Macintosh and
>           Power Macintosh systems. This includes most m68k based Macs,
> @@ -57,6 +58,7 @@ config ADB_CUDA
>  config ADB_PMU
>         bool "Support for PMU based PowerMacs and PowerBooks"
>         depends on PPC_PMAC || MAC
> +       select RTC_LIB
>         help
>           On PowerBooks, iBooks, and recent iMacs and Power Macintoshes, the
>           PMU is an embedded microprocessor whose primary function is to

I think ideally these would just become regular RTC drivers, rather than
relying on the roundtrip through CONFIG_RTC_DRV_GENERIC.

        Arnd

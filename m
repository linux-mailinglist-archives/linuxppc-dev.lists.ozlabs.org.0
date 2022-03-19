Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2E4DE73A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 10:25:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLFph4Ck5z3bZl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 20:25:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.177;
 helo=mail-qk1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLFpG4Hv4z3000
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 20:24:52 +1100 (AEDT)
Received: by mail-qk1-f177.google.com with SMTP id v13so8452901qkv.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 02:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/vQVG0dsvXiKvTeGXeXwf1PIXee60jvWMmXOwq1e7g=;
 b=wiRuX3gMK5JQrKwZBaWbOmm32rHb2VjbBrcRSHYk06K/UMWA2+ziJvXLg5REg42JsZ
 G/qCCi/nxAdjxEN0l1uvcOxRG5BAQDTTFAshvSZz/OYRsP5dUYKU5Q44K7nucNEtn4U2
 TTOmHTPVznpW+7qiyr/fxGAUDHavdOzonx3HR8Xy/vEwkxXt4ZwZrTnjGn7q2mCmobBW
 apYKy2XnXlVNxHD8KySEhzXdGNKTSW3UqszyrSKgAVgsT25fGWRL8SlVQmRNNcc/fh/2
 rRrd8dl82jIEZG9fXA5hZhN8UnQPzrYTWsnQlhOQ3BVVp5av3q84WajbfqML8v9Yhw4R
 MoJg==
X-Gm-Message-State: AOAM5338aWksB4shnOE2z2WssGgJSKWP9KQeCgh6flA/xEtPCc7VjMIz
 gOgBgZ4mQ+/UJQsseVG5I6cyT9KDaz4NLA==
X-Google-Smtp-Source: ABdhPJyX+k/0YoBiP7nX0fd1EE0cab8+YCAYIBfFFjpf/lQEhE+932IYjib6O7g8xinwKVUr7/1XUA==
X-Received: by 2002:a05:620a:25cd:b0:67b:740:94fa with SMTP id
 y13-20020a05620a25cd00b0067b074094famr7847571qko.20.1647681887650; 
 Sat, 19 Mar 2022 02:24:47 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 k6-20020a378806000000b0064915d9584fsm4901893qkd.8.2022.03.19.02.24.47
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 02:24:47 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2e5e31c34bfso33099657b3.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 02:24:47 -0700 (PDT)
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr15567904ywb.256.1647681886843; Sat, 19
 Mar 2022 02:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <cb1828050f8c9ef801b2bdf79eccd6c52afed26b.1647663509.git.fthain@linux-m68k.org>
In-Reply-To: <cb1828050f8c9ef801b2bdf79eccd6c52afed26b.1647663509.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 19 Mar 2022 10:24:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLCX0uPOCQos=cd5Z5pbm-++uVyV-fzMGyPi6oD3+SZw@mail.gmail.com>
Message-ID: <CAMuHMdVLCX0uPOCQos=cd5Z5pbm-++uVyV-fzMGyPi6oD3+SZw@mail.gmail.com>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT is
 disabled
To: Finn Thain <fthain@linux-m68k.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On Sat, Mar 19, 2022 at 5:23 AM Finn Thain <fthain@linux-m68k.org> wrote:
> drivers/macintosh/via-pmu-event.o: In function `via_pmu_event':
> via-pmu-event.c:(.text+0x44): undefined reference to `input_event'
> via-pmu-event.c:(.text+0x68): undefined reference to `input_event'
> via-pmu-event.c:(.text+0x94): undefined reference to `input_event'
> via-pmu-event.c:(.text+0xb8): undefined reference to `input_event'
> drivers/macintosh/via-pmu-event.o: In function `via_pmu_event_init':
> via-pmu-event.c:(.init.text+0x20): undefined reference to `input_allocate_device'
> via-pmu-event.c:(.init.text+0xc4): undefined reference to `input_register_device'
> via-pmu-event.c:(.init.text+0xd4): undefined reference to `input_free_device'
> make[1]: *** [Makefile:1155: vmlinux] Error 1
> make: *** [Makefile:350: __build_one_by_one] Error 2
>
> Don't call into the input subsystem unless CONFIG_INPUT is built-in.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/drivers/macintosh/Makefile
> +++ b/drivers/macintosh/Makefile
> @@ -12,7 +12,10 @@ obj-$(CONFIG_MAC_EMUMOUSEBTN)        += mac_hid.o
>  obj-$(CONFIG_INPUT_ADBHID)     += adbhid.o
>  obj-$(CONFIG_ANSLCD)           += ans-lcd.o
>
> -obj-$(CONFIG_ADB_PMU)          += via-pmu.o via-pmu-event.o
> +obj-$(CONFIG_ADB_PMU)          += via-pmu.o
> +ifeq ($(CONFIG_INPUT), y)
> +obj-$(CONFIG_ADB_PMU)          += via-pmu-event.o
> +endif

Alternatively, you can introduce an invisible Kconfig symbol that
is y if ADB_PMU && INPUT, to control the build of via-pmu.o.

>  obj-$(CONFIG_ADB_PMU_LED)      += via-pmu-led.o
>  obj-$(CONFIG_PMAC_BACKLIGHT)   += via-pmu-backlight.o
>  obj-$(CONFIG_ADB_CUDA)         += via-cuda.o
> diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
> index 4b98bc26a94b..55afa6dfa263 100644
> --- a/drivers/macintosh/via-pmu.c
> +++ b/drivers/macintosh/via-pmu.c
> @@ -1457,12 +1457,14 @@ pmu_handle_data(unsigned char *data, int len)
>                 if (pmu_battery_count)
>                         query_battery_state();
>                 pmu_pass_intr(data, len);
> +#ifdef CONFIG_INPUT
>                 /* len == 6 is probably a bad check. But how do I
>                  * know what PMU versions send what events here? */
>                 if (len == 6) {
>                         via_pmu_event(PMU_EVT_POWER, !!(data[1]&8));
>                         via_pmu_event(PMU_EVT_LID, data[1]&1);
>                 }
> +#endif

Additionally, if that new symbol is not enabled, a dummy via_pmu_event()
can be provided, so you don't need to add an #ifdef to the driver anymore.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC440A67E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 08:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7tJZ3nNCz30HX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 16:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a1n4DBD2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=gustavo.romero@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a1n4DBD2; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7YJq481xz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 03:25:12 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id a66so11420373qkc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 10:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:references:subject:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5DdZSpd41lEsj+bLJ8CsWMDUAIUQO9ZK4W3HGsAwt4=;
 b=a1n4DBD2ZVFQBiIK1UTHaRnOHJ1ULMvo1R+klp5Y9ZzQLNHykVngHxcYmONZo8NDJ/
 I/QsnbNj+VPZMEolW4yeJz286KLGTjkwJADPMW6Gr9078A4nIWLxqDwjfyo1JrLb/P16
 OaU5MWcU9iVylaiOC2yhp3OYJ+rxlZTmlxYVBeuG7L4Nv+IOHQdMYENRJg5K7nGMl/PY
 grO5IaF0ihythj9l/aZdiQqWqWELu+aHNan9Rh/yADoUfa/Ro5SbUCzI9LiS8cWup21P
 82sZHfxR6v+Y7IuKoGexGSMeCijEmXWOjTM+PP1pHl6KW+VQfQryUTsuxf45v8FfUksL
 rNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:subject:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5DdZSpd41lEsj+bLJ8CsWMDUAIUQO9ZK4W3HGsAwt4=;
 b=DK5rvhuEnVwlzgT68VMvWp+sJ2L0OMJEoza6RfZ2lPi3VS0CzKKU6jLFR6h+M2FduA
 VhUqvQyUYxchSGRZzeNn66oxne6MLohvZhskRBimj/lKCaIiRnCvkrjamvDmAKZyaRee
 86O5iSsWoODrPnYnyLCr04G8ByWzS8ioZ6tuveiWdh6bl5TY0zTALgfmXpwRzZV2wcGo
 DOyXE7uzbmmj7P+vNPNvpne26J380u2pY64Pnlh+qpsYK7I4O7+kaVFCYV6KjTcRi0Z/
 mWbdymCugU+r1lKkmmKf84oiuLf0PMeI1VXZzbiWDmIVkgo7zDWYcGgvJNj26O5a4bCo
 H3dw==
X-Gm-Message-State: AOAM532NWbMLU+o5XFG2Nr1qZZ7c19Atvq0cpTTJaPHcnZm5fApiB5KC
 M4u+K7/P8pz/YTZjIOUuDdebHA==
X-Google-Smtp-Source: ABdhPJzpLlTjutDeQfgluabOOk879ns8pnm95RnHEmZzAuYKvzsnSah5w43D85A3zZJ8unjJH7EuyA==
X-Received: by 2002:a37:b56:: with SMTP id 83mr728137qkl.360.1631553909591;
 Mon, 13 Sep 2021 10:25:09 -0700 (PDT)
Received: from ?IPv6:2804:431:a2bd:9c00::9f9? ([2804:431:a2bd:9c00::9f9])
 by smtp.gmail.com with ESMTPSA id 207sm5883041qkh.45.2021.09.13.10.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 10:25:09 -0700 (PDT)
To: linuxppc-dev@lists.ozlabs.org, clg@kaod.org
References: <20210913134056.3761960-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xics: Set the IRQ chip data for the ICS native
 backend
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <ab38499a-5693-66cc-e2c6-5e0c34b6b061@linaro.org>
Date: Mon, 13 Sep 2021 14:25:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210913134056.3761960-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Sep 2021 16:10:00 +1000
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
Cc: mikey@neuling.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I confirm that if this fix is *not* applied to current Linus
tree (c605c39677b9) and kernel boots on Microwatt (18eb029) the
kernel will crash with the following exception:

<snip>

[    1.846437] BUG: Kernel NULL pointer dereference on read at 0x00000048
[    1.853121] Faulting instruction address: 0xc00000000003146c
Vector: 300 (Data Access) at [c0000000010332c0]
     pc: c00000000003146c: ics_native_unmask_irq+0x10/0x60
     lr: c0000000000314d4: ics_native_startup+0x18/0x2c
     sp: c000000001033560
    msr: 9000000000009033
    dar: 48
  dsisr: 40000000
   current = 0xc000000001050000
   paca    = 0xc00000000068c000   irqmask: 0x03   irq_happened: 0x01
     pid   = 1, comm = swapper
Linux version 5.14.0-11101-gc605c39677b9 (gromero@amd) (powerpc64-linux-gnu-gcc (Ubuntu 10.3.0-1ubuntu1) 10.3.0, GNU ld (GNU Binutils for Ubuntu) 2.36.1) #5 Sat Sep 11 22:01
enter ? for help
[link register   ] c0000000000314d4 ics_native_startup+0x18/0x2c
[c000000001033560] 0000000000003000 (unreliable)
[c000000001033580] c000000000074c00 irq_startup+0x8c/0xd4
[c0000000010335c0] c000000000072434 __setup_irq+0x534/0x6c4
[c000000001033660] c0000000000728ac request_threaded_irq+0x130/0x154
[c0000000010336d0] c000000000217478 univ8250_setup_irq+0x1b0/0x20c
[c000000001033720] c00000000021af2c serial8250_do_startup+0x428/0x654
[c0000000010337b0] c00000000021475c uart_startup+0xd0/0x1a0
[c000000001033800] c00000000021487c uart_port_activate+0x50/0x74
[c000000001033830] c00000000020fc98 tty_port_open+0xa4/0x110
[c000000001033880] c000000000212810 uart_open+0x24/0x4c
[c0000000010338a0] c000000000208b04 tty_open+0x2d4/0x394
[c000000001033920] c0000000000e38a8 chrdev_open+0xd4/0x15c
[c000000001033980] c0000000000dc080 do_dentry_open+0x24c/0x2d0
[c0000000010339d0] c0000000000edd60 path_openat+0x8fc/0xa2c
[c000000001033ab0] c0000000000edee8 do_filp_open+0x58/0xbc
[c000000001033be0] c0000000000dd530 file_open_name+0x54/0x7c
[c000000001033c50] c0000000000dd5a0 filp_open+0x48/0x68
[c000000001033c90] c00000000048e1d4 console_on_rootfs+0x2c/0x88
[c000000001033d00] c00000000048e424 kernel_init_freeable+0x1f4/0x238
[c000000001033db0] c00000000000e51c kernel_init+0x28/0x138
[c000000001033e10] c00000000000b114 ret_from_kernel_thread+0x5c/0x64
mon>


Thanks for fixing it Cédric.

Tested-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB1409B4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 19:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Yzh34Nnz2ywk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 03:55:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UNKdq3yZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=gustavo.romero@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UNKdq3yZ; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Yyz5VJcz2yKR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 03:54:49 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id t4so11481038qkb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:references:subject:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5DdZSpd41lEsj+bLJ8CsWMDUAIUQO9ZK4W3HGsAwt4=;
 b=UNKdq3yZC85neO0NyXPM7MqQePgrNyXqPWQJouAYZ+ag9JZBFj9YQi6jy54JBvVYsz
 hEsgA5S0UyUlFjSYyYPVDZi4noeNy2JuPnSUQwQKamn6RBEmxq4LvPzC/dj20UTXm5PF
 sqm2S/mvGKDlIYYuFbmpWAy3T0JeOj6FgDWa1DoZ/rlqiaahi5+kv7zQuNfLTqUzUZMu
 /rKAbhrlNXYUXyd8QVoI85X4qh5nknK9mDMJq18puRMTWCRDwm2ralonomo300cAbR/y
 Ifhiibi0GuJ3g3kONCo3XiiSpB0Q3EskuYFJ3J5+xiJXOX+fyK8cuC4cJBvn99g1unZV
 HEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:subject:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5DdZSpd41lEsj+bLJ8CsWMDUAIUQO9ZK4W3HGsAwt4=;
 b=SNUs0C1xS84hNJD/n0Q8FRlnBf3Fb97x7nrM03eeq025hUj7ckBNhTLLjmib7hVHD2
 gIDhEc1t+QlGlG99NVuRSh7zp4JBY1zqQzxE1IyvU0UMjh5QLy1353XWsjBiaFOcXWAQ
 f3QD4kpZYxs2V1KDqvkHnKWiLTKvz3TX6bennn2kJXE7YeQ67RDFby1cOT0o0Z1MIShr
 ORP0B7qkcAhF3At4fdiPhkmTIZcmAGM2to3oAmJcBIPDaWHbshWu3kjktnKrNCfC3YxO
 WYByhMW3AulYZwOrPRkSjA4S2vIH48ZQTsHej9Rxy58KS08br98mq+6OD40YSppgZAVU
 ritA==
X-Gm-Message-State: AOAM533MThw8sTM9tW5XGGVFyyscHogudfTO+Sp6j7uinIBVR7QSTkzL
 qkIkaYstBI+W8mJVXNvmFzG9FfqO39z9oA==
X-Google-Smtp-Source: ABdhPJw+Scyv7zU4XVTaFS/sMRplhnIEdhkx+CeWaozRwhnsKsd3RNxuO7NwlYuWMqmGO+CMXkVRkA==
X-Received: by 2002:a37:62d8:: with SMTP id w207mr813965qkb.23.1631555685884; 
 Mon, 13 Sep 2021 10:54:45 -0700 (PDT)
Received: from ?IPv6:2804:431:a2bd:9c00::9f9? ([2804:431:a2bd:9c00::9f9])
 by smtp.gmail.com with ESMTPSA id t194sm5966134qka.72.2021.09.13.10.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 10:54:45 -0700 (PDT)
To: linuxppc-dev@lists.ozlabs.org, clg@kaod.org
References: <20210913134056.3761960-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xics: Set the IRQ chip data for the ICS native
 backend
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <cc95509b-0b1c-6837-72ad-13b6d7382146@linaro.org>
Date: Mon, 13 Sep 2021 14:54:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210913134056.3761960-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

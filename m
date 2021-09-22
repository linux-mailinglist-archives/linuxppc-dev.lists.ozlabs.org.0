Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409E414EFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 19:26:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF4vh2wF3z2yZx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 03:26:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lOlumiI1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lOlumiI1; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF4v33wthz2xtH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 03:25:34 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id w6so2240912pll.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qoUCKun9GOqpNGoTy8WaehZ/oDjPVJ/YWHnCEdsLlKI=;
 b=lOlumiI1+oziCAkd5/0aA3H3/+hEOnLGXIusMJhpDcPaDZc4gwE53YLyfaBThcZmqL
 bKAPzUJKWoqZ4iYlILMHa0Idlx3WXy500K7/q2TPhx7tASzXgykABzWzd7pd2LDltcme
 d+aLtugrh5FIrcdFLmKB8WfbpC1uusVdH3uzDm2DYHKo7Wh5Lhbzc3BZ7HjVLIHZ/Hpk
 g0m37ObmoShzoKnybbvXTyJWm/G4AppPdRIHqXAVVIYo5ahKuQlOlqVaeHdusrXLzDZF
 JIsRGVwdjc4pGBWycvMFhIzcSPbt6vziKd4Hlr+kjodgcKbiWv2y5/ZwT9yAnbPwznys
 2+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qoUCKun9GOqpNGoTy8WaehZ/oDjPVJ/YWHnCEdsLlKI=;
 b=kJzi+S4mrcaedJWjBuIZcooL1NlWFA/3psghSSHEum1uwqWw4IBkeBQFT2PrddLbF5
 RK6F57B17D6ZABDOJpph6tB/QYkWs1abUjXpZUe0cD0SIXkoidaXdSoHbGOB12qzQr7v
 dc2mQ03bOMyaOYFwAZVHY17SaF2n29vQBMksKddsoL+6xeokKDCmlSOqLwloWLQTVl4l
 CpVv9bathJkYSM+pX1dLOHcce/sx0PQdnW/b0Td8awjB8zDPFdyZm5NeKDMoVKjkmAUm
 9VWOgLLNudCJaNJEOmrgiZsgwj1sYUMVlNXl4sNj3/XRI2ruTvoR9adMV5PlJCmpcFVT
 9Pmg==
X-Gm-Message-State: AOAM530EuXks3+2J/11jzkXoDcfwHp7h/govB3UjHb8Fum07ajx0+isw
 ddymLKWqFYENUHfcpr2xK9zFEhHgSnmjs6enD0MBALFgJRU=
X-Google-Smtp-Source: ABdhPJyxC3JRRpZG3LkkxGatOXyZC0ojgXzjvV1lz9Y2JO+113tXAcNZQyAATGMuPayxs+JyBN1qg/ni/xqWVEyGjrc=
X-Received: by 2002:a17:903:2083:b0:13b:f43a:41af with SMTP id
 d3-20020a170903208300b0013bf43a41afmr578854plc.57.1632331531443; Wed, 22 Sep
 2021 10:25:31 -0700 (PDT)
MIME-Version: 1.0
From: cp <carlojpisani@gmail.com>
Date: Wed, 22 Sep 2021 19:25:35 +0200
Message-ID: <CA+QBN9DheGSvAYwPnjaai3dxJfUHYueR-86kwWvrAw5g1DofDg@mail.gmail.com>
Subject: doesn't boot when linkaddr=0x0090.0000
To: linuxppc-dev@lists.ozlabs.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi
I am new to this list. Hope this is the right place to ask.

I am working with a PPC405GP board, and as far as I understand, the
support for ppc40x platforms like Acadia and Walnut were dropped with
kernel 5.8.0, so this seems like a pretty straightforward question,
but extensive experiments from kernel 4.11 to kernel 5.7.19 haven't
shown a really clear, up-to-date answer.

In k4.11 .. k5.7.19, when the kernel size is bigger than 8 MB, the
final kernel doesn't boot but rather arch/powerpc/boot/main.c dies
before the first message from the kernel shows up.

Why?

Digging deeper I see the relation between the kernel size and link_addr

        # Round the size to next higher MB limit
        round_size=$(((strip_size + 0xfffff) & 0xfff00000))

        round_size=0x$(printf "%x" $round_size)
        link_addr=$(printf "%d" $link_address)

and this is where link_addr is involved

        text_start="-Ttext $link_address"

My kernels are compiled for cuboot, and the code that invokes "kentry"
is entirely located in arch/powerpc/boot/main.c

I instrumned that module, and this is what I see on the condole

The following is the same kernel, compiled with the same .config, but
with two link_addr values

A) with link_addr=0x0080.0000
image loaded from 0x00800000
SP=0x03eb1b80
kernel_size = 7411084 bytes
copying 256 bytes from kernel-image at 0x0080f000 to elfheader
elf_info.loadsize = 0x00700e68
elf_info.memsize  = 0x0074234c
allocating 7611212 bytes for the new kernel
copying ...
from = 0x0081f000
to = 0x00000000
size = 7343720
flush_cache, 32Mbyte flushed
cmdline: uboot bootargs overridden
cmdline=[console=ttyS0,115200 root=/dev/sda2 rootfstype=ext2 rw
init=/sbin/init ]
Finalizing device tree... flat tree at 0xf23b80
ft_addr=0xf23b80
my tp1: success
kernel booting ....
(it boots)

B) with link_addr=0x0080.0000
image loaded from 0x00900000
SP=0x03eb1b80
kernel_size = 7411084
copying 256 bytes from kernel-image at 0x0090f000 to elfheader
elf_info.loadsize = 0x00700e68
elf_info.memsize  = 0x0074234c
allocating 7611212 bytes for the new kernel
copying ...
from = 0x0091f000
to = 0x00000000
size = 7343720
flush_cache, 32Mbyte flushed
cmdline: uboot bootargs overridden
cmdline=[console=ttyS0,115200 root=/dev/sda2 rootfstype=ext2 rw
init=/sbin/init ]
Finalizing device tree... flat tree at 0x1023b80
ft_addr=0x1023b80
my tp2: success
my tp3: success
invalidate_cache 0x00000000+0x02000000
my tp4: (point of no return)
calling kentry()...
kernel booting ....
(it dies at this point, but without a debugger it's like watching
something fall into a black hole)

Any ideas?
I am lost ...

Carlo

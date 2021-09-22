Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECA4150DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 21:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF8JV6zC8z2ywB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 05:59:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V0Hdhbci;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V0Hdhbci; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF8Hs73gTz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 05:58:47 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so5294901pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qoUCKun9GOqpNGoTy8WaehZ/oDjPVJ/YWHnCEdsLlKI=;
 b=V0Hdhbci9z+bQKb/vjsba1qWZWDTd2k6jO+lKKIzgBdxT0wgY5wgqQnRfEaSD8Pj8S
 UdTyQvveRUzPJ/UzH6IMHnvUVXj/K3DcoorgsT98FPeOu/0A4kLkQdlheSct4/wWINC6
 4ENrl5apaq+raoiUKCilri9uBkn2kv1ROlNk30x/pmSljJN6R9naglGT3PHW4tazABEz
 gfCunWG343hnwMmvHY833gn68Zle1zzHpW1fMrdERoMZR3BdLILpLXYpTX2NWN/jNGu8
 UplD5PfhAb00er8dPEaMDlrq5wHtkGC/n6ft+jug+/FRZ01PyBvg6U/Hii3JQIc3gYDi
 fung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qoUCKun9GOqpNGoTy8WaehZ/oDjPVJ/YWHnCEdsLlKI=;
 b=hhjAs8io/abBs0e4YIJA5rnk/hQx8SDorchn+/KexIWmMrr6dymNYHyGrsWLaZ7ilu
 HvxXWDRvvi/gLpQxcVGcAkzHNfbbUEjWgzNv/cY1iHrkxbXoYblKyOl/eN4J31JIDITr
 Des40AthPHZxYhqBhwlLB4Ctzy1R5tG7GM8UCSECBf7q0GRvRk5wFb7KOUqxkcSwTSHR
 dvOWETSklUtCMSI2HIk4u3Gxsy26npFaHNcV1ltsLk454+xxY3bGjGKlEVkI8AAx1sDb
 PpLyl1GFxTyevugPVVclWop9hQd4OHx61E5GvyGvrNlVqhvOh5hZJUjsAKdSORJF6Duc
 UiaQ==
X-Gm-Message-State: AOAM530kfVAHGiqX1XywuX5ZREbrVJxS8CyfnZB3zB8bPvrgcdyKjAAw
 Y3iZJ0TTF0HiFwAFxFXL92vQhRkyttnc4bNdP5V0nCws4Ww=
X-Google-Smtp-Source: ABdhPJzsh9orREzJKewycu2GTF5mAfzx+1RLXtsQTIuDG8OJoVDYUeDeFsQDz2Etd4Yp2N6gonPOJ2/8c3+avDvBYPY=
X-Received: by 2002:a17:90a:191a:: with SMTP id 26mr890627pjg.79.1632340724266; 
 Wed, 22 Sep 2021 12:58:44 -0700 (PDT)
MIME-Version: 1.0
From: cp <carlojpisani@gmail.com>
Date: Wed, 22 Sep 2021 21:58:48 +0200
Message-ID: <CA+QBN9AmMEzeQebU6pCaA+WcSjida7KV3njju0AER4aKa8rnkQ@mail.gmail.com>
Subject: doesn't boot if linkaddr=0x0090.0000
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

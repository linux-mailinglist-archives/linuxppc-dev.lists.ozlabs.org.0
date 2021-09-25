Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF04180DC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 11:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGkf04xG3z3bjX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 19:50:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eK2IM5UQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eK2IM5UQ; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGkdH1PMbz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 19:49:22 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id k26so6478726pfi.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qoUCKun9GOqpNGoTy8WaehZ/oDjPVJ/YWHnCEdsLlKI=;
 b=eK2IM5UQmZeWd3M74yPeXKWLnWuprO7vkbPPvLnnSKAdSDV08+NywCGvzKS31dTRQA
 MqpoZMBv/w0kBeYtGRANxtGCPpUgl5/BhEJlikqWEpQdXCffoiabCGNLH7aI/dOksfLu
 SclPzf68kmuQdWh21S5fq5m03jE5dyWNk4WWosj3MTJW0XCYbpgJCqck7Puyu+JUC6nm
 /81iHWh6uyij//McHywBGhITxfwAWeRNudWzVOe5k+bE0obqhxLwS/iWRkssVezh2Doe
 L9ICpkP9I53nWba3ptAEzw7EzCmuknMoSgNoZzI7B1x9b2kMnaFgZZughvZa1o9vc+YM
 dm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qoUCKun9GOqpNGoTy8WaehZ/oDjPVJ/YWHnCEdsLlKI=;
 b=735tAN1EB7pmmMKECyf9LDK2TiRF4Gs+xFntwOOgNfRuzm5tuNmyfdyccm+E5zPOIL
 WWWLpKwz1wKBPpz8upl+Khgvm9YygZgR3bmq44njeuJ99hArHybXlhTKb/z7t4+ODCUx
 onSoQOIvkHZ9+Qiso1REy07BZxHB4Xo/DsSCWOjC0zcgr8SLKuFF1eY6X94E59CUuk4e
 sIy9PQcmXeJN7FCoNBxXdqbZIAMexBGM+VKF/tPUwIF0MbKBB51yr07HVRspSDKW2G9o
 a1sIFdoFav0jkQgTK80krjaxrtVg9nWoHSLE2DF0AYowWci2ARbC+oaxn15EK8fwZUnl
 l4wA==
X-Gm-Message-State: AOAM533BbBbccgqD5oYAXR6Rgpw/ln3XcSkJvE9V9vV6maD0CFZclaT8
 kiYIXhmQTa22J1U+aHibcGAnnqXZrC9qsz/wLO3hVX1efK0=
X-Google-Smtp-Source: ABdhPJxwz4sRl4hyWNYWeeYQ/NGfvW3SBpg41ENEFGYFEzK4HXbNMsSJwmCrsMJz1UzkRC3safjLUItV31F0hqaelco=
X-Received: by 2002:a05:6a00:c8c:b0:447:bddb:c83 with SMTP id
 a12-20020a056a000c8c00b00447bddb0c83mr14140350pfv.1.1632563356318; Sat, 25
 Sep 2021 02:49:16 -0700 (PDT)
MIME-Version: 1.0
From: cp <carlojpisani@gmail.com>
Date: Sat, 25 Sep 2021 11:49:13 +0200
Message-ID: <CA+QBN9AFNSf3+U4iMhwZx7c69MLk-BtSbVODBEA97ObYWRczbQ@mail.gmail.com>
Subject: ppc32 doesn't boot when linkaddr=0x00900000
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
Cc: torvalds@linux-foundation.org, paulus@samba.org
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

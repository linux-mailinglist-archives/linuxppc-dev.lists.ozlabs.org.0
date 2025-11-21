Return-Path: <linuxppc-dev+bounces-14415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04553C7A588
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 15:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCdfL5mNfz302l;
	Sat, 22 Nov 2025 01:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763737162;
	cv=none; b=DT6aFZB4YGRjJCeYcBGGS6PLMYxuYg4K6ExWSjx5yfLk4FlKbIsr3cFqJQhrjTbY6c+anl5UduhUtDSUMxyZypBKavd19YtjD8mmFmRuBAOv+5LMscLDmeIitSNHLgnpM3/jHx2UMT5zvTgmr8S9YUtsk4eyUwr1RQQ1u9IkqqBXhTNtrniZ9+kjYof2gWnPe9no3nyzCYZwzfYhfsX1/TZWM5cwSaOg6istxfnfeOwRfqgse20haXSLAJBKkSIBO9nmApvTgFRDqDjKt33smLKLRqHr8Zk9z1PYl4aiqlOucVbijBEVMTwvJKKXOLjBdGPFR9nEg6wARqZtbGVRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763737162; c=relaxed/relaxed;
	bh=zLcNfDRLWMiGrGrKX48fCNhlICDPEHHFNxw1XQjmDuY=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=nLjbMuucDfGw7VCjSTr1sVfhGlPAdokzPW9i/cdNvUEvlzsBcyS++HDXA8CgRWN+NQ8TJo30fc1SyVEpcTzvewvcRJ8Bx23X7K/Oi9MvMIQZSwoeMS4GXYAEGZg64EQ9CF+9TAbVvZbpumL6CsazKviGinzihqkc8w/iXk/5OlYbZsOf0jJYlLCHVemZnb7YhjcrsbgaZwVV57GVEEbeF8njBHrJd72UKhH7kkLmcQ/brOW1sGMmLwskPA3xfXoAq1Rut2im6SU3kDK2lltUqEd2a9EoYDURN7P057GxVDyxJBn5Ffa28FVcO9HitwX1eajXAzV+kv0/deCYpquZgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JUR2+x/4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JUR2+x/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=manili.devteam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCdfJ4fC5z302V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 01:59:19 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ee127a3f2dso1015531cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 06:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763737156; x=1764341956; darn=lists.ozlabs.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLcNfDRLWMiGrGrKX48fCNhlICDPEHHFNxw1XQjmDuY=;
        b=JUR2+x/4pGE2eI2/8s0e+MwJbTRBfyxl+TfzU7n4op0apL8qLm1X1eiOGUa8cOsdjO
         4+Y+xqIsDhv01BY2mstZnSpbzRALAniFq6LwHlpm7YBNoWdL/ksXSNOOD0Mp+UoFdJOQ
         fcCkB/b3KXfP183h5CvO3Xao/o4eWYEL+TbiIlC6k7ACloImqrKGrep2jpUbgrq+kyr4
         moGYKBMSBrtqi3Cs8J6opA4f68sUib5zuQcc2h/oLMTjEFozYYe1sdbavoZgIjrBZuJt
         lXrujNcCgKmv/DI4MvemrDLPCY1OIjvOLuZe0Jy2q5bEQdZVNilms8axXFoIy5ijXs/E
         ySkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737156; x=1764341956;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLcNfDRLWMiGrGrKX48fCNhlICDPEHHFNxw1XQjmDuY=;
        b=VkBYIPuJl1EBjPfZH+IT4QdzP+i39b1pWWZxCTUH7tSYCn7x9e4Om+haJ0YKNugSeu
         ixEwYt7xATfY2KLviKOh9EKszT9nZXMMP1TeXP+5LTJ63q9xhyFKYDkCzE+dRlfG8Bzv
         w2DuTMRygeOkiIcyJAqF3ARUgW7f7cICRxgos/xoD5HpAHTWLuBQKXJtaoO0XG48/sdL
         EmHguheOHL+T4tFzBaGVx9ZFY5kmZVsEiAc8vYMCl1hC3oeTfV6We8JqLbVjCQ423irb
         vJ/RNj6qRvJNYht0iDcl77t2Q2kuKa0LI4zNXNFKL4BDKhLBI8WPuRU1clOi/FbLzBau
         tf9A==
X-Gm-Message-State: AOJu0YyReZoveT1d6ADq/bH+mIFkAqRTUryZBUHa/xIdJYDNSCeh47Wj
	5ZAwhgatzoL1uZEVezKKHpqhSd/TKYLnNpabOh0xBzIiLUgxGWELGuCO
X-Gm-Gg: ASbGncvbY++v+8AmtCtTBDA4Mt/xR/BA5/yTP879sRBtjhqbKl52+Vx5Exbjk4uDqTR
	pvN88Y8djLKJNB+0wp52GYDGHQmn5V1NdG8Dp372U7tEw8vrWrZFSuKUAsreONbzumwSN/iwiwR
	u9ScDo3kPI8305mu0qEoDQaEA/gOAcDG6wSaCDN3nhb5OvUnn6C1+wyat6ro66qmtcUmbxdW8cr
	yAO/4hlK5vJhDA855G/M6gRl5zkwa2lsMAe7dIdgiKMYgzRXJ0W9OEqE8t4jtf7OQ2Bl0XGXcLW
	VC+25dAa8mHw5WDTJWCpeRxX80QlM8UKE4I3GjgFjFdDpPZRqidDe7YsllbyOMjvOyQQNTHT0pA
	K1pEXUTz1jZnlIZEDF3bKpx12Slt+3m2NaFfynRz/lVsbJrYMDBMTdwQ/3APeBBA2Z8Bh15YlqV
	HFYKFWw3SIg6KczlFM10rWrU1WFIjLVtVnWQoGeBFoo2NAvc79TCXvZUOrZfJVzo9A1sM=
X-Google-Smtp-Source: AGHT+IEvZzhcnfu5PXFB4M/pyNgDvgRIog1SX8am73OO9I85Kk8aEfWP0MOapfYPKXV/XL+AaTvPYg==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr27247511cf.2.1763737156179;
        Fri, 21 Nov 2025 06:59:16 -0800 (PST)
Received: from smtpclient.apple (ec2-3-87-7-19.compute-1.amazonaws.com. [3.87.7.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e446458sm39754796d6.12.2025.11.21.06.59.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:59:15 -0800 (PST)
From: Mohammad Amin Nili <manili.devteam@gmail.com>
Message-Id: <0BCEC0A4-006A-487F-B3E8-8AA0ECB20B2D@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8BC99E6B-1877-42D6-9754-2A24817AFFF4"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: =?utf-8?Q?Re=3A_=5BHelp=5D_Microwatt_=28Zynqwatt=29_=E2=80=94_Ker?=
 =?utf-8?Q?nel_halts_after_Radix_MMU_init_on_booting_Linux_on_Zynq_version?=
 =?utf-8?Q?_of_Microwatt?=
Date: Fri, 21 Nov 2025 09:59:11 -0500
In-Reply-To: <CAOSf1CEQPBrXBXkLkJ7o7VJYbrT1jXQDzqqe=FjRyKv62sfC0Q@mail.gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
To: Oliver O'Halloran <oohall@gmail.com>
References: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
 <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com>
 <CFB0E332-AB7C-4E70-BB8A-45BFD4EB9E18@gmail.com>
 <CAOSf1CEQPBrXBXkLkJ7o7VJYbrT1jXQDzqqe=FjRyKv62sfC0Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail=_8BC99E6B-1877-42D6-9754-2A24817AFFF4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Oliver!

> If you wanted to do something similar you would need to
> implement a udbg driver for your xilinx UART.

Actually this was the key point which finally led me to the
right direction. Thank you SOOO much for your help.
I implemented a udbg driver for Xilinx=E2=80=99s UART, worked
through a number of bugs, and managed to get bash and
userspace to start. During the work I hit two things in the
source that look odd to me; I=E2=80=99d appreciate any pointers or
explanations:

1. There appear to be two ways udbg can be initiated:
- =
https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/setu=
p_64.c#L378 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/set=
up_64.c#L378>
- https://elixir.bootlin.com/linux/v6.18-rc5/source/init/main.c#L932 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/init/main.c#L932>
  -> =
https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/setu=
p-common.c#L944 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/set=
up-common.c#L944>
  -> =
https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/setu=
p-common.c#L947 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/set=
up-common.c#L947>

The problem with the *first* (early) path is that a udbg driver
often calls `early_ioremap()` **before** any MMU/memory
setup has completed. The MMU setup for 64-bit happens here:
- =
https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/setu=
p_64.c#L418 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/set=
up_64.c#L418>

The 32-bit setup (`setup_32.c`) calls `udbg_early_init` *after*
`early_ioremap_init`, so it doesn=E2=80=99t hit this ordering problem:
- =
https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/setu=
p_32.c#L87 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/set=
up_32.c#L87>

In my case, attempting to initialize the Xilinx udbg driver via
the early path can (and did) cause kernel panics because
`early_ioremap()` runs before the memory/MMU is ready.
Practically, the only reliable place for my driver to initialize
is later in `init/main.c`. Is this the intended/expected behavior
for PPC64? Or am I missing something?

2. I had to inject a busy-wait loop between lines 125=E2=80=93126 in
`kernel/rcu/tiny.c` to prevent a crash when/after switching to
userspace:
- =
https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.c#L125 =
<https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.c#L125>=


Here is the loop I added:
for (volatile uint32_t i =3D 0; i < 10; i++);

If I omit that trivial busy-wait, the kernel crashes while/after
switching to userspace with an error LIKE:

[   42.397074] kernel tried to execute exec-protected page =
(c00c000000000000) - exploit attempt? (uid: 0)
[   42.408148] BUG: Unable to handle kernel instruction fetch
[   42.414964] Faulting instruction address: 0xc00c000000000000
Vector: 400 (Instruction Access) at [c00000000207fae0]
    pc: c00c000000000000
    lr: c00000000008c798: rcu_process_callbacks+0xf8/0x100
    sp: c00000000207fd80
   msr: 900000001000b033
  current =3D 0xc000000002056300
  paca    =3D 0xc0000000016e8000	 irqmask: 0x03	 irq_happened: =
0x09
    pid   =3D 10, comm =3D ksoftirqd/0
Linux version 6.18.0-rc5-00111-g6fa9041b7177-dirty (manili@manili) =
(powerpc64le-linux-gcc.br_real (Buildroot 2021.11-18033-g83947c7bb6) =
14.3.0, GNU ld (GNU Binutils) 2.43.1) #3 Thu Nov 20 09:33:11 EST 2025
enter ? for help
[link register   ] c00000000008c798 rcu_process_callbacks+0xf8/0x100
[c00000000207fd80] c00000000008c748 rcu_process_callbacks+0xa8/0x100 =
(unreliable)
[c00000000207fe00] c00000000003f320 handle_softirqs+0x1ec/0x23c
[c00000000207ff00] c00000000003f3a8 run_ksoftirqd+0x38/0x58
[c00000000207ff20] c00000000005f9c4 smpboot_thread_fn+0x1a0/0x1a8
[c00000000207ff80] c00000000005b190 kthread+0x1c0/0x1cc
[c00000000207ffe0] c00000000000b160 start_kernel_thread+0x14/0x18
mon>

The exact addresses in the error vary, but the crash
template is the same. My suspicion is that this is a
core/thread synchronization issue. Do you have any
ideas on this issue and why a simple while loop is able
to solve it?

Bests,
Manili=

--Apple-Mail=_8BC99E6B-1877-42D6-9754-2A24817AFFF4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div>Hi Oliver!</div><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">If you wanted =
to&nbsp;do something similar you would need =
to</div></div></blockquote><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"">implement a udbg driver for&nbsp;your xilinx =
UART.</div></div></blockquote><br class=3D""></div><div>Actually this =
was the key point which finally led me to the</div><div>right direction. =
Thank you SOOO much for your help.</div><div>I implemented a udbg driver =
for Xilinx=E2=80=99s UART, worked</div><div>through a number of bugs, =
and managed to get bash and</div><div>userspace to start. During the =
work I hit two things in the</div><div>source that look odd to me; I=E2=80=
=99d appreciate any pointers or</div><div>explanations:</div><div><br =
class=3D""></div><div>1. <font color=3D"#000000" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0);" class=3D"">There appear to be two =
ways udbg can be initiated:</span></font></div><div>-&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/ker=
nel/setup_64.c#L378" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/=
kernel/setup_64.c#L378</a></div><div>-&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/init/main.c#L932=
" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/init/main.c#L=
932</a></div><div>&nbsp; -&gt;&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/ker=
nel/setup-common.c#L944" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/=
kernel/setup-common.c#L944</a></div><div>&nbsp; -&gt;&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/ker=
nel/setup-common.c#L947" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/=
kernel/setup-common.c#L947</a></div><div><br class=3D""></div><div>The =
problem with the *first* (early) path is that a udbg =
driver</div><div>often calls `early_ioremap()` **before** any =
MMU/memory</div><div>setup has completed. The MMU setup for 64-bit =
happens here:</div><div>-&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/ker=
nel/setup_64.c#L418" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/=
kernel/setup_64.c#L418</a></div><div><br class=3D""></div><div>The =
32-bit setup (`setup_32.c`) calls `udbg_early_init` =
*after*</div><div>`early_ioremap_init`, so it doesn=E2=80=99t hit this =
ordering problem:</div><div>-&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/ker=
nel/setup_32.c#L87" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/=
kernel/setup_32.c#L87</a></div><div><br class=3D""></div><div><div>In my =
case, attempting to initialize the Xilinx udbg driver via</div><div>the =
early path can (and did) cause kernel panics =
because</div><div>`early_ioremap()` runs before the memory/MMU is =
ready.</div><div>Practically, the only reliable place for my driver to =
initialize</div><div>is later in `init/main.c`. Is this the =
intended/expected behavior</div><div>for PPC64? Or am I missing =
something?</div></div><div><br class=3D""></div><div>2. I had to inject =
a busy-wait loop between lines 125=E2=80=93126 =
in</div><div>`kernel/rcu/tiny.c` to prevent a crash when/after switching =
to</div><div>userspace:</div><div>-&nbsp;<a =
href=3D"https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.=
c#L125" =
class=3D"">https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/ti=
ny.c#L125</a></div><div><br class=3D""></div><div>Here is the loop I =
added:</div><div><div>for (volatile uint32_t i =3D 0; i &lt; 10; =
i++);</div><div><br class=3D""></div><div>If I omit that trivial =
busy-wait, the kernel crashes while/after</div><div>switching to =
userspace with an error LIKE:</div><div><br class=3D""></div><div><div>[ =
&nbsp; 42.397074] kernel tried to execute exec-protected page =
(c00c000000000000) - exploit attempt? (uid: 0)</div><div>[ &nbsp; =
42.408148] BUG: Unable to handle kernel instruction fetch</div><div>[ =
&nbsp; 42.414964] Faulting instruction address: =
0xc00c000000000000</div><div>Vector: 400 (Instruction Access) at =
[c00000000207fae0]</div><div>&nbsp; &nbsp; pc: =
c00c000000000000</div><div>&nbsp; &nbsp; lr: c00000000008c798: =
rcu_process_callbacks+0xf8/0x100</div><div>&nbsp; &nbsp; sp: =
c00000000207fd80</div><div>&nbsp; &nbsp;msr: =
900000001000b033</div><div>&nbsp; current =3D =
0xc000000002056300</div><div>&nbsp; paca &nbsp; &nbsp;=3D =
0xc0000000016e8000<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> irqmask: 0x03<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
irq_happened: 0x09</div><div>&nbsp; &nbsp; pid &nbsp; =3D 10, comm =3D =
ksoftirqd/0</div><div>Linux version 6.18.0-rc5-00111-g6fa9041b7177-dirty =
(manili@manili) (powerpc64le-linux-gcc.br_real (Buildroot =
2021.11-18033-g83947c7bb6) 14.3.0, GNU ld (GNU Binutils) 2.43.1) #3 Thu =
Nov 20 09:33:11 EST 2025</div><div>enter ? for help</div><div>[link =
register &nbsp; ] c00000000008c798 =
rcu_process_callbacks+0xf8/0x100</div><div>[c00000000207fd80] =
c00000000008c748 rcu_process_callbacks+0xa8/0x100 =
(unreliable)</div><div>[c00000000207fe00] c00000000003f320 =
handle_softirqs+0x1ec/0x23c</div><div>[c00000000207ff00] =
c00000000003f3a8 run_ksoftirqd+0x38/0x58</div><div>[c00000000207ff20] =
c00000000005f9c4 =
smpboot_thread_fn+0x1a0/0x1a8</div><div>[c00000000207ff80] =
c00000000005b190 kthread+0x1c0/0x1cc</div><div>[c00000000207ffe0] =
c00000000000b160 =
start_kernel_thread+0x14/0x18</div><div>mon&gt;</div><div><br =
class=3D""></div><div><div>The exact addresses in the error vary, but =
the crash</div><div>template is the same. My suspicion is that this is =
a</div><div>core/thread synchronization issue. Do you have =
any</div><div>ideas on this issue and why a simple while loop is =
able</div><div>to solve it?</div></div><div><br =
class=3D""></div><div>Bests,</div><div>Manili</div></div></div></body></ht=
ml>=

--Apple-Mail=_8BC99E6B-1877-42D6-9754-2A24817AFFF4--


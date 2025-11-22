Return-Path: <linuxppc-dev+bounces-14418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADCDC7C353
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Nov 2025 03:48:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCxNh3Jwxz302l;
	Sat, 22 Nov 2025 13:48:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763779716;
	cv=none; b=hOosXEm3IYKoJIdZBibL6jN/q0h3xhZ+ex6fw1M0ZMeWDxSVJMHwSopFhY6u3oAVK/DtO6uFLQA3Ejm5XY92QhrH2XqU5YzKWynONWBsZFaSt21lGfh3+iWsnwc2azpED4Mx0aTeNrkeWMM4qx9mlO113kW6ztIvTbzSAI6jxl+2gISC2uKS6LsG8YV4VCWypg41VJDOAiBrEo0vo5uBrptqme9wUvJHr8EoNF+rN60UDMcUN/gavhNe7fv8nikGNgDzO47RIq2NfsjjQojdoG9UjG/CTAS+c/Ms+7m4OeHFUabp2JZ++6qCeCwlxI/nOHDlsA8jk1isEZ5Qpgj2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763779716; c=relaxed/relaxed;
	bh=wkjKi/GcIsfFwPxnJVBX2oqJY7KP3swBhoKF5dVways=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1uxLjcJnpXLAt0prS/8B5MEx/oHh/ANCgYXdNgzrAVmgzi8kqXUYFpeRg9L3oy1jYPX/ByNpNNM4qT72uYP5VYhb5tENcz6keJhuYCRd37bfQt2l1a+mEDyQmOSd0ST9zA9o7rJQW3GtqHnxalyEVWnqL2LdHi1CBzAQP8ZZV7zVJckvHnLJuwxZ7vdnuBLfmVeqNKA2VaGnwOWDnQE0MB/P3QJBP+7uRLTn0a4UJlF3WWuvgF0yXTflBkf2CA9mLRBKLDzGQtQfL1zkQC6k7TUp0oxqhm/gjdj5LfPOnIDe067O/KtqxfXIlppo6FnNlhaXECBS7DIAxTR8QRaug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PAnXzh8o; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PAnXzh8o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCxNd4q7cz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 13:48:32 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b73b24f1784so499266066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 18:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763779704; x=1764384504; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkjKi/GcIsfFwPxnJVBX2oqJY7KP3swBhoKF5dVways=;
        b=PAnXzh8oRCzfjrWV3NkpVGRemKbLyrmoxlzUb3iMP2k/Pl4UUQOqo4TICBJm/XhRM4
         +j3y60w7o01AEIXlofu8LoWk5AJJ1QNLx5oLXm1Uv9b+MtqQ7pYfmU4odRIBmBYTwCpW
         +YMZ+McLgZhhJ6mhdXEE4xHBw1ftO9s/iazMAZDabjdjfvHUtkF0NLyHQ5/SbBsXiETP
         a2eN4TepVzYSuU9iYlfkXRIvRu5gcTB0wZ9dS3CSliEH+1JliTahqUvDeFv8axsc5I8p
         Vz3IwNvz4w2OqSc7yc2dFuXxCFSLXpfofmZWhjVxlwQAROPe1eJlxzPQPfnXmoBmgDzz
         Cd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763779704; x=1764384504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wkjKi/GcIsfFwPxnJVBX2oqJY7KP3swBhoKF5dVways=;
        b=eVBTmnAHEB4npy++uTmN5onas4AUo9kYunv3mPMlQrjgqiN/n/0wApVg7MwQhcWaT5
         2u5Z9tBkXzZHrka/h0bsHI4r0TmFx5uof+JQTCNMcq+xYlVshUeQXN9vSb2mR+eE0J1H
         viMQRM5T4KD062SWILyi6fiXZRDe7UkfLO9SWtvddnzou8XEujAE3bYa5J43lYICtub2
         BVO+ohF/o+SbgfTOobUOezgcU358IebxpBIWRiDjkLisG5jNdVbcInSEfimNmw/mywa/
         rw3ptUQVPI/B4RxWlugwp6iXQNao1DN/bXfu1jF07LtTsmgzFVez+O6Fq1RO3s48Ux9j
         /QVA==
X-Gm-Message-State: AOJu0Yyi/tfiMvB6so6E2OsO7eBaWA7cSKPuXKfR2oliZvjWYDsaQpQB
	tY6DC/xrSGytfI9M1eNlQmiOAFIQsy2sXOLFsHQ67Vi6t5vHY5ILtuD+iDdpc3DzaxbevXs6ifT
	oiul+VJ7Ph9VbhgFr7XWPg4KJT9d1qy4=
X-Gm-Gg: ASbGncvsHNKpQXqXLvMDI2mMHrsESlZEFm2e5v6Stm52LTYxb0/8CSayI4r4x7pa0mB
	IO8Hj+iyXEdxA1flElBntskefd8HEChHZyd8v7bG7lZ+LqP6Vs3bbNe2w7Xn+CRjq2EBuTQ9OMM
	dp1vkSTOG4DnTRG+S2EX4eX2+Gyb/sZIMoZJkoxC+izg1iZWJZ4NQSOrfrDcbeZ+69mGTwmLz/E
	9eMAFsgV0S4ePtMpx2wbW/2qcEfPGZSBGlvCq7RRb3T1gnTA2Eb4Hkjp1jI1RkuIynJXpkWgmK1
	yTjzKbU=
X-Google-Smtp-Source: AGHT+IFnsYHAvqEdGlgbB9sKcMzjtfUBA9egLD2my8e0mrtjWPyUN+z/1pT5fl+stY7jLmb68+TH5futBKWtYl9pHb0=
X-Received: by 2002:a17:907:3d87:b0:b72:671:b2a5 with SMTP id
 a640c23a62f3a-b76571367f9mr1048116366b.3.1763779703813; Fri, 21 Nov 2025
 18:48:23 -0800 (PST)
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
MIME-Version: 1.0
References: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
 <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com>
 <CFB0E332-AB7C-4E70-BB8A-45BFD4EB9E18@gmail.com> <CAOSf1CEQPBrXBXkLkJ7o7VJYbrT1jXQDzqqe=FjRyKv62sfC0Q@mail.gmail.com>
 <0BCEC0A4-006A-487F-B3E8-8AA0ECB20B2D@gmail.com>
In-Reply-To: <0BCEC0A4-006A-487F-B3E8-8AA0ECB20B2D@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Sat, 22 Nov 2025 13:48:12 +1100
X-Gm-Features: AWmQ_bnodxtm7U8V1GPYbvQLuiE2RRvFVIodEq7QUAUg5nlexK_2QPQukzho1jA
Message-ID: <CAOSf1CEqFVxaNetW_=gBZFnvn4Our8-gGSDUigWeaMc98Kg-yg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BHelp=5D_Microwatt_=28Zynqwatt=29_=E2=80=94_Kernel_halts_aft?=
	=?UTF-8?Q?er_Radix_MMU_init_on_booting_Linux_on_Zynq_version_of_Microw?=
	=?UTF-8?Q?att?=
To: Mohammad Amin Nili <manili.devteam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 22, 2025 at 1:59=E2=80=AFAM Mohammad Amin Nili
<manili.devteam@gmail.com> wrote:
>
> The problem with the *first* (early) path is that a udbg driver
> often calls `early_ioremap()` **before** any MMU/memory
> setup has completed. The MMU setup for 64-bit happens here:
> - https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/s=
etup_64.c#L418
>
> The 32-bit setup (`setup_32.c`) calls `udbg_early_init` *after*
> `early_ioremap_init`, so it doesn=E2=80=99t hit this ordering problem:
> - https://elixir.bootlin.com/linux/v6.18-rc5/source/arch/powerpc/kernel/s=
etup_32.c#L87
>
> In my case, attempting to initialize the Xilinx udbg driver via
> the early path can (and did) cause kernel panics because
> `early_ioremap()` runs before the memory/MMU is ready.
> Practically, the only reliable place for my driver to initialize
> is later in `init/main.c`. Is this the intended/expected behavior
> for PPC64? Or am I missing something?

Nah it's just broken for your case. Most ppc64 development happens on
IBM hardware and the udbg drivers for those platforms (pseries for
VMs, powernv for bare metal) don't require the MMU to be setup.
Enabling debug output pre-MMU is handy since it lets you debug MMU
setup issues, but obviously it's not going to work if your udbg driver
needs to map stuff. You could avoid depending on the MMU by using the
potato uart driver's trick of just disabling data relocation when
writing to the UART's registers. That's pretty slow and a bit janky
though. A better fix might be to split udbg init into an early
(pre-mmu) and late variants with the udbg drivers that need the mmu
are initialised later.

> 2. I had to inject a busy-wait loop between lines 125=E2=80=93126 in
> `kernel/rcu/tiny.c` to prevent a crash when/after switching to
> userspace:
> - https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.c#L12=
5
>
> Here is the loop I added:
> for (volatile uint32_t i =3D 0; i < 10; i++);
>
> If I omit that trivial busy-wait, the kernel crashes while/after
> switching to userspace with an error LIKE:
>
> [   42.397074] kernel tried to execute exec-protected page (c00c000000000=
000) - exploit attempt? (uid: 0)
> [   42.408148] BUG: Unable to handle kernel instruction fetch
> [   42.414964] Faulting instruction address: 0xc00c000000000000
> Vector: 400 (Instruction Access) at [c00000000207fae0]
>     pc: c00c000000000000
>     lr: c00000000008c798: rcu_process_callbacks+0xf8/0x100
>     sp: c00000000207fd80
>    msr: 900000001000b033
>   current =3D 0xc000000002056300
>   paca    =3D 0xc0000000016e8000 irqmask: 0x03 irq_happened: 0x09
>     pid   =3D 10, comm =3D ksoftirqd/0
> Linux version 6.18.0-rc5-00111-g6fa9041b7177-dirty (manili@manili) (power=
pc64le-linux-gcc.br_real (Buildroot 2021.11-18033-g83947c7bb6) 14.3.0, GNU =
ld (GNU Binutils) 2.43.1) #3 Thu Nov 20 09:33:11 EST 2025
> enter ? for help
> [link register   ] c00000000008c798 rcu_process_callbacks+0xf8/0x100
> [c00000000207fd80] c00000000008c748 rcu_process_callbacks+0xa8/0x100 (unr=
eliable)
> [c00000000207fe00] c00000000003f320 handle_softirqs+0x1ec/0x23c
> [c00000000207ff00] c00000000003f3a8 run_ksoftirqd+0x38/0x58
> [c00000000207ff20] c00000000005f9c4 smpboot_thread_fn+0x1a0/0x1a8
> [c00000000207ff80] c00000000005b190 kthread+0x1c0/0x1cc
> [c00000000207ffe0] c00000000000b160 start_kernel_thread+0x14/0x18
> mon>
>
> The exact addresses in the error vary, but the crash
> template is the same. My suspicion is that this is a
> core/thread synchronization issue. Do you have any
> ideas on this issue and why a simple while loop is able
> to solve it?

That's very odd. rcu_reclaim_tiny() is probably being folded into
rcu_process_callbacks() by the compiler and the crash occurs when
branching to the callback function from the rcu_head
(https://elixir.bootlin.com/linux/v6.18-rc5/source/kernel/rcu/tiny.c#L95).
That said, the "callback" address it branched to (0xc00c000000000000)
is actually the base of the vmemmap (i.e. the struct page array) so I
doubt that's actually the callback address stored in the rcu_head. You
can use xmon to dump the registers and examine memory to confirm this.
It's hard to say why this is happening, but it's pretty likely to
either be the compiler optimizing away code you'd prefer to keep or a
bug in the core itself.

I'd compare the disasm of rcu_process_callbacks() with and without
your wait loop added and see how the emitted code changes. If adding
the loop changes nothing then it might be a logic bug in microwatt
itself or some other timing induced problem.

>
> Bests,
> Manili


Return-Path: <linuxppc-dev+bounces-14141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE55C54E58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 01:29:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6LkD71Ywz2yv5;
	Thu, 13 Nov 2025 11:29:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762993764;
	cv=none; b=gYZDn8mLPG6YiT2Q6sBburXKyAKjo5wi6uaR7t/nzdo3fEBdPsGirJfsNJul/OBSnPMTUMjB25O4dOVpJ1uNypQp00pLldNtcvMS15XsmYKWU0x2rV9Fpw8Pj/oKvr/vaxx/2cJwJcabpWSkHEAS1WF8GQcKKmntiuVmHA0nvrJM8QtfyvKEwlbc7jf9SmeKZwTEah7DspAb4NlJseGXUhc+roabrIZwRKqHlv/EuB8aMRB2CSGHyi/bUCqes+4kDFQTg4/s3QWL8ISnixX/iC1HNZL0e+Lw3DZJ51mCrk1y92A9GXf2bCiN+bUuRG77yErSwTIotDh1kox/BzvLag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762993764; c=relaxed/relaxed;
	bh=fsuoeTC9LYzmTJuuWc0SKKrhbIpFQflydwROOTcgFGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8jj3Zazzlrurdtjfw2n2O588q1zWZ/ed2U92iO1irelG0ap9s1MjQsWGCKaGsQaFMqBn9He3Bl+NbRs9WiZX4QBX6ARQY0kH26mI53dtoux/EL4XK6GuIKMX2N7jjlACY6iTTzDJd261sFhcbHRoZBxObEKjH/TMmLOrAk3dqFoVzxJSj2ROXFL9ID1r513NfYD7hGZs12GMlXrLpQ2Zbut5seZgejJW/hX/GdKJxpTPM2wotgh0xrCQOpWAvGYtYnXXICw/PiNO9uM01dkOwdpmYIp7acPXmhk0AikdwszOig6MVTXqhvPH2K5b2fjz8oARL0ccXpY23zaBZUvfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RgJTMM4z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RgJTMM4z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6LkC0QC0z2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 11:29:21 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b73301e6ab5so26588766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 16:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762993753; x=1763598553; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsuoeTC9LYzmTJuuWc0SKKrhbIpFQflydwROOTcgFGk=;
        b=RgJTMM4z9MNookg9O3qQcGpsmse2RRYJQYOr7Q214PMq3lLOV/ny+/Mvx+AiY3lAnD
         ur3fNxHRec4N78luMxDt/xYnQZZCfrAAV//Qdtyt6zSVposL6Q5SIqENpACKv97nKTjR
         2iDLDtvkyOVhVlIrqIArYmseHxSCslsAECJ1VVoNyXHky8zpKx/d99wO3BjyY3as6ptY
         WaJf1nkQGGbbrqlF0/8EQ6GTjt/X1u+Ob7cqmJXW94DVj3TJyUKZuIQ7lkvsXCRyU5Qq
         c9AWWHyQzOdH+mXYuN418uEj6AdC1dl2G6hvr6jG8qHHLUUhspfyOkPHoC2mE6JDQWK0
         I+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762993753; x=1763598553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsuoeTC9LYzmTJuuWc0SKKrhbIpFQflydwROOTcgFGk=;
        b=MMdYhjMSe8ZipgNybiupWG3dmf8vFwfofMosrBGBFI+X9fYb66dlk91SdzAmz1cjcw
         4uxoaXcV4TjTrrqvx8caqwLl83UXhPWqCfMh3FXz2s0fomMg0bdism5OAHyd9PSdQnL8
         mjG+iMO2tHIIVXDlrofccLq+Ia6zZXXclUWtg6O0DztDcuZK7JpK6x2a4ToxVZOf6Pcy
         0gg4RT10oysj3ig95Jks66NUv9YMJzGSX5ZcwpSe5MeVEXlHIVAtLLrMbNIgZ8a+lQ36
         OMQPWWNGBdmpq0eO7saQFlAijrLGjeLNzxBlfbT6GYLy2I+5AhjxMBFRc9sTYwR4uvZE
         fajA==
X-Gm-Message-State: AOJu0Yz0AsmVaOQEZ2oW36p05XeGVIdoiQ/cX2MOaT8ZO2T5BA95oVTV
	rWBtqvxhJ3/GyHs2kCYOCeUg0/iFHPCnTz7FpGA8Rkk/B6TdZBmw/BuXRlS2F+1c/4N+l0rs+qc
	Ef5QTQpK4hqpYfjwSO3Ng5RQCqEo+3/Ic9ZYJ
X-Gm-Gg: ASbGncvglfdgcaE04fRze5EFNEyS6qkP+gJh4GCZVYMc+pJnJFBJUUcCOKyZp+t7FAe
	CfZ8Y80/9AkF6S06NaxBrSjNUYR4pZf8mHuwkkzoxxA//HsPtmF7zMihveI97Xlt61grbbzRg84
	nkMY4Ioji93hfxpkS774tNehfddH+n1wkCPXKkJhoMyITvEoHUhg9oHNk44M5iGFlC1UaQE0BqF
	wxAD1oItwg2p/pfqoI4eZLzoW3oEPEG+qBo8XQ4I34nQGq5Qs+1Z/1YNio=
X-Google-Smtp-Source: AGHT+IFd18Jrs1NQq2GGGQKcgIYhx6fS+iQ6jcR2AQ9MrU6UxPw2aMdkO5lJurzqRj5/iQo5caV/7JVWeFj51sKevpY=
X-Received: by 2002:a17:907:1c1b:b0:b37:4f78:55b2 with SMTP id
 a640c23a62f3a-b7331b5f2b8mr482975666b.34.1762993753308; Wed, 12 Nov 2025
 16:29:13 -0800 (PST)
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
In-Reply-To: <AEFA6CA1-69CB-4248-9911-C0BDFB03DB56@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 13 Nov 2025 11:29:01 +1100
X-Gm-Features: AWmQ_bl8M4r73FwxJI6TEZLsFXyPn97Oif1rLC1ZJpZnRCwREMMQxpP8hsKL76E
Message-ID: <CAOSf1CEf41H4ynEQvszspTMKpq9vq0FnXy=qdk_-PUrZpJVwCg@mail.gmail.com>
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

On Thu, Nov 13, 2025 at 1:45=E2=80=AFAM Mohammad Amin Nili
<manili.devteam@gmail.com> wrote:
>
> [    0.000000] printk: legacy bootconsole [udbg0] enabled
> [    0.000000] ioremap() called early from of_setup_earlycon+0xd0/0x2d4. =
Use early_ioremap() instead
> [    0.000000] earlycon: earlycon_map: Couldn't map 0x00000000ff000000

pretty big red flag right there


> NOTE: As you know

bold of you to assume i know things

> the `earlycon` driver depends on calling `ioremap`
> in `drivers/tty/serial/earlycon.c:L47` to get the virtual address of its
> `mapbase/membase`, which is later used by the main console driver (e.g.
> `cdns,uart-r1p12`). During the very early boot phase, `ioremap` returns
> `0x00000000` because it is called before `early_init_mmu` and
> `early_ioremap_setup` in the `early_setup` of
> `arch/powerpc/kernel/setup_64.S`.
>
> For debugging purposes, I hardcoded it to return the **physical address**
> `0xFF000000` =E2=80=94 which corresponds to the Zynq PS-side UART0.
>
> 5. From what I can tell, **the system crashes or loses console output
> immediately after the MMU is activated** =E2=80=94 specifically right aft=
er the
> call to `RFI_TO_KERNEL` in `arch/powerpc/kernel/head_64.S:L1019`.

Right, you turn on the MMU and the next time printk() is called the
console driver tries to write to 0xFF00_0000. That's not a valid
virtual address so it explodes. To make an address usable in both real
mode (i.e. pre-mmu) and virtual mode you need to have the page tables
setup so that virtual address maps to the same physical address.
Setting up that mapping is what early_ioremap() does. That's why
there's a warning telling you to use it.

Based on the in-tree DTS files earlycon doesn't seem to be used on any
powerpc systems. My guess would be that most ppc platform use udbg
(very old, powerpc specific thing) rather than earlycon for this kind
of super-early debug output. Considering you're getting console output
via udbg I'd say just removing earlycon from your kernel command line
will probably fix your issue.


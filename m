Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C669C86BAEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:46:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XeHVI3r0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlTxK2xGWz3vYd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:46:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XeHVI3r0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlTvX73J3z3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 09:45:12 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a34c5ca2537so53705166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 14:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160306; x=1709765106; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Wb6NhI/vtCiU6t546gnwmXs9J3vtrwxtAXa2CAncw=;
        b=XeHVI3r0tCegUO96R/N2SiTJqIu5gv8qwNaCEOVx45Xe4mPVmuICp1atB213beRrD9
         ehkj1nA2xKtMdWNFcUBcgRYhjQqeeNodVgK70Af9EfjKefY+D8zjxmwtxTEnpW8pxdRk
         y5WL4uWgdKq7OjI68l3U2XwemY08xZVcv1VhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160306; x=1709765106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Wb6NhI/vtCiU6t546gnwmXs9J3vtrwxtAXa2CAncw=;
        b=UGpixQSvO+l75g34U2DKUC5peBlvhAtSTx5+8dg2mgBKjc+PAWvSjRN8zy77D6QZZ1
         Kod6lLsxxo2nZ/5benf1O4nU44a9iPFaoNmebcVwVGf4s2lDZqWdnVIrCk2yFd3R6wMG
         RfgxDUnMY9T29QFgZGTp5Cjssa0catKUeFZOH55WczN+dUQ9L9S0gerRLFH4E0U6MNJF
         TrLpDTePmnT0n/mvIXcuVZeKmpL3b5NqCk0UV/6egZPWbnMkN5M2BGK6+3axi76ifuz5
         JeGhE6NxSCUSo50FwNtXTZMhEvxg+TkmWyir3BDeJ09pYfwdv4gs0XR0evFdPZTDkg4C
         zVJg==
X-Forwarded-Encrypted: i=1; AJvYcCVTNswKwvKABvjOe1m2O7LeS/Dpvr3nzqoDWrVQxG3py2XykaRsoazqXGOJUR3+6Xwd3UdsV3tsPCaHq1J+vqeHc9kfil8Kqu5Th5P4Cw==
X-Gm-Message-State: AOJu0YyVWOFhJQPsQiwZjIJqU79Dc+sOZTpQhqaF1vdoKkRyLRSgP7uX
	mtGnxSqqbm10XPhDESFUh1/rJ+hfYhRS+nt2h2Yikx5J0g2ZL1yC9EXG76mvAd2TDJNLuYw+pmJ
	1M0AI
X-Google-Smtp-Source: AGHT+IEDb0RZuxFn1jT4ggvWS0lo1lg/IdJbsYLXmfdXDGnLqrp/S55kp39fgE6tGTZb+5m3AWEhHw==
X-Received: by 2002:a17:906:2bd4:b0:a3d:482f:3fc4 with SMTP id n20-20020a1709062bd400b00a3d482f3fc4mr170649ejg.70.1709160306649;
        Wed, 28 Feb 2024 14:45:06 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a43f4722eaesm1171450ejc.103.2024.02.28.14.45.06
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:06 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so1875a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 14:45:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7ZsbCAtDWs5vMWcu2xmHZIXJiFXdMdUhO5vKtos4nGvedTuo48MLUYrSyOVfaNz7oVjECsu9dyxBMqP42dl5yjxaog40dymrSkfNzAw==
X-Received: by 2002:a50:8aca:0:b0:561:a93:49af with SMTP id
 k10-20020a508aca000000b005610a9349afmr11944edk.7.1709160305919; Wed, 28 Feb
 2024 14:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-4-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-4-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7gOpLw2VwRO7EwwNoqSJFM8iC0-R1GC4RHtz4=fwa5A@mail.gmail.com>
Message-ID: <CAD=FV=W7gOpLw2VwRO7EwwNoqSJFM8iC0-R1GC4RHtz4=fwa5A@mail.gmail.com>
Subject: Re: [PATCHv11 3/4] genirq: Avoid summation loops for /proc/interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: pmladek@suse.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jan.kiszka@siemens.com, deller@gmx.de, liusong@linux.alibaba.com, kernelfans@gmail.com, linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, npiggin@gmail.com, tglx@linutronix.de, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Feb 27, 2024 at 11:22=E2=80=AFPM Bitao Hu <yaoma@linux.alibaba.com>=
 wrote:
>
> show_interrupts() unconditionally accumulates the per CPU interrupt
> statistics to determine whether an interrupt was ever raised.
>
> This can be avoided for all interrupts which are not strictly per CPU
> and not of type NMI because those interrupts provide already an
> accumulated counter. The required logic is already implemented in
> kstat_irqs().
>
> Split the inner access logic out of kstat_irqs() and use it for
> kstat_irqs() and show_interrupts() to avoid the accumulation loop
> when possible.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  kernel/irq/internals.h |  2 ++
>  kernel/irq/irqdesc.c   | 16 +++++++++++-----
>  kernel/irq/proc.c      |  6 ++----
>  3 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

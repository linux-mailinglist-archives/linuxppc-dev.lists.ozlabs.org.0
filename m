Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC2886BAE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:45:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lrR0Guoc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlTwP3WRJz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lrR0Guoc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlTvW1Ptkz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 09:45:08 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a44360a8b9dso18126266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160302; x=1709765102; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaIW3mETQDzZhGMK3PRFUOCtdSx2PTiCbd1xUJLaJyo=;
        b=lrR0Guocd4t6sQe/WbmLpRi8xSN0oe1RfCt2wkBV9Xj38skOBaQY1V+T3JQfknG830
         ESMLGycHkFGMwKjq7+V2srJFB2cWzG4E4gZL+iaNc2m76OuiJ1O6n+02So1QCSLcviHR
         jCRQVGxqQ5xoLTM9w1wagGwlRQ8zhkAD4nnhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160302; x=1709765102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaIW3mETQDzZhGMK3PRFUOCtdSx2PTiCbd1xUJLaJyo=;
        b=nBrnBM/M4A+7pjaWOXWxvKOLYQcujg5ue5yr4omYhjovHveNLtRThK85fpn7L/BZCd
         v/GcZPnAv/4KG39vhBJqdB1SP4ZBHNqSEFDGo2RuS9qt8puZ7s58d6+9REitMzvBKBkL
         PsgZ79UfHGLuJRCVlUzfjgRQGMOSIwyncrvMAUzmSzUkAL9XqTaVfHNsDySay8lB5usz
         jEWt5Ug/r/8CwPeviJitV0cu6ALujdHQeUWU1VwZjCU+fVG1TQ7cg8UYJqaclIYfYq/n
         kvzuqpMggO0frh0uEuqiGy1xc+KMciTMyLTvAbfkrqVIUNnFW4ZXey4Oz9VC9/YY/x5a
         cIsg==
X-Forwarded-Encrypted: i=1; AJvYcCXknDQBMnhSb9kCICMSBKeKTKj0g4Lo2KyPHuipQb6LMfAIfi3B0G1KmqmkCj3eQ2tKKDWSVjCRfdBa8VhGAsAtbTZvV/cDwWuCnNSxoA==
X-Gm-Message-State: AOJu0Yx+rPY7JMOcI3SuLvR10TuXmuXI/Fbc812k9Lx8dMsfj8ZK8WuF
	aBQ0ar+nfzccMFqqOY9zHvfzM8K7Kv3kIYPRAQqj1gI1cO9cC1LxOfKP/pulShP9VUPG0cbOOaH
	/wz+d
X-Google-Smtp-Source: AGHT+IFhT9sYF5O6DdFhKgwTWiIRQ95OegTbKAXaTN069Upo22CHAz6Lyhgx8Io6DNxLaWTmdwnSOQ==
X-Received: by 2002:a17:906:4152:b0:a3d:2243:29da with SMTP id l18-20020a170906415200b00a3d224329damr167211ejk.36.1709160302337;
        Wed, 28 Feb 2024 14:45:02 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id vk7-20020a170907cbc700b00a3f6466ba85sm2302633ejc.35.2024.02.28.14.45.00
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:45:01 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4129a748420so29255e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 14:45:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFLaXGaWs6hFJHA8X/gwy1+i4eRmKyfVYupqDMvD4cdVgQvlDfIFsA15fmDCLXmi7x8p35z1rsn/p50C4EbU+J/J7+tqMsznwSbUoVoA==
X-Received: by 2002:a05:600c:4e16:b0:412:b66f:3d0a with SMTP id
 b22-20020a05600c4e1600b00412b66f3d0amr20561wmq.6.1709160300349; Wed, 28 Feb
 2024 14:45:00 -0800 (PST)
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-3-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-3-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Message-ID: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for interrupt statistics
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
> The soft lockup detector lacks a mechanism to identify interrupt storms
> as root cause of a lockup. To enable this the detector needs a
> mechanism to snapshot the interrupt count statistics on a CPU when the
> detector observes a potential lockup scenario and compare that against
> the interrupt count when it warns about the lockup later on. The number
> of interrupts in that period give a hint whether the lockup might be
> caused by an interrupt storm.
>
> Instead of having extra storage in the lockup detector and accessing
> the internals of the interrupt descriptor directly, convert the per CPU
> irq_desc::kstat_irq member to a data structure which contains the
> counter plus a snapshot member and provide interfaces to take a
> snapshot of all interrupts on the current CPU and to retrieve the delta
> of a specific interrupt later on.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  arch/mips/dec/setup.c                |  2 +-
>  arch/parisc/kernel/smp.c             |  2 +-
>  arch/powerpc/kvm/book3s_hv_rm_xics.c |  2 +-
>  include/linux/irqdesc.h              | 14 ++++++++++--
>  include/linux/kernel_stat.h          |  3 +++
>  kernel/irq/internals.h               |  2 +-
>  kernel/irq/irqdesc.c                 | 34 ++++++++++++++++++++++------
>  kernel/irq/proc.c                    |  5 ++--
>  scripts/gdb/linux/interrupts.py      |  6 ++---
>  9 files changed, 51 insertions(+), 19 deletions(-)

I won't insist on it, but I continue to worry about memory
implications with large numbers of CPUs. With a 4-byte int, 8192 max
CPUs, and 100 IRQs the extra "ref" value takes up over 3MB of memory
(8192 * 4 bytes * 100).

Technically, you could add a new symbol like "config
NEED_IRQ_SNAPSHOTS". This wouldn't be a symbol selectable by the end
user but would automatically be selected by "config
SOFTLOCKUP_DETECTOR_INTR_STORM". If the config wasn't defined then the
struct wouldn't contain "ref" and the snapshot routines would just be
static inline stubs.

Maybe Thomas has an opinion about whether this is something to worry
about. Worst case it wouldn't be hard to do in a follow-up patch.

Everything else looks good to me. Given that I'm not insisting on
adding the extra CONFIG, I'm OK w/:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

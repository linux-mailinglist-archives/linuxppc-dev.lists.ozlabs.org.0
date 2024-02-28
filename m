Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9C86BB04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:53:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LLtvZnM3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlV5832Wwz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LLtvZnM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlV4L0thZz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 09:52:48 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a3f4464c48dso38618166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 14:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709160764; x=1709765564; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxABPZ28o1U9eMcO7y1qUMLxndBrASNoz0KbMJJ/fIg=;
        b=LLtvZnM3Y0Rcz+Cif0Y9XuIGQYACWgWGKOfBXq67BdyHIHeXw5nEfyeoj1oXLt3ld9
         XjTiAzYyYb6FK0NzrdrvQ4gU9fthhVmTdlmy3m1h5gDixHuXvVik1+PYsfQVFixOgQjF
         OGa6vU62nD9dDq+/DJjs1O5nfNPFvsqwoW2hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709160764; x=1709765564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxABPZ28o1U9eMcO7y1qUMLxndBrASNoz0KbMJJ/fIg=;
        b=dwVMX6IJOxX3oeT4yRkuKuZB7m39IO8juxVjnSWdRb14ESo2ofizqtLFed9oWlU0sH
         /PckeLdAh1bhs6kgo6WkRm4Mh9N3M1L2p8fap7qwlUZMe3iG8IrTwdl9nFT/HzWdHNir
         wYYCnrfOB2nLMir3FzmxLUEP8lTd51JTHXDvhZ6dsUHdCWdmtWlEqQfUd3jMhtR6u4kF
         spIx+OcZsNqfTFMHg1VtsyfFpie8fYOlBLkbADVe51wzMnR9E0c9oxjCVcHQlWDqUVML
         RlL41FnHJ6RaH6PgtgLsbP2m9frNqBgHE+APbGnJ0Fd1D9zIcsHYRMa1/Cx6N+7ETKjQ
         vvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf8rqdWzplPqLng5mC/bwoJ7sh5h+qH3hYuhh78XufplQJkn1+cG8bdpC8zfBzOYHarFD59hyu9SCZoni3GKzAaMB48khWxkt70Bf4bQ==
X-Gm-Message-State: AOJu0YxMiSWxxoOWlu7VIW7YI6oCA4iA+5nx3oNk+Afoms1aaqGLJ4Kd
	643je0NDp25Q9UlEHTmTcy2cYY35Q7F4TSc7vA1ZBwhl0JYxMJvdo8jM6FJ05PSwr2+5Q0JTeKY
	Hnnwu
X-Google-Smtp-Source: AGHT+IGy+4HnM2Pn2AFGn+qmbkXvHPEk/QCT+ulUoiLuck9dGDRDsWvGgvoM7N46jYfA0w3W7rNiRg==
X-Received: by 2002:a17:906:134a:b0:a43:efcd:c7c2 with SMTP id x10-20020a170906134a00b00a43efcdc7c2mr215981ejb.40.1709160764402;
        Wed, 28 Feb 2024 14:52:44 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id cd14-20020a170906b34e00b00a4412406741sm817012ejb.131.2024.02.28.14.52.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 14:52:44 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so1926a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 14:52:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVExm/wO12iFrSaxkZ4cXZoe81pGr/A0e9sdbNTJoIlw88SRXXFJQADcXuhNpGXuAbUiCn64Fuje82mX9Xc64gcaKqSoueNJlYf36QXbw==
X-Received: by 2002:a05:600c:538f:b0:412:b689:5d88 with SMTP id
 hg15-20020a05600c538f00b00412b6895d88mr18372wmb.3.1709160314368; Wed, 28 Feb
 2024 14:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20240228072216.95130-1-yaoma@linux.alibaba.com> <20240228072216.95130-5-yaoma@linux.alibaba.com>
In-Reply-To: <20240228072216.95130-5-yaoma@linux.alibaba.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 14:44:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xgr4--NJ3dAh2ggxbFUV9-QR6rW+YXyMHZYXPVSkmaAw@mail.gmail.com>
Message-ID: <CAD=FV=Xgr4--NJ3dAh2ggxbFUV9-QR6rW+YXyMHZYXPVSkmaAw@mail.gmail.com>
Subject: Re: [PATCHv11 4/4] watchdog/softlockup: report the most frequent interrupts
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
> When the watchdog determines that the current soft lockup is due
> to an interrupt storm based on CPU utilization, reporting the
> most frequent interrupts could be good enough for further
> troubleshooting.
>
> Below is an example of interrupt storm. The call tree does not
> provide useful information, but we can analyze which interrupt
> caused the soft lockup by comparing the counts of interrupts.
>
> [  638.870231] watchdog: BUG: soft lockup - CPU#9 stuck for 26s! [swapper=
/9:0]
> [  638.870825] CPU#9 Utilization every 4s during lockup:
> [  638.871194]  #1:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.871652]  #2:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.872107]  #3:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.872563]  #4:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.873018]  #5:   0% system,          0% softirq,   100% hardirq,    =
 0% idle
> [  638.873494] CPU#9 Detect HardIRQ Time exceeds 50%. Most frequent HardI=
RQs:
> [  638.873994]  #1: 330945      irq#7
> [  638.874236]  #2: 31          irq#82
> [  638.874493]  #3: 10          irq#10
> [  638.874744]  #4: 2           irq#89
> [  638.874992]  #5: 1           irq#102
> ...
> [  638.875313] Call trace:
> [  638.875315]  __do_softirq+0xa8/0x364
>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> Reviewed-by: Liu Song <liusong@linux.alibaba.com>
> ---
>  kernel/watchdog.c | 115 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 111 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

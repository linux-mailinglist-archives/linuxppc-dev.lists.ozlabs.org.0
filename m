Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C71DB49E4EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 15:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl3KG5bRHz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 01:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hks7nMfH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hks7nMfH; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl3Jg5wKKz30NW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 01:44:35 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id 9so3846091iou.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 06:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2TXXxAA22JP55U2d5KcEju2kMZrmD6a4AiOWrq8N6KU=;
 b=hks7nMfHeG1O6/iSHwf3VQNmLIui784tr+mUrsdRtKWklyXM3EHK5UQMezkB1a53Fj
 Xe8/FA2bEmcQXXOIsA9K+hyq5JnOFDJjKSZ+Mlpx4F/4CIYPQ3IKRC/nTGPu0ojoNMaY
 h/BjBiqYDkljFlrXa7cEbL21DvAVb0rcYLV6HRHI3K7kv/f1+LE5KjPlHZYcwDV0LTDc
 BPvPQTafXmAtuPE/44fxvNkq+fAkJ5qPkvNl3GhEAN49MSc7ec4sh7QYUzqST5eqgZO0
 xuUBFysv9O05ffOPhGh6BUiTlkXg5JOIzjn4R0hND5ha77B2PBWgeFWNmWwnLAXjCRu9
 F79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2TXXxAA22JP55U2d5KcEju2kMZrmD6a4AiOWrq8N6KU=;
 b=xR+Hiq3toHT2U08aOvYAn0FDB2o6aw5AzQ0Eojii6l7VJ75MVgpo5sKagAdHjhgv7L
 NADTJ091SNV31DluSwqzJVL1ScSoTP8zFln70NlAqHYpo8qtD4ImcVo38YEAXTj6Qlle
 5d/sa+9LKQWiHQxkwBqWCFp99FFkOGU67iqIV5DxEsSJr3lC62wMHKjQqYM5forcKxvK
 HdY2FoXbfd9TXjQ2nbP8usMFFI1e9ECz4rTeRqPaMmbQ1mmqGd4HpLR8HNnd6LcoGpOz
 vHRuTS0FtE/sV0QFYZuzEhSrUsuFmA2wXNuOCLjKFA1CW9AOTb9NJhSKT9IMLuvCXYff
 qivQ==
X-Gm-Message-State: AOAM5319/IJ81iwAnOMI8FyqCsFQ0qyBJfrHwsnknNuk5pz5ihnxRdMv
 rkMmlkZbvPMX9hW6TspNelk+pffrSBfZTlKcMdk=
X-Google-Smtp-Source: ABdhPJyjYQkK30yF9LrqatH2JvSYsgA0twQ9CE2bho07UqZJyO2P/gsHsIc4qJ2ONo8j3aAo3LNmiq32b4vlcas9oDE=
X-Received: by 2002:a02:ac88:: with SMTP id x8mr1972396jan.264.1643294670931; 
 Thu, 27 Jan 2022 06:44:30 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
 <871r0tmosw.fsf@mpe.ellerman.id.au>
In-Reply-To: <871r0tmosw.fsf@mpe.ellerman.id.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Jan 2022 15:44:20 +0100
Message-ID: <CANiq72n3ReEAf6BNXL99Q9Ovg5kqpXDRSSDaWLd+mJKK7FxdCw@mail.gmail.com>
Subject: Re: ppc: hard lockup / hang in v5.17-rc1 under QEMU
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Thu, Jan 27, 2022 at 11:54 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> It looks like your kernel-ppc64le-release.config does not have the
> hardlockup detector enabled, so I suspect you're hitting the bug
> described in that patch.

On -release it was a hang; but please note that on -debug the hard
lockup was actually being detected (so it was also reproducible with
the detectors enabled).

> That fix will hit linux-next in the next day or so and should be in rc2.

I confirm the fix works for us -- thanks a lot!

Cheers,
Miguel

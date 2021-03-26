Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E216F34A36D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 09:52:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6G246Ql7z3c1k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 19:52:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lBrtXw4I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lBrtXw4I; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6G1f4zH5z300x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 19:52:06 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FDB461A4C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616748723;
 bh=XLC9yTktkkTCTcqmTymKbTkS7ocrX/l3RayX7yKfUVI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=lBrtXw4IguGaQxldR1tMbzgyY/459t+AJnsxWjtacrvonEyaiKgvg0a36MZmS2hRI
 pPf5E60q6ihnrDDdqCxaavQOxRcMs9G9AXp6kx/L7N9hchCEwzHzuEd4n2iccH13Yl
 o03yicOVpDb9sfGGim3AGr1J/9KkOaFlZkkDUihxhKqE9C+Yz2JGoeap1i2WziQtCh
 scfzUykjP7KNWmoudf3E5tpPOUhOORVuKzzVZ0CvWv3Thrp+yV5SLmYh8XYF01Y0wK
 Vqgrcir0b4fJskQNdi6J4j8du2SqYB8uUjt8vlaPWcCQVstBUo8J9PU1/psJzAbKZo
 bVJD99+44gCLg==
Received: by mail-oo1-f51.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so1141571oor.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 01:52:03 -0700 (PDT)
X-Gm-Message-State: AOAM533XeSzw3eFZlHvpApo+54xbydjHipZfyLa5oqHeLfmFS5hYpvHd
 lIth9IAYv7k/CYrTYVpQVgMDfQekef4S0NmMu10=
X-Google-Smtp-Source: ABdhPJxFmzDYtA3vz0j++H5JPrGDulcgfDeMX+fhEtN0QMlJKXJwWIk94mYoTguFCR3xO2L/Mr+haF9Bq5h9AnTcBrs=
X-Received: by 2002:a4a:e9a2:: with SMTP id t2mr10392411ood.15.1616748722322; 
 Fri, 26 Mar 2021 01:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131530.2619900-1-arnd@kernel.org>
 <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
In-Reply-To: <CADRPPNQJfJ=KmRGkX5Uo6VfWDsihrMUKV7OkQ7jtb3+Byb0RLQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Mar 2021 09:51:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2y4cmmRtpPvSvxaevDftsCUQDEJxjin0j77yOJqxv_YA@mail.gmail.com>
Message-ID: <CAK8P3a2y4cmmRtpPvSvxaevDftsCUQDEJxjin0j77yOJqxv_YA@mail.gmail.com>
Subject: Re: [PATCH] soc/fsl: qbman: fix conflicting alignment attributes
To: Li Yang <leoyang.li@nxp.com>
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
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>, SoC Team <soc@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Roy Pledge <roy.pledge@nxp.com>,
 YueHaibing <yuehaibing@huawei.com>, lkml <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 3:17 AM Li Yang <leoyang.li@nxp.com> wrote:
> On Tue, Mar 23, 2021 at 8:17 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When building with W=1, gcc points out that the __packed attribute
> > on struct qm_eqcr_entry conflicts with the 8-byte alignment
> > attribute on struct qm_fd inside it:
> >
> > drivers/soc/fsl/qbman/qman.c:189:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
> >
> > I assume that the alignment attribute is the correct one, and
> > that qm_eqcr_entry cannot actually be unaligned in memory,
> > so add the same alignment on the outer struct.
> >
> > Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/soc/fsl/qbman/qman.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> > index a1b9be1d105a..fde4edd83c14 100644
> > --- a/drivers/soc/fsl/qbman/qman.c
> > +++ b/drivers/soc/fsl/qbman/qman.c
> > @@ -186,7 +186,7 @@ struct qm_eqcr_entry {
> >         __be32 tag;
> >         struct qm_fd fd;
> >         u8 __reserved3[32];
> > -} __packed;
> > +} __packed __aligned(8);
>
> The EQCR structure is actually aligned on 64-byte from the manual.
> But probably 8 is enough to let the compiler not complain.

The important bit is that all members inside are at most 8-byte long
and naturally aligned, so the compiler can now optimize the accesses
because it can assume that each member can be updated atomically.

Marking a structure as unaligned with the __packed attribute can lead
to rather unoptimized code, which is particularly important when the
structure is mapped as uncached -- accessing it one byte at a time
means you have eight times the latency for a simple read. I think on
arm64, the compiler doesn't actually have to do that, but at least if you
run a 32-bit kernel, the packing would prevent the use of ldrd or ldm
instructions that need an aligned word.

       Arnd

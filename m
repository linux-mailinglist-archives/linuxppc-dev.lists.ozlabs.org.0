Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AEC530AFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 10:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L68tk1PZnz3bkh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 18:02:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JnIPcVOF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JnIPcVOF; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L68t572JLz301P
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 18:01:32 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id u3so20122870wrg.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IIprQJikdj2nLx7sbhpwV1cLCPZZu53ZPgrrVhrdMKE=;
 b=JnIPcVOF5mipeAp0Iu6ClW98U1hnbDD/A166EIkqM35Zm7QeMmkvVshiY/xEh9MsB8
 /65gwUmbpMWKRaa7iYsR9V7e+Yo0kqCVW97LfkveURy+ln7gpyRA7Xjh4v0+QA/+jC/2
 ec4lx311srd/nK3/4mj9MRWv/za6uaAZSdbpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIprQJikdj2nLx7sbhpwV1cLCPZZu53ZPgrrVhrdMKE=;
 b=kQfMXa2FPFxXDS1hY+3Dbh+zv3yTgcZl/PnAJXHP7ufdSj/3Qdap7w/2PeNBk9LcLO
 Re2PMAW1ewmu7VqmgFbZliJk9rihVjn4MDbch7IAru5oJ1bzN4O4X9Ag7NDLsqTqIQx8
 lRd4xh/BsqgXROWGRQYiBiAX6lEgmZcMCLBosGkq7TClOOnj/7F88dvRbxmfr+21+CI3
 mk6/smEq39JfoUCRp9pufB3nJd21u3ogpSLrHZ4WXoJXr5pXF5vOvJv8bF05sFrmXla5
 5I8HOWEpQn4+kmy7X62rjwsdLrSFzlHAgE2w/918abRmarO0jiKuawtOiptg0X3qfBHO
 dX5g==
X-Gm-Message-State: AOAM533rNKOb+rSzaxO9C+wXQHIvploPUTgV3DtLR7RsMyqjEnewVeex
 lx+XdQWcdtp+jTUGx6u2J6xQNNw8StZ16Y/kUDo=
X-Google-Smtp-Source: ABdhPJwBXdHh8carO8mjn/4YtSkt+6UU88hitirOFabyiY82Z4DK0Yv7eN3Yzu5eyOC8hjJCgFXxi6TJk8w4ccGmkjg=
X-Received: by 2002:a5d:595f:0:b0:20d:97d:4d14 with SMTP id
 e31-20020a5d595f000000b0020d097d4d14mr17503531wri.549.1653292885643; Mon, 23
 May 2022 01:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220519125706.593532-1-joel@jms.id.au>
 <1653005064.mw8ywmb8ft.astroid@bobo.none>
In-Reply-To: <1653005064.mw8ywmb8ft.astroid@bobo.none>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 May 2022 08:01:11 +0000
Message-ID: <CACPK8XdHBLuzouS1SLma10pVNzu2LT3mTMziqNfUMiP659KWXg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/microwatt: Add mmu bits to device tree
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 May 2022 at 00:06, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Joel Stanley's message of May 19, 2022 10:57 pm:
> > In commit 5402e239d09f ("powerpc/64s: Get LPID bit width from device
> > tree") the kernel tried to determine the pid and lpid bits from the
> > device tree. If they are not found, there is a fallback, but Microwatt
> > wasn't covered as has the unusual configuration of being both !HV and bare
> > metal.
> >
> > Set the values in the device tree to avoid having to add a special case.
> > The lpid value is the only one required, but add both for completeness.
> >
> > Fixes: 5402e239d09f ("powerpc/64s: Get LPID bit width from device tree")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> LGTM... does Microwatt actually need 12 lpid bits, or does it just need
> the LPID 0 partition table entry? I wonder if you set it to 1. That's
> a minor nit though.

0, 1, 4, 5, 6, 7 fails. 8, 9, 10, 11, 12 work.

I'll let someone else explain why that is!

Oh, it's because we use it like this:

arch/powerpc/include/asm/book3s/64/mmu.h:#define PATB_SIZE_SHIFT
 (mmu_lpid_bits + 4)

and then

arch/powerpc/mm/book3s64/radix_pgtable.c:
set_ptcr_when_no_uv(__pa(partition_tb) |
arch/powerpc/mm/book3s64/radix_pgtable.c:
     (PATB_SIZE_SHIFT - 12));

 so anything less than 8 will result in a negative value there.

The ISA says (from Figure 22 in 3.1, or 21 in 3.0B):

 Partition Table Size=2**(12+PATS), PATS<= 24.

From this it's clear that 12 >= mmu_lpid_bits >= 24.

(except there's only 4 bits for PATS in the ISA, so really the maximum is 16?)

What's not clear to me is why we define PATB_SIZE_SHIFT as mmu_lpid_bits + 4.

Cheers,

Joel

>
> Acked-by: Nicholas Piggin <npiggin@gmail.com>
>
> > ---
> >  arch/powerpc/boot/dts/microwatt.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
> > index 65b270a90f94..b69db1d275cd 100644
> > --- a/arch/powerpc/boot/dts/microwatt.dts
> > +++ b/arch/powerpc/boot/dts/microwatt.dts
> > @@ -90,6 +90,8 @@ PowerPC,Microwatt@0 {
> >                       64-bit;
> >                       d-cache-size = <0x1000>;
> >                       ibm,chip-id = <0>;
> > +                     ibm,mmu-lpid-bits = <12>;
> > +                     ibm,mmu-pid-bits = <20>;
> >               };
> >       };
> >
> > --
> > 2.35.1
> >
> >

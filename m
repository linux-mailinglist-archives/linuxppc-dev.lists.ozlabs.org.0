Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 946691890FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 23:04:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnK02C4HzDqtV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 09:04:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnFw03GJzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 09:02:10 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id y71so23540442oia.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 15:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ya5i9h9BDB0gF/4044yCkDpgVppUSZpZ2zck8bl6SA0=;
 b=AAjBxSsxghq66xS4/PVPs4P1JVgOTKizvr+uDz3R2BKYpctt6o1IpIyCe2ApWKs+AE
 gIlE6C5EsqbGGvK/Zq8TV9kddBbLyTxJ18GxrGzbrhHtB0A4lBsziVcmEaSAOfgvqY+g
 97evpMU4CJ8V7aE9X9dQKgSxWIh4i//Vw6QxCpXBBCHuq6O6yca33nxVJEKsHE8Lqnvr
 EitwxIO9/UwVrObttJa/BzDwgK71Q6bpeW3IZ045x951EIbDsz3/KkK4vOIAVJe2HeER
 tld0r9N08kD+nB36a4aN1jBSRjw+o64e9TUkvYxqD0ydD1Ezm7PfzV3beNHpssI9qdOE
 Ei3Q==
X-Gm-Message-State: ANhLgQ1C8Lj5lTsw8Zc5lCZipFtnriTRmiU7c16wHSkpKjb4ciRoDj5z
 UslJu5QOKlXVoQZmQGPdydEz2F2i
X-Google-Smtp-Source: ADFU+vubKKRR64yLTy51CbBbvq1DI7naivKEMBUVBkjzCdoD7GMxWagTapcJPlsNmR/WONGLfK27Kw==
X-Received: by 2002:a05:6808:3c5:: with SMTP id
 o5mr833421oie.159.1584482527632; 
 Tue, 17 Mar 2020 15:02:07 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48])
 by smtp.gmail.com with ESMTPSA id x8sm1468282oie.18.2020.03.17.15.02.07
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 15:02:07 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 111so23377179oth.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 15:02:07 -0700 (PDT)
X-Received: by 2002:a9d:7607:: with SMTP id k7mr1220783otl.205.1584482526826; 
 Tue, 17 Mar 2020 15:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200312222827.17409-1-leoyang.li@nxp.com>
 <20200312222827.17409-7-leoyang.li@nxp.com>
 <b9c5a514-18c1-e36c-1595-2b86c9bfcff1@rasmusvillemoes.dk>
In-Reply-To: <b9c5a514-18c1-e36c-1595-2b86c9bfcff1@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 17 Mar 2020 17:01:55 -0500
X-Gmail-Original-Message-ID: <CADRPPNT2vRNU6uddqhqUcmyNVOpFbEUz+F5giCSfm9q5ZdYH5A@mail.gmail.com>
Message-ID: <CADRPPNT2vRNU6uddqhqUcmyNVOpFbEUz+F5giCSfm9q5ZdYH5A@mail.gmail.com>
Subject: Re: [PATCH 6/6] soc: fsl: qe: fix sparse warnings for ucc_slow.c
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 16, 2020 at 4:08 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 12/03/2020 23.28, Li Yang wrote:
> > Fixes the following sparse warnings:
> >
> [snip]
> >
> > Also removed the unneccessary clearing for kzalloc'ed structure.
>
> Please don't mix that in the same patch, do it in a preparatory patch.
> That makes reviewing much easier.

Thanks for the review.

One of the few lines removed are actually causing sparse warning,
that's why I changed this together with the sparse fixes.  I can add
all the lines removed in the log for better record.

>
> >
> >       /* Get PRAM base */
> >       uccs->us_pram_offset =
> > @@ -231,24 +224,24 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
> >               /* clear bd buffer */
> >               qe_iowrite32be(0, &bd->buf);
> >               /* set bd status and length */
> > -             qe_iowrite32be(0, (u32 *)bd);
> > +             qe_iowrite32be(0, (u32 __iomem *)bd);
>
> It's cleaner to do two qe_iowrite16be to &bd->status and &bd->length,
> that avoids the casting altogether.

It probably is cleaner, but also slower for the bd manipulation that
can be in the hot path.  The QE code has been using this way to
access/update the bd status and length together for a long time.  And
I remembered that it could help to prevent synchronization issues for
accessing status and length separately.

It is probably cleaner to change the data structure to use union for
accessing status and length together.  But that will need a big change
to update all the current users of the structure which I don't have
the time to do right now.

>
> >               bd++;
> >       }
> >       /* for last BD set Wrap bit */
> >       qe_iowrite32be(0, &bd->buf);
> > -     qe_iowrite32be(cpu_to_be32(T_W), (u32 *)bd);
> > +     qe_iowrite32be(T_W, (u32 __iomem *)bd);
>
> Yeah, and this is why. Who can actually keep track of where that bit
> ends up being set with that casting going on. Please use
> qe_iowrite16be() with an appropriately modified constant to the
> appropriate field instead of these games.
>
> And if the hardware doesn't support 16 bit writes, the definition of
> struct qe_bd is wrong and should have a single __be32 status_length
> field, with appropriate accessors defined.

Same comment as above.

>
> >       /* Init Rx bds */
> >       bd = uccs->rx_bd = qe_muram_addr(uccs->rx_base_offset);
> >       for (i = 0; i < us_info->rx_bd_ring_len - 1; i++) {
> >               /* set bd status and length */
> > -             qe_iowrite32be(0, (u32 *)bd);
> > +             qe_iowrite32be(0, (u32 __iomem *)bd);
>
> Same.
>
> >               /* clear bd buffer */
> >               qe_iowrite32be(0, &bd->buf);
> >               bd++;
> >       }
> >       /* for last BD set Wrap bit */
> > -     qe_iowrite32be(cpu_to_be32(R_W), (u32 *)bd);
> > +     qe_iowrite32be(R_W, (u32 __iomem *)bd);
>
> Same.
>
> >       qe_iowrite32be(0, &bd->buf);
> >
> >       /* Set GUMR (For more details see the hardware spec.). */
> > @@ -273,8 +266,8 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
> >       qe_iowrite32be(gumr, &us_regs->gumr_h);
> >
> >       /* gumr_l */
> > -     gumr = us_info->tdcr | us_info->rdcr | us_info->tenc | us_info->renc |
> > -             us_info->diag | us_info->mode;
> > +     gumr = (u32)us_info->tdcr | (u32)us_info->rdcr | (u32)us_info->tenc |
> > +            (u32)us_info->renc | (u32)us_info->diag | (u32)us_info->mode;
>
> Are the tdcr, rdcr, tenc, renc fields actually set anywhere (the same
> for the diag and mode, but word-grepping for those give way too many
> false positives)? They seem to be a somewhat pointless split out of the
> bitfields of gumr_l, and not populated anywhere?. That's not directly
> related to this patch, of course, but getting rid of them first (if they
> are indeed completely unused) might make the sparse cleanup a little
> simpler.

I would agree with you that is not neccessary to create different enum
types for these bits in the same register in the first place.  But I
would like to prevent aggressive cleanups of this driver for old
hardware that is becoming harder and harder to be thoroughly tested
right now.  These fields are probably not used by the in tree ucc_uart
driver right now.  But as a generic library for QE, I think it is
harmless to keep these simple code there for potentially customized
version of the uart driver or other ucc slow drivers.

Regards,
Leo

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9889228FDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:41:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBPV20qsDzDqtS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:41:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YTjMKLPj; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPS05BrczDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:39:58 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id e64so1263349iof.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 22:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dye7u7YIC4RfoCt2uGY/m/EW7dDy2cn7/jqaE/CyBZE=;
 b=YTjMKLPjzrxb9Gbngq22sCAmh34PA2l6wYTGk7M4LDTxfBcQKqHm8n4cmPUbarHsEx
 dC7OeAPxGFeXUF2gbMjwlFmHhVhx+BiyR8Uwvca/sJAD/rIo0BhiUYs1Vi/4P4XreNM0
 po8LMFNrd9uSAKgLIl90L/TBWql9WLputZae0XxyjHtNND4EpSe1BjWCQ69r4sU6B/lx
 R5xQy9IWpDuNVFYLzaYLnx30QzIM/f4q8PrnDlenBdkdvIsmLCEqaCIr2RF23HoeKehv
 CL++Un6fAnkmjFh+9Gq4thrJNew2mX2THCp6MYUY0ZKWIgdHTcRsSSNRao11oTdhipEM
 oZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dye7u7YIC4RfoCt2uGY/m/EW7dDy2cn7/jqaE/CyBZE=;
 b=YNJmnEaJvrx4Ursn7CdifWe66vw2vNMp4ISYMDUOnUUlbUT/OY1iAu1uVUso/jfjMA
 ias+HzurMMiDYuH07QEhbBbuG8q+Gb4V1EM5DloAB7a2/+Lh2b8kfy9VZD518YQrO33G
 uQDKpF9qM9ZgUva6MdpGRnvT7FGat4APvlIXjjpLO4BUY4yGVHLzPeap4YULFKeyA38l
 pslVm+WlP/eGqE9/GJBwkjF6tXz2rVQyAswJs6Pvyd3BKfPZIIRRKTTX8hr6FbsS8So8
 LeFtj/OZn9jEBn+J/7048p8ZgoolFRjgGrf46VVQ46rNHf0GeYw3vcl8QseV4acAb76z
 6dXQ==
X-Gm-Message-State: AOAM530Mi/tGlQ2vKpiRpxkxNukMsSJzCefUY4UOHh/B7s8sbst8j3bX
 jlqh1PuYTJKqIhgmT+Bl7faujh7sgBZmPiMyUgB7no8e
X-Google-Smtp-Source: ABdhPJwu5bdXZhr0/lQiPzW1XFnuOVwHNq1Gb7gTEVKCx+pxjkAEtYa0fJcGwu7+B4rXB9M5AXPP1CWYVuyXdJouxgE=
X-Received: by 2002:a6b:c410:: with SMTP id y16mr31235296ioa.75.1595396395046; 
 Tue, 21 Jul 2020 22:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-16-oohall@gmail.com>
 <c89dfd04-afc2-4d69-00ab-2e743d5bb844@ozlabs.ru>
 <CAOSf1CHL9YoSohwMWm1YkLbLTqOn-WfBMKERZaPYb_5-UKmsuw@mail.gmail.com>
 <25d7fd88-668a-861e-a93c-3188caeac3cf@ozlabs.ru>
In-Reply-To: <25d7fd88-668a-861e-a93c-3188caeac3cf@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 22 Jul 2020 15:39:43 +1000
Message-ID: <CAOSf1CF1_Ga1KDhqLGxTgg+ugj6AfrzXbouZq1MiMa0faHZeeg@mail.gmail.com>
Subject: Re: [PATCH 15/15] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 6:00 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> >>>                *
> >>> -              * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
> >>> -              * with other devices, IOV BAR size is expanded to be
> >>> -              * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
> >>> -              * segment size , the expanded size would equal to half of the
> >>> -              * whole M64 space size, which will exhaust the M64 Space and
> >>> -              * limit the system flexibility.  This is a design decision to
> >>> -              * set the boundary to quarter of the M64 segment size.
> >>> +              * The 1/4 limit is arbitrary and can be tweaked.
> >>>                */
> >>> -             if (total_vf_bar_sz > gate) {
> >>> -                     mul = roundup_pow_of_two(total_vfs);
> >>> -                     dev_info(&pdev->dev,
> >>> -                             "VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
> >>> -                             total_vf_bar_sz, gate, mul);
> >>> -                     iov->m64_single_mode = true;
> >>> -                     break;
> >>> -             }
> >>> -     }
> >>> +             if (vf_bar_sz > (phb->ioda.m64_segsize >> 2)) {
> >>> +                     /*
> >>> +                      * On PHB3, the minimum size alignment of M64 BAR in
> >>> +                      * single mode is 32MB. If this VF BAR is smaller than
> >>> +                      * 32MB, but still too large for a segmented window
> >>> +                      * then we can't map it and need to disable SR-IOV for
> >>> +                      * this device.
> >>
> >>
> >> Why not use single PE mode for such BAR? Better than nothing.
> >
> > Suppose you could, but I figured VFs were mainly interesting since you
> > could give each VF to a separate guest. If there's multiple VFs under
> > the same single PE BAR then they'd have to be assigned to the same
>
> True. But with one PE per VF we can still have 15 (or 14?) isolated VFs
> which is not hundreds but better than 0.

We can only use single PE BARs if the per-VF size is >= 32MB due to
the alignment requirements on P8. If the per-VF size is smaller then
we're stuck with multiple VFs inside the same BAR which is bad due to
the PAPR requirements mentioned below. Sure we could look at doing
something else, but considering this matches the current behaviour
it's a bit hard to care...

> > guest in order to retain the freeze/unfreeze behaviour that PAPR
> > requires. I guess that's how it used to work, but it seems better just
> > to disable them rather than having VFs which sort of work.
>
> Well, realistically the segment size should be 8MB to make this matter
> (or the whole window 2GB) which does not seem to happen so it does not
> matter.

I'm not sure what you mean.

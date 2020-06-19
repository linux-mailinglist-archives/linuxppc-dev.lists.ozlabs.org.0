Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9E2001D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 08:11:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p7j82jxPzDrNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 16:11:08 +1000 (AEST)
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
 header.s=20161025 header.b=NgqVy5db; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p7gG455WzDrND
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 16:09:30 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id f23so4643020iof.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 23:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYxn2HuTRA3kCqcFXfYQRyqqNTAy3PwXnnRQDGWHA4U=;
 b=NgqVy5db7TBXpcCoWsiNcm81+r8wB7QoDkLtYA8FTiExi4WXjDYhZZiktk6PQx+XXi
 sNxsk+YR6+9p7fACijf3HzJYlxbgVbZzTjdaQrrhetJ/R4Msgq6290Oig1cg+jTZIq2f
 yl3EQph2BWnzfnIPbz9YFUN+YlB64zBSDACRy9ju9RnuM0+IE9NHqsVNFE0K645veJ5R
 gJajFl76B1M0FeuAE1cy/TjkYbJ0XHTuoi8R3H1e9ARnD+B5r4wLjsgRkphK1qVwu1E8
 uP2NRtbMUBkLewVc4iw5Hm4i14DQpXnVaB3wz9nF5jl8RwMI5eB/VBwciS2v6XBnbmiK
 jTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYxn2HuTRA3kCqcFXfYQRyqqNTAy3PwXnnRQDGWHA4U=;
 b=LFYxCEq2oHI5HqUandWcxJzO976l8ssKbKNjf/KVpZ+txdVZK93g5JIsRa1b0DYQXS
 tENCr8TWnBFYl0wSgmAlm1upu0zDHQambUEH7o18MsU7Pt1IknoRfEgeLJC0rSGJL6MN
 dT+vhBiLocJawT4WggTA/WCbM7A/Z06r/h7VBwoen5BA9m/2/I4WY/JWkaaFeCtS2O/w
 Ra3Tq9sMjNef8T7D9F9Ytj6c9+YbBtBNRvppIQVaCFXCUUfF4pqBti0vjoguOqYvG2TF
 QOSFDc0LtPkcR3h3md5oo04Roawt5kJJ8qrPFJ2Z+Y2zQAiJkTpSsqnHG/rHxG8i7Gs7
 fhmg==
X-Gm-Message-State: AOAM533s+YAJw2tAhEUDxqOo5HFXxjQDpqqTN6iYnNPSNY9QCYf0xaum
 sRvT1pMDX7Yq/i6h/MzbYNZX1PyTU/MS+Y2urTk=
X-Google-Smtp-Source: ABdhPJxY7eSgKH6dKZYnyajlEKqNF9Z9p1uErbaLgioSZZ78WjmRrjQY8zG6KEncBf0O3XFyxmsKLcD7ZiP7npCW3ok=
X-Received: by 2002:a6b:780d:: with SMTP id j13mr2723403iom.66.1592546966717; 
 Thu, 18 Jun 2020 23:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
 <87r1ufdy1x.fsf@mpe.ellerman.id.au>
 <CAOSf1CHT9A55+ZAKquikHy9Siy_k5E0ucB-qY2G7hjfVSmf7pg@mail.gmail.com>
 <87ftaudx1x.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ftaudx1x.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 19 Jun 2020 16:09:15 +1000
Message-ID: <CAOSf1CEusxHAvXOUJ=R8MV8z0rt8Hh0Ag33QmSDopH1FQrxEGg@mail.gmail.com>
Subject: Re: powerpc/pci: [PATCH 1/1 V3] PCIE PHB reset
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 4:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> "Oliver O'Halloran" <oohall@gmail.com> writes:
> > On Tue, Jun 16, 2020 at 9:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> wenxiong@linux.vnet.ibm.com writes:
> >> > From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> >> >
> >> > Several device drivers hit EEH(Extended Error handling) when triggering
> >> > kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> >> > in pci general code when triggering kdump.
> >>
> >> Actually it's in pseries specific PCI code, and the reset is done in the
> >> 2nd kernel as it boots, not when triggering the kdump.
> >>
> >> You're doing it as a:
> >>
> >>   machine_postcore_initcall(pseries, pseries_phb_reset);
> >>
> >> But we do the EEH initialisation in:
> >>
> >>   core_initcall_sync(eeh_init);
> >>
> >> Which happens first.
> >>
> >> So it seems to me that this should be called from pseries_eeh_init().
> >
> > This happens to use some of the same RTAS calls as EEH, but it's
> > entirely orthogonal to it.
>
> I don't agree. I mean it's literally calling EEH_RESET_FUNDAMENTAL etc.
> Those RTAS calls are all documented in the EEH section of PAPR.
>
> I guess you're saying it's orthogonal to the kernel handling an EEH and
> doing the recovery process etc, which I can kind of see.
>
> > Wedging the two together doesn't make any real sense IMO since this
> > should be usable even with !CONFIG_EEH.
>
> You can't turn CONFIG_EEH off for pseries or powernv.

Not yet :)

> And if you could this patch wouldn't compile because it uses EEH
> constants that are behind #ifdef CONFIG_EEH.

That's fixable.

> If you could turn CONFIG_EEH off it would presumably be because you were
> on a platform that didn't support EEH, in which case you wouldn't need
> this code.

I think there's an argument to be made for disabling EEH in some
situations. A lot of drivers do a pretty poor job of recovering in the
first place so it's conceivable that someone might want to disable it
in say, a kdump kernel. That said, the real reason is mostly for the
sake of code organisation. EEH is an optional platform feature but you
wouldn't know it looking at the implementation and I'd like to stop it
bleeding into odd places. Making it buildable without !CONFIG_EEH
would probably help.

> So IMO this is EEH code, and should be with the other EEH code and
> should be behind CONFIG_EEH.

*shrug*

I wanted it to follow the model of the powernv implementation of the
same feature which is done immediately after initialising the
pci_controller and independent of all of the EEH setup. Although,
looking at it again I see it calls pnv_eeh_phb_reset() which is in
eeh_powernv.c so I guess that's pretty similar to what you're
suggesting.

> That sounds like a good cleanup. I'm not concerned about conflicts
> within arch/powerpc, I can fix them up.
>
> >> > +             list_for_each_entry(phb, &hose_list, list_node) {
> >> > +                     config_addr = pseries_get_pdn_addr(phb);
> >> > +                     if (config_addr == -1)
> >> > +                             continue;
> >> > +
> >> > +                     ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> >> > +                             config_addr, BUID_HI(phb->buid),
> >> > +                             BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
> >> > +
> >> > +                     /* If fundamental-reset not supported, try hot-reset */
> >> > +                     if (ret == -8)
> >>
> >> Where does -8 come from?
> >
> > There's a comment right there.
>
> Yeah I guess. I was expecting it would map to some RTAS_ERROR_FOO value,
> but it's just literally -8 in PAPR.

Yeah, as far as I can tell the meaning of the return codes are
specific to each RTAS call, it's a bit bad.

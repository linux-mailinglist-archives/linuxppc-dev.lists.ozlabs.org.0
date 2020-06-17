Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E81FC2F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 02:47:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mmcY20C6zDqGt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 10:47:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q/PudYTa; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mmZg0P4QzDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 10:45:46 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id u13so708812iol.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=43zs2nBC83Bu8iPfDbnsYchsjR/CGj5fgS7p+JZx09E=;
 b=q/PudYTaJJvPcTfErnH3UpOelKZOuwxJ2dDzqO5LWq4gVdW9btAnxFPZGnZZPIi1kG
 IjO444Xmx9G33XV/4KnzbLIlLlOjLUIeKEwx61kBqJCgHqY0yFgdM6sTvfkHWD0+iBe0
 yRCxA545ovppQ0Gs38BlhMJa4CNweycXYYiV78F7O7ObYHaRqZjTyUx/JjNlnD0ay+xN
 V0Tk9NH3YpccxHqWI/XhZFxwPool75Gg4pg3np5lhHFJHE5xq5kuwXWjep/NAoPMvtkA
 hVfDjblfNRLf+yPK/y435ia3BjTeYG/souQtxdKxoKQQlMKDjXWVW5gMzhKwsfjeLmYg
 hRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43zs2nBC83Bu8iPfDbnsYchsjR/CGj5fgS7p+JZx09E=;
 b=OYATx5LF/KjFW1p6DUpJncGx7vqbhrtgT3Sxq63uBmVDXXKcyNs7mZM8/uke3Deuqf
 TH/69YjtK8vlshV8kfR6mjmOIo5SzSyXcKQVBltXrO9NInwF74KFXc+c8i8yVd9cR+RN
 2dNOg24Mj/lI2Lw/U49MYTLexT2mUIpf56HOOx6/XE5EfnIkP3n7s10cUtdw1SslykoX
 0zF9wGoODsCBPx0LoZYpMaunDwbuBa3srwPdX1gVt0cWCoXE57m40nA4CC+aGe/LHA+m
 peYRgqghpCVITtjIRkRp28xT2f2eZyzyNLP6x2PB5i4pe+owoV6F76s9hkaZXWY9ZAVs
 yPSA==
X-Gm-Message-State: AOAM533CgrsoiUOLF/7ZBYQnLSNFyOBROkCds0EKs9joAbnpPP/2mxFO
 rzBWFzzLtO7Jxujq0/6jULReXQWoD4YYs1oAR+U=
X-Google-Smtp-Source: ABdhPJw5jmPugCvnOz7ztCinkstSzMH9K65yoDBRnah7X2/qo5x4TJ571uey+koIYtRBWouCI3HPS0BbauJg+uo6fHU=
X-Received: by 2002:a05:6602:1647:: with SMTP id
 y7mr5511613iow.75.1592354743391; 
 Tue, 16 Jun 2020 17:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
 <87r1ufdy1x.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r1ufdy1x.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 17 Jun 2020 10:45:32 +1000
Message-ID: <CAOSf1CHT9A55+ZAKquikHy9Siy_k5E0ucB-qY2G7hjfVSmf7pg@mail.gmail.com>
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

On Tue, Jun 16, 2020 at 9:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> wenxiong@linux.vnet.ibm.com writes:
> > From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> >
> > Several device drivers hit EEH(Extended Error handling) when triggering
> > kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> > in pci general code when triggering kdump.
>
> Actually it's in pseries specific PCI code, and the reset is done in the
> 2nd kernel as it boots, not when triggering the kdump.
>
> You're doing it as a:
>
>   machine_postcore_initcall(pseries, pseries_phb_reset);
>
> But we do the EEH initialisation in:
>
>   core_initcall_sync(eeh_init);
>
> Which happens first.
>
> So it seems to me that this should be called from pseries_eeh_init().

This happens to use some of the same RTAS calls as EEH, but it's
entirely orthogonal to it. Wedging the two together doesn't make any
real sense IMO since this should be usable even with !CONFIG_EEH.

> That would isolate the code in the right place, and allow you to use the
> existing ibm_get_config_addr_info.
>
> You probably can't use pseries_eeh_get_pe_addr(), because you won't have
> a "pe" structure yet.
>
> Instead you should add a helper that does the core of that logic but
> accepts config_addr/buid as parameters, and then have your code and
> pseries_eeh_get_pe_addr() call that.

I have a patch in my next pile of eeh reworks which kills off
pseries_eeh_get_pe_addr() entirely. It's used to implement
eeh_ops->get_pe_addr for pseries, but the only caller of
->get_pe_addr() is in pseries EEH code and the powernv version is a
stub so I was going to drop it from EEH ops and fold it into the
caller. We could do that in this patch, but it's just going to create
a merge conflict for you to deal with. Up to you.

> *snip*
> > +             list_for_each_entry(phb, &hose_list, list_node) {
> > +                     config_addr = pseries_get_pdn_addr(phb);
> > +                     if (config_addr == -1)
> > +                             continue;
> > +
> > +                     ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> > +                             config_addr, BUID_HI(phb->buid),
> > +                             BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
> > +
> > +                     /* If fundamental-reset not supported, try hot-reset */
> > +                     if (ret == -8)
>
> Where does -8 come from?

There's a comment right there.

It could be better explained I suppose, but you need to read
PAPR/LoPAPR to make sense of anything RTAS so what's it really buying
you?

> Oh I see, it's copied from pseries_eeh_reset().
> > +                             ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> > +                                     config_addr, BUID_HI(phb->buid),
> > +                                     BUID_LO(phb->buid), EEH_RESET_HOT);
> > +
> > +                     if (ret) {
> > +                             pr_err("%s: PHB#%x-PE# failed with rtas_call activate reset=%d\n",
>                                                       ^
>                                                       again missing PE number.
>
> > +                                     __func__, phb->global_number, ret);
> > +                             continue;
> > +                     }
> > +             }
> > +             msleep(EEH_PE_RST_SETTLE_TIME);
>
> So that loop is basically a copy of pseries_eeh_reset() but with the
> sleep hoisted out of the loop.
>
> I'd really prefer to see that refactored into a helper that takes the
> config_addr and buid and doesn't do the sleep.
>
> Then this loop could call that helper, and so could pseries_eeh_reset().

That's better so long as we're not requiring CONFIG_EEH being
selected. pseries_eeh_reset() uses the rtas token variables
initialised in pseries_eeh_init() which are static to the file so
they'd need to be initialised somewhere common.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40129473952
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCdxs1Hcsz3c75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 11:08:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GnrjInCg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=rajatja@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=GnrjInCg; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCXPl03Tlz2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 06:58:32 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id d11so6842544pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmtlwaoKecb3OjlTS1+QUQgYom0U7BYI17ypi8x6kXI=;
 b=GnrjInCguT1hYvRxEFp2FFlcWJk+X6scQ0TguTZJYVs5btZvLe4+YCVtdB1wZBA4ql
 lPf7oCvJEdd0G+oUe5yfcRXur4cxWEXfxcjyEJoITH2W9As4AMyaF/6oqsEcsNBAgWD/
 UBIucA6BcyhNjSnCqT/ISHXWrlgFdN+ILDONTu1HlNwv1vdXyPxGBU9vO+59APihDv/L
 /nwhYbGPq5FxpkV4Q212xLuEDTP4CAF4U5LzT8KXzoBVVzuau0xfXfTisMvTpfIsPlgw
 +17xll8EDuD0UqXiCAsNXUxf++d7lYacez0U09SFm2L5hSCMz5JIZS3+Y+DKV/2HHGL6
 Pi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmtlwaoKecb3OjlTS1+QUQgYom0U7BYI17ypi8x6kXI=;
 b=l+tO5cN/HoUCFfOEwQifaBVaZRT/UfyfNdFvCeouivzARkyS+2XmzcaU7gBb7ldMMZ
 mLYcyRHtmq7NfiNJUMisLiI08TizxstOgBbfa2qKr95tpLaPgMmBXRy07Kbc1NaEA9el
 m6rljZ55tAwQYa7JST5G9bAjO3HPYSinGKb6Wm9zAWvpb3VN8W7qsSNCZgCx1e+njV6O
 uni/SWheC6fz4pelNPToGwx2ySvE89ZoLzPpbPOM1VY7cY5sGoYQoLWFyA1no7Nafphg
 zBJxNWdBXqWuKTTUDRNMYLqZzLFgT+DlF4iL6756hlP6tUFTnyyOX+qSOWV3EW6LcWtn
 7CCg==
X-Gm-Message-State: AOAM530dDYH83dUJ2oQFwxq3ebiVKUDNRUO8weYiSBu2a+jC7hlU6Xhz
 rxDBMOBz3gSZRcsRxAykv1W7CDTDfcu0ctaSPzPhSg==
X-Google-Smtp-Source: ABdhPJyxdpF8yw1Mfppja7TttKdq2KytY/u0mapNh2UceVCKIokfMXDLBzkp5pk5YhzPAhPmfct2uhkiNfnabLvww9s=
X-Received: by 2002:a63:ef44:: with SMTP id c4mr564190pgk.146.1639425509218;
 Mon, 13 Dec 2021 11:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20211209094556.2085357-1-jiasheng@iscas.ac.cn>
 <20211211175450.GA398271@bhelgaas>
In-Reply-To: <20211211175450.GA398271@bhelgaas>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 13 Dec 2021 11:57:52 -0800
Message-ID: <CACK8Z6EntHP0TWfq=JdQ7QS8vCgXoRUJOWqbGYLvD6R2Mq0paw@mail.gmail.com>
Subject: Re: [PATCH] PCI/AER: potential dereference of null pointer
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Dec 2021 11:07:43 +1100
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
Cc: linux-pci@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello

On Sat, Dec 11, 2021 at 9:54 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Rajat, author of aer_stats:
> db89ccbe52c7 ("PCI/AER: Define aer_stats structure for AER capable devices"
> 81aa5206f9a7 ("PCI/AER: Add sysfs attributes to provide AER stats and breakdown"]
>
> On Thu, Dec 09, 2021 at 05:45:56PM +0800, Jiasheng Jiang wrote:
> > he return value of kzalloc() needs to be checked.
> > To avoid use of null pointer in case of the failure of alloc.
> >
> > Fixes: db89ccbe52c7 ("PCI/AER: Define aer_stats structure for AER capable devices")
> > Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > ---
> >  drivers/pci/pcie/aer.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index ec943cee5ecc..d04303edf468 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -376,6 +376,8 @@ void pci_aer_init(struct pci_dev *dev)
> >               return;
> >
> >       dev->aer_stats = kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
> > +     if (!dev->aer_stats)
> > +             return;
>
> Did you actually trip over a null pointer dereference, and if so,
> where was it?
>
> I think the intent here was that aer_stats is a non-essential feature,
> and if we can't allocate space to keep the statistics, we can still
> use the device without the stats.

Ack. Yes, this was my intention.

Practically speaking though, if a system cannot allocate space for
aer_stats (608 bytes), I would think it is under an extreme memory
pressure so not really sure if will be able to really do anything with
the PCI device (probe the driver which may want to allocate more
memory etc). But that isn't anything that we can help with.

The current patch AFAICS looks like a no-op to me.

Thanks,

Rajat

>
> I *think* all the users of dev->aer_stats check for NULL before
> dereferencing it, but if you found a case that doesn't do that, we
> should definitely fix it.
>
> In a few cases (aer_stats_dev_attr, aer_stats_rootport_attr), the
> check isn't obvious -- it happens in aer_stats_attrs_are_visible().
> If aer_stats_attrs_are_visible() finds that aer_stats is NULL, those
> sysfs attributes should not be visible, and the corresponding *_show()
> functions should never be called.
>
> >       /*
> >        * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
> > --
> > 2.25.1
> >

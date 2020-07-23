Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313322A53E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 04:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBx9F2MzJzDr7H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 12:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ph/gQ5eI; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBx7X5PNVzDr5T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 12:27:34 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id v6so4736437iob.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 19:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvzKY/ySgCqsDTQensyurV9/DP10ToSkJYjUs5j0myg=;
 b=Ph/gQ5eInF6amiLsQmfAyWzP2ChLpVCdx4fhnvwwW3Qxz63QyhFig3TOQKvYDdwNJl
 dAVjeMCgFrxQKxT67TxmVSsuYSkOkHRR8Ds1kO9w3SRPLH4hLpXFTM9pE3AuuLXXUkKC
 bo4Msgb1EknD93OT1AIZDaboPZZGbrLqEWaEs5wJGKFrpwoyD6DCH5dpuha7tfxSDG4z
 lhbNzW9bDvVT+c8WB84hBrL7Y4ZutExj5TRGf/WzQwltOcrd1B7L0Cd43GOagA9Zxawu
 rq3efox8oMPoQZ7JtBuJwUnBXqMUljTTLYvAhkck/IeY77OnXDqH8RcH1+f4K6ot+DzE
 ju9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvzKY/ySgCqsDTQensyurV9/DP10ToSkJYjUs5j0myg=;
 b=gDLnd0hAN801CPAsvq9uIaoZ3vB//c4XfZ6X60gNt9mNjJj49QB/j5YqaER1uweAKv
 gdx9JK8LWdCylh4PTyPTZtAO4f6cyP9U9BFkNrzJyXZkGUY2gdVezu3k1jeDW55XH/Yo
 Muhnq/zZpMeYytl0Fb68rExyB0gekhcVWJcPsTVTghQPqXhnlpXmMiVczhGcfPN7kyLG
 Y9dCvlI6mt4RNNJnRc3ibWpFIV+wYJvkV4rajWoO1pxqtBHRN3KeV9sWKCIg3TMgn5A3
 0UHNHufTWcaYgrNM/53a/tvsl5evF8IOjIBncl8VAcVYe6BzBEl+RzG7gks7virQUZSx
 ty7g==
X-Gm-Message-State: AOAM533XywGikmm+96QVJ2zCgXlCzN/g/yGq99HK1jnbD+08UVnrbKWw
 4Id9e5bBfvKFoe6IiQc84COO6O4QT11r+f/GaQ==
X-Google-Smtp-Source: ABdhPJxP70UTDfmFJzT3r8yxYjSb71wBCZPcUlfZkZ0JMKBv9W9ZdKjgzXSAuIt0UTfCVr0S/UIMYHM4hKpZz5fseWY=
X-Received: by 2002:a05:6602:2f89:: with SMTP id
 u9mr2772338iow.126.1595471251227; 
 Wed, 22 Jul 2020 19:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
 <1595382730-10565-2-git-send-email-kernelfans@gmail.com>
 <87pn8oqh86.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pn8oqh86.fsf@mpe.ellerman.id.au>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Thu, 23 Jul 2020 10:27:20 +0800
Message-ID: <CAFgQCTsgX9XWJ476dxT2csTuuhpaO3KSZN-EewZiZ0mBj3N4aQ@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 12:57 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Pingfan Liu <kernelfans@gmail.com> writes:
> > A bug is observed on pseries by taking the following steps on rhel:
>                                                                 ^
>                                                                 RHEL
>
> I assume it happens on mainline too?
Yes, it does.
>
[...]
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > index 1a3ac3b..def8cb3f 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -372,6 +372,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> >       invalidate_lmb_associativity_index(lmb);
> >       lmb_clear_nid(lmb);
> >       lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> > +     drmem_update_dt();
>
> No error checking?
Hmm, here should be a more careful design. Please see the comment at the end.
>
> >       __remove_memory(nid, base_addr, block_sz);
> >
> > @@ -607,6 +608,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> >
> >       lmb_set_nid(lmb);
> >       lmb->flags |= DRCONF_MEM_ASSIGNED;
> > +     drmem_update_dt();
>
> And here ..
> >
> >       block_sz = memory_block_size_bytes();
> >
> > @@ -625,6 +627,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> >               invalidate_lmb_associativity_index(lmb);
> >               lmb_clear_nid(lmb);
> >               lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> > +             drmem_update_dt();
>
>
> And here ..
>
> >               __remove_memory(nid, base_addr, block_sz);
> >       }
> > @@ -877,9 +880,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
> >               break;
> >       }
> >
> > -     if (!rc)
> > -             rc = drmem_update_dt();
> > -
> >       unlock_device_hotplug();
> >       return rc;
>
> Whereas previously we did check it.

drmem_update_dt() fails iff allocating memory fail. And in the failed
case, even the original code does not roll back the effect of
__add_memory()/__remove_memory().

And I plan to do the following in V4: if drmem_update_dt() fails in
dlpar_add_lmb(), then bails out immediately.

Thanks,
Pingfan

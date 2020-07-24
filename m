Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A333022BD57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 07:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCcgN5gdTzDrMC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:09:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Flz38AdY; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCccb3LDWzDrPS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 15:06:38 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id b18so1064319ilo.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 22:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g7uEBWjqmRN4pnEc3eceKiHpgKbYI+xwpSrK1t8xmOQ=;
 b=Flz38AdYi4y8FK4DkKaZwO1ebDUYKvqWr586OUPgRmOeBJXdQT1mcMo3iL96wFvYfq
 Rp152OR5KA0AK0dNzvMpPakgTy/5GcSpgtiELOWkNOwe1Zgn8JsFkKPifJnM1mS3n7R/
 d+/2Hp2XzmVFqUo6Kb2A8elGrDPdP1TLCfukV6Aj4KxfHpzlRqoxdCrmtTbBpTT0m5BA
 /YNUsfYDuoxcbP+s+UdEGbfnvUNI5hucxPJU7SWsRm4oeGKVNTqMj7Xh6bDWHNdFIxkC
 khMkXK1qPJapqbd3bDILQRXV8VgnFbRDD/EXFoifwEJCIWTL9PNzUFWduA11iRdyR68L
 UKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g7uEBWjqmRN4pnEc3eceKiHpgKbYI+xwpSrK1t8xmOQ=;
 b=mwKAaOlXjFO18bEiFAm4vcYD37qzC3tVFXQUHdVguH7mg7EAEOxVWaS7QVcdUvfdal
 Ltu3TG8HGLT1tGpfEkzsjEmvJM8+aalPO/mPXCxYE5z+Noc9jyDam2LrFdPaftJozc5H
 oSybxqpv7unk7D8WM6R+myr5Hx+8H1sM4okb853o0LAiFF9JnzU9NNKHGntEzxCjfwM9
 QsmvcM6uL2Bh8+wnr0jEjcZGAnoW+AGwELxvNthJGuB7EQUu6NnYU/X7xpscWLlSd7JF
 ubkxez2fwH8bdXf401Ji8CiFWM3gXfEueCeyUHI2LOqTNUiQEyTznY2VEV9TH+H0UCXK
 jrvQ==
X-Gm-Message-State: AOAM533WUqS3PA6Mrnz1/B/hKkqJE+drLwHc8ngfjcSfIGp6iMzOUsiV
 Ai+4A3EVnzmhDrUV2SsRFDlv+HhGjOKDWxECSYTCOYVM
X-Google-Smtp-Source: ABdhPJyIBA7lUCehd36IiIvyr+QKfBxYb5HC/MD+h9JdA+vjb+d3tRSlMCP0B3Alz/15j9vHpIb4iwKQWW5gt9CtPZI=
X-Received: by 2002:a92:9a97:: with SMTP id c23mr8619847ill.258.1595567196814; 
 Thu, 23 Jul 2020 22:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200722042628.1425880-1-oohall@gmail.com>
 <20200722042628.1425880-14-oohall@gmail.com>
 <983435c2-0e6b-ded7-d28d-e6728c0a001e@ozlabs.ru>
In-Reply-To: <983435c2-0e6b-ded7-d28d-e6728c0a001e@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 24 Jul 2020 15:06:25 +1000
Message-ID: <CAOSf1CEkrqZhR1n8CXEbdNTfFLx7LiG1E62Ty1T2sFz-waWA7Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] powerpc/eeh: Move PE tree setup into the platform
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 3:01 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 22/07/2020 14:26, Oliver O'Halloran wrote:
> > The EEH core has a concept of a "PE tree" to support PowerNV. The PE tree
> > follows the PCI bus structures because a reset asserted on an upstream
> > bridge will be propagated to the downstream bridges. On pseries there's a
> > 1-1 correspondence between what the guest sees are a PHB and a PE so the
> > "tree" is really just a single node.
> >
> > Current the EEH core is reponsible for setting up this PE tree which it
> > does by traversing the pci_dn tree. The structure of the pci_dn tree
> > matches the bus tree on PowerNV which leads to the PE tree being "correct"
> > this setup method doesn't make a whole lot of sense and it's actively
> > confusing for the pseries case where it doesn't really do anything.
> >
> > We want to remove the dependence on pci_dn anyway so this patch move
> > choosing where to insert a new PE into the platform code rather than
> > being part of the generic EEH code. For PowerNV this simplifies the
> > tree building logic and removes the use of pci_dn. For pseries we
> > keep the existing logic. I'm not really convinced it does anything
> > due to the 1-1 PE-to-PHB correspondence so every device under that
> > PHB should be in the same PE, but I'd rather not remove it entirely
> > until we've had a chance to look at it more deeply.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> > v2: Reworked pseries PE setup slightly. NOT DONE YET. mostly done needs test
>
> So far it was looking good and now this :)
>
> When is it going to be done? Is this the broken stuff you mentioned
> elsewhere?

I am a dumb.

I put those in there to remind myself what I have / haven't done when
respinning a series. I added that before I tested it and forgot to
remove the comment.

>
>
> --
> Alexey

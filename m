Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC9155163
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 04:57:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DM2d2GvwzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 14:57:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fKCxejqK; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DM1716HnzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 14:56:26 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id f10so537470ils.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 19:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KkzsNJV+aY0g/K99TGSPn/rUfA0jwLEbrpPdI3caRWA=;
 b=fKCxejqKnB0Fhrdbvhdp+Vvh5beWV2AD8QofBmHqQVZBCO46ttxmuXuhdD9ariDZDA
 T+80DcTnbT7eT+5NonmhzMt4OF9rG2eVkCJ1vqL+uImM00m7cHr8SwZKK15nQQXOAO9+
 7Y6OntSmQfyQZ67Cne9beMKI1OwwD5gxiZRCQb3NLpoWjlEq0Vg7puvhWUodvmZeZkPS
 /4/8Ryi3mWb3TV6QY98E31gehG4dHmdBUCr6RaJsiMbpH6RMhIWE4nFcAf2aIdbHkP7F
 5SYLC0CE0eaBHNyh73gru63KkpOKN4RLaqBGErVjukVJZa3SPVmYF78a6RL4ATEPjNGz
 UPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KkzsNJV+aY0g/K99TGSPn/rUfA0jwLEbrpPdI3caRWA=;
 b=nrB00bWvNM0p/QEXgWDKhf24+4SWdQtDAeuudaNTYqzSwDipOap48viNguRq5jJT0R
 5xmBHmuqm06wBZ2y3Jnp4WkPPEUHV2zvYjixk3PaFx6noHHEuvnmNdPdgFyrDWMsNzRw
 Gt4PSJK6aY+lZh+QHICxwc4DYDcTqAxgYtVZWcW9PiveBxeYY+bvhdJjp51p1YzdBmIu
 XglQJkisyYf1PC8rG1swqZmK5ERENReR3TZT40Z+P5B0yQDEPJa9bI6CuD3/tiB8Kj73
 4vHhVAVUb4OmlgfUCYr5tgrOImP3q2G48ipo6t4NcQU3A6U5HPZp8OQCLa8xg+re8ilz
 BKQw==
X-Gm-Message-State: APjAAAWSffWxJ0silttMQE/5tWDhQGRth+nd6UwFtRj2+FoFXA7VW03I
 Fspz2r+/YWeZ3aVUNIpWejiA7hy37lRb2xL80XSbuw==
X-Google-Smtp-Source: APXvYqwkGYsQQCuTeeLq963UCrVFLpJoTYwkCwuSuKEu1dH8KKXhs/FayQZsCoFmN1qHj5uSZyV+OWo9XUJY5Azyebk=
X-Received: by 2002:a92:910b:: with SMTP id t11mr7420305ild.195.1581047784416; 
 Thu, 06 Feb 2020 19:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-6-oohall@gmail.com>
 <20200207022412.GA21238@osmium>
 <CAOSf1CEBuv-5GLbOX6Kaux1zA2uNVheXRtDfjVkbx+wcKtZHng@mail.gmail.com>
In-Reply-To: <CAOSf1CEBuv-5GLbOX6Kaux1zA2uNVheXRtDfjVkbx+wcKtZHng@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 7 Feb 2020 14:56:13 +1100
Message-ID: <CAOSf1CEjdt_RVH4YvDscCR_kjS9-Gv0MvwJkY+QaCoYYb1+RrQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] powerpc/eeh: Make early EEH init pseries specific
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 7, 2020 at 2:35 PM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> On Fri, Feb 7, 2020 at 1:24 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> >
> > On Mon, Feb 03, 2020 at 07:35:20PM +1100, Oliver O'Halloran wrote:
> > > The eeh_ops->probe() function is called from two different contexts:
> > >
> > > 1. On pseries, where set set EEH_PROBE_MODE_DEVTREE, it's called in
> > "set set" -> "we set"
> > >    eeh_add_device_early() which is supposed to run before we create
> > >    a pci_dev.
> > >
> > > 2. On PowerNV, where we set EEH_PROBE_MODE_DEV, it's called in
> > >    eeh_device_add_late() which is supposed to run *after* the
> > >    pci_dev is created.
> > >
> > > The "early" probe is required because PAPR requires that we perform an RTAS
> > > call to enable EEH support on a device before we start interacting with it
> > > via config space or MMIO. This requirement doesn't exist on PowerNV and
> > > shoehorning two completely separate initialisation paths into a common
> > > interface just results in a convoluted code everywhere.
> > >
> > > Additionally the early probe requires the probe function to take an pci_dn
> > > rather than a pci_dev argument. We'd like to make pci_dn a pseries specific
> > > data structure since there's no real requirement for them on PowerNV. To
> > > help both goals move the early probe into the pseries containment zone
> > > so the platform depedence is more explicit.
> > >
> > I had a look around near your comment:
> > > +                     // XXX: uh, do we have the rescan lock held here?
> > And we definitely don't have the lock when it gets called via the module
> > init path (as rpaphp is loaded) -- I tried it and there was no deadlock.
> > I don't think we have the lock in other situations but I haven't
> > unravelled it all enough yet to tell, either.
>
> The other hotplug drivers seem to be taking the lock manually in their
> enable_slot() callback. So I guess we need to be doing it there too.
> I'll fix it in another patch since this one is a bit big.

On closer inspection I think we'll need to have a deeper look at this.
This function isn't used for operations on the hotplug slot. Instead
it's used for DLPAR operations including adding / removing whole PHBs.
There doesn't appear to be any code in the DLPAR add / remove paths
which takes the PCI rescan / remove lock so I think we'll need to have
a careful look at what's going on there. Great stuff...

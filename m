Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FA2B4852
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 09:32:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XZZX60jtzF4DM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r9ZCUHr7"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XZXD5pDmzF485
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 17:30:33 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id h144so5199896iof.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o9mDrR6NVyTxU2wGnDfpnoURFDe/e4NIzqR2/MNM9Is=;
 b=r9ZCUHr7nG/DC+13dX9Ytc2LPNdfkwNd/4SYlQwt34mPek940+LJpyXcEmI6oK3+vd
 XTgYK636+Qu5xNpfG9s/EAdUiVymeguV5Gf0JdxnHgF7ZHiV2KnJqw3eDWIJSkduWmwk
 /MIEVpmVOb6snKVQjac/+G0fAt9SvtIeQFYT+sXZQxmkHC8SLVOVt9rEPTRDoGNiAYKb
 YBusYnYH3TprU9aF1hDMhrJ3zhscXfv6RHkGBtzRYTKUQm3t36uDS1GoXPqAolej/QR/
 AjL+vVuWmmJ0fvT7j1ywuB+49H8eT2tAmMHqY3z8utTuWCICtIEKmJzUU5bjroGEGkWg
 yKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9mDrR6NVyTxU2wGnDfpnoURFDe/e4NIzqR2/MNM9Is=;
 b=DR3USFHh/PVT9HV99Enc3Ie99F2uNGa+1aVFzoCgDflvrHmwhSQtXKSluTA32RUICS
 prRJ9zIugPnEQ6dkK2D6+WX//to4oS/m3vel4pBgU4aXHjKdaFqYx4nc5YCwS+Na2gib
 Kt4IXVcTdRhnsl6xGGrQSlJhCziJEC8hHoYoaWJILinLVJyWm2XF8iUFgPVnETBNsqg1
 gHlTymeT5V9O6YexKmBT4fg1RzHbz/NUcroKGNnrnZoQawrqx6RYyl7vN5Neyi/HMz/A
 wcU9pJ/y99+YR0HY3AZ+2KaOYYTmpQrMTlDcXzfaBKYHU0F2unYztd7+h/yjXJojPrdF
 ytKA==
X-Gm-Message-State: APjAAAWrqep07MBzxXiqYyCV145LueSAZUWKn19APWTjrlpsNZyW07Wt
 HjiA5xZCe18l1gTkwJTAMQcC2u1IXs8WhejECEk=
X-Google-Smtp-Source: APXvYqzWaRqI1zZeIKQ43FK3n017lqxItMV911Lb+BZ+Cnwse80l9CSDKJxWA9jaI1IETpLyrxd54fAm3/l9otJv3ow=
X-Received: by 2002:a02:2302:: with SMTP id u2mr1687201jau.70.1568705429875;
 Tue, 17 Sep 2019 00:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-8-oohall@gmail.com>
 <20190917011542.GG21303@tungsten.ozlabs.ibm.com>
In-Reply-To: <20190917011542.GG21303@tungsten.ozlabs.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 17 Sep 2019 17:30:18 +1000
Message-ID: <CAOSf1CE9AuG_nS0F+pmejx8eX5XDJ06AGxKBMPs3xweZ-XWnrQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] powernv/eeh: Use generic code to handle hot resets
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 11:15 AM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Tue, Sep 03, 2019 at 08:15:58PM +1000, Oliver O'Halloran wrote:
> > When we reset PCI devices managed by a hotplug driver the reset may
> > generate spurious hotplug events that cause the PCI device we're resetting
> > to be torn down accidently. This is a problem for EEH (when the driver is
> > EEH aware) since we want to leave the OS PCI device state intact so that
> > the device can be re-set without losing any resources (network, disks,
> > etc) provided by the driver.
> >
> > Generic PCI code provides the pci_bus_error_reset() function to handle
> > resetting a PCI Device (or bus) by using the reset method provided by the
> > hotplug slot driver. We can use this function if the EEH core has
> > requested a hot reset (common case) without tripping over the hotplug
> > driver.

> Could you explain a bit more about how this change solves the problem?
> Is it that the hotplug driver's reset method doesn't cause spurious
> hotplug events?

Yes, see the comment below.

> > -     if (pci_is_root_bus(bus) ||
> > -         pci_is_root_bus(bus->parent))
> > +     if (pci_is_root_bus(bus))
> >               return pnv_eeh_root_reset(hose, option);
> >
> > +     /*
> > +      * For hot resets try use the generic PCI error recovery reset
> > +      * functions. These correctly handles the case where the secondary
> > +      * bus is behind a hotplug slot and it will use the slot provided
> > +      * reset methods to prevent spurious hotplug events during the reset.
> > +      *
> > +      * Fundemental resets need to be handled internally to EEH since the
> > +      * PCI core doesn't really have a concept of a fundemental reset,
> > +      * mainly because there's no standard way to generate one. Only a
> > +      * few devices require an FRESET so it should be fine.
> > +      */
> > +     if (option != EEH_RESET_FUNDAMENTAL) {
> > +             /*
> > +              * NB: Skiboot and pnv_eeh_bridge_reset() also no-op the
> > +              *     de-assert step. It's like the OPAL reset API was
> > +              *     poorly designed or something...
> > +              */
> > +             if (option == EEH_RESET_DEACTIVATE)
> > +                     return 0;
>
> It looks like this will prevent pnv_eeh_root_reset(bus->parent) (below)
> from being called for EEH_RESET_DEACTIVATE, when it was before the
> patch. Is that right?

I agree it's a little awkward, but it works fine. OPAL has always
treated the resets defined by opal_pci_reset() as being edge-triggered
rather than level triggered since the de-assert step has always been
implemented as a no-op. This behaviour is effectively part of the ABI
between OPAL and the kernel since the kernel skips the de-assert step
in pnv_eeh_bridge_reset(). Although pnv_eeh_reset() uses
pnv_eeh_reset_root() to reset the secondary bus of the root port
pnv_pci_reset_secondary_bus() still uses the bridge reset.

I should probably update the OPAL API docs to mention that. Oh well.

> > +             rc = pci_bus_error_reset(bus->self);
> > +             if (!rc)
> > +                     return 0;
>
> Is it correct to fall through and try a different reset if this fails?

The only reason I can see for the generic code failing is when config
space to the bridge is blocked by the EEH core. The internal
pnv_eeh_bridge_reset() function has the option of calling
opal_pci_reset() or using the internal EEH config accessors (which
aren't filtered) so falling back makes sense to me.

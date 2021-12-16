Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5939476E80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 11:06:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF76m6pndz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 21:06:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=nwHvRMuR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=nwHvRMuR; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF76459dsz2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 21:05:32 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 516F2402E0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639649129;
 bh=iEjFNSHMwi4aeXpe7cQghYno80kPHKULcTC4SGtg0Js=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=nwHvRMuRraIbskS8YaDIW1RjDuNlMdsvKpV7Aa/0en9awLxx31ImhnZrDXn6D2tNo
 jk9NGEeH22SzMnxaqeXVLCWlWWwk4+m6N/Vw2+NMP5MMAUNpUtUE78UILvnxXunbuC
 lAL+cTQ8x5serNaTA+Et7Srx64YQZjUXAnG0r5oYxoMrLpnm8qFhM05/2zCaarGyMo
 7GzxaIw6dHchTLh70rHv8ruDIhwKZO1/E+c3kc0GZNS4CrxOi7G9+r4IXQ9l7c8R2t
 DWjLIT5oX5kIBvEa0FCN5v4w9zkFsISXm1SHlFD35K0UsQb/FgpD3V5HyTRWEELJ4x
 DetXQOY0pQwrg==
Received: by mail-ed1-f69.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so22774506edx.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 02:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEjFNSHMwi4aeXpe7cQghYno80kPHKULcTC4SGtg0Js=;
 b=LcyVbPS4NGTMwF2ozYVRJx4smfsd6zdntHxos2iPndLxC0+NQWWeY9+XOUcN0qmzr1
 afO1y2LPlqZuRcwhOzs42LZotKjHsXfaQmQpQYvJU1S28v5FNzoMbnHcFBR6BB+iSBNv
 B2X6VUzocdaRUg2g3dQG+urdqbYRL27y5sgxw72kYQDupFkIpA+hINsR1ox8ZAjpnihi
 JECBXqabe3VQ6wDaTw+eDjUXpd/pLXBDdQCZQeu2bzw1zh4w6QTB+jmbBDHlU5O36thP
 R72QT24Eys/E4FJi2F1U1CFJN1+2cF2nHHR+CG/uA7F2nFp214kzyVlMb1NUA/1e6WiQ
 Lb3Q==
X-Gm-Message-State: AOAM532V0m9dI/nn/EA0gU8Fvd0NPWV5cyvDHr4piP8EZxfGnSwJTaIl
 qr3t2ysnAPSxJt7AKWNw7V46fIWWKlSuYs8qcHvlKbBYo9SKpSchfYRiwOfHKkW1Tzxu1bCf1LI
 QgdRXQyTcPp4HpgVzj+GR+0nX5AemIiY798zjJDbWrLZ4NJPgLMytdSq1x4Y=
X-Received: by 2002:a17:906:48d:: with SMTP id
 f13mr1328897eja.178.1639649129031; 
 Thu, 16 Dec 2021 02:05:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4csYse2ts0CIc+GNT8hFD4S36DkgIwbzgfyBzIjr+nwEiJtuY5m75c6D7//m27d8UIPSjBoFZUfOIoRMOvGc=
X-Received: by 2002:a17:906:48d:: with SMTP id
 f13mr1328883eja.178.1639649128845; 
 Thu, 16 Dec 2021 02:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
 <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
 <CA+zEjCtajRJhs8zSdR_oFBOO3P5FWWZJ3L6N-GK+JnUjdymTiA@mail.gmail.com>
 <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3aJJYcONV9JMcn47=mW4P4kvYFdwnTdyZfRqeo+eGndQ@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 16 Dec 2021 11:05:18 +0100
Message-ID: <CA+zEjCu9KmTMpvXkFqgHX0C1jNZKquZU4owZKaJ_-o4+M_7ACg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Cleanup after removal of configs
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Lee Jones <lee.jones@linaro.org>, linux-cifs@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-cachefs@redhat.com, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Kalle Valo <kvalo@codeaurora.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-power@fi.rohmeurope.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 15, 2021 at 10:49 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Dec 10, 2021 at 9:38 PM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > On Fri, Nov 5, 2021 at 4:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
> > > <alexandre.ghiti@canonical.com> wrote:
> > > >
> > > > While bumping from 5.13 to 5.15, I found that a few deleted configs had
> > > > left some pieces here and there: this patchset cleans that.
> > > >
> > > > Alexandre Ghiti (7):
> > > >   Documentation, arch: Remove leftovers from fscache/cachefiles
> > > >     histograms
> > > >   Documentation, arch: Remove leftovers from raw device
> > > >   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
> > > >   arch: Remove leftovers from mandatory file locking
> > > >   Documentation, arch, fs: Remove leftovers from fscache object list
> > > >   include: mfd: Remove leftovers from bd70528 watchdog
> > > >   arch: Remove leftovers from prism54 wireless driver
> > >
> > > Looks all good to me, thanks a lot for the cleanup!
> > >
> > > For arch/arm/configs:
> > >
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > assuming this goes through someone else's tree. Let me know if you need me
> > > to pick up the patches in the asm-generic tree for cross-architecture work.
> >
> > Arnd, do you mind taking the whole series except patch 6 ("include:
> > mfd: Remove leftovers from bd70528 watchdog") as this will be handled
> > separately. I can ask Jonathan for the doc patches if needed.
>
> I tried to apply them, but only three of the patches applied cleanly. Can you
> resend them based on v5.16-rc1?

Sure, I have just sent the v2.

Thanks,

Alex

>
>         Arnd

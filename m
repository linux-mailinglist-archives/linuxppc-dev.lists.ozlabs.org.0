Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E324A3048
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 16:24:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmJ5d32yYz3bbR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 02:24:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=drummond.us header.i=@drummond.us header.a=rsa-sha256 header.s=google header.b=cmvGYiFp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=drummond.us (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=walt@drummond.us;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=drummond.us header.i=@drummond.us header.a=rsa-sha256
 header.s=google header.b=cmvGYiFp; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmJ4z0XbQz30Md
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 02:23:44 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id c7so12707922ljr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=drummond.us; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0mCWH6Tux8tcx0O8BuZbvK36ydxh3XeFUHA8Flrblcc=;
 b=cmvGYiFpo2ar6tVj5q2BCQVYb9k8BBD0XwhyxqAVItAmy2DCdgiftAuj8oc7BBE49Q
 LjK1fzbe0hOX97nInIogSNxADc9w4GpCfyauU6NFtNktDIG03u61lrQy9hqdUvd6EUft
 C6I/tHY4kzyBauIRoXYOzo9LGSe929OK0jEzQ59wjAL3By0a+QjA0M9X3G7I1kcoxcb7
 Q0AdPG8TS8c6yTTOUze5l0qFpdoVitgV/p2s3UNbwqPC0EG+SKAZieLlLnSPMO8rnFD5
 +FIv54+PLtXCBluE0vkOLnAVfI1OEciJIeE6mtAgIHH1+Z3qSeTB6dFp5Kah63auycAx
 k05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0mCWH6Tux8tcx0O8BuZbvK36ydxh3XeFUHA8Flrblcc=;
 b=vWWOWKsT9FesekqgdWYSilQcsxee1UmrB7b7js5FuLRlW1GikzbQPXK4Ll+Mu3UkfD
 4rDpTYo+DIvdFkUvWGfEZz46weD8ljHyMfs2ERfBEODpKYy2/IOVsbfLzuJkC7JmMzDl
 zvvcbrFyJxZ/dqvU7OPHfTjEDEWDz+bPSorl77jy2oCe89TjkL17sx2TWoLObZrHcf4X
 GRh/bckr6v1dFY6+vsnHmKD7o95nXUnIb0IaJl7Mn7NjY1uVGDpU5HBRrT2rvML0+2Ee
 CYtJet+t0HyAThOC79yDCmdSeNy6wxlMUGv+SBinfPFHdbJQRdyKo8sdvBwIwhvi3IVX
 lk7w==
X-Gm-Message-State: AOAM533KAf3MDWyOxX/BVVUXiS95+GMpolJWnzzpxAO2/sB/Euy3AAqg
 sndW+GBnzBzG5bArRbckr7e4fQTd6APWjYgyqPDxqw==
X-Google-Smtp-Source: ABdhPJzK4pFoabd9NoIBHHNS2OQ2X0frUhiKWXvHsU/uBjqxnLeu+8dmN2me2gLqvfH4JEfcPiamxCIYMad5ipU8E2c=
X-Received: by 2002:a2e:994a:: with SMTP id r10mr8482884ljj.254.1643469817879; 
 Sat, 29 Jan 2022 07:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20220118044259.764945-1-walt@drummond.us>
 <YfFQeC1cUVFmISMK@kroah.com>
In-Reply-To: <YfFQeC1cUVFmISMK@kroah.com>
From: Walt Drummond <walt@drummond.us>
Date: Sat, 29 Jan 2022 07:23:26 -0800
Message-ID: <CADCN6nyyChM=jb9nmc2jDg2UdHUoXp3E05=ifxRpcs=8k8t09Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] status: TTY status message request
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 jcmvbkbc@gmail.com, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, ar@cs.msu.ru, jirislaby@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de,
 deller@gmx.de, ysato@users.osdn.me, mattst88@gmail.com,
 borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, gor@linux.ibm.com,
 hca@linux.ibm.com, ink@jurassic.park.msu.ru, rth@twiddle.net, chris@zankel.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ACK, will do.

On Wed, Jan 26, 2022 at 5:45 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 17, 2022 at 08:42:57PM -0800, Walt Drummond wrote:
> > This patchset adds TTY status message request feature to the n_tty
> > line dicipline.  This feature prints a brief message containing basic
> > system and process group information to a user's TTY in response to a
> > new control character in the line dicipline (default Ctrl-T) or the
> > TIOCSTAT ioctl.  The message contains the current system load, the
> > name and PID of an interesting process in the forground process group,
> > it's run time, percent CPU usage and RSS.  An example of this message
> > is:
> >
> >   load: 0.31  cmd: sleep 3616843 [sleeping] 0.36r 0.00u 0.00s 0% 696k
> >
> > User API visible changes are limited to:
> >  - The addition of VSTATUS in termios.c_cc[]
> >  - The addition of NOKERNINFO bit in termios.l_cflags
> >  - The addition of the TIOCSTAT ioctl number
> >
> > None of these changes break the existing kernel api as the termios
> > structure on all architectures has enough space in the control
> > character array (.c_cc) for the new character, and the other changes
> > are space agnostic.
> >
> > This feature is in many other Unix-like systems, both current and
> > historical.  In other implementations, this feature would also send
> > SIGINFO to the process group; this implementation does not.
> >
> > Walt Drummond (3):
> >   vstatus: Allow the n_tty line dicipline to write to a user tty
> >   vstatus: Add user space API definitions for VSTATUS, NOKERNINFO and
> >     TIOCSTAT
> >   status: Display an informational message when the VSTATUS character is
> >     pressed or TIOCSTAT ioctl is called.
> >
> >  arch/alpha/include/asm/termios.h         |   4 +-
> >  arch/alpha/include/uapi/asm/ioctls.h     |   1 +
> >  arch/alpha/include/uapi/asm/termbits.h   |  34 ++---
> >  arch/ia64/include/asm/termios.h          |   4 +-
> >  arch/ia64/include/uapi/asm/termbits.h    |  34 ++---
> >  arch/mips/include/asm/termios.h          |   4 +-
> >  arch/mips/include/uapi/asm/ioctls.h      |   1 +
> >  arch/mips/include/uapi/asm/termbits.h    |  36 ++---
> >  arch/parisc/include/asm/termios.h        |   4 +-
> >  arch/parisc/include/uapi/asm/ioctls.h    |   1 +
> >  arch/parisc/include/uapi/asm/termbits.h  |  34 ++---
> >  arch/powerpc/include/asm/termios.h       |   4 +-
> >  arch/powerpc/include/uapi/asm/ioctls.h   |   2 +
> >  arch/powerpc/include/uapi/asm/termbits.h |  34 ++---
> >  arch/s390/include/asm/termios.h          |   4 +-
> >  arch/sh/include/uapi/asm/ioctls.h        |   1 +
> >  arch/sparc/include/uapi/asm/ioctls.h     |   1 +
> >  arch/sparc/include/uapi/asm/termbits.h   |  38 +++---
> >  arch/xtensa/include/uapi/asm/ioctls.h    |   1 +
> >  drivers/tty/Makefile                     |   2 +-
> >  drivers/tty/n_tty.c                      | 113 +++++++++++-----
> >  drivers/tty/n_tty_status.c               | 162 +++++++++++++++++++++++
> >  drivers/tty/tty_io.c                     |   2 +-
> >  include/asm-generic/termios.h            |   4 +-
> >  include/linux/tty.h                      | 123 ++++++++---------
> >  include/uapi/asm-generic/ioctls.h        |   1 +
> >  include/uapi/asm-generic/termbits.h      |  34 ++---
> >  27 files changed, 461 insertions(+), 222 deletions(-)
> >  create mode 100644 drivers/tty/n_tty_status.c
> >
> > --
> > 2.30.2
> >
>
> You forgot to cc: me on patch 2/3, which would be needed if I was to
> take them all.
>
> Please fix up patch 2 and resend the whole series.
>
> thanks,
>
> greg k-h

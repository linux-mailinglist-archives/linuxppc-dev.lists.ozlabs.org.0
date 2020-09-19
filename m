Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81308270A84
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 06:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btcqf6DWSzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 14:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=tony.ambardar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aGlESU91; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Btcnx31nxzDqr5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 14:16:05 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id j2so9287393ioj.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 21:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKEE3yp5Rcc/md7pG2bSGfj9ZsRwTbcCIHn5InN/kNw=;
 b=aGlESU91VLGmqPRG+xHbjCgsyyg5neN9y2SNkYDvUeQ/ri6kC1WlyggLSeUQowP2o3
 MJ5NU1bEu8TBm/7t2TfhQcrZd4HxQLTHSmRvaNfRYBlCa6N3rg+Lt/9tFIFKogS8UkgA
 GHeyEaQ3o28fInNlpcYGcX7+tlb0eBwcl+FIh5XCCx5SImQO5UV6LDiEY93RUahk0DuI
 DU41E/43MjV31NeVL4Dou3FBVxJ/gksWyph1xvb0WoYr8TbCqfpEUBnBmsDFdN/7xj9X
 tLwwWLvSCL/lInFUsxJakhgPfUhwqb93IYkschuRk9FWmDUQioeCrf4gKAXvQH66XarW
 RcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKEE3yp5Rcc/md7pG2bSGfj9ZsRwTbcCIHn5InN/kNw=;
 b=I3zmVyj6qHZ8XlDUPzVGojQcdng3avC5gOaS7bjazmJdk7iX+0MEF9NvlvVqpdn3ug
 5ZYLFmj4HCPQ4KuG1TaL+M/wQK5BCgYoLGoDAZSJzFlABK/81NPRzpr5ACTUchxT4+Bo
 RjdCaPOUrIz3ryrvqmjSDdkkSO6w4L3GGniXjVtX9LM2a38v/leltX08oWI4hQatzrAI
 Paz1nSsw9TGpDeZWQ6UnZ+kApioTrUWKd6XvJzKgrxonnFAuIesdmVGNPQHwaJ+wRHjJ
 DHbptkGly3Uq2GRvoonwhqxmVXGkaausZUbN2YsB45hNkAwOYhk8/pp5CF2qWjgzykv9
 BixQ==
X-Gm-Message-State: AOAM533dz2zQDCkJjyPjZEpNLGjgukyJ2XdRd0SeyPo5ub3iz/wjAH9W
 oLIvoWu2Rc822Dw34N8GDaqGtEqxzbqIYYf2mfo=
X-Google-Smtp-Source: ABdhPJwKnTGflf3OjRpTv6fCq3h03LLJfNJI6RfNDUunk5g2o2wcmnT9KK1bw3XsjwKQAmkTA2xcwBBV8pBnPKwMV/8=
X-Received: by 2002:a5d:8a04:: with SMTP id w4mr29941997iod.68.1600488960801; 
 Fri, 18 Sep 2020 21:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200916074214.995128-1-Tony.Ambardar@gmail.com>
 <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
 <87363gpqhz.fsf@mpe.ellerman.id.au>
 <CAK8P3a3FVoDzNb1TOA6cRQDdEc+st7KkBL70t0FeStEziQG4+A__37056.5000850306$1600351707$gmane$org@mail.gmail.com>
 <87h7rw321o.fsf@igel.home>
In-Reply-To: <87h7rw321o.fsf@igel.home>
From: Tony Ambardar <tony.ambardar@gmail.com>
Date: Fri, 18 Sep 2020 21:15:50 -0700
Message-ID: <CAPGftE__Mh2Fp_v=Vhm3cQ1PHNFETMsXET6raTpLav-BbVQvbw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
To: Andreas Schwab <schwab@linux-m68k.org>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Paul Mackerras <paulus@samba.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Sep 2020 at 07:34, Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Sep 17 2020, Arnd Bergmann wrote:
>
> > The errno man page says they are supposed to be synonyms,
> > and glibc defines it that way, while musl uses the numbers
> > from the kernel.
>
> glibc also uses whatever the kernel defines.
>
That's right, and from my investigation this isn't a libc issue. The
various libc flavours simply try to follow POSIX and the PPC ABI and
aren't doing anything wrong.

See errno.h for example (https://man7.org/linux/man-pages/man3/errno.3.html):
  EDEADLK: Resource deadlock avoided (POSIX.1-2001).
  EDEADLOCK: On most architectures, a synonym for EDEADLK.  On some
architectures (e.g., Linux MIPS, PowerPC, SPARC), it is a separate
error code "File locking deadlock error".

The root cause is unique to the Linux PPC code in
arch/powerpc/include/uapi/asm/errno.h:
  >/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
  >#ifndef _ASM_POWERPC_ERRNO_H
  >#define _ASM_POWERPC_ERRNO_H
  >
  >#include <asm-generic/errno.h>
  >
  >#undef  EDEADLOCK
  >#define EDEADLOCK       58      /* File locking deadlock error */
  >
  >#endif  /* _ASM_POWERPC_ERRNO_H */

It includes "<asm-generic/errno.h>" to pull in various definitions but
has the side-effect of redefining EDEADLOCK to a non-ABI value which
conflicts with the libc errno.h, as I outline in the patch
description. Other arches which also use different EDEADLOCK and
EDEADLK values (mips,sparc) do not do this. They define EDEADLOCK
*once*, with an ABI-consistent value, and don't have the same issue.

The problem goes back a ways (as Arnd points out), affecting current
stable and all LTS branches, so would be nice to get this sorted out.
I'm certainly interested if there's a better way than proposed in this
patch.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

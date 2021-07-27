Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7793D7C5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 19:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ3xC5LxDz3cb2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 03:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IXy7dy/E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IXy7dy/E; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ3wk3gK7z2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 03:40:38 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34E9560FC2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627407635;
 bh=PrLaVhJtnv8oDcD5hqybwz9YD9godDZatvRa/JhR9M0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IXy7dy/E6HvlzyRFJzUFggLgVaHAvF9F7JL2rJM5VeRZOMZdg/HxMtLK5pYciS9Ot
 CRJjiKFBHYy+qOHmBpmK9ybk1PCp987bNID/VVLMECfL8FQmO2v0h9OhJkkAlAjN6G
 wPLOK/PK5sD90XP9UMVhR9xaAyglmJe73UxiqWo+AUdFveMkdG4lXMlVtNb2KrA+jy
 LRhX7wo1K5E0RfxzNuSj2IT5uL3xfWnZnQC6fn0bWN2O6Bf0erf9oXDHVDAOYAYFuC
 GlTTrJw4eX17JIH5B+hSg99c/W/SJZdqYF2l1guDZo1JcZODNQ8IJQluR8ADj/C452
 iRJE3wKX38H3A==
Received: by mail-ed1-f54.google.com with SMTP id l6so14489770edc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 10:40:35 -0700 (PDT)
X-Gm-Message-State: AOAM533IFL5pUEtpCGaceT9YwDu402xmybe+JiGCFM+KSH90NvYLAycc
 xJK92Yf5mw2dUhYR8IHu8F7Dh4iiiYvDPsUz3Ew=
X-Google-Smtp-Source: ABdhPJwS3rT+yAdjePDzQkl1JqnECPTPxX9jMsyrg697T6BrM+4lIuGtTERdp1j5XGkArSly5ovA2pWeExL5zNS/vV0=
X-Received: by 2002:adf:f446:: with SMTP id f6mr13242430wrp.361.1627407622867; 
 Tue, 27 Jul 2021 10:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144859.4150043-1-arnd@kernel.org>
 <20210727144859.4150043-5-arnd@kernel.org>
 <YQBB9yteAwtG2xyp@osiris>
In-Reply-To: <YQBB9yteAwtG2xyp@osiris>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Jul 2021 19:40:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3itgCyc4jDBodTOcwG+XXsDYspZqQVBmy88cGXevY5Yw@mail.gmail.com>
Message-ID: <CAK8P3a3itgCyc4jDBodTOcwG+XXsDYspZqQVBmy88cGXevY5Yw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm: simplify compat numa syscalls
To: Heiko Carstens <hca@linux.ibm.com>
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
Cc: Feng Tang <feng.tang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021 at 7:27 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Tue, Jul 27, 2021 at 04:48:57PM +0200, Arnd Bergmann wrote:
> > ---
> >  include/linux/compat.h |  17 ++--
> >  mm/mempolicy.c         | 175 +++++++++++++----------------------------
> >  2 files changed, 63 insertions(+), 129 deletions(-)
> ...
> > +static int get_bitmap(unsigned long *mask, const unsigned long __user *nmask,
> > +                   unsigned long maxnode)
> > +{
> > +     unsigned long nlongs = BITS_TO_LONGS(maxnode);
> > +     int ret;
> > +
> > +     if (in_compat_syscall())
> > +             ret = compat_get_bitmap(mask,
> > +                                     (const compat_ulong_t __user *)nmask,
> > +                                     maxnode);
>
> compat_ptr() conversion for e.g. nmask is missing with the next patch
> which removes the compat system calls.
> Is that intended or am I missing something?

I don't think it's needed here, since the pointer comes from the system
call argument, which has the compat_ptr() conversion applied in
arch/s390/include/asm/syscall_wrapper.h, not from a compat_uptr_t
that gets passed indirectly. The compat_get_bitmap() conversion
is only needed for byte order adjustment, not for converting pointers.

It's also possible that I'm the one who's missing something.

        Arnd

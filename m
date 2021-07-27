Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD33D7F68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 22:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ7z81hS3z3bWf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 06:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZKlOgZHS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZKlOgZHS; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ7yj5hMzz309l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 06:42:37 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C38460F9C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 20:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627418555;
 bh=d4JjFlDfF7N2eBt3m9sdZRk+eRhA4ZhBMt2Pq1TZ0cw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZKlOgZHSGjAmEnyaCwMuVKafYPWKeXil2Iiwo9tfWrDpXPrP+nIx5u3FkbHHx9hE7
 f/+uSzSaAFLY8z0zPS4rMNMGD3DTUb7OLkYFi3ipPjtLYS72UjSrIEZWHsniKmxxZK
 Le59cWQyoKcdNBRC2NnQPaYKcr4Sl5SxpzzeT6TBVgHinsKuWcX4k1BjDbOE4supyn
 HiZ19DR0bU/awUHcX41Rjheo1w+obLAaQrJ8Rjja+UBSy51OODPf7/DV6wZKbPG4vd
 wTF3Um9UkJV8uDOE8zSUVipLRKY8TGL5cXoV09GMyL2Tz2E7xssC3kDmiC7uClw3Me
 O9bSVwy2lubCA==
Received: by mail-wm1-f43.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so203592wms.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 13:42:35 -0700 (PDT)
X-Gm-Message-State: AOAM5331IpecoxMKFKc5dzoiw59h81plOWX7tMxcbFRjpUnacLz82pAV
 lDvbFgL9fkOQT/6zGAB4IApoUt2Hb3646kZYtaY=
X-Google-Smtp-Source: ABdhPJzIeHa1hycZO5ufjXaaYbpY3YdQw4oHXjfZp2KwEfMcEIfJ5hSLrfTaLF7iY7hnR3dqnN2Y1Sv0AKkyrN9dOFM=
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr6005968wmk.84.1627418543998; 
 Tue, 27 Jul 2021 13:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144859.4150043-1-arnd@kernel.org>
 <YQAfa6iObAwwIpzb@infradead.org>
 <20210727131017.f151a81fc69db8f45f81a2b3@linux-foundation.org>
In-Reply-To: <20210727131017.f151a81fc69db8f45f81a2b3@linux-foundation.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Jul 2021 22:42:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2S4Oct4+a8u=ottrW1b+iRf-tRSJb0DvaLNR3CZARmTQ@mail.gmail.com>
Message-ID: <CAK8P3a2S4Oct4+a8u=ottrW1b+iRf-tRSJb0DvaLNR3CZARmTQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] compat: remove compat_alloc_user_space
To: Andrew Morton <akpm@linux-foundation.org>
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
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021 at 10:11 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Tue, 27 Jul 2021 15:59:55 +0100 Christoph Hellwig <hch@infradead.org> wrote:
>
> > On Tue, Jul 27, 2021 at 04:48:53PM +0200, Arnd Bergmann wrote:
> > > Since these patches are now all that remains, it would be nice to
> > > merge it all through Andrew's Linux-mm tree, which is already based
> > > on top of linux-next.
> >
> > Is it?
>
> the -mm tree is structured as
>
> <90% of stuff>
> linux-next.patch
> <the other 10% of stuff>
>
> So things like Arnd's series which have a dependency on linux-next
> material get added to the "other 10%" and are merged behind the
> linux-next material and all is good.
>
> If possible I'll queue things ahead of linux-next.patch.  Those few
> things which have dependencies on linux-next material get sent to Linus
> after the required linux-next material is merged into mainline.

The first five patches in my series should apply cleanly on mainline
kernels and make sense by themselves, the last patch is the one that
depends on this series as well as another series in the netdev tree,
so that has to go behind linux-next.

I suppose I could also merge the first five through my asm-generic tree
and send you the last one if you prefer, but then again two of the patches
are actually memory management stuff.

         Arnd

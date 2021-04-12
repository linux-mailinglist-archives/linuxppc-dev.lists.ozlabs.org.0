Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7760535C511
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJmf63L9gz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:26:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJmdm4f2hz3028
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:26:20 +1000 (AEST)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MbRXd-1m7iUq0CxF-00bqcG for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr
 2021 13:26:17 +0200
Received: by mail-wr1-f43.google.com with SMTP id a6so12541928wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 04:26:16 -0700 (PDT)
X-Gm-Message-State: AOAM533TexU/OPlRYoGz3d09dwz+iHR8wy3vV98b4ZHaHqeY1R86x3OD
 pRlzw3sY9z051Cn809VbxzhYfuOK+Z5gJ5aqVvE=
X-Google-Smtp-Source: ABdhPJy46sI91TDF91SxINRlLS3vYTwc1YeMRJCymXnpPG5ap8cTdjbAP71XB76ODq1s/TL2YmK09N0XG1Vr80EDjdY=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr31632710wrg.165.1618226776291; 
 Mon, 12 Apr 2021 04:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210412085545.2595431-1-hch@lst.de>
 <20210412085545.2595431-6-hch@lst.de>
 <15be19af19174c7692dd795297884096@AcuMS.aculab.com>
 <5c3635a2b44a496b88d665e8686d9436@AcuMS.aculab.com>
In-Reply-To: <5c3635a2b44a496b88d665e8686d9436@AcuMS.aculab.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Apr 2021 13:26:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1JZ=JerasdkntzX_ApaCF7C29ZS1E31aPQATOts0ZiLw@mail.gmail.com>
Message-ID: <CAK8P3a1JZ=JerasdkntzX_ApaCF7C29ZS1E31aPQATOts0ZiLw@mail.gmail.com>
Subject: Re: [PATCH 5/5] compat: consolidate the compat_flock{,64} definition
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:K/ka3Q+B1BaGhTINpnNd6qvWX1YXcTjycuB+fGaVGkXrEdKB2BA
 9KzWFd4BdMt8TtMuoBZKeRMAEAAzj6pKL3Y6byn84RvR8jlh+cZubUF7YfsfnprnszeKrpl
 2x5f4UzwwKJKKLc9H8QnHT/JhGkZEevF1uyfiu+8AL0xyvoOHgjkPzqDk8WqYdoHjC3tAwz
 2DR/48ou3ZdnEvK6cUV+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RZQ/f3YyP4U=:hPd0lZn1HE1zZVhJim5u9+
 b0NLgSFhedHVqzYnlFxPNZ3NPN8hMCsu/g5crqUnpa6XyblRWKuUTslPVjcKjEzTtRTodROOl
 EWoTsKFwM7BXxo+zddGUXh0d6ZPhErZxO5zJaB+OGr9GZQQa0gf91OqnsAG5ZptHI+/07Pghf
 VbEZz85pG60GOZdV54rTQS8QnH8009P8GaYzRB00feNehNiMhccetLy4WG8zJzhids1H6bpDo
 3f1+ZTYXx2qWX+zt/nKoiQKh5cT4bXPQatX99dQHYuwfV5TW6FQQKhROyXKDbCdgEyQQNelXH
 v9Uzke6ta1YwZsCDcoLBxLzkku90M7KVe242PXu6DlUccM1d0S2An9vJvd1LQ0R44UYoxxeIb
 Thw62jqmBsjwHUGRvNBKbUvKDo2CdlCFqwRpVU9pbJDzihQoY5jWFHCBXorqB5zO8GwM+ZW5U
 srv+5F80SHDbCd78I0LTZZvaZa0CBDqEqn37CMZV/UMvQDQlJE75kQDgJjv46OFKZAaZOAhx1
 Bx4jqIOusE6glxcVAw5PEb4C+K1bgFHblAiju0CGpT/q2Bop4WYdEXw0V9MlIahPj16onHKyf
 P2J+164MCE+5RkK1cmZUXacZdTD+HGVj51
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Heiko Carstens <hca@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 12:54 PM David Laight <David.Laight@aculab.com> wrote:
> From: David Laight > Sent: 12 April 2021 10:37
> ...
> > I'm guessing that compat_pid_t is 16 bits?
> > So the native 32bit version has an unnamed 2 byte structure pad.
> > The 'packed' removes this pad from the compat structure.
> >
> > AFAICT (apart from mips) the __ARCH_COMPAT_FLOCK_PAD is just
> > adding an explicit pad for the implicit pad the compiler
> > would generate because compat_pid_t is 16 bits.
>
> I've just looked at the header.
> compat_pid_t is 32 bits.
> So Linux must have gained 32bit pids at some earlier time.
> (Historically Unix pids were 16 bit - even on 32bit systems.)
>
> Which makes the explicit pad in 'sparc' rather 'interesting'.

I saw it was there since the sparc kernel support got merged in
linux-1.3, possibly copied from an older sunos version.

> oh - compat_loff_t is only used in a couple of other places.
> neither care in any way about the alignment.
> (Provided get_user() doesn't fault on a 8n+4 aligned address.)

Ah right, I also see that after this series it's only used in to other
places:  compat_resume_swap_area, which could also lose the
__packed annotation, and in the declaration of
compat_sys_sendfile64, where it makes no difference.

      Arnd

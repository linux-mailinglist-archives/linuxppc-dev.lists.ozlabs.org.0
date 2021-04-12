Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CB35C4B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:08:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJmFC42Slz3c0d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:08:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJmDs5K9Mz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:08:12 +1000 (AEST)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N8GAQ-1laUyt1rPM-014Crs for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr
 2021 13:08:07 +0200
Received: by mail-wr1-f52.google.com with SMTP id s7so12363289wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 04:08:06 -0700 (PDT)
X-Gm-Message-State: AOAM530l2wX/NasHkHxcpw9wJrJc23ubZXczeMw+3JTx8CmvDM9i9lQi
 BczFkBvorbQaP56rtQ3oBxlGQbvtQycbVm/4duk=
X-Google-Smtp-Source: ABdhPJwatGj4Mvozhf6aCxkSShLwRvZgtq4mQWAmILFQGmr0irnCJbJ+CA5m1DFQ3FmRiRFXCX+SPYIdhUIUiDPM7gw=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr1862692wrz.105.1618225686459; 
 Mon, 12 Apr 2021 04:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210412085545.2595431-1-hch@lst.de>
 <CAK8P3a38qgkjkh4+fDKp4TufL+2_W-quZBFK9pJFf7wXP=84xQ@mail.gmail.com>
 <16c471554aa5424fbe2f6a4fd60bd662@AcuMS.aculab.com>
In-Reply-To: <16c471554aa5424fbe2f6a4fd60bd662@AcuMS.aculab.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Apr 2021 13:07:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0MpbF=Zp8MtqaPYrLeLorh1TfVVtTPZ-ubxBy93CSOVA@mail.gmail.com>
Message-ID: <CAK8P3a0MpbF=Zp8MtqaPYrLeLorh1TfVVtTPZ-ubxBy93CSOVA@mail.gmail.com>
Subject: Re: consolidate the flock uapi definitions
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:OeoWRZQ5tzWn+DWeM4Tp4OACKEwR7wJ4VG+coZqaXM8woVvfBVF
 cikSbNC6v5bzJHl0NUImxY99NXNQ7ndM6aOoti5xXTgfbIPb5ASdcIrnwMF325fJQY5Uw0P
 GOioaBcgPZ22hkdp+M7fq2OBSE3PfY1oM1++xUWGucnGAoHHWvgb6x6LgBHB62V+FP/rnF1
 GvTKNTHrs33EHCBuJm/4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4rlbwDLE9uY=:BoD8jcxM7TdJz+DOC5h4Lc
 TTI2fHF0gBCWAQO1DwoIZRFq3OpK0CuUuT1jam0WmcQIX6EMymX0lrrbOKN0XL6Nt/0/PxEf7
 XzsAnGYshWt4XhyHj98xMzqTz8JWl6qruCfLTHzMn5+raUMaX9UaPKNexa401/r0okdXW8EQS
 fJvN8BqMV46yZCl2gWvQsFQ6nzqXGIyZMtp3SX8JfZQ4CNqpoVjofc+pYUHVAdr7ob6ArFhe3
 fmI8+HB0Jt7Nn3RflrUVru5ewLEs6TgfnCqb5fSf5xNUflDqufZKLfxtX9D3N6dE6hHY4u1Fu
 0q11Ki8v5or8J9DF/A4Qtn9/QD7ldHzYhDau/TX4iaxxa7Lu/xbZSeBKdWVGCBRzsq9I7cdBI
 V8q7QKqWFE3K+rKNKVJJPNHXtZh9koiWFD7E1g5jOLF7GnLkX6c3MOseXa75UPgF3ci8JkCuv
 jo8Vv8TaQY4Wh0sGfYlXZyC0rbDaSTp8xFzWyzFzhPHc642OBwepz+D1iSvIDQMOR4Da5CYNs
 pGkRsOWzUcWFGpXrTI4oTFXsZ8xp+GVXxDlw9n8Znlr5xnORqONMmBjlHxPwVtvmgLzkPyQ4z
 pDRPAjlvPb9DnJhVIPFCXdWBRQpj6Gz8Ia
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Will Deacon <will@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, sparclinux <sparclinux@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 12:22 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Arnd Bergmann
> > Sent: 12 April 2021 11:04
> >
> > On Mon, Apr 12, 2021 at 10:55 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Hi all,
> > >
> > > currently we deal with the slight differents in the various architecture
> > > variants of the flock and flock64 stuctures in a very cruft way.  This
> > > series switches to just use small arch hooks and define the rest in
> > > asm-generic and linux/compat.h instead.
> >
> > Nice cleanup. I can merge it through the asm-generic tree if you like,
> > though it's a little late just ahead of the merge window.
> >
> > I would not want to change the compat_loff_t definition to compat_s64
> > to avoid the padding at this time, though that might be a useful cleanup
> > for a future cycle.
>
> Is x86 the only architecture that has 32bit and 64bit variants where
> the 32bit variant aligns 64bit items on 32bit boundaries?

Yes.

> ISTM that fixing compat_loff_t shouldn't have any fallout.

That is my assumption as well, but I still wouldn't take the
risk one week before the merge window.

       Arnd

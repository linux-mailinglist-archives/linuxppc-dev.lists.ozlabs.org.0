Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E2371464
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 13:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYgt60WCdz30BR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 21:36:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYgsf2HNhz2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 21:36:20 +1000 (AEST)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1McpeM-1l3e9d33ha-00ZyMq for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May
 2021 13:36:15 +0200
Received: by mail-wr1-f41.google.com with SMTP id v12so5172492wrq.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 04:36:14 -0700 (PDT)
X-Gm-Message-State: AOAM531CeW0sZtF2AMct60kmFyy/8b1YUKNj6AKMqTdTYa2BaBHJ66t9
 4ewuZmz6PHvU/OYA1g0FKe0iixMNvTV6BlC+1EQ=
X-Google-Smtp-Source: ABdhPJwIvsv/yMchaa4sUSYzSCPmfiG5zkCBHBNNq2yUma7fb0HtVe+fV0tBIbTslxWLhW72fs4l8PW7OasotEimGEc=
X-Received: by 2002:adf:d223:: with SMTP id k3mr24144176wrh.99.1620041774578; 
 Mon, 03 May 2021 04:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
In-Reply-To: <20210502223007.GZ1847222@casper.infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 13:35:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Vt17Yry_gTQ0dwr7_tEoFhuec+mQzzKzFvZGD5Hrnow@mail.gmail.com>
Message-ID: <CAK8P3a1Vt17Yry_gTQ0dwr7_tEoFhuec+mQzzKzFvZGD5Hrnow@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Z8RYyFBTR5o3Gcdii1TPHYQqkLQIdp1drj3MxWpBy1wPr6GBK2S
 bLhKqBbfzbDVOhyQM2i8+/f1eqvzQEk7r/i1JoeNPnDJJpGUdxG+TOOtHhSGkU2bQk/BRWk
 2oZjWaVVeN3rzkq0arDgum12Fv530N5iI69V/95cJoHCo9G+uGfnaxga8n3YwsyCSfdjTK6
 iNlZkMoWENf6BZs1t8aUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QescW9gl+ug=:uTdt3o52wX+6wEjDe8COhS
 Bm7LbCnD6ZXgIPN3w4F2HcA45ghzXViocbljmqqvhoUkwebjcpO9I3m6LusQap/eupYApDvXs
 N2L+i/ykmWClYMb6H2HJWPJuKx/LLHKHALX3d/Dv7RKl8xhD1vLgPvE9wBtFewNTdIoRVqFcI
 mRkELWPq5UweQy0SC+P3HrnVVdyX4kljBcQMu8QcPLlqV38dZ+MAQWlEVU3roYnR2cGpt4X2S
 k9f3kKRVCI1ZpjIGQ7w9zXqNpT+kmZXGLmFO92jMRb/28re2dyCAxggOF98Vb6bCtHFPwtZ+G
 b9RuIhdqIjKawhciAvrK3onQdSQMOzxRyfzPOcRDmsQLn638+BENcfZKbYBmMZ3O9qCS+Y/ek
 K0y+LRFk3S3YLqAPrdxlyVWmo/kYDBkHGtZq+ctF3+QI1hJaIquusGv9HPZo3aMcxU8SBRB8P
 QrUn/FWuu8qbLLcRq2WhwNmjnCmLcLd0DMJBlT4lmsamXmlEYNtKF4krcDVFPXgLIJtHPguqq
 JpdxnLhnT32TrPnqPgmiUs=
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 12:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> > What is relevant is what version of gcc various distributions actually
> > have reasonably easily available, and how old and relevant the
> > distributions are. We did decide that (just as an example) RHEL 7 was
> > too old to worry about when we updated the gcc version requirement
> > last time.
> >
> > Last year, Arnd and Kirill (maybe others were involved too) made a
> > list of distros and older gcc versions. But I don't think anybody
> > actually _maintains_ such a list. It would be perhaps interesting to
> > have some way to check what compiler versions are being offered by
> > different distros.
>
> fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
> Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
> Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.
>
> So do we care about people who haven't bothered to upgrade userspace
> since 2017?  If so, we can't go past 4.9.

I would argue that we shouldn't care about distros that are officially
end-of-life. Jessie support ended last July according to the official
Debian pages at https://wiki.debian.org/LTS.

It's a little harder for distros that are still officially supported, like the
RHEL7 case that Linus mentioned, Debian Stretch (gcc-6.3),
Slackware 14.2 (gcc-5.3), or Ubuntu 18.04 (gcc-7.3). For any of
these you could make the argument one way or the other: either
say we care as long as the distro cares, or the users that want
to build their own kernels can be reasonably expected to either
upgrade their distro or install a newer compiler manually.

Looking at the Debian case specifically, I see these numbers
from https://popcon.debian.org/:

testing/unstable: 16730
buster/stable: 113881
stretch/oldstable: 39147
jessie/oldoldstable: 19286

Assuming the numbers of users that installed popcon are
proportional to the actual number of users, that's still a large
chunk of people running stretch or older. Presumably,
these users are actually less likely to build their own kernels.

       Arnd

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D8370F77
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 00:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYLTM3bH2z301K
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 08:32:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=udzO03mH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=udzO03mH; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYLSm5bKfz2xZ9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 08:32:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sxg9T1l2P1TCAt0KGvVd11DgxmUSs0be5EJPC9/f71E=; b=udzO03mH7WI7B+E+YTdUOwtAf1
 pjHtqAcqFvgk6A/VPnylKxmrsD2lIsft1hfQrFKrFeNBtjNS6w+ZE+mHiu5d5gHPflr/5ZEY0rMY3
 j/Vp83jF/iLnG6XdNPzIyF+mF5/lYl4l1cbzzG1WNvagPbMrY6WOJxtjqyegDj+NUVKUcLudh1Jxj
 aIs6ARBcGAieZGWtA+1xInBrNjRM1WzTAXphw3z434iaMpsXozUAAxgXsgOVhK/ROYowwzYtHNMjt
 qTvAIs7sHWprczN8zI56TNESOK3PApv5dUV0ZiJ8bjyK89wcLViH+1YjrBh3jVl2hZIW2BIswvKuA
 GSIUL4Rg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ldKbH-00EKpr-87; Sun, 02 May 2021 22:30:19 +0000
Date: Sun, 2 May 2021 23:30:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502223007.GZ1847222@casper.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> What is relevant is what version of gcc various distributions actually
> have reasonably easily available, and how old and relevant the
> distributions are. We did decide that (just as an example) RHEL 7 was
> too old to worry about when we updated the gcc version requirement
> last time.
> 
> Last year, Arnd and Kirill (maybe others were involved too) made a
> list of distros and older gcc versions. But I don't think anybody
> actually _maintains_ such a list. It would be perhaps interesting to
> have some way to check what compiler versions are being offered by
> different distros.

fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.

So do we care about people who haven't bothered to upgrade userspace
since 2017?  If so, we can't go past 4.9.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A922D371277
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 10:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYblY4jxkz30Fn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 18:30:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=thorsis.com (client-ip=92.198.35.195; helo=mail.thorsis.com;
 envelope-from=ada@thorsis.com; receiver=<UNKNOWN>)
X-Greylist: delayed 562 seconds by postgrey-1.36 at boromir;
 Mon, 03 May 2021 17:44:13 AEST
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYZjn1lqGz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 17:44:13 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 9964BECE
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 09:34:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxC1ocj2zaEz for <linuxppc-dev@lists.ozlabs.org>;
 Mon,  3 May 2021 09:34:44 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 4F1BC1A30; Mon,  3 May 2021 09:34:44 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
 * -0.0 NO_RECEIVED Informational: message has no Received headers
Date: Mon, 3 May 2021 09:34:28 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210502223007.GZ1847222@casper.infradead.org>
X-Mailman-Approved-At: Mon, 03 May 2021 18:30:31 +1000
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hei hei,

Am Sun, May 02, 2021 at 11:30:07PM +0100 schrieb Matthew Wilcox:
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

Desktops and servers are all nice, however I just want to make you
aware, there are embedded users forced to stick to older cross
toolchains for different reasons as well, e.g. in industrial
environment. :-)

This is no show stopper for us, I just wanted to let you be aware.

Greets
Alex


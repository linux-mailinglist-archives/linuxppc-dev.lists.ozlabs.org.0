Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9C1E9AB3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 00:32:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZtNM54gnzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 08:32:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=dRT/N9JT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3FC1tD5l; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZtLj4F8QzDqJg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 08:31:02 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9AC80A6A;
 Sun, 31 May 2020 18:30:57 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Sun, 31 May 2020 18:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=06crlrRkH4ZShLOIeGRbGNUpy+YS
 wnsfjyy8abD7jwY=; b=dRT/N9JT2Q+FJvtt5js0XkdRETQbFGTSTNbVnLa3H8ii
 IE5N+JIddFJrubJpcUR1t4dzyQ23lylffKgJ/V0CS+uaF0H2HjySrRlVvY6Gg8B3
 XPELpveOpD9zLvyVJ4TTCzS3XXxSInCLEqsxY3FIIcx+N41K4gBFALhjK3e//yjJ
 hD1+5KlFB4Aer0DgF0C+SsOkHWozNHbIdagh7mbDkVQ0woc8RevUhdDZ5Nt6ijQa
 OuTOCBA0yUXSakcOmQkznYDymFIlq0EjVijPLdN9TZNCKgfp7JXnHphUAwqr9h2C
 m+mvLPQJohy49X2/ZISiYOxfddgXtBN4uG9M3gxiAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=06crlr
 RkH4ZShLOIeGRbGNUpy+YSwnsfjyy8abD7jwY=; b=3FC1tD5lrBwZvaSz0tJ4Vo
 bdboL4B9wEkEhZn5gjG5LV1ErB0Eir/YzfdGcAHuk0hIaKJBdeu0GcRzwmcn4xk8
 XpBFEg32xrMi51OyUqCf7vhbbP1QHFQztdqShZUe7C9cnsLJf8QorMG+Z5nKkQhu
 x9eA2oiSxxEe4LRFFLdHcO9YBfBEjKFM7GoEzS0RU+3jMwqPuFE8uusaGtylGd76
 9EVe20xQZ4BmLszQYnYsY0yUmz9TL82ezYSe8FPJWKAyPla5ZZ9BXWhtc5OWeYiq
 g51zZ1Bzsqc3ijxFVNZFGDV7OYKBCUw4/EPgejpo6xR6KX5PzwnEekYbyaNazKEA
 ==
X-ME-Sender: <xms:HzDUXuIYsfirAas38TSFrEXw5V-7sOwktRf9NehZNKAl_cQiTPHAGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefgedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepteefheefhefhleehuddthedufeefjeduueffledtgeejgeek
 gedvueekgfeggeefnecuffhomhgrihhnpehlihhnuhigqdhfohhunhgurghtihhonhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
 rghnihgvlhesohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:HzDUXmLAEDRmAK5nFjUMyKF1D-4ztQnEjiDyQBB5IF5KUibyk_0Aew>
 <xmx:HzDUXutNsoUWcSd1crNkF-iBmR-670ZNJteOv1WW_le1Q2hZ3lHtZA>
 <xmx:HzDUXja7cwJB4kwtcGRjKUPwAy9aZNGAoDSqYT2Pay_HrcdVc6uaAA>
 <xmx:ITDUXkVJ2sHOvOQ4loXS-yLzA729OYsrQ7EDIBiFxSJ_wP3INjq1dg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3E4C8C200A4; Sun, 31 May 2020 18:30:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-504-g204cd6f-fm-20200527.002-g204cd6f2
Mime-Version: 1.0
Message-Id: <4205b197-b964-451e-bc41-59b35d1dd233@www.fastmail.com>
In-Reply-To: <20200531204205.GI31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <20200530192212.GG31009@gate.crashing.org> <2956705.fEcJ0Lxnt5@sheen>
 <20200531204205.GI31009@gate.crashing.org>
Date: Mon, 01 Jun 2020 00:29:56 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>,
 musl@lists.openwall.com, "Will Springer" <skirmisher@protonmail.com>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Content-Type: text/plain
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
Cc: eery@paperfox.es, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt via binutils <binutils@sourceware.org>, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 31, 2020, at 22:42, Segher Boessenkool wrote:
> On Sun, May 31, 2020 at 12:57:12AM +0000, Will Springer wrote:
> > On Saturday, May 30, 2020 12:22:12 PM PDT Segher Boessenkool wrote:
> > > The original sysv PowerPC supplement
> > > http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf
> > > supports LE as well, and most powerpcle ports use that.  But, the
> > > big-endian Linux ABI differs in quite a few places, and it of course
> > > makes a lot better sense if powerpcle-linux follows that.
> > 
> > Right, I should have clarified I was talking about Linux ABIs 
> > specifically.
> 
> That was the link you deleted.
> 
> > > What patches did you need?  I regularly build >30 cross compilers (on
> > > both BE and LE hosts; I haven't used 32-bit hosts for a long time, but
> > > in the past those worked fine as well).  I also cross-built
> > > powerpcle-linux-gcc quite a few times (from powerpc64le, from powerpc64,
> > > from various x86).
> > 
> > There was just an assumption that LE == powerpc64le in libgo, spotted by 
> > q66 (daniel@ on the CC). I just pushed the patch to [1].
> 
> Please send GCC patches to gcc-patches@ ?

FWIW, that patch alone is not very useful, we'd need to otherwise patch libgo to recognize a new GOARCH (as right now it's likely to just use 'ppc' which is wrong).

That said, we'll get back to you with any patches we have. One I can already think of - we will need to update the dynamic linker name so that it uses ld-musl-powerpcle.so instead of powerpc (musl needs to be updated the same way by adding the subarch variable for the 'le' prefix).

> 
> > > Almost no project that used 32-bit PowerPC in LE mode has sent patches
> > > to the upstreams.
> > 
> > Right, but I have heard concerns from at least one person familiar with 
> > the ppc kernel about breaking existing users of this arch-endianness 
> > combo, if any. It seems likely that none of those use upstream, though ^^;
> 
> So we don't care, because we *cannot* care.

Well, that's the reason this thread was opened in the first place - to call out to any potential users, and synchronize with upstreams on a single way forward that all upstreams can agree on, since this effort requires changes in various parts of the stack. We don't want to hog changes locally or otherwise do any changes that would be in conflict with upstream projects, as that would mean needlessly diverging, which only means trouble later on.

> 
> > > A huge factor in having good GCC support for powerpcle-linux (or
> > > anything else) is someone needs to regularly test it, and share test
> > > results with us (via gcc-testresults@).  Hint hint hint :-)
> > > 
> > > That way we know it is in good shape, know when we are regressing it,
> > > know there is interest in it.
> > 
> > Once I have more of a bootstrapped userland than a barely-functional 
> > cross chroot, I'll get back to you on that :)
> 
> Cool!  Looking forward to it.
> 
> Thanks,

Either way, thanks for the hints so far.

> 
> 
> Segher
>

Daniel (q66)

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2571EB230
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 01:28:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bWZP0Q8CzDqRc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 09:28:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=fx+oawfU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3aflJQhj; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bWXl3w14zDqLp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 09:27:02 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 559E45C00F2;
 Mon,  1 Jun 2020 19:26:59 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 19:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=lPj5FklBSOLuI2eU5Vq+QLjFIMfl
 SpoWSoBj6yr8rRc=; b=fx+oawfUpIxQG+oWdsVfr58OXgosRU12IpCh8aiVG9sE
 tMu/EtMvdd3NwVFMyOu+46RoBsq7dOfxYavGZULdILjLOoV52ypWmcNN/ZASi7Hv
 t5BitJehlJK3MEL1/xr2Z2qb4QippBENRo7omm1XTbFY6oWykypKwB1ERjg7l4Th
 oVr9IFQEgkk+Sq10T36pRQbF4Di2B1vaqANDA7S9OxAi+Q4Snn5549H7EmP+6aaI
 nvR1Z/xkxvxQ2D8FTOG85xEPu1SY/SojLZdtIHObAtnKzBKKNDAvBBWJYaP0NxaL
 pq4PhhW9oX4d15ubLxdvET5HpILXkl46ecS6YjAB8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lPj5Fk
 lBSOLuI2eU5Vq+QLjFIMflSpoWSoBj6yr8rRc=; b=3aflJQhjSMy+fE6kWo2ug1
 /VjU7Eo2ZyjduVqpjpkfNtOJSmFO2HsGv0coxRzVyW3KVHk2vrZfK8N1PwDYj4O+
 sIa3SnWikBCtEalH4Jr4+10vAB8AdmU3ZFwjqlG/o8STPyQ95tVttBvKBdrgrBDi
 ZbrLC7+m5MdKeVjf9z/g09ihD09ofoSbExZePUyInz9WS6up02j1FsMZEmOSvb89
 nSD2KvM2sPBaJmhdxBzI7ACDLeW+QtQbZYEmW+f1qA13uF8IwF8JCz3sRD/ELq9V
 oxbWh6FuN7NUsLRag2ETuaHV1Oe8fZPVe8e/5RN1RxKDW6aIf8XUzxCxktytx4+w
 ==
X-ME-Sender: <xms:wo7VXvFUvcU_t2gJ6KSgC-59XtJzbgzNhWYylraRlLioB4n7t28mIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepueelgeeljeeigeeghefgtddtveeuhedvheeuteeiveetledu
 vdevvdfgtdeigfdvnecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhes
 ohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:wo7VXsXMD-DOJcMHQHCzMkF8qoI7x9cfwXhuPqShnfC_AA5nx8Jl4Q>
 <xmx:wo7VXhKGryuRRWghWmGYXI-TxO735KnMyzpaxz9JzkO1HWszDYPJaQ>
 <xmx:wo7VXtGtq8VWIyfRO0bsrCHeKi_IUhLsxyURgRdr7IDvXngujzXhWA>
 <xmx:w47VXry4eRWj1fv_lK3ttVyOxh8HTXyyyQod70GA8GEhu-SouReE3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E5238C200A4; Mon,  1 Jun 2020 19:26:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
Date: Tue, 02 Jun 2020 01:26:37 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Joseph Myers" <joseph@codesourcery.com>,
 "Will Springer" <skirmisher@protonmail.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 1, 2020, at 23:28, Joseph Myers wrote:
> On Fri, 29 May 2020, Will Springer via Binutils wrote:
> 
> > Hey all, a couple of us over in #talos-workstation on freenode have been
> > working on an effort to bring up a Linux PowerPC userland that runs in 32-bit
> > little-endian mode, aka ppcle. As far as we can tell, no ABI has ever been
> > designated for this (unless you count the patchset from a decade ago [1]), so
> > it's pretty much uncharted territory as far as Linux is concerned. We want to
> > sync up with libc and the relevant kernel folks to establish the best path
> > forward.
> 
> As a general comment on the glibc side of things, if this is considered 
> like a new port, and it probably is, the same principles that apply to new 
> ports apply here.
> 
> There's a general discussion at 
> <https://sourceware.org/glibc/wiki/NewPorts>, although much of that is 
> only applicable when adding new CPU architecture support.  More specific 
> points include that new 32-bit ports should default to 64-bit time and 
> file offsets from the start, with no support for 32-bit time or offsets 
> (meaning that if you want to use this with some kind of library call 
> translation, the library call translation will need to deal with 
> corresponding type size conversions).  And a new port should not be added 
> that uses the IBM long double format.  You can use IEEE binary128 long 
> double, possibly with an ABI similar to that used on powerpc64le, or can 
> use long double = double, but should not support IBM long double, and 
> preferably should only have one long double format rather than using the 
> glibc support for building with different options resulting in functions 
> for different long double formats being called.

Are you sure this would be a new port? Glibc already works in this combination, as it seems to me it'd be best if it was just a variant of the existing 32-bit PowerPC port, sharing most conventions besides endianness with the BE port.

128-bit IEEE long double would not work, since that relies on VSX being present (gcc will explicitly complain if it's not). I'd be all for using 64-bit long double, though (musl already does, on all ppc ports).

While we're at long double, I'd actually be interested in transitioning the existing big endian ports in Void (64-bit and 32-bit, neither has VSX baseline requirement in my case) to using 64-bit long double, abandoning the IBM format altogether (little endian will transition to 128-bit IEEE long double once it's ready on your side, as that assumes POWER8 baseline which includes VSX).

What would be the best way for me to proceed with that? I actually experimented with this, using the old glibc compat symbols from pre-ibm128 times, and I mostly had it working, except I haven't managed to find a way to switch the default symbols to 64-bit ones, which is problematic as linking everything against nldbl_nonshared is fragile and potentially quirky (breaks dlsym, function pointer equality across libraries, etc).

There is also one more thing while we're at this. The 64-bit big endian Void port uses the ELFv2 ABI, even on glibc. This is not officially supported on glibc as far as I can tell, but it does work out of box, without any patching (things in general match little endian then, i.e. ld64.so.2 etc, but they're big endian). Is there any chance of making that support official?

> 
> -- 
> Joseph S. Myers
> joseph@codesourcery.com
>

Daniel

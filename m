Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6211EEDA4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:09:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dKgK6swqzDqwj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 08:09:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=RLKI3scQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=c8cxnA3j; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dKdM0xk1zDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 08:07:18 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0507AABE;
 Thu,  4 Jun 2020 18:07:14 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Thu, 04 Jun 2020 18:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=/DcpCQByEYMYqaGpa2onU3F76Qsu
 C3VUuhoL/afHAT0=; b=RLKI3scQ32Y+d8NTwWwKCH/wB3ua1CwVg1EfJX+K5gTX
 IaTCCMrAEZVPim4rV3KbeCoVV00tMlaxcUl0V0HBLXcx+IBljVy82/QjcEWoM6q2
 VtEN2aXFltkL/tQG/cvcMD2traD+LZ4S5H+ItNXHTBOsAn1Erre/ywEPDzaTBPEd
 n7XvzCWzEMkFxMFsmZzHH8FY38E6XZpGLu4Wuk80cZgBSx3VqXyCegizmvg8Afof
 Vo2XfCf79wDvCsfrzPlfC/NQCZA9aoV6yOUj3jtY8Tm/ui3HPu2cE9ln4x0QKb1X
 SCVSkk6mZ3L0xbtTNUQ3MPWPuHtDKjGzQ8g8zrDwuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/DcpCQ
 ByEYMYqaGpa2onU3F76QsuC3VUuhoL/afHAT0=; b=c8cxnA3ja4TYTecPNOALGI
 Jxx7QTp+ZWiTui5L7akABVHlQMDWl+dJks3UchCxeSW3o0gq37qkOXnvVxfAYM6x
 MN8jRwo6DAFBMldmRY9x1NZOkdiWw4pJWqiZ0IaP2ITOpJvbTdKlaGFxesnF7TUs
 fRE2X5c+Cw69+0ciiboPnH8j66j5H3uNkOu5pHYhDlN+8tSY0KNQI4Ro1wk/j9dt
 gdH8Ruo1awLT+p4cngkvulqAoVhhUGARtwDF+PizaMd/Xg62dsWog+BQmxPGApTj
 4tmWn8nL344wolW/3qm6P9kAsuexS4c/WXKiZjSb8oDIJnDUTyR30CegUIe3g6ZA
 ==
X-ME-Sender: <xms:iXDZXnDSyPWHX2o84U2Mk_HVyX321cucFgwM_mbL9uEAsIqv1-1Clg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegvddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepieevvddvjeehiedtvdelgfeuiefhgfetvdeuhfffteehuddu
 fffgudfhfffhleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepuggrnhhivghlsehotghtrghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:jHDZXthVyHrutuNo_mSPCKZ0nW0UGzNoU7auFQcdUSuMcA_c7_cdYw>
 <xmx:jHDZXin17K4j-K2apPM9KMe8Z7MsT13zXv_pjpfVquqwygE020X-Ag>
 <xmx:jHDZXpyk1jPgWuZOHBYiwaIRthDgjbOsNA2NiOUJZCp5fWjGGGKtpA>
 <xmx:knDZXid6vEM9UPEYivNB_NOMg-47Oev7nN5GyhGr16Sgqn6pGGVG9Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 92CEBC200A5; Thu,  4 Jun 2020 18:07:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <2d17c697-1ce2-4bea-b55c-6c424eb00d7b@www.fastmail.com>
In-Reply-To: <20200604215511.GB28641@pbcl.net>
References: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604215511.GB28641@pbcl.net>
Date: Fri, 05 Jun 2020 00:06:41 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Phil Blundell" <pb@pbcl.net>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Will Springer <skirmisher@protonmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 4, 2020, at 23:55, Phil Blundell wrote:
> On Thu, Jun 04, 2020 at 10:39:30PM +0200, Daniel Kolesa wrote:
> > Is there *any* way I can take that would make upstreams of all parts 
> > of the toolchain happy? I explicitly don't want to go back to ELFv1. 
> > While at it, I'd like to transition to ld64 long double format, to 
> > match musl and improve software compatibility, which I feel will raise 
> > more objections from IBM side.
> 
> Although I don't pretend to understand all the nuances of your port, and 
> in particular I have no idea what the thing about "ld64 long double 
> format" means, this doesn't sound like a particularly unusual situation.  
> If I understand correctly, you are in the position of essentially 
> wanting to implement the calling-standard part of the ABI on hardware 
> that isn't capable of implementing the full ABI as documented.

Well, the ld64 part is a separate issue. Defining a new long double ABI would break the ELFv2 ABI, since ELFv2 says long double must be 16-byte, of either IBM double-double format or IEEE754 binary128 :)

However, when I was talking about ELFv2 on 970 being a subset, I meant with the IBM double-double format, which has been present since glibc 2.4 at least, and doesn't require any vector functionality (it works even on 32-bit PowerPC)

So, defining a new long double ABI would indeed be a change compared to standard ELFv2. But, if we were doing a new port anyway, I think it'd be potentially worth it.

> 
> If that's the case then, depending on exactly what instructions are
> missing, I think your choices are:
> 
> 1a. Define your own subset of ELFv2 which is interworkable with the full 
> ABI at the function call interface but doesn't make all the same 
> guarantees about binary compatibility.  That would mean that a binary 
> built with your toolchain and conforming to the subset ABI would run on 
> any system that implements the full ELFv2 ABI, but the opposite is not 
> necessarily true.  There should be no impediment to getting support for 
> such an ABI upstream in any part of the GNU toolchain where it's 
> required if you can demonstrate that there's a non-trivial userbase for 
> it.  The hardest part may be thinking of a name.

Yes, this is the approach I would like to take.

> 
> 1b. Or, if the missing instructions are severe enough that it simply 
> isn't possible to have an interworkable implementation, you just need to 
> define your own ABI that fits your needs.  You can still borrow as much 
> as necessary from ELFv2 but you definitely need to call it something 
> else at that point.  All the other comments from 1a above still apply.
> 
> 2. Implement kernel emulation for the missing instructions.  If they
> are seldom used in practice then this might be adequate.  Of course,
> binaries that use them intensively will be slow; you'd have to judge
> whether this is better or worse than having them not run at all.  If
> you do this then you can implement the full ELFv2 ABI; your own
> toolchain might still choose not to use the instructions that it knows
> are going to be emulated, but at least other binaries will still run
> and you can call yourself compatible.
> 
> 3. Persuade whoever controls the ELFv2 ABI to relax their requirements.
> But I assume they didn't make the original decision capriciously so
> this might be hard/impossible.  ABI definitions from hardware vendors
> are always slightly political and we just have to accept this.

IBM has their commercial interests here and I don't think it'd be wise to take this kind of path. Implementing a new variant would probably be better; if we were documenting such differences, it'd probably be worthwhile to sync up with musl, since it'd be exactly the same ABI.

> 
> FWIW, we faced a similar situation about 20 years ago when the then-new 
> ARM EABI was defined.  This essentially required implementations to 
> support the ARMv5T instruction set; the committee that defined the ABI 
> took the view that requiring implementations to cater for older 
> architectures would be too onerous.  It was entirely possible to 
> implement 99% of the EABI on older processors; such implementations 
> weren't strictly conforming but they were interworkable enough to be 
> useful in practice, and the "almost-EABI" was still significantly
> better than what had gone before.
> 
> Phil
>

Daniel

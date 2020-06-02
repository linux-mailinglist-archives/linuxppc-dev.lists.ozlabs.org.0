Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 846901EB296
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 02:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bXYf3g5VzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 10:12:54 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=fm3 header.b=pkU/tkxX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=d/+azhY7; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bXWz4qhmzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 10:11:27 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 50F025C014D;
 Mon,  1 Jun 2020 20:11:25 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 20:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=nE9WDmKoox2eCpfIvJhS+C7GKX9i
 IDXJZVhx4DlAhyE=; b=pkU/tkxXCawfpz5wTZ+vipgEjrEEjMydL+GFQ28BMkf4
 of5RNeZrlQyXkUkUZYaE9I16Knp/8tK54M80QrQ6bGwmvISTwiVmVPyLVHZRfxNU
 kkxlRWx+iZj+4Cbo3ABBbeg9vHv3E5o58zp1wyKHyDf5yKs907qbpBqLmg7z/ldS
 3hX/do8AUHV7rNHszvhO76EKC0/XRsiwxv0pxlbBEISJue59QTc41dBvql6KonHY
 dzICLz5P8Njr68GuVrpBd8lxZ9j0YbbSX12r0EE88dz/FZJZ6VNUqh5/dsoAH3rL
 gMeYTrmIVzM/3rom0S/xT1+Nzy7P/zLk/y2f3VZIBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nE9WDm
 Koox2eCpfIvJhS+C7GKX9iIDXJZVhx4DlAhyE=; b=d/+azhY7gvIKJXI9LwuIWs
 Db8MM2uk5ddccVqgG5Swy/0nV3bx5hCw+eBZT3sPASv1qmqjcWSMfCtEyJhAFvON
 7I0fzV4HunpjWA2yWlq3kq1C2kZTOLjm5h32+OMNmB3bXzgzF/5/J3JWZtWwL42O
 foqJFee3NzyuE3KBt3383RAGi2VpBGtu7xKB4lN4XgK9dFS7kvxPS8Um5yfAdME3
 h+RSbAqpiayVERzVg2YwhR8pZy7qJgSQHhSFjp0+Z+HEXYVHGn4wwadBS77v69Wn
 tFz5KZ3xnXKEwtLMVJMFqDc/Lm5hHikG9KbQvdWGKdiH+48LQC3fcf6pjFOYCdCQ
 ==
X-ME-Sender: <xms:K5nVXscAWdAFD0h14tLGurbCcKHoy_pEwOixJ0_AUwcELTRXP3AEMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepueelgeeljeeigeeghefgtddtveeuhedvheeuteeiveetledu
 vdevvdfgtdeigfdvnecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhes
 ohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:K5nVXuM6Aj4v4O44EVxFpWhY-OfNXsgvAL28Ixi00xvS6g3SPAYMpw>
 <xmx:K5nVXthcf4LQJIDhvcjWIJteBFTajfNQGmchlEAFs_uKosiO39-Cnw>
 <xmx:K5nVXh8EqCmIfqzckE_7jn6klSWCn31Punilci7VnKDkAYdj1X1ubQ>
 <xmx:LZnVXqK0Et0d9Wqv80HnM0Yq-sz6RWycGrQQR8A_shySB_nClpP_SA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A006C200A4; Mon,  1 Jun 2020 20:11:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
Date: Tue, 02 Jun 2020 02:11:03 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Joseph Myers" <joseph@codesourcery.com>
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
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 2, 2020, at 01:45, Joseph Myers wrote:
> On Tue, 2 Jun 2020, Daniel Kolesa wrote:
> 
> > Are you sure this would be a new port? Glibc already works in this 
> > combination, as it seems to me it'd be best if it was just a variant of 
> > the existing 32-bit PowerPC port, sharing most conventions besides 
> > endianness with the BE port.
> 
> The supported glibc ABIs are listed at 
> <https://sourceware.org/glibc/wiki/ABIList>.  This would be a new ABI, 
> which should have a new ABI-and-architecture-specific dynamic linker name 
> (all new ports are expected to have a unique dynamic linker name for each 
> ABI, to support systems using multiarch directory arrangements), new 
> symbol versions and avoid legacy features such as 32-bit time or offsets 
> or IBM long double.
> 
> > 128-bit IEEE long double would not work, since that relies on VSX being 
> > present (gcc will explicitly complain if it's not). I'd be all for using 
> 
> The minimum supported architecture for powerpc64le (POWER8) has VSX.  My 
> understanding was that the suggestion was for 32-bit userspace to run 
> under powerpc64le kernels running on POWER8 or later, meaning that such a 
> 32-bit LE port, and any ABI designed for such a port, can assume VSX is 
> available.  Or does VSX not work, at the hardware level, for 32-bit 
> POWER8?  (In which case you could pick another ABI for binary128 argument 
> passing and return.)

POWER8 may have VSX (well, actually POWER7 and newer has VSX and can run LE, but glibc does not support this, musl potentially does), but the overall assumption here is that the resulting binaries should eventually not be limited to being just userspace under ppc64le, but should be runnable on a native kernel as well, which should not be limited to any particular baseline other than just PowerPC.

While it should in theory be possible to do IEEE ldbl128 using a different ABI, I don't really see any benefit in this - for one, the baseline hardware doesn't support on any level, it would mean further complicating the ABI, and it would require explicit support in the compiler, which currently doesn't exist. Using 64-bit long doubles sounds like a much better way out to me.

> 
> > There is also one more thing while we're at this. The 64-bit big endian 
> > Void port uses the ELFv2 ABI, even on glibc. This is not officially 
> > supported on glibc as far as I can tell, but it does work out of box, 
> > without any patching (things in general match little endian then, i.e. 
> > ld64.so.2 etc, but they're big endian). Is there any chance of making 
> > that support official?
> 
> If you want to support ELFv2 for 64-bit big endian in glibc, again that 
> should have a unique dynamic linker name, new symbol versions, only 
> binary128 long double, etc. - avoid all the legacy aspects of the existing 
> ELFv1 port rather than selectively saying that "ELFv1" itself is the only 
> legacy aspect and keeping the others (when it's the others that are 
> actually more problematic in glibc).

Again, the BE port cannot use binary128 long double, at least not with the same ABI as on POWER8, since it runs on all 64-bit PowerPC systems starting with 970 (G5, and potentially even POWER4 if built without AltiVec). Unique dynamic linker names are complicated, since as it is, glibc uses ld64.so.1 for ELFv1, and ld64.so.2 for ELFv2. (on 32-bit PowerPC, it's ld.so.1, and uses the SVR4 ABI which is not related to either the AIX/ELFv1 nor the ELFv2 ABIs) If we were to introduce new ports, what would those use? ld64.so.3 for BE/v2? ld.so.2 for LE/32-bit? I can see the reason for a new dynamic linker name though (multi-arch setups).

However, the effective difference between the ports would be rather minimal, if any, as far as I can see. As I already said, we have a whole glibc/ELFv2/BE system, with nearly all of the existing Linux userland covered by the distro, and there haven't been any issues whatsoever.

> 
> -- 
> Joseph S. Myers
> joseph@codesourcery.com
>

Daniel

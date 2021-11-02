Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0294425A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 03:26:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjv0n07Vtz2y7K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 13:26:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=G6Uz3wXV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G6Uz3wXV; 
 dkim-atps=neutral
X-Greylist: delayed 319 seconds by postgrey-1.36 at boromir;
 Tue, 02 Nov 2021 13:25:54 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hjv020ZLNz2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 13:25:53 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 11F1F5C026F;
 Mon,  1 Nov 2021 22:20:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 01 Nov 2021 22:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wJqx1F
 TB4U21ng3981TrQ3zWspp708VpJ0rineHzSiw=; b=G6Uz3wXVuCG/IdWN9YWAmd
 Q1U2TlHQb+z5EI4HQU01EqsMXaBUGT1AawqBJddPXIFFs4AQA7Va6abLDaw2R2hs
 upbh4SZQvASMQkqLffXpmySS1irJjrOezxhNOj5KJYDB3pKBO0mUl+YdpvBWjj3U
 NrSkIMmuQOUHjB7epeep9lClEeXGX5mokCQyjn5CYgZE9jqO8CMWOE+x8AGqR/Mi
 W/Mc21Ind1LuyUUDyWYzKZK3qgsSRHOFGrIgfm/lIS7FJ4yrnrkImimUpzVfnU8f
 6aRcfF6DaGZGzn9B8TKV3IbLy7tQXrABGMNj/jfW0ic/8+w1DJgA4fVtTh+Tff8g
 ==
X-ME-Sender: <xms:bKCAYbu_VbCmednvNR3jybw5SGe_5BD6BvZs0z1iO-P4UK242R1Ajg>
 <xme:bKCAYcfAHlEoNfbocVKjogt4ioYhd21-0LKHEeI6EZzS-naqTQESZGC1e0oAXJdvF
 iizzvO4eH4aTfkBOSI>
X-ME-Received: <xmr:bKCAYew2H2xHJIH2KESxK6tfsNBYi5tWquUuL158TYOvLoC8Ja0bqO38-oQXcb4ZvoikXjoFN4c1Z6HzvgKaf3mbhb21Y45AouI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehgedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepkeevvedtkeeftdefhfdvgfelleefhfdtfeeiteejjeevgffhudefjeekhefg
 uedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:bKCAYaPWFaPZOUuQK9_QWTargLLk3X3zKImLhpd3k7bLwPMzOYX6sw>
 <xmx:bKCAYb-ZqoMNlj1vK1jB0Ft8_APo-9c9oXrFmLCAniLxs_wJW8UPVA>
 <xmx:bKCAYaWsvzSmJKEilN9DMCa5RSrSsXEVHEFqBD0oAqsiNId3P8ZDSw>
 <xmx:baCAYdJ_4YQYv9vaiypOiydQOh3mU4_NjfcQpDBdUc3DVSHmOOSnyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Nov 2021 22:20:25 -0400 (EDT)
Date: Tue, 2 Nov 2021 13:20:21 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Christopher M. Riedl" <cmr@linux.ibm.com>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
In-Reply-To: <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
Message-ID: <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christopher,

After many builds and tests, Stan and I were able to determine that this 
regression only affects builds with CONFIG_USER_NS=y. That is,

d3ccc9781560  + CONFIG_USER_NS=y  -->  fail
d3ccc9781560  + CONFIG_USER_NS=n  -->  okay
d3ccc9781560~ + CONFIG_USER_NS=y  -->  okay
d3ccc9781560~ + CONFIG_USER_NS=n  -->  okay

Stan also tested a PowerMac G3 system and found that the regression is not 
present there. Thus far, only PowerMac G4 systems are known to be affected 
(Stan's Cube and Riccardo's PowerBook).

I asked Stan to try v5.15-rc after reverting commit d3ccc9781560. 
Unexpectedly, this build had the same issue. So, it appears there are 
multiple bad commits that produce this Xorg failure, of which d3ccc9781560 
is just the first.

But there's no easy way to identify the other bad commits using bisection. 
So I've addressed this message to you. Can you help fix this regression?

Regards,
Finn

On Fri, 22 Oct 2021, Christophe Leroy wrote:

> ...
> > 
> > -------- Forwarded Message --------
> > Subject: Fwd: X stopped working with 5.14 on iBook
> > Date: Fri, 22 Oct 2021 11:35:21 -0600
> > From: Stan Johnson
> > To: Christopher M. Riedl <cmr@codefail.de>
> > CC: Finn Thain <fthain@fastmail.com.au>
> > 
> > Hello Christopher Riedl,
> > 
> > Please see the message below, in which a git bisect identifies a commit
> > which may have stopped X from working on some PowerPC G4 systems
> > (specifically the G4 PowerBook and Cube, possibly others).
> > 
> > I'm not sure how to proceed with further tests. If the identified commit
> > could not have caused the problem, then further testing may be needed.
> > Please let me know if you need any additional information.
> > 
> > Hopefully your e-mail filter will allow messages from yahoo.com addresses.
> > 
> > thanks for your help
> > 
> > -Stan Johnson
> > 
> > -------- Forwarded Message --------
> > Subject: Re: X stopped working with 5.14 on iBook
> > Date: Fri, 22 Oct 2021 11:25:14 -0600
> > From: Stan Johnson
> > To: debian-powerpc@lists.debian.org
> > CC: Riccardo Mottola <riccardo.mottola@libero.it>
> > 
> > On 10/14/21 9:21 PM, Stan Johnson wrote:
> > > ...
> > > Debian's 5.10.0-8 config file works (as expected) with Debian's 5.10.0-8
> > > kernel source.
> > > ...
> > > X works with 5.14 using a tuned config file derived from 5.13 testing.
> > > ...
> > 
> > Update:
> > 
> > The issue originally reported by Riccardo Mottola was that X wasn't
> > working on a PowerBook G4 using Debian's default
> > vmlinux-5.14.0-2-powerpc kernel. I was able to confirm that the X
> > failure also occurs on a G4 Cube. My G4 Cube has Debian SID,
> > sysvinit-core, Xfce and wdm installed. To test whether X works, I
> > disabled wdm, then I log in at the text console and run "startx". When X
> > fails, the screen goes blank and the backlight stays on; when X works,
> > the normal desktop comes up.
> > 
> > X works in mainline v5.12 built using a config file based on Debian's
> > config-5.10.0-8-powerpc.
> > 
> > X fails in mainline v5.13 built using a config file based on Debian's
> > config-5.10.0-8-powerpc.
> > 
> > With much help and advice from Finn Thain, I was able to run a bisect
> > using a config file based on Debian's config-5.10.0-8-powerpc, with
> > v5.12 "good" and v5.13 "bad".
> > 
> > $ git reset --hard
> > HEAD is now at 62fb9874f5da Linux 5.13
> > $ git bisect start v5.13
> > Updating files: 100% (12992/12992), done.
> > Previous HEAD position was 62fb9874f5da Linux 5.13
> > HEAD is now at 9f4ad9e425a1 Linux 5.12
> > $ git bisect bad v5.13
> > $ git bisect good v5.12
> > Bisecting: 8739 revisions left to test after this (roughly 13 steps)
> > > 85f3f17b5db2dd9f8a094a0ddc665555135afd22] Merge branch 'md-fixes' of
> > https://git.kernel.org/pub/scm/linux/kernel/git/song/md into block-5.13
> > 
> > After the bisect, git reports this:
> > 
> > ----------
> > 
> > d3ccc9781560af051554017c702631560bdc0811 is the first bad commit
> > commit d3ccc9781560af051554017c702631560bdc0811
> > Author: Christopher M. Riedl <cmr@codefail.de>
> > Date:   Fri Feb 26 19:12:59 2021 -0600
> > 
> >      powerpc/signal: Use __get_user() to copy sigset_t
> > 
> >      Usually sigset_t is exactly 8B which is a "trivial" size and does not
> >      warrant using __copy_from_user(). Use __get_user() directly in
> >      anticipation of future work to remove the trivial size optimizations
> >      from __copy_from_user().
> > 
> >      The ppc32 implementation of get_sigset_t() previously called
> >      copy_from_user() which, unlike __copy_from_user(), calls access_ok().
> >      Replacing this w/ __get_user() (no access_ok()) is fine here since both
> >      callsites in signal_32.c are preceded by an earlier access_ok().
> > 
> >      Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> >      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >      Link: https://lore.kernel.org/r/20210227011259.11992-11-cmr@codefail.de
> > 
> >   arch/powerpc/kernel/signal.h    | 7 +++++++
> >   arch/powerpc/kernel/signal_32.c | 2 +-
> >   arch/powerpc/kernel/signal_64.c | 4 ++--
> >   3 files changed, 10 insertions(+), 3 deletions(-)
> > 
> 

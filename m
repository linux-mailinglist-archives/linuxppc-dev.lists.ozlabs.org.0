Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2F61EEC5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 22:48:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dHts4HzvzDqsx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 06:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=RAxXaGYP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bn/EpETP; 
 dkim-atps=neutral
X-Greylist: delayed 422 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jun 2020 06:47:01 AEST
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dHrj2Vt4zDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 06:47:01 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id E46DC50C;
 Thu,  4 Jun 2020 16:39:52 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Thu, 04 Jun 2020 16:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=MUHn5s5Nt7GGkqN++AgnN3kqO2g2
 mXg1y0pbVUfJVho=; b=RAxXaGYPaDHVlTsCg7c6bk5/hdnUFoTM0zWfQeMAuVN+
 sQM7ylaBZHR0uZVXv1pGL5DRyspm2+zddgbcaBp+Z7Kh8/pJNpDjvZV69YvWXjG8
 jlvrD7/kH3N3j9ejwQsx0bOFagRLyJlWE1JzCLIZeMhWD5SBKbSPcL7iy6LvnuK0
 ZFxIPmy+6FDpen1sZAi36Wk9/yHLvR47YID51dPLUYk5Vq573/D9tMgE39/5/Ygr
 knwjcs8nnl9J4Ypv3o05+TNgZqbKgLlQpkWGu1anVotVj47vbEIkF9DIx2lgExia
 mXO7ORtTxmihDihAEC5Y0bBuIO/smlcNPfFITeMzfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MUHn5s
 5Nt7GGkqN++AgnN3kqO2g2mXg1y0pbVUfJVho=; b=bn/EpETPJIpWcqB1b3Uee1
 +fK8nlBBDfXpN6RKNORw0k1TLX/xwxSQMhZ0y9I4ceMzbD11ddApv2U9/QNCnlca
 aGdGVsPxw3pGpYxvM/nCyeTSKpmMkr7+4EzGbYa4emJuc5q7UuTD7Uu/sdM2zYcd
 9Tk/qEpAkoGQqxJalQRlJusMdhvE8593YNYffV7Z/tOyjAeswr0AkDglYa5d20LE
 D7I9XMIE1ES3XX7hyHImRIXhc92i0FVDwuVn6m/lHz9wXfRtsrjwFDT7oazfMuHA
 UvP3etZG+NcteyRJd68B8X6tv/dS2pUpiUwTedkRqASM3t4GVTGC/cgGvYCwqPcA
 ==
X-ME-Sender: <xms:F1zZXqVP-ZbKDVwaYBYADXrHMTwUGGoXmdL-7m9mcw3SzDMGZyZDcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeguddgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfffgr
 nhhivghlucfmohhlvghsrgdfuceouggrnhhivghlsehotghtrghfohhrghgvrdhorhhgqe
 enucggtffrrghtthgvrhhnpeeivedvvdejheeitddvlefgueeihffgtedvuefhffethedu
 udffgfduhfffhfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:F1zZXmlDxw8oVuwv7Wxv5fX9cwhNaU7xXBPQaMyS_vc1Lu6d8i-QBA>
 <xmx:F1zZXuZhlOja9tr-gT78GuPFjZ1-2t3zz2Cwgfpy1gPyjKpnm2bJUw>
 <xmx:F1zZXhW_DVBB1Wh95eEOOhslRp7DgXPPIDhzfiET7_-6jP5sISFJ2w>
 <xmx:GFzZXuV5HG6cAePppidEhZPcYr-iRoD1IRMH8hhGHb_2RZwSkewXUdRMQzM>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2756EC200A4; Thu,  4 Jun 2020 16:39:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
In-Reply-To: <20200604173312.GI31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
Date: Thu, 04 Jun 2020 22:39:30 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>,
 "Rich Felker" <dalias@libc.org>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 4, 2020, at 19:33, Segher Boessenkool wrote:
> On Thu, Jun 04, 2020 at 01:18:44PM -0400, Rich Felker wrote:
> > On Thu, Jun 04, 2020 at 12:12:32PM -0500, Segher Boessenkool wrote:
> > > On Tue, Jun 02, 2020 at 05:13:25PM +0200, Daniel Kolesa wrote:
> > > > well, ppc64le already cannot be run on those, as far as I know (I
> > > > don't think it's possible to build ppc64le userland without VSX in
> > > > any configuration)
> > > 
> > > VSX is required by the ELFv2 ABI:
> > > 
> > > """
> > > Specifically, to use this ABI and ABI-compliant programs, OpenPOWER-
> > > compliant processors must implement the following categories:
> > 
> > This is not actually ABI but IBM policy laundered into an ABI
> > document, which musl does not honor.
> 
> It is the ABI.  If you think it should be different, make your own ABI,
> don't pretend the existing ABI is different than what it is.  Thank you.
> 

Well then - in that case, what do you suggest that I do?

Void currently ships an ELFv2 (or apparently not, I guess) 64-bit big endian port that works on 970/G5 up. It is important to me that it stays that way (a large amount of users are running 970s, so introducing a VSX dependency means I might as well abandon the port entirely).

It currently works out of box - there are no changes required in glibc, and nearly the entire userland builds and works (about ~11500 out of ~12000 software packages, those that don't work either don't work on ppc64le either, or have issues related to endianness, or some other unrelated reason).

I'd like to eventually get this into a state where I don't have to worry about glibc arbitrarily breaking it - which means it would be necessary to stabilize it upstream. While I can probably maintain a downstream patchset when it comes to it, I'd much prefer if I didn't have to - but this sounds like an official ELFv2 glibc BE port would be impossible unless the VSX requirement (and thus IEEE 128-bit long double and so on) was in place, which would defeat the point of the port.

Is there *any* way I can take that would make upstreams of all parts of the toolchain happy? I explicitly don't want to go back to ELFv1. While at it, I'd like to transition to ld64 long double format, to match musl and improve software compatibility, which I feel will raise more objections from IBM side.

> 
> Segher
>

Daniel

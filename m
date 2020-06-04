Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8191EED77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:46:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dK8p467yzDqq0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 07:46:02 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=fm3 header.b=K3IvaUQ3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=QNUAOGdL; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dK6s5STdzDqpM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 07:44:20 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 861D5A16;
 Thu,  4 Jun 2020 17:44:16 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Thu, 04 Jun 2020 17:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=g8tHp7glaHEcWvNfjYzrolEbZelJ
 OxcgyjhmYsZZJYI=; b=K3IvaUQ3QUUcZKTpjyVNk9a4ygqI8k3d9bC2i2V910lE
 r0Moh22XI8XQmRm37SFD4pwQRqNHHBNW9RNnIqKSW2LyfO1+IpSOl8x1afL9YAeB
 6g82XJVmvQV6IV7sW6SJiBGbLx33XRUKD6rd15NQ4blpCyoQz4SVmPcwJt/WRGO+
 Reem2KAguHP6QYO8j2BP3OQ3evFAv7YCoN4n2PTQUs7Lle46DVXDNTg8q+AxheC6
 b0mewUHQD03TjWv4QoiaOdtzOH6hLBbAiivOl09HlEgQS+sFBY5Vz44aMrUqKdlb
 ZWQ75OHeqaT2PSNHMYwrOOqXpFBPOlcXVOxO438GeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=g8tHp7
 glaHEcWvNfjYzrolEbZelJOxcgyjhmYsZZJYI=; b=QNUAOGdL33p+j4YDM75n39
 H9SQiSDQEln4LGxOt7n9ga8FdwnLndBJhJ6Jo4ZO67AAnrihY/ZA3IBGKzr6c2qh
 ne0LA7DqyuLMaZ0z3pS/Ukx3bgV5Df+uyegSsc+DH78HZkLyCMZjoZh0LIWZZsEh
 gmLy+nMsEPwoV9z48fyfvIw67bQmUnUATRAHacI8JdakW3GDwoF87Xtn567g2cfx
 MrNsAxu/MnLN77GxOEfd2Lgf5Kkqw5oc58mi8TM/3NJK9AJhNlCThzj58K42icO+
 Ti51DhTTZluMU9QDQO0dRAgjK+x7MTGwgSRZXcIBr1fLLTnOyQ1octAXORfLSvaw
 ==
X-ME-Sender: <xms:LmvZXruzCpVLy-HqevhYFgXqFCV218f4DXLaUevKpHgUQ011EOTEWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeguddgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfffgr
 nhhivghlucfmohhlvghsrgdfuceouggrnhhivghlsehotghtrghfohhrghgvrdhorhhgqe
 enucggtffrrghtthgvrhhnpeeivedvvdejheeitddvlefgueeihffgtedvuefhffethedu
 udffgfduhfffhfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:LmvZXsekYjXtWTlq1Mf1-BWaiZ4QEPuw90sgzjMI5WqVROVQjfwD2g>
 <xmx:LmvZXuxK38sLsqQrJDnolEMKmblhiD71z3Wj6j55xBsS_0Zk04U55w>
 <xmx:LmvZXqNa1mlVTbEUqqYzfDuCYob4O2ZbnoUFQqXjVuBxvmkqtJq3Lw>
 <xmx:MGvZXsPu6o-oZKSLmKRxehcAXDm5oLPCZyZMN04dzKNUcbNXSjzmii3IX3o>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0A220C200A4; Thu,  4 Jun 2020 17:44:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
In-Reply-To: <20200604211009.GK31009@gate.crashing.org>
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
 <20200604211009.GK31009@gate.crashing.org>
Date: Thu, 04 Jun 2020 23:43:53 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Segher Boessenkool" <segher@kernel.crashing.org>, musl@lists.openwall.com
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, eery@paperfox.es,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 4, 2020, at 23:10, Segher Boessenkool wrote:
> Hi!
> 
> On Thu, Jun 04, 2020 at 10:39:30PM +0200, Daniel Kolesa wrote:
> > On Thu, Jun 4, 2020, at 19:33, Segher Boessenkool wrote:
> > > It is the ABI.  If you think it should be different, make your own ABI,
> > > don't pretend the existing ABI is different than what it is.  Thank you.
> > 
> > Well then - in that case, what do you suggest that I do?
> > 
> > Void currently ships an ELFv2 (or apparently not, I guess) 64-bit big endian port that works on 970/G5 up. It is important to me that it stays that way (a large amount of users are running 970s, so introducing a VSX dependency means I might as well abandon the port entirely).
> 
> You can just clearly document what ABI changes you use, and try to make
> sure that everyone who uses your distro / your tools / your ABI variant
> knows about it.  Telling your users that it is ELFv2, without telling
> them it is not compliant, namely X Y Z are different, is a bit of a
> disservice to your users, and worse to everyone else involved.

The thing is, I've yet to see in which way the ELFv2 ABI *actually* requires VSX - I don't think compiling for 970 introduces any actual differences. There will be omissions, yes - but then the more accurate thing would be to say that a subset of ELFv2 is used, rather than it being a different ABI per se.

The ELFv2 document specifies things like passing of quadruple precision floats. Indeed, VSX is needed there, but that's not a concern if you *don't* use quadruple precision floats.

> 
> If you always use -mcpu=970 (or similar), then not very much is
> different for you most likely -- except of course there is no promise
> to the user that they can use VSX and all instructions in ISA 2.07,
> which is a very useful promise to have normally.

Yes, -mcpu=970 is used for default packages. *However*, it is possible that the user compiles their own packages with -mcpu=power9 or something similar, and then it'll be possible to utilize VSX and all, and it should still work with the existing userland. When speaking of ABI, what matters is... well, the binary interface, which is the same - so I believe this is still ELFv2. A subset is always compliant with the whole.

That's why I'm worried when you speak of introducing a new ABI. As it is, we can benefit from having the compiler being generally the same (-mabi=elfv2 producing correct results even for 970) and retaining interoperability when people compile their own code for modern targets that cover the ELFv2 ABI as a whole. As I said, it's perfectly possible for somebody to run BE Void on their POWER9 machine, then compile their software for POWER9, and still have it work with the system packages built for 970 baseline. Pretty sure glibc will still provide optimized stuff (e.g. memcpy and so on) for the modern targets based on runtime detection, too.

So the "differences" in our case come down to "This is ELFv2, except you can't strictly assume that all features are present. In general that means no quad precision floating point for you if you want things to run on 970, since you don't have VSX regs"

> 
> > It currently works out of box - there are no changes required in glibc, and nearly the entire userland builds and works (about ~11500 out of ~12000 software packages, those that don't work either don't work on ppc64le either, or have issues related to endianness, or some other unrelated reason).
> 
> Very nice!
> 
> > I'd like to eventually get this into a state where I don't have to worry about glibc arbitrarily breaking it - which means it would be necessary to stabilize it upstream. While I can probably maintain a downstream patchset when it comes to it, I'd much prefer if I didn't have to - but this sounds like an official ELFv2 glibc BE port would be impossible unless the VSX requirement (and thus IEEE 128-bit long double and so on) was in place, which would defeat the point of the port.
> > 
> > Is there *any* way I can take that would make upstreams of all parts of the toolchain happy? I explicitly don't want to go back to ELFv1.
> 
> Oh absolutely, it sounds like things are in quite good shape already!
> It will safe a lot of grief on all sides if you make clear this is not
> "plain" ELFv2, and in what ways it differs.

See above.

> 
> Btw, if you use GCC, *please* send in testresults?  :-)

Yes, it's all gcc (we do have clang, but compiling repo packages with clang is generally frowned upon in the project, as we have vast majority of packages cross-compilable, and our cross-compiling infrastructure is gcc-centric, plus we enable certain things by default such as hardening flags that clang does not support). I'll try to remember next time I'm running tests.

> 
> > While at it, I'd like to transition to ld64 long double format, to match musl and improve software compatibility, which I feel will raise more objections from IBM side.
> 
> I have no idea what "ld64 long double" is?  Is that just IEEE DP float?
> Aka "long double is the same as double".  That is likely easier for new
> ports than "double-double", yes, even if the eventual goal should be
> IEEE QP float -- a much smoother transition.

Yes, I mean double == long double (like musl, and glibc before 2.4). I don't think there is any other viable way, since the IBM double-double format is legacy/often broken and real QP is constrained by hardware in this case. We're as much of a source distro as a binary distro, so a potential ppc64 build doesn't have to have any vector requirements at all, even if the default binary packages do.

I have a feeling that glibc would object to such port, since it means it would have to exist in parallel with a potential different ELFv2 port that does have a POWER8 minimal requirement; gcc would need a way to tell them apart, too (based on what would they be told apart? the simplest way would probably be something like, if --with-abi=elfv2 { if --with-cpu < power8 -> use glibc-novsx else use glibc-vsx } ...)

> 
> Same goes here: document it!  If your users know that the ELFv2 variant
> you give them is not *the* ELFv2, but it differs in some clear ways,
> everyone will be happier :-)

See above.

> 
> 
> Segher
>

Daniel

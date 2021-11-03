Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038C444AD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 23:27:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl1bX3SCMz2yg5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 09:27:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=hQwwldvi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out2-smtp.messagingengine.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=hQwwldvi; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl1Zr0fz9z2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 09:26:25 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 894355C01A1;
 Wed,  3 Nov 2021 18:26:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 03 Nov 2021 18:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RnJRH+
 x5RcNrgMW0Leu0Oyc3joplHtQNHM3XvnM4cgY=; b=hQwwldviuYhU8+RFnbyi+S
 y3FGeOMMP6cS6i5pQ17zOzBtVa2hjDmC0XYqOgTz2PXNMfrDBHA+w8/9kJmx9fyW
 xfFtgLo4SAIKdMLIy1C5cMgWLhg+kY4SUXTTp5MaQ8vC3xnXmY3uePN3vFhVrrYi
 sxv+aRIyrxClDZnTW/P6pnFiN6/BXDkcs3+dBe3z+wHZWcd/31emOYCuYXs4jEoa
 ETD1DOaDnxicGLxlJLbCwuHuIZR7fK7PQJbC0aBEaBWcvxt8HY/dkKUQBR8B0/Es
 mNnRWqK0+AU5W3XZjvajLEbSg6hfiKZ239DJeKuP3RI/yt3pOIAKYwNo4yBObJxw
 ==
X-ME-Sender: <xms:jAyDYUHMNhgI-lOgNDRceWgzjAcUwVequqEMfqP_eUpKJPtgaFiZ7Q>
 <xme:jAyDYdV5uXwQK65sV3v3ZrIw8MwHRjGqOOrBTqjg0P5rc7JSapQ7erTFdbDqUunJI
 uwdJfErXNlmym0imyI>
X-ME-Received: <xmr:jAyDYeKVKry2Pqz0KBCMBxE2qpGfKJtUhsHXeOCOwOlgJ1r3_zE2muB8S5zyz-pSfceH1P6I0gka0Rsh4E7G9LnJHWjyUoPj2rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:jAyDYWFJBs7E2dWC681h9iAMbUU_Dy8rvx_Jrmf0axfsIj1ujYGOqA>
 <xmx:jAyDYaUoSl5XpZLpuHwJdNN4G2b2wxiozquO6tazmW6NMwPp6DrG0g>
 <xmx:jAyDYZMoGtVeSadcCYtOayYytiUQ9pMdjZ-Guh5WdE3r4dmZqubyxg>
 <xmx:jAyDYXjFcU6_2cjsxCxJbkBURHpMFJXwBz1bMBjAjY3fDJY1R-VS2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 18:26:17 -0400 (EDT)
Date: Thu, 4 Nov 2021 09:26:10 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
In-Reply-To: <87cznh39lk.fsf@igel.home>
Message-ID: <3723058-87f1-cba7-c8ad-ac8dc5722abe@linux-m68k.org>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb__21333.0969143257$1635819996$gmane$org@nippy.intranet>
 <87cznh39lk.fsf@igel.home>
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>,
 Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Nov 2021, Andreas Schwab wrote:

> On Nov 02 2021, Finn Thain wrote:
> 
> > After many builds and tests, Stan and I were able to determine that this 
> > regression only affects builds with CONFIG_USER_NS=y. That is,
> >
> > d3ccc9781560  + CONFIG_USER_NS=y  -->  fail
> > d3ccc9781560  + CONFIG_USER_NS=n  -->  okay
> > d3ccc9781560~ + CONFIG_USER_NS=y  -->  okay
> > d3ccc9781560~ + CONFIG_USER_NS=n  -->  okay
> 
> On my iBook G4, X is working alright with 5.15 and CONFIG_USER_NS=y.
> 

Stan said his Cube has these packages installed:

# dpkg --list | grep Xorg
ii  xserver-xorg-core                      2:1.20.11-1
      powerpc      Xorg X server - core server
ii  xserver-xorg-legacy                    2:1.20.11-1
      powerpc      setuid root Xorg server wrapper

I gather that Riccardo also runs Debian SID.

Perhaps there is some interaction between d3ccc9781560, CONFIG_USER_NS and 
the SUID wrapper...

Does your Xorg installation use --enable-suid-wrapper, Andreas?

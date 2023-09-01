Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8378F6D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 03:46:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lov1Fblw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KNqq/RgJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcLVl1kpjz3c5H
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 11:46:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lov1Fblw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KNqq/RgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcLTn1MFXz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 11:46:04 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 1E29B5C007C;
	Thu, 31 Aug 2023 21:46:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 31 Aug 2023 21:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1693532760; x=1693619160; bh=/d
	C0IWBjlOk1cS3fGjjVkXrON0sGSFSdKCiYoOsqrQ0=; b=lov1FblwV5W5dXCW3y
	PyhVhnq8a0HDk2STH0OY515uM4YgLit8RKC+mD4F7jyfHGCKgqpDsj7HOrGzgonS
	RJIMYIS5rdW8g1u4KDce3nmlUJWX/3/Trdj8E+c4+hm8pdu0yemEOslldINe2KdB
	MDT3AMS0+xzBcGael/Q3t6mjl8uXNsXeg06Akf2qONFaDhXcGowEkvhKd+1WQQhZ
	8Av4E57X48mSAUu/XuACqnpalmTajcrvnzn+hudkGgPP2kbgh3RAzsAhtbPyUqSa
	YZ+2+KvrjOvv6zGJULSyuYuLibwJiiNufhd6YXiiiCaMHHlkZWe/ayOofE67Lcrl
	TNeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693532760; x=1693619160; bh=/dC0IWBjlOk1c
	S3fGjjVkXrON0sGSFSdKCiYoOsqrQ0=; b=KNqq/RgJqoO2rbDyJbQroiP9/8Y75
	WalTecsNOJmxB9enurBhjpkyDFqmOmnBfZcA8c1bYAnnZheb8B6wmEI7LXJgcZNf
	O69Wtof8HXrRjU0fANKAtKCK/yxhtHYuY6qBr5YuDj9XY+kR3vonsp0T/1LELLyX
	8gItwmw8Xqi/k9HiKjVi4G+i81a0qd48Ed9N42NGgUThYzNOTAGbut1DnMMsKIJE
	0TKStVwxfSq2VoqD/jVUA7/LpvJSFqf1HSqZ6N511RjAjfKj+2Y8vIKJbc6CJhqA
	mElnFI/nuJCtcWPjZDzRwun1SBjFmcnBldXMl/pSTxHkX4rOHq6ikTY2Q==
X-ME-Sender: <xms:V0LxZOt375m-3W8VOySJrjnjr9ObhvdGxUmMdn04bqErZBhnqNAkIQ>
    <xme:V0LxZDdNTU-ss4sANAeM8AHqiCe-VSw3RHijcQZZG-sP6F-M5Gn8lDenFsgvKXnwP
    uZjvtoszEM_GhndjvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeguddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:V0LxZJyiXQ8Yw6bEIvINotqM1dyr27oQwtGb7O0bxkKU_1Cz34gKPQ>
    <xmx:V0LxZJPQqR-wEf4eK6SJLtq6RvhCnuEyv9Rdmqn4M8yvLGIf6HG7Lg>
    <xmx:V0LxZO-keQqiLYWIaNv0YxcGr1Xh2g8vSrHDvNxCaGYfOshb7-coCQ>
    <xmx:WELxZOytphZ83V37PscaQPVRM8UhnBenszVdE_DQmhdZVq4tCXrP2A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 89BB0B6008D; Thu, 31 Aug 2023 21:45:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-701-g9b2f44d3ee-fm-20230823.001-g9b2f44d3
Mime-Version: 1.0
Message-Id: <6ddd3504-9833-4ac8-a30c-cd63494f7ed8@app.fastmail.com>
In-Reply-To: <5501ba80-bdb0-6344-16b0-0466a950f82c@suse.com>
References: <5501ba80-bdb0-6344-16b0-0466a950f82c@suse.com>
Date: Thu, 31 Aug 2023 21:44:06 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Helge Deller" <deller@gmx.de>
Subject: Re: Framebuffer mmap on PowerPC
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 31, 2023, at 10:41, Thomas Zimmermann wrote:
> Hi,
>
> there's a per-architecture function called fb_pgprotect() that sets 
> VMA's vm_page_prot for mmaped framebuffers. Most architectures use a 
> simple implementation based on pgprot_writecomine() [1] or 
> pgprot_noncached(). [2]
>
> On PPC this function uses phys_mem_access_prot() and therefore requires 
> the mmap call's file struct. [3] Removing the file argument would help 
> with simplifying the caller of fb_pgprotect(). [4]
>
> Why is the file even required on PPC?
>
> Is it possible to replace phys_mem_access_prot() with something simpler 
> that does not use the file struct?

What what I can tell, the structure of the code is a result of
these constraints:

- some powerpc platforms use different page table flags for
  prefetchable vs nonprefetchable BARs on PCI memory.

- page table flags must match between all mappings, in particular
  here between /dev/fb0 and /dev/mem, as mismatched attributes
  cause a checkstop. On other architectures this may cause
  undefined behavior instead of a checkstop

It's unfortunate that we have multiple incompatible ways
to determine the page flags based on firmware (ia64),
pci (powerpc) or file->f_flags (arm, csky), when they all
try to solve the same problem here.

Christophe's suggested approach to simplify it is probably
fine, another way would be to pass the f_flags value instead
of the file pointer.

      Arnd

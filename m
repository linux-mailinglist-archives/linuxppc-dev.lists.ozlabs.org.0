Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15F76D6AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 20:19:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RS2lZDrq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xi6gI5pR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGKxk65YYz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 04:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RS2lZDrq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xi6gI5pR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGKwk45Y0z30Db
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 04:18:28 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 498BF3200754;
	Wed,  2 Aug 2023 14:18:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 02 Aug 2023 14:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1691000302; x=1691086702; bh=Sm
	MQ6kJN4Wc3hcGgVxP+bMiAcMtZCScse6Dh72DQZNY=; b=RS2lZDrqYqL/YCzd28
	LQCEyYTBpZ9AsOx0epUPG7MNbrjDFXtbn2z9kisIrwzEFRddS8DfdcM4pINxZ//S
	5OZE92Kstnns7ub7HeGv0fpTJBX8OtBSFKJpxGDUGHF8XRBobYAx/rMNGnyCjym7
	YMESHJFdKICPLHtuv6ikqbcVe3W7vyxG+OaoTho+CZi9nYIvCwjRJdKhf57NElLn
	jPBvbA2kRk8Sx+ttZ0omoSfqXeXMjP/gBLwz+9y5dTYLnxLIhGtXkGiqnOpt9v5m
	43bdfIu9/HZyez1rthW6GvPxKTxX20wVPxAZiNEZjpSFXabaFM6wVQdH0mFK2RUy
	vAKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691000302; x=1691086702; bh=SmMQ6kJN4Wc3h
	cGgVxP+bMiAcMtZCScse6Dh72DQZNY=; b=xi6gI5pRORVFWj2yXsvH8AwNVpnA9
	A5a1Fyq0dj4s0Io3/eZsSzAY4OFS64wWHck4CM0gPb81+pJadaLf00nsSoPmHJGI
	yqdSVZAjgY8ehq3RhWDC8UYbVMzAjmVMcHBwywcIOa99Qy8QIUW+xbMGwUSFU/Hs
	FsKW2jX4AqemuoL3171ZDDO0JyfwO5hM/zB1YSrSGeShaHj08n4uujRORratQFhl
	PdYVWLxvY+XY+sg3MZG5ljs1mFykrJFTKazhDfBDkPHOoXt9PCcCQyRrdFxl5fzU
	UzHNPG8eosDSYySxkWrL7sJIGGLzV7IY67xLvNFuQEpYFlAws4/AKP5Bw==
X-ME-Sender: <xms:7Z3KZCgwPzHXYeemGEu9Qyj5ErRzXXH7EmceR0J370__O_AtKGSjjQ>
    <xme:7Z3KZDCNARqZ3h2BImuDxS4dIQevS2UNF-oTbZUqXfYBpaiOyAILrbSyW8-38C9LE
    EfCTFet5V4DvB9mokg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:7Z3KZKGVIjfLGAQDf86B3N3SiiyttqfRRZrEnPxSrvNnVIeMTrgxGQ>
    <xmx:7Z3KZLTHd1_k1KnwARlCRCdU78UDy3la_61mG4Ce8f6O-CyIIGuYXA>
    <xmx:7Z3KZPyDn7GRtzeLKBJWaBVSepGHmVV8VtgKVnt7SFKOubhKGBQC1Q>
    <xmx:7p3KZGkolqmrhhVrqabX3Jmlg1oqsm7SuSv25c8SSN5llD02sVBiBQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F7D1B60089; Wed,  2 Aug 2023 14:18:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <dd48b4ff-1009-41fe-baf5-be89432c5d28@app.fastmail.com>
In-Reply-To:  <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
References: <20230801-bitwise-v1-1-799bec468dc4@google.com>
 <CAHk-=wgkC80Ey0Wyi3zHYexUmteeDL3hvZrp=EpMrDccRGmMwA@mail.gmail.com>
 <20230802161553.GA2108867@dev-arch.thelio-3990X>
 <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
Date: Wed, 02 Aug 2023 20:17:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Will Deacon" <will.deacon@arm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>
Subject: Re: [PATCH] word-at-a-time: use the same return type for has_zero regardless
 of endianness
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 2, 2023, at 19:37, Linus Torvalds wrote:
> On Wed, 2 Aug 2023 at 09:16, Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> We see this warning with ARCH=arm64 defconfig + CONFIG_CPU_BIG_ENDIAN=y.
>
> Oh Christ. I didn't even realize that arm64 allowed a BE config.
>
> The config option goes back to 2013 - are there actually BE user space
> implementations around?

At least NXP's Layerscape and Huawei's SoCs ended up in big-endian
appliances, running legacy software ported from mips or powerpc.
I agree this was a mistake, but that wasn't nearly as obvious ten
years ago when there were still new BE-only sparc, mips and powerpc
put on the market -- that really only ended in 2017.

> People, why do we do that? That's positively crazy. BE is dead and
> should be relegated to legacy platforms. There are no advantages to
> being different just for the sake of being different - any "security
> by obscurity" argument would be far outweighed by the inconvenience to
> actual users.
>
> Yes, yes, I know the aarch64 architecture technically allows BE
> implementations - and apparently you can even do it by exception
> level, which I had to look up. But do any actually exist?
>
> Does the kernel even work right in BE mode? It's really easy to miss
> some endianness check when all the actual hardware and use is LE, and
> when (for example) instruction encoding and IO is then always LE
> anyway.

This was always only done for compatibility with non-portable
software when companies with large custom network stacks argued
that it was cheaper to build the entire open source software to
big-endian than port their own product to little-endian. ;-)

We (Linaro) used to test all toolchain and kernel releases in
big-endian mode as member companies had customers that asked
for it, but that stopped a while ago as those legacy software
stacks either got more portable or got replaced over time.

Many Arm systems won't boot BE kernels any more because UEFI
firmware only supports LE, or because of driver bugs.
Virtual machines are still likely to work fine though.
I'm fairly sure that all Arm Cortex and Neoverse cores still\
support BE mode in all exception levels, OTOH at least Apple's
custom CPUs do not implement it at all.

     Arnd

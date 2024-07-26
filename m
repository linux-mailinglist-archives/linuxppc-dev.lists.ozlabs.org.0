Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C293D3F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 15:16:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ghjrTmDd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EF47Fbnm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVpD33ynvz3dPs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 23:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ghjrTmDd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EF47Fbnm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.152; helo=fhigh1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVpCL4hC1z3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 23:15:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 50449114011D;
	Fri, 26 Jul 2024 09:15:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 26 Jul 2024 09:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721999723; x=1722086123; bh=vmerSIvbbd
	JwhSoqOIXC2+RNPWABTiKzG+1CMpROaZc=; b=ghjrTmDdPDJjPGtsBL3GmDFdm2
	ZSBHeCrIQTA8d5RP5V/BWeM0BoUG41sbDKwyY7tmNlEx+73N936TJ9LuA+S/bR3m
	zrdmQFpRDJVVGosH+az8iD6LVLyRPAzkzQPBflA2nbFs1cQ57CMMAhWDK+tPz9d3
	H6bs+8aRAkn++KkCLIdVHEbgf/BXflmJ9lh6a9AL4g12NAODKMIXyA+za0cZmHsx
	JHQhlvTtF8wOk8SKaB6oo3bPPPI+L+HEh91YxjwonpY+6iC9uBsrpoB9AQcT9/yv
	o8JkiMpYSZIwrdjgc5stCOFVf9qH8PazJzkATwTdV6OuDcq8qYL7M6abBf5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721999723; x=1722086123; bh=vmerSIvbbdJwhSoqOIXC2+RNPWAB
	TiKzG+1CMpROaZc=; b=EF47FbnmLU+CJUubr/cPrjx4zEz1IOVRC4/g1UvlMAmq
	ZMd2zO3DP4DrRxlX35r4KyLsNy9iKiwVBRAHXB978/jGdMGgUeMWqc/xL1b8rulH
	Xn1W1B3IzOyf1g7fotJLffVtgt7Z64QvMH/8mpgWrn57aWAe0D1fCgBjNP74RoX2
	fyuGgeek9KBwPq6lS7r7eYIXE2UWIk4NJQnvFBWVHPUe+WrKuHA5EmnfNqkWd9VA
	nhjeLdwTFQUTRErtjhX9VjyrWV2831Qafhfv1qtiWw7Svw01sPYENmnozNx4Z2de
	UPA4EkbhuqDkch2HS6moVtxi4i1vPMyDMsBjnjroCQ==
X-ME-Sender: <xms:aqGjZncmek0d6DlX5rmfDs2Hcc7wlLiF6sd-quL8SMEpCzGM5GXXMA>
    <xme:aqGjZtNmO6ulIS3ch5Fvozb5Oq717545zCUQKC3Nu8_K28teDcgief867jgrfaJCf
    ZjdyQyiNMosqCejiDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieehgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:a6GjZgiykAIw5yRnIFqQsaa_mngBGf75_Xm0KqCEWbw5sZnXN4--UA>
    <xmx:a6GjZo9p0mtK0c5J0yrdyvtgk5e7n1iW6mzNkfbTbUnNBC6xEyX3_A>
    <xmx:a6GjZjswhYF-bomv4LRH6KedP5n9FyT3TSFva15cojTBjlSW6H6yrw>
    <xmx:a6GjZnEnVfADJzgstmkdjBLpRwGGk-eQJ82n-kLFgbylj2GerKMNcQ>
    <xmx:a6GjZtICG5hmWnk3HExbAcf9xtu_I0y6rsYQsTfl-dm5M_gBXD6P---B>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D829FB6008D; Fri, 26 Jul 2024 09:15:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
MIME-Version: 1.0
Message-Id: <60581044-df82-40ad-b94c-56468007a93e@app.fastmail.com>
In-Reply-To: <20240726123322.1165562-1-mpe@ellerman.id.au>
References: <20240726123322.1165562-1-mpe@ellerman.id.au>
Date: Fri, 26 Jul 2024 15:15:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Mark powerpc Cell as orphaned
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
Cc: Geoff Levand <geoff@infradead.org>, Jeremy Kerr <jk@ozlabs.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2024, at 14:33, Michael Ellerman wrote:
> Arnd is no longer actively maintaining Cell, mark it as orphan.
>
> Also drop the dead developerworks link.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Arnd Bergmann <arnd@arndb.de>

The platform contains two separate bits, so we need to
decide what to do with each one of them in the long run:

CONFIG_PPC_IBM_CELL_BLADE is clearly dead, they were sold
from 2006 to 2012 and never that popular aside from a
handful of supercomputers that were all dismantled a
long time ago. Unless there is a user that wants to
keep maintaining these, we can probably remove all this
code soon, e.g. after the next LTS kernel.

CONFIG_SPU_FS is shared with the PS3 platform, which is
still used and maintained. The bit I don't know is how
common it is to actually still use spufs on the PS3.
Support for spu programs was removed in gcc-9.1 and
gdb-8.3, so none of the major distros even ship old
enough toolchains any more, but existing applications
and older toolchains should still work for people
that have them and want to run new kernels.

Geoff, are you using spufs on ps3, and if so, should
we move arch/powerpc/platforms/cell/spu* to the PS3
entry in the MAINTAINERS file? I don't think there
is any advantage in actually moving the files to
platforms/ps3 if we delete the cell blade support.

     Arnd

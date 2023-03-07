Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD716AD843
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 08:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW6Hw4HFKz3f3R
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 18:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=EVRS9l0S;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=drzmil33;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=EVRS9l0S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=drzmil33;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW6Gv0tRjz3bvH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 18:17:57 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 0C2795C0267;
	Tue,  7 Mar 2023 02:17:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 07 Mar 2023 02:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678173473; x=1678259873; bh=qEXKdcaZZ2RtX2iYZ7qIlOWk0bUKh5e0zsP
	y9GctdU4=; b=EVRS9l0SgvuuYtQJV4VfCOBDd5P19/ufqL/xok5l9oWD530qvRl
	32OGHmJT2bayLahPVS0gWRhnLxK6Z+Jlk++srAgloB6tZ4t6RnEQYl9dtmHEbUEF
	41yZP0BmrDRa116+CrN+4XevwsaS770TCHXUy+xB6oK0X09IiOjiuVuH0C/ARmo6
	fO6SZlgLkFxz5cjkZRClchxi0pyAZ+FHLG3nl/CBKqBfT5jRISfkTQNn0YYywD4T
	Wj92noz9HFGKpzdsy/cwomQIzdk3+YO7/KK9SAc605foLfc32u4qJDvXpP1n5P7c
	peGtwY/JqW+0XBFgu8QLiruwVmEZvdvu2Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1678173473; x=1678259873; bh=qEXKdcaZZ2RtX2iYZ7qIlOWk0bUKh5e0zsP
	y9GctdU4=; b=drzmil3385Lov2w7beShJrFQ3GATqdBgomeK+nZBz6RibzrgaH9
	Ph4oAZFDXe1gA4dz02jni1x8rYLPU8csmNt0y/kcxAHHuEqFKFb3SExrpsrl2+ox
	U3hGgfD2s/cIMt8ObvuYqHtHz6rCzw4uyLsanVK3GWvMbQj1h7ydE9biXdh6IlAo
	vbBrXEwKvNYO63OEEXlqSJsO+MvOnXKAazVOsOpMwDKqVBcWpraKL3cF2FUOLPH8
	UeMggh88CpSEmj+eZVgGHUKWgsHEc9fW6HXemWUPFDglt5cDYOzE/+dXaTvRkKAT
	+fxjvbLqJBJC5gz7jKtljcIml1zGKCfQHUA==
X-ME-Sender: <xms:IOUGZNt444Blsb2CJgWVwvaA3q7cIpqk4Aurj850w7PB2pFddLW_2Q>
    <xme:IOUGZGdTSdtyeCMJgOipQiIPfHDIoHGyi32o6chNgVL66YAnAWyqMOqsYDE7kyEDF
    D8mw-a2MlpLRvahZBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtledguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeu
    feefieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:IOUGZAxle2sK94bL_Sv0epth1M9WSOpp80SbYE5KdPlt6hZoubNNTw>
    <xmx:IOUGZEM6RnQIS_yxJzQrjETPabDxGUQ5yKtgqKI26-XJ0WsTCzecGw>
    <xmx:IOUGZN_ERqYTyoR5IRPG-Ib0D_4bvp2mSCmNzsxQKB_0bbay6-dj_Q>
    <xmx:IeUGZLe9d7grz_DOWcQ4denP8nvxrHBfCStmI9ZP3mjw4WhQQuhvZw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 13F47B60086; Tue,  7 Mar 2023 02:17:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <9d8292ad-c865-4b82-b6e3-d7db75820d0f@app.fastmail.com>
In-Reply-To: <ZAaTw+841xBsz/m9@MiWiFi-R3L-srv>
References: <20230303102817.212148-1-bhe@redhat.com>
 <20230303102817.212148-3-bhe@redhat.com> <87sfej1rie.fsf@mpe.ellerman.id.au>
 <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
 <5dec69d0-0bc9-4f6c-8d0d-ee5422783100@app.fastmail.com>
 <87jzzt1ioc.fsf@mpe.ellerman.id.au> <ZAaTw+841xBsz/m9@MiWiFi-R3L-srv>
Date: Tue, 07 Mar 2023 08:17:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Baoquan He" <bhe@redhat.com>, "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 2/2] arch/*/io.h: remove ioremap_uc in some architectures
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 7, 2023, at 02:30, Baoquan He wrote:
> On 03/07/23 at 11:58am, Michael Ellerman wrote:
>> "Arnd Bergmann" <arnd@arndb.de> writes:
>> > On Sun, Mar 5, 2023, at 10:29, Geert Uytterhoeven wrote:
>> >> On Sun, Mar 5, 2023 at 10:23=E2=80=AFAM Michael Ellerman <mpe@elle=
rman.id.au> wrote:
>> >>> Maybe that exact code path is only reachable on x86/ia64? But if =
so
>> >>> please explain why.
>> >>>
>> >>> Otherwise it looks like this series could break that driver on po=
werpc
>> >>> at least.
>> >>
>> >> Indeed.
>> >
>> > When I last looked into this, I sent a patch to use ioremap()
>> > on non-x86:
>> >
>> > https://lore.kernel.org/all/20191111192258.2234502-1-arnd@arndb.de/
>>=20
>> OK thanks.
>>=20
>> Baoquan can you add that patch to the start of this series if/when you
>> post the next version?
>
> Sure, will do. Wondering if we need make change to cover powerpc other
> than x86 and ia64 in Arnd's patch as you and Geert pointed out.

The patch fixes the aty driver for all architectures, including the
ones that were already broken before your series with the 'return NULL'
version.

The only other callers of ioremap_uc() and devm_ioremap_uc() are
in architecture specific code and in drivers/mfd/intel-lpss.c, which
is x86 specific.

     Arnd

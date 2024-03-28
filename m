Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3A88F7BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:10:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=mdrkDm1z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xn52XuWw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4tSG1FJNz3vjT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 17:10:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=mdrkDm1z;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xn52XuWw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.158; helo=fhigh7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4tRQ4Vlpz3cZB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 17:09:38 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 7BA841140110;
	Thu, 28 Mar 2024 02:09:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 28 Mar 2024 02:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1711606174;
	 x=1711692574; bh=vXVwqe/erX1PcRzBc8LEzG4qm/OR98bBQcZiNr1jHCk=; b=
	mdrkDm1zUf83McKaDZ1OjY/1A7t0N4B38FWURTGfsjptoFkXrwL6zKyWa5pOFOv+
	hvsgrjFfC0myat+zznFPmLNnG9w90xPQAvVzNmzdQJOwNnXdNjVvqfz4mUQbM/e6
	OxbfSY/xIaUYIojq13BakiVnWs0HYNiVZrgAEOIUEI9D6oRTqxlFGcnSI13wQxgz
	6JAkiZNtPo5M29tWnP51n822Mud89ul3NedpvaNtNc6hsvYUhFZItVxgGm1ZpVXf
	cFzCWGJMAlxrh+RE0RM6utM4vHpsc7/S1wNPgSVQaBrRkpPRaeUFm3NSZwjifqkF
	dZIaEYC5A5H6MBBTvF5JxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711606174; x=
	1711692574; bh=vXVwqe/erX1PcRzBc8LEzG4qm/OR98bBQcZiNr1jHCk=; b=x
	n52XuWwQ8Vs8R2QY5crarliOfoNa/Vrc5v4KL1kcsU4vJ0wJ0CwR7u16qV0zEaP4
	FM2SLx4CApXY9r0SdioxbDDYE5lRol8u8QcCraSL8tLU57UFHixy6VPjwoQTcsR9
	26lOJffKFE4XP0en2WR6y/vUZPAJDcCZ4iMYODkZ1wHHKzPYWrfG9sEHPt+MAVZA
	0AkHvfFCGqwdjANgIlXC94Eo6lsGv99e21CK2Ud+BGP4fEv3Q39gTl6qturO1M1H
	KxlFXhn1xte1vOFI9qqU1sjv8i6MHgD2ZYT8hXUpsV8t9oD/zzyKMnsqf5jsHNHk
	v7qulqCRWicFI6WkkEUtQ==
X-ME-Sender: <xms:ngkFZgwl-1tg1AASOQ92_TgiqSYLgFEQtxWmpuLjRGFkqRCWhB_Kug>
    <xme:ngkFZkSqPaS27gfgDdX0OG1XNVy7bLD0VB7y9c9fWosp8Wws7KjBD2YCO2qU2UhGI
    cekxVh2d5yPzvhdyAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddukedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ngkFZiXvSjvMnoomVzs6OSB_RGmksqIByAGlf37ERrLetKApO9z0hA>
    <xmx:ngkFZuh8wmJbKBSuNg1SQmGtw2l8tWe-MIS-0F4HljsrebP8M6wy4g>
    <xmx:ngkFZiBjK1spfO1A12Khk6XImjTvuYkK6jOYv2Sl2PWe0fhS-5M-Jw>
    <xmx:ngkFZvKQ7m7Ya41lbGnt0Tdolu7WLPa7k6HkghD6C4iYzDnHdTEctw>
    <xmx:ngkFZky1g0jNiTJfq9jF4NbiJaJCNdQ4ta79C5UOKgp5zfsNqRf8dQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D9B44B60092; Thu, 28 Mar 2024 02:09:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <10da3ced-9a79-4ebb-a77d-1aa49cc61952@app.fastmail.com>
In-Reply-To: <3360dba8-0fac-4126-b72b-abc036957d6a@kernel.org>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
 <dc1433ea-4e59-4ab7-83fb-23b393020980@app.fastmail.com>
 <3360dba8-0fac-4126-b72b-abc036957d6a@kernel.org>
Date: Thu, 28 Mar 2024 07:09:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>,
 "David Hildenbrand" <david@redhat.com>, peterx <peterx@redhat.com>
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
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
Cc: linux-s390@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Matt Turner <mattst88@gmail.com>, linux-arm-kernel@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024, at 06:51, Vineet Gupta wrote:
> On 3/27/24 09:22, Arnd Bergmann wrote:
>> On Wed, Mar 27, 2024, at 16:39, David Hildenbrand wrote:
>>> On 27.03.24 16:21, Peter Xu wrote:
>>>> On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
>>>>
>>>> I'm not sure what config you tried there; as I am doing some build =
tests
>>>> recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS c=
ould
>>>> avoid a lot of issues, I think it's due to libc missing.  But maybe=
 not the
>>>> case there.
>>> CCin Arnd; I use some of his compiler chains, others from Fedora dir=
ectly. For
>>> example for alpha and arc, the Fedora gcc is "13.2.1".
>>> But there is other stuff like (arc):
>>>
>>> ./arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
>>> ./arch/arc/include/asm/mmu-arcv2.h:82:9: error: implicit declaration=
 of=20
>>> function 'write_aux_reg' [-Werro
>>> r=3Dimplicit-function-declaration]
>>>     82 |         write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
>>>        |         ^~~~~~~~~~~~~
>> Seems to be missing an #include of soc/arc/aux.h, but I can't
>> tell when this first broke without bisecting.
>
> Weird I don't see this one but I only have gcc 12 handy ATM.
>
> =C2=A0=C2=A0=C2=A0 gcc version 12.2.1 20230306 (ARC HS GNU/Linux glibc=
 toolchain -
> build 1360)
>
> I even tried W=3D1 (which according to scripts/Makefile.extrawarn) sho=
uld
> include -Werror=3Dimplicit-function-declaration but don't see this sti=
ll.
>
> Tomorrow I'll try building a gcc 13.2.1 for ARC.

David reported them with the toolchains I built at
https://mirrors.edge.kernel.org/pub/tools/crosstool/
I'm fairly sure the problem is specific to the .config
and tree, not the toolchain though.

>>> or (alpha)
>>>
>>> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>>> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
>>> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
>>> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
>>> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
>>> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
>>> ERROR: modpost: "memcpy" [crypto/crypto.ko] undefined!
>>> ERROR: modpost: "memcpy" [crypto/crypto_algapi.ko] undefined!
>>> ERROR: modpost: "memcpy" [crypto/aead.ko] undefined!
>>> ERROR: modpost: "memcpy" [crypto/crypto_skcipher.ko] undefined!
>>> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!
>
> Are these from ARC build or otherwise ?

This was arch/alpha.

      Arnd

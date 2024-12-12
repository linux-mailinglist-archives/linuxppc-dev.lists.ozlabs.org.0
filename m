Return-Path: <linuxppc-dev+bounces-4061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CBE9EFDEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:09:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Q7g61cyz2yDM;
	Fri, 13 Dec 2024 08:09:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734037743;
	cv=none; b=dYBFmvpiEyn7J/2BCmz/o7P+pqcsTiIDqebEbhnghBz2Wyp0BU0KgsXRCLH9TqM/++3i9foLAFD6YJsFzY9s/rHGV7u3d/LlURWyvbLvRsIbf+1LkZlv1N5e79jV1ZsvItrG9k7mDMuaW89HRVbFoG4Dlb6nFQxNbYVrU7GCWcUzYwpCtOjLyIIRKI+heUWSjtHzFOlfawXJN8ilnqrXkVuZqKsDooQ4aUcv8My6BX+gbr6XwkB13AUQpzwBcjPvoEIXmDrxmPnJq/+NNVrQmn+UnXWzR2SP9ORXUGhvl6i5ikgcznf4hsQjcYSxODLnfoVAB8bypVazUxT1pJKmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734037743; c=relaxed/relaxed;
	bh=9IqZ6rAQRKbEW2J4TH6/7CA/VSmhrZDWQ3WoMQkxePk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jW4CsxnMeWI/qzBIMc3wJ/xSls7cX1++QoSTIRqLqJN7I+qMmHbYtd5LCVuCDvRAIKvmYbosLne1RQ3CYYUxjNSxhfkJCrPzwWMPgVjR0HKg3WXgQ+Hp+7kERChUsVqwEP9km9+WPtXn2jteS5K+mRM2dvpgHD2nzn6f5adfa6O278pfalvfi1ltvBzZyyFy191QrUpmTn54wKfu94DylwBL87XsqKsPrM8WDRuuMj5qjB7rl3xwk2a1COm5z0xfCA1DmDmzJJDjsmkrIjFjXCDkhIA5GnWM9PcYicsyQsdFdyzf+V1XM5QyOIbHJcjZSSxszypZ7nA2AYtD3Z3KQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=sI9WQo0h; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=V2xBxaHc; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=sI9WQo0h;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=V2xBxaHc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Q7f4FSsz2y72
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:09:02 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 8EE3F1383EA7;
	Thu, 12 Dec 2024 16:09:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Dec 2024 16:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734037740;
	 x=1734124140; bh=9IqZ6rAQRKbEW2J4TH6/7CA/VSmhrZDWQ3WoMQkxePk=; b=
	sI9WQo0hT8RZfeLkFWtOxYBaixCFsKGWtj1oeld5wv+OdD59xfdJ/DXtsqqA5hQt
	iqOuvNi/VCCSpWXoYZS39BY5IDFhiWrgN7uGOEI80sW1mD86lUNNrJYsuinhpIUd
	yIhPLs4TywRs8rOz9rzJVi1JgzrdiimkQ65PkMgb0vc72c6LR+JnVMGUs4NEk77r
	sTzT5VObzwIahbjTu14Sn072AKr3QmyqW4t6gUI+fj8oxqiYAtMZnJGpw6KFvWj9
	/oN1Ya0/vGY1kQzpziYR1O6rbYPBKcOKtWSh2D/iBJcvpmOMOKrODid3HPvM9yZy
	4mjyZbZRdPqpqpSkulf93g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734037740; x=
	1734124140; bh=9IqZ6rAQRKbEW2J4TH6/7CA/VSmhrZDWQ3WoMQkxePk=; b=V
	2xBxaHcyH7nhSIq8a4Shpv1fzPD4TS4/o7IMn+qgKdxGHqV8eH8bVojf4NDKmYId
	wQ5mTyohsX3YXFFFXfGAVLTVSHsgcVGB32ZuEuPEcsvKgPnNjr/ytl8Rol4AdGUH
	z4RYUE/LTQ4TSRFibOFJaAUAU9Y1y3XSO4DmEg/vuNB3umXTPRa+lqY4thL/yeSX
	+gWisPsU3ubkDeY87y6wmDYrll/Y7H8BuqaYXv7BQKRu+NAHz633wh9LSFMjsRCc
	Sl9zQV4xpWiKN9OVoZ2hImjbuMrL8rLGDuVpu5KmhMLyFaTOGnXlPY4RfqWnGL3Q
	tyRAAaDN7xrgHEaKtYX0A==
X-ME-Sender: <xms:6lBbZyw5SFn4lKEQCjXQULlKKQ3fuezYL-a0vCHYGD3K-FVjpKNC4A>
    <xme:6lBbZ-T7owsIHjUc1TlBe8pyoFKFV3A4XgfmG_C3lywr1GwU4Q9tIxa9IUfSJ4uZZ
    5abI64AlwCYCLWcu3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepghhrrghfsegrmhgriihonhdrtghomhdprhgtphhtthhopegrthhishhhphesrg
    htihhshhhprghtrhgrrdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhl
    thdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhroh
    huphdrvghupdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghp
    thhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:6lBbZ0VwsS4U5Dh3P7otMqmSIAVEsOO6G7LJsCShu6InWS5ECnRScA>
    <xmx:6lBbZ4g36ua-0NY8XWqhtFeQFSxll2Gb7OcvFB5JwEkVcXBPt7efZw>
    <xmx:6lBbZ0CZQR2tq0T2mN9rDgYjaqBp7grBCA0XYnDCiY-g_gO8TIGx1w>
    <xmx:6lBbZ5JchKyroSqzawYqmB-bFcM24AfcbmVsrLAOC-nqaNsZvK-LMA>
    <xmx:7FBbZ-xtl9XJ4zczjb9ueyrbQc4qE0emOqr48sDEu3vHDq2m0T8uPYzW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 134EC2220072; Thu, 12 Dec 2024 16:08:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Thu, 12 Dec 2024 22:08:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, kvm@vger.kernel.org
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Alexander Graf" <graf@amazon.com>, "Crystal Wood" <crwood@redhat.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
In-Reply-To: <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-3-arnd@kernel.org>
 <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
Subject: Re: [RFC 2/5] powerpc: kvm: drop 32-bit booke
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 12, 2024, at 19:35, Christophe Leroy wrote:
> Le 12/12/2024 =C3=A0 13:55, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>

>>=20
>> Support for 64-bit hosts remains unchanged, for both 32-bit and
>> 64-bit guests.
>>=20

>>   arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
>>   arch/powerpc/include/asm/kvm_booke.h        |   4 -
>>   arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
>>   arch/powerpc/kvm/Kconfig                    |  22 +-
>>   arch/powerpc/kvm/Makefile                   |  15 -
>>   arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------
>>   arch/powerpc/kvm/booke.c                    | 268 ----------
>>   arch/powerpc/kvm/booke.h                    |   8 -
>>   arch/powerpc/kvm/booke_emulate.c            |  44 --
>>   arch/powerpc/kvm/booke_interrupts.S         | 535 -----------------=
--
>>   arch/powerpc/kvm/bookehv_interrupts.S       | 102 ----
>>   arch/powerpc/kvm/e500.c                     | 553 -----------------=
---
>>   arch/powerpc/kvm/e500.h                     |  40 --
>>   arch/powerpc/kvm/e500_emulate.c             | 100 ----
>>   arch/powerpc/kvm/e500_mmu_host.c            |  54 --
>>   arch/powerpc/kvm/e500mc.c                   |   5 +-
>>   arch/powerpc/kvm/trace_booke.h              |  14 -
>>   17 files changed, 4 insertions(+), 2194 deletions(-)
>>   delete mode 100644 arch/powerpc/include/asm/kvm_book3s_32.h
>>   delete mode 100644 arch/powerpc/kvm/book3s_32_mmu_host.c
>>   delete mode 100644 arch/powerpc/kvm/booke_interrupts.S
>>   delete mode 100644 arch/powerpc/kvm/e500.c
>
> Left over ?
>
> arch/powerpc/kernel/head_booke.h:#include <asm/kvm_asm.h>
> arch/powerpc/kernel/head_booke.h:#include <asm/kvm_booke_hv_asm.h>
> arch/powerpc/kernel/head_booke.h:       b=20
> kvmppc_handler_\intno\()_\srr1

As far as I can tell, these are still needed for e5500/e6500,
but you know more about the platform than I do.

       Arnd


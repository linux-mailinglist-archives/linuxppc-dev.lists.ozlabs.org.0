Return-Path: <linuxppc-dev+bounces-12482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 067ADB8CA6E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 16:37:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTX680K0Qz2yyx;
	Sun, 21 Sep 2025 00:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758379071;
	cv=none; b=KFuUlnMlxSItYYtq1hermyIdSrFhUDwJwIBGzG+8MDlwBrPqe1Hfqxw6I43WGFKCLE/fAx0CEXGQB8Y1CDADqPydcKry0bzd1Yw85ThvisqQu+xGfqFf1XnxR0nvv4ecaWqV7ZyR0uBLnSExL/tWf6jESiOVBpgVdxOb7Ooep8FBDfYoheBBCC4bU0mhoqhr3rSuu0FW9gfFT65YBIym3r/IPYe77hv0i0DpXogDwipCKgsrH1keGRNk+/58ZNIiyStiMliXhbhulB81KDWuG3lSQYYURzfqK94hGZWXGd/cQxLEvLkkUb4atJmC7kp3daNtXAZvCIc8ClySndGm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758379071; c=relaxed/relaxed;
	bh=zl7kC1EIRM1bovNYL1w209PeOAD8n12bCeV2ctXIJKA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VOel4xc6AClnzIdoPTAwrHrUBZeW381Uhk9ENjK9ypSH05EFGw1p5FLk0asChFyJzQooW4f+azjxEKXpTPNHbWtlTLlxplha8gWkLypuvRntPKCmbGngYKe+hVNwzSMGFZ9LlEkwznIHJFESkMmmFevpmTZYmAdRIPe/OQInQYiXA3+Ujd0FchjYijlfo/RZAOnLdHRV03DKE2o2ThtTA0LirUaqLywwkxWWa6Hbl8YQMGV+6KNRiK6hiK7RQ51Qykl9pcodPKNYRkQ9VJO23KRGTwXY7OZjEThrkogUqpamYF0K+SrPDOr2YNpDCllSnflvbaOCeyrPg3cs+iP0+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IuOAYaht; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LiyXhnJE; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=thomas.weissschuh@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IuOAYaht;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LiyXhnJE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=thomas.weissschuh@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTX655yPlz2xns
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 00:37:49 +1000 (AEST)
Date: Sat, 20 Sep 2025 16:37:31 +0200 (GMT+02:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758379058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zl7kC1EIRM1bovNYL1w209PeOAD8n12bCeV2ctXIJKA=;
	b=IuOAYaht68bYkyaAnw8mBbLpF0dn3cHPZYb3bHY/9Qnt9yej59kdqYZJUWNbDzZGSJ3TIy
	vjrvCVj7pN9urWJ8vbE7f5Y7s06j1F7C25eooUUWlI/++co+NpbE+0c3O9gU8JhqiQ4SOp
	nEr9GIBlux69WP9tMhPFg67LTHmTvdVHi2p9ozbkfo80InufXiIgLtH8e3RsPcupcPYRP2
	nssGv7o6Yg5ve4IE1rmDb+lFxtqdTCMXnzYxTXl6UFFDzvLF6IKJDyxsjpNQs2JoC30EGY
	l4VSzJrhtm6l5eUJHa5gMp4mr91o6zftCBBdh0zhww52FxDcaykrwIYDsaTHpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758379058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zl7kC1EIRM1bovNYL1w209PeOAD8n12bCeV2ctXIJKA=;
	b=LiyXhnJEAMLAmv3dP0IXuri7G82RDp9AQI+GKRfiI7mQ/gNlgkAkJhXcdz7geMJwt+zvtQ
	OagdT5Ug6EumENCg==
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Message-ID: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
In-Reply-To: <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de> <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <48fd164e-959b-4263-b3c7-cef5771aa40a@linutronix.de>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sep 20, 2025 15:25:11 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.=
de>:

> On Wed, 2025-09-17 at 16:00 +0200, Thomas Wei=C3=9Fschuh wrote:
>> The generic vDSO provides a lot common functionality shared between
>> different architectures. SPARC is the last architecture not using it,
>> preventing some necessary code cleanup.
>>
>> Make use of the generic infrastructure.
>>
>> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
>> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>>
>> Tested on a Niagara T4 and QEMU.
>>
>> This has a semantic conflict with my series "vdso: Reject absolute
>> relocations during build". The last patch of this series expects all use=
rs
>> of the generic vDSO library to use the vdsocheck tool.
>> This is not the case (yet) for SPARC64. I do have the patches for the
>> integration, the specifics will depend on which series is applied first.
>>
>> Based on tip/timers/vdso.
>
> Could you share a version of the series based on top of 6.17.0-rcN for
> testing purposes? I would like to test the series on a Sun Netra 240
> which is based on the UltraSPARC IIIi.

Here is the git branch based on rc4:
https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git=
/log/?h=3Db4/vdso-sparc64-generic-2

Does that work for you?

Thanks for testing!

Thomas


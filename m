Return-Path: <linuxppc-dev+bounces-13748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE7C31F62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 17:03:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1CtG1cXyz3bfM;
	Wed,  5 Nov 2025 03:03:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762272214;
	cv=none; b=apO2guDTJnZP0ZVAoXyu2ffEm/qQk/6D7A66aWguCLyD2uBe6EW9yN39u63/20wfwozE/Qgd24ST61Ke2hEjfKfoWnyUTJzi/9qHkhc2hUcK+yBp4pfJqjV9VcyRARq2Va65aL8tcPlga0Wbcfn68km7PJTyXNV6E0Zhxh1o5fXTM3XZv7Iac7xiZ0cb3i6bFgzWFZeR1w7AcG9K3JJQE+IB6pt5kFYqxJNIU4uBN5YFivmrQazQ/ELldASiKBtXECcPxHst8h6GbnpWpSbnC+afP40k3LxyChwgy408h1miFSNtEjLXIFNv+7aX4Rf/fcvIMUN0aGz/qb7dVNyvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762272214; c=relaxed/relaxed;
	bh=DVUsxBJLnt/zLZAkRttgBosRsQLZoSsfdLuF7oCasSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtTDgQD6f4HqIBPzd1R+teB189REx7/Bkb2B2imTboJpXcrZdv9jazslvclZGxg4UWOWJd442fq1T/XnCfxiVPbj2HinGE9wnI8pSoTnjk2+J4hkArevbgjkbsCQqjCOCA3ogzkUs/1DQ1ytysOGBO8u80JCQz8bhUBeN2nhsQQ0wDAs4t4YwBQeqqieQb4yIFWa7lDA9+KmkTkdX9OaxkTqkHVHWLp5eEF0cmU2AkHKNKB5brFQhoUjkx89o/7606k5w5lflSF1lsRK1rD7dlluB7F0UGZVaNqmEeRcp7qTNGs0AaheFUHmpYFg/lLuOhNeGOdUP79gJhSJfctaVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bCAJkSmI; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=izkXgs1O; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bCAJkSmI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=izkXgs1O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d1CtD4tzCz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 03:03:32 +1100 (AEDT)
Date: Tue, 4 Nov 2025 17:03:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762272209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVUsxBJLnt/zLZAkRttgBosRsQLZoSsfdLuF7oCasSk=;
	b=bCAJkSmIzBJHojDm0KwmGmGWsC3n03i6WCc33ZaQkkge47R+7l1saAH6blSD0ZcrD6t1+k
	SA4SqaEwkJ+TDe/W1zQ8LTYjWa5RWNLQbAfIZM+Y+AU9p4PAC1jduZobAX0xoB8rwl0Rcf
	M48fxss71NzXcEx0CMI2zKV0ZH5sHbuLnO4VKDpnaH0pQlAdBlWLr8PyNUBpCmRFSLjQX6
	q5H8QxYqM7wyitM/U8xUreRnLtjBS6s3mWTKfzwJz5XToqIIPoSbtgz7MpOkUtm14JG4ei
	ZIAvxu9YICBZcukK1G/oAgbfZ24wqdhKPQwPstAHkfdm8JBXQruiwn1UOMWiFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762272209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVUsxBJLnt/zLZAkRttgBosRsQLZoSsfdLuF7oCasSk=;
	b=izkXgs1Oks6O1p19fpLoG5rO6SL/s7yAl4p4D5Myex7HUGGkSZYk39IZs7dnxM/choRDJb
	t0IdWzTWBxSakZCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251104170215-3600e71c-1573-43aa-ad1d-8d02af9bbbf4@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
 <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
 <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQogAfbrP9rTPLvI@finisterre.sirena.org.uk>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 03:47:13PM +0000, Mark Brown wrote:
> On Tue, Nov 04, 2025 at 04:43:34PM +0100, Thomas Weißschuh wrote:
> > On Tue, Nov 04, 2025 at 01:14:03PM +0000, Mark Brown wrote:
> 
> > > I've now got the results for this specific commit, it looks like every
> > > single arm64 system is failing.  I didn't test any other architectures.
> 
> > Which one do you mean exactly with "this specific commit"?
> 
> > 6a011a228293 ("vdso/datastore: Map pages through struct page")
> > 10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")
> 
> The one in the thread being replied to here, the first.

Ack.

> > Any chance I could get remote access to one of your test machines?
> > I don't have access to the exact machines and that should reduce the chance
> > of chasing down dead ends.
> 
> I can let you submit LAVA jobs to my lab (there's an API, a web
> interface for (re)submitting jobs and a CLI tool for shoving jobs in) if
> that works?  That's how my own access to it works unless I go pull
> boards out.  You should be able to resubmit existing jobs, it downloads
> test binaries over HTTP.

Sounds good.


Thomas


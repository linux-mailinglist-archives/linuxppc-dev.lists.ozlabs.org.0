Return-Path: <linuxppc-dev+bounces-536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315895F2DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 15:25:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsry829DGz2yJL;
	Mon, 26 Aug 2024 23:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724678704;
	cv=none; b=Ie15OwUh02nJm1W8bi5BId2vhKnAQtoXagH1KKx99+G92TWj9sTd4syk7DB18unfBDDAZKQzJZissSQSORAl0pwpzgcqC2TI/cIXv5z06I3jZ1tt0HuhwJrubFySXgWzUMdgcKAFSVKA7zLzLh61nXsut454qLsn51RT9rjd4iEHoU/zaJyjX6qSdmua2IzckDLBvYZBQkN3uA1ys8TabUZofcMDRFy7ZXnRE1lqA9fOWF2UjE32/Ye7M11JvpOPedDeLHtqUdkp5620LEagwiXKwqjYngdDNduh3LtM+VXdC3JSiDno71/0hzoevhtK4qhu1yGR7frvdYxURqCCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724678704; c=relaxed/relaxed;
	bh=JtERtJKi/CA36m/GEM8qvROm+v91KuIncw1OX4BkHbo=;
	h=From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=A8nVusMt4K2id+nguXRO5ic04Aacfbfa7mhE8XP5gAJkj2SGrlmXB3JI6VWHM3YJY1+7FB3cJ7awQnKzrpGYxjBpVPZdIBlrVkZPy+TodZCdod14KNuQn5ZiONFrDJTR2A3ICuNE9ahkBrAfiuPhFWv9blowuYZfUuoxcVe3ziCrh+frwLGDmvOsSNkzmzVbyR0JmUaPjemkqqrnnDEBM2nQemaU5cudmN+EyagolQbeKo+qyS7EVQYT01l7gTvyaHwMXg3D/nLozntFLrvTzOh3rGTVXizEP+P/o7tIhIWDTR7TpjGvxKqZyf3xpSGoBY3i236gUPWBDBbhKdklpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zp1vNc4D; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MVBUGdIS; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zp1vNc4D;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MVBUGdIS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsry75W6qz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 23:25:03 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724678693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtERtJKi/CA36m/GEM8qvROm+v91KuIncw1OX4BkHbo=;
	b=zp1vNc4DuEN5YGFJn0TnAQLg0tqSuVcJT1LF7fJXWGjIq9boLoE67t0jweEecdUb7sF4GH
	GCQYB9HU/g83IdP8iePIB0ST+nfgjNktYKMIjUz3LlV/WiJcdqrTixPcGf8q5uk9fA4AJk
	w6fD2O1Yn3O5X0dRndrBmcvUrBU9IQbcMRg2frAPJ2wSc4l2YQ1FFd73rJq1/y6Vj/xxgH
	0esO02GAS3JjVqcgZix9NqNsLH/qRLm4AhSWJl3hwYmpMbN4YgqIT9Dr7UFLXgC7zxx7qp
	lBn8E0DLeyhkRVJ4UXNT+sBw3oZUwmdUgkhGWPGAQ6TSpslNcaibuIH3xKyBgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724678693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtERtJKi/CA36m/GEM8qvROm+v91KuIncw1OX4BkHbo=;
	b=MVBUGdIS3uO0WmN8EGfXIZc+hb2K87xkQVti0VUBQTGVjM7a9DhmIGZGaQAw3NK+w8pyab
	59i8js1pWL3G7UAg==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Andy Lutomirski
 <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>, Arnd
 Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
 <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 02/17] vdso: Clean header inclusion in getrandom
In-Reply-To: <51adbe91-3c3a-4baa-bb39-29df98a6eea5@csgroup.eu>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>
 <Zsw3xMoX2EI5UUs1@zx2c4.com>
 <7e519ba2-0293-4320-84bf-44f930fc286d@csgroup.eu>
 <ZsxDssNPbLkcPetJ@zx2c4.com>
 <51adbe91-3c3a-4baa-bb39-29df98a6eea5@csgroup.eu>
Date: Mon, 26 Aug 2024 15:24:52 +0200
Message-ID: <87plpvct7f.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26 2024 at 12:45, Christophe Leroy wrote:
> Le 26/08/2024 =C3=A0 10:58, Jason A. Donenfeld a =C3=A9crit=C2=A0:
>> On Mon, Aug 26, 2024 at 10:37:49AM +0200, Christophe Leroy wrote:
>>>
>>>
>>> Le 26/08/2024 =C3=A0 10:07, Jason A. Donenfeld a =C3=A9crit=C2=A0:
>>>> On Thu, Aug 22, 2024 at 09:13:10AM +0200, Christophe Leroy wrote:
>>>>>=20=20=20=20
>>>>> +#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
>>>>> +#define _PAGE_MASK (~(_PAGE_SIZE - 1))
>>>>
>>>> If PAGE_SIZE isn't defined at this point, why not just call it PAGE_SI=
ZE
>>>> instead of _PAGE_SIZE? But if that's the case, why not put the vdso
>>>> definition of PAGE_SIZE into some vdso header included by this file?
>>>
>>> It was working ok on powerpc but on x86 I got:
>>=20
>> Seems like there might be some more fiddling to do, then? Or did you
>> conclude it's impossible?
>
> Maybe someone who knows x86 in details could helps but after a first=20
> look I gave up because it looks very x86 specific, indeed that's=20
> x86/asm/vdso/gettimeofday.h that pulls several x86/asm/ headers , and=20
> the same type of issue might arise for any new architecture coming in.

Of course :)

> For me it looked cleaner to just do as commit cffaefd15a8f ("vdso: Use=20
> CONFIG_PAGE_SHIFT in vdso/datapage.h") and not use PAGE_SIZE at all. But=
=20
> I didn't want to directly use (1UL << CONFIG_PAGE_SHIFT) and (~(1UL <<=20
> (CONFIG_PAGE_SHIFT - 1))) in the code directly hence the new macros with=
=20
> a leading underscore to avoid any conflict with existing macros.

#ifndef PAGE_SIZE
# define
#endif

Perhaps?

Thanks,

        tglx


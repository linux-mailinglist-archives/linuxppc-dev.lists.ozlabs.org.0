Return-Path: <linuxppc-dev+bounces-1532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FC97EDD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 17:13:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XC61v3bF1z2xk7;
	Tue, 24 Sep 2024 01:13:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727104387;
	cv=none; b=I94HAm6dW47BRVjXxcI0Ew7kq+4rXCIE8XxG6z9F1kgcx+SUlMpe0USZNgd/+IBs6c1SjbmBMooFAhjOXqamLxDkjJ3GeL4PkYKS1my/C7pWN0N25MKLIZnKGp1XXgNkPGcpGqj2Oijoq5yTWCy531n9MHwvHl4sslpaex+/YnUOn5SUQoPiIeGkLVQmdRxjr/cPYWxmxfOVVxDTaLJZZKjSI9b7cy59M8io720v9MNzVGJ33Vb3j5zGFezf6W7j9KGWoHR04INuDstMHujy07L2FitJ1+whN1HKy5X+0yuchFdm0tujW+uaW6+XZdNQ54ddsEPfHTcPCXGHRAiAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727104387; c=relaxed/relaxed;
	bh=elBGvOspzH3iGmK1fYd/bVgzyP8I6OQGyztmlAKbFJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nIB4JOkVVLsyY3edUh9GC/YDlc5j0rELxHBe5O2pMXaWL9D9ILt5mwurUHQEXGWgKyqciSwJhmbd76dciJ5Efu0pgArHo+uW8l9CaK3ryFqD5N/NSlziiyEp+NwDvh5K8c+AMa+pPl0+/rtI+9SVStVPQYwonAYaYGOwEzLHlaCK1kyiKE9r5ywTieSJ5eDHJYEBxSRWF9n45xAQ9Dx1i3enuXbVEOXZpe3e3r5cVhqBDI2bhsqZQFZjZ9sxhUuDUHCECfWLfrih5FFTXRQDtLMNIHhUJll7iTLl5ktfw+7qzkT/fta6bLSiE8TNpxTEY2OOGTyZh1SFUE/vsuvLgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PBfKNMCo; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ncg/SvYz; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PBfKNMCo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ncg/SvYz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC61t4smPz2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 01:13:06 +1000 (AEST)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727104377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elBGvOspzH3iGmK1fYd/bVgzyP8I6OQGyztmlAKbFJU=;
	b=PBfKNMCoXVgqUMQ+jS8J96N56vpHFkiEIv7N0xlOaDipsFXHcUA3PDP3QEcMOcBBsigKcu
	ep2rSt1lLmY2DOAonrtcys3ggssiwc2a9tr/YB5alUERWPb6VXbNoKRZigHzcgV4755VTn
	wYk2+oEYFTBeLTvaEZ2pCcfw4KlNVPS6/D7TaIAiY0D8BB+WIJhmIwmXannp8UhBY3G1mi
	G3uxSUcypZgacKtqZK/L7EwPqpg1IfqrNDdQvgliRnYaxsk4TTzPhYuwSgE1DT6uKROso/
	5t/eiTVejV5slXI2ZzVLWwCneMD86d/J/xsNeJTYKgO8rphcsMBTmkNWCz+K2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727104377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elBGvOspzH3iGmK1fYd/bVgzyP8I6OQGyztmlAKbFJU=;
	b=Ncg/SvYzGFuvGC711XUusZn2/nNt5VKfdynTFfYe/Dj4+RDnjWTCN3ea404B/VToJ/4LZq
	lwKy9a1/BRdLjSCQ==
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org,
 SeongJae Park <sj@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, netdev@vger.kernel.org, linux-sound@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch
 <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Frederic
 Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 00/15] timers: Cleanup delay/sleep related mess
In-Reply-To: <6cbedd50-c2d5-4ad7-8133-774eebd9d2f1@wanadoo.fr>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <c794b4a6-468d-4552-a6d6-8185f49339d3@wanadoo.fr>
 <6cbedd50-c2d5-4ad7-8133-774eebd9d2f1@wanadoo.fr>
Date: Mon, 23 Sep 2024 17:12:56 +0200
Message-ID: <87ed5aietj.fsf@somnus>
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> Le 16/09/2024 =C3=A0 22:20, Christophe JAILLET a =C3=A9crit=C2=A0:
>> Le 11/09/2024 =C3=A0 07:13, Anna-Maria Behnsen a =C3=A9crit=C2=A0:
>>> Hi,
>>>
>>> a question about which sleeping function should be used in=20
>>> acpi_os_sleep()
>>> started a discussion and examination about the existing documentation a=
nd
>>> implementation of functions which insert a sleep/delay.
>>>
>>> The result of the discussion was, that the documentation is outdated and
>>> the implemented fsleep() reflects the outdated documentation but doesn't
>>> help to reflect reality which in turns leads to the queue which covers=
=20
>>> the
>>> following things:
>>>
>>> - Split out all timeout and sleep related functions from hrtimer.c and=
=20
>>> timer.c
>>> =C2=A0=C2=A0 into a separate file
>>>
>>> - Update function descriptions of sleep related functions
>>>
>>> - Change fsleep() to reflect reality
>>>
>>> - Rework all comments or users which obviously rely on the outdated
>>> =C2=A0=C2=A0 documentation as they reference "Documentation/timers/time=
rs-=20
>>> howto.rst"
>>>
>>> - Last but not least (as there are no more references): Update the=20
>>> outdated
>>> =C2=A0=C2=A0 documentation and move it into a file with a self explaini=
ng file name
>>>
>>> The queue is available here and applies on top of tip/timers/core:
>>>
>>> =C2=A0=C2=A0 git://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/l=
inux-=20
>>> devel.git timers/misc
>>>
>>> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>>=20
>> Hi,
>>=20
>> not directly related to your serie, but some time ago I sent a patch to=
=20
>> micro-optimize Optimize usleep_range(). (See [1])
>>=20
>> The idea is that the 2 parameters of usleep_range() are usually=20
>> constants and some code reordering could easily let the compiler compute=
=20
>> a few things at compilation time.
>>=20
>> There was consensus on the value of the change (see [2]), but as you are=
=20
>
> Typo: there was *no* consensus...
>
>> touching things here, maybe it makes sense now to save a few cycles at=20
>> runtime and a few bytes of code?
>>=20

Sorry for the late reply. I'll check it and will come back to you.

Thanks,
	Anna-Maria



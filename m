Return-Path: <linuxppc-dev+bounces-2366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC59A37FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 10:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVHNM71rlz3blg;
	Fri, 18 Oct 2024 19:06:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729238803;
	cv=none; b=OCZ/zzQYh0zrT/jmLgFb18LwwPAQ2h+jPViCxEVJOAu6V2hcJ+mRGyL8iKtJiT5ihI2cdjfnrOOTsoXQO8Fy9XybmGPqxpmtpOUwYGnRNo0GQljON1DInqYFgbdimuT5LbiZbYYa1D2Uq19OhrmLEVigJyovbUhHkLN9CVUwL4yknbJuV+K2AmlsfkLjQDD5ukl1kSX+ZyMJzKj0qrcFmxGS4h43kY7AgfoHxuxMscbaBLa3N+AsqF/hk4vNI46PBU6NLv+4AJWpd2ub/ZXNjOwejx+VHwZ5y06w+dTJna54wY74ALTeMFXwEdhgdeG92SJw3siCWISg5iXVg0rJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729238803; c=relaxed/relaxed;
	bh=9qhF6W1c/3/sG23aEO9tLagb3+CHQYJpHJvqkXIB/Ps=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=BSa5SmOa5vRaxVF8L7ROxMdvOcgL/ndlgycZth+tNlsR8crTGoOiVc7zQemFFAZKKaFaLQQ3+oU7KQ8I2Qvwr/gES84tqgdufm9vxFN2DuTiK88fhpML4LxeU6sId+zi4Z6ax7b3Dj43Z6bCGx4JbjtO9cohB1fgjq23cfiNGr4B5MDJbmaE06YSYkVZIqD/8dfWwr8q1MgX/WpJP6UH6993pSH8ZSbCnCGC7oHHy869gruO7J75dPs2mbTFWfsIDklN2OrvK04ffWU+DCKnxuhgfEoA9HLlp2E3C7QB+ijFO1322hCwnsUkgY+HLMPfbuhyRfuOBfgHJ1ovOZ5fog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E9wltJqq; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iPAq467j; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E9wltJqq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iPAq467j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVHNL49mNz3bkc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 19:06:42 +1100 (AEDT)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729238795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=9qhF6W1c/3/sG23aEO9tLagb3+CHQYJpHJvqkXIB/Ps=;
	b=E9wltJqqE4fpTBnohMvI18TXh8lPPJ1Xtmu5Vy77l1LIB2eppmb7XTrSNgkqxY1J9iGgqY
	deOgqo2bNx19ak+L55Px9Y/RlpgE9brajnjSPWAch6FhSgDdXA0XSXbigUYjFSoDA1KsiZ
	dKPei3MRJhYXcAULfdZSikT4LhmtMgU8R9M4Oi4eL+Z9Aile6jBfvdzz+oYC0RK6Vg2KPC
	9YE4ulAzTbxmThmqCQJV8lSNJ/lrVSaiVCgYpflQMZSBmx39XQRZgN2lEmgM0VYUOhCFX1
	Vw6CZAE5hDi7XGzEKarvxVV3Zor6oqprypgIZgO3XRZwjK6ixSnNNUBkzWDlDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729238795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=9qhF6W1c/3/sG23aEO9tLagb3+CHQYJpHJvqkXIB/Ps=;
	b=iPAq467jfirDKuvqaYCqXV9px/5Hu6TKGIkeCKSsovGUgr3GHHObss64N8oXRTuUbh1ytG
	POelUJ7DqUtCAHAA==
To: Mark Brown <broonie@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jonathan
 Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, Alice
 Ryhl <aliceryhl@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-mm@kvack.org, SeongJae Park <sj@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, linux-arch@vger.kernel.org, Heiner Kallweit
 <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan
 Ray <dwaipayanray1@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 netdev@vger.kernel.org, linux-sound@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: (subset) [PATCH v3 00/16] timers: Cleanup delay/sleep related mess
In-Reply-To: <172892295715.1548.770734377772758528.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 10:06:33 +0200
Message-ID: <877ca5al86.fsf@somnus>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mark,

Mark Brown <broonie@kernel.org> writes:

> On Mon, 14 Oct 2024 10:22:17 +0200, Anna-Maria Behnsen wrote:
>> a question about which sleeping function should be used in acpi_os_sleep()
>> started a discussion and examination about the existing documentation and
>> implementation of functions which insert a sleep/delay.
>> 
>> The result of the discussion was, that the documentation is outdated and
>> the implemented fsleep() reflects the outdated documentation but doesn't
>> help to reflect reality which in turns leads to the queue which covers the
>> following things:
>> 
>> [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
>

Would it be ok for you, if the patch is routed through tip tree? kernel
test robot triggers a warning for htmldoc that there is a reference to
the no longer existing file 'timer-howto.rst':

  https://lore.kernel.org/r/202410161059.a0f6IBwj-lkp@intel.com

Thanks,

	Anna-Maria


Return-Path: <linuxppc-dev+bounces-1419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25797AB2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 07:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X79xz59z5z2xjP;
	Tue, 17 Sep 2024 15:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726552567;
	cv=none; b=Z7PtzMJM+/W4bEs+TOzyvWjLMUAn9lPmMZvSmRiElwnySun1vIs1U4H6bQX5pYPCtl1Me4qNHcFP3egQV0D0VuMDyIzZBSu6YG8tvApoCKzKgRNxfyUmL1AxwvnncRmY3rOz/rUiGHU9c2IABphvhERDUCOW4SqUKIndgDLve8auCw5i6Ja0+H42kqylrPPQqogRhBw9go+j1N1juDMdyVn9M4Pw4cFzh+7BqwLo0p00onSPezDy0l0yFEON6eWNOWQTf5lw3IV54XXt+35GLYD5Nvb0+B2ovv9orngAbE9i1Q4z4kuPnWdoTvjfUzau154kUNqY/PkefnJvza5Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726552567; c=relaxed/relaxed;
	bh=ox/BUEVjGvecYqicoCV10v4Q9kXMIsRKDm9TgbacwPA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HzxmmN6qN4RRQ2S3GGwcV2PsSE2KKRYQrD/9aWUDXRghj0cHWL3pgyn7tRHOQ1+Nb3ATytc9MbGkVgZvlccz1Lxqsq/FHzc2xp0j1tsuIgCJejNvQILBfHZp2x394wqw0NXqQdKEeZjcNWYt1dDEeAvXAWu9UxBNYGFcJDYzFag1laYhXpJWU9ew+7k0Sgf/cv/RXc4j1/3eJJ9w7xFQsAsSc4wppm294zQg05DiAsjvguDaGkXr+/jZUc+AsuvjCcYQviOeJbomCTb7mkVkKppWwSspAgelPw3GGVLgxUuPiiMqwmhWakmnow33t6foynfMg0ci61yQtauKan0C4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=uE7YHFnc; dkim-atps=neutral; spf=pass (client-ip=80.12.242.13; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=uE7YHFnc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.13; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X79xy0Q04z2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 15:56:04 +1000 (AEST)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id qQf2sEuii3ZMyqQf2s4PfP; Tue, 17 Sep 2024 07:22:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726550528;
	bh=ox/BUEVjGvecYqicoCV10v4Q9kXMIsRKDm9TgbacwPA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=uE7YHFncSbIkns75ceMLvKBWR2lLESwDluJGLQhQBCQV5lrcOaRwCaTNTSOfcQpVq
	 HJm+j7e1uOEsx+GUZ7TkF+WOOqssb6mQ20ALFlGIaRf9KYFvSjIxmC0ctChK9RKjkP
	 VHegYqJfxnmpTt+hhya69OXSYxRcdh4NY3Nx4ludydVSWdFFHnCuY48Vq5d4BGuFHH
	 iIBCrqPhkEWoNiBUDqoomBPmojMFvpSGzksiXevYTJzesiUhHvUmNIIDj1if0WR1dK
	 bCJHsDM4ZJQSKYDiq97zSpNKRY9B+XwVjxgT8qhAE/jWfxA728uT22uHSOZu+Yfgmr
	 KFRvY0tmnJyeg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 17 Sep 2024 07:22:08 +0200
X-ME-IP: 90.11.132.44
Message-ID: <6cbedd50-c2d5-4ad7-8133-774eebd9d2f1@wanadoo.fr>
Date: Tue, 17 Sep 2024 07:22:00 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 00/15] timers: Cleanup delay/sleep related mess
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-mm@kvack.org, SeongJae Park <sj@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, netdev@vger.kernel.org,
 linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <c794b4a6-468d-4552-a6d6-8185f49339d3@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <c794b4a6-468d-4552-a6d6-8185f49339d3@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 16/09/2024 à 22:20, Christophe JAILLET a écrit :
> Le 11/09/2024 à 07:13, Anna-Maria Behnsen a écrit :
>> Hi,
>>
>> a question about which sleeping function should be used in 
>> acpi_os_sleep()
>> started a discussion and examination about the existing documentation and
>> implementation of functions which insert a sleep/delay.
>>
>> The result of the discussion was, that the documentation is outdated and
>> the implemented fsleep() reflects the outdated documentation but doesn't
>> help to reflect reality which in turns leads to the queue which covers 
>> the
>> following things:
>>
>> - Split out all timeout and sleep related functions from hrtimer.c and 
>> timer.c
>>    into a separate file
>>
>> - Update function descriptions of sleep related functions
>>
>> - Change fsleep() to reflect reality
>>
>> - Rework all comments or users which obviously rely on the outdated
>>    documentation as they reference "Documentation/timers/timers- 
>> howto.rst"
>>
>> - Last but not least (as there are no more references): Update the 
>> outdated
>>    documentation and move it into a file with a self explaining file name
>>
>> The queue is available here and applies on top of tip/timers/core:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux- 
>> devel.git timers/misc
>>
>> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> 
> Hi,
> 
> not directly related to your serie, but some time ago I sent a patch to 
> micro-optimize Optimize usleep_range(). (See [1])
> 
> The idea is that the 2 parameters of usleep_range() are usually 
> constants and some code reordering could easily let the compiler compute 
> a few things at compilation time.
> 
> There was consensus on the value of the change (see [2]), but as you are 

Typo: there was *no* consensus...

> touching things here, maybe it makes sense now to save a few cycles at 
> runtime and a few bytes of code?
> 
> CJ
> 
> [1]: https://lore.kernel.org/all/ 
> f0361b83a0a0b549f8ec5ab8134905001a6f2509.1659126514.git.christophe.jaillet@wanadoo.fr/
> 
> [2]: https://lore.kernel.org/ 
> all/03c2bbe795fe4ddcab66eb852bae3715@AcuMS.aculab.com/
> 
> 
> 
> 



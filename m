Return-Path: <linuxppc-dev+bounces-1412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96C97A83E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 22:21:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6xC34Vy6z2yNv;
	Tue, 17 Sep 2024 06:21:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.24
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726518095;
	cv=none; b=L6aLgAYZTJr1ImPH6zqq+x/fTNcG+R6XijTDagEMErY8RCbXxKd2KOEyRlE9JuiVl0o90EoFZhfNXm7xMDJ4lirNM5WqR4ihkE2oP465iv4YAhzsv6qfJ6hlYJxKHysSoUb8v0Xq78PL2E+fT6w3KBc8LTF07Q/tFNoTjiRLpnwdwaiNQKDOGPadBrA7DjYANGzUxS3XNcNxdBSKeMeosjtT45FQgA+2xyb04yKmBaO8OzcDwrwSTan7gb8fLZ1acAELAUbtwy/xaWjxVJGrm+zZbBGHbOugzUF6+Izu2RAyYxQNuR5S2p39AxPgzs8D1u0iDmsQdetHuL7sGG8+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726518095; c=relaxed/relaxed;
	bh=3Knrr3RbC4JV3H2uQiTkpSAIzSvcPBfz3YbMOwmqzNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTdY8ztLrK2tbDbxBsCfld1uDXg+VQNhl5yBPwOX4ZnDkNlmoha6qcqSuBBANWctJNoG9HMuB4TZVW55nrwRhky6eSTek2Mh2DkMS+xOgdxp4UPaTgZBmTEmBCFpY+jeYF7GP5fG/HEeqR667r2Jzv3gZpU9AgvYqDMQd+TowQNzVngvhgH0cFpj9AVGxXHI+Oop6F1JThi/InZ9x7TnWSMy6vNWrawLCnITjUW6Y5uBeQUCRMVPWaGpeIMldOK2rsOSPn7gKToZcPuY6biOR0SojO5Odz4Cm6NKnMhdFxDv+jIl1u7EB1LDg3eRGgJfv0lmvukd6Dyg6uAqR+Z+cA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=QrriRmjV; dkim-atps=neutral; spf=pass (client-ip=80.12.242.24; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=QrriRmjV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.24; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6xC06nCtz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 06:21:30 +1000 (AEST)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id qICnsCJi7wFpSqICnsB9XJ; Mon, 16 Sep 2024 22:20:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726518025;
	bh=3Knrr3RbC4JV3H2uQiTkpSAIzSvcPBfz3YbMOwmqzNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=QrriRmjVayvdZ9yvTrDorx9oh8DoqEJ9P43q3xnDcEZNreDtgqJE3mJ5HkFLby/Xx
	 jyAeNmPyXwcG/0ceO29wqGO1fVfkmlk1m+a2ocC8mtq9sHA9PcQHat6bT7aUMIAPfu
	 xyQzpH6ueoDHTTIWVUSR8dA3vMlIuJoP/Rrmxe3lVHgAJENm4GJBj6hLz3GeRvlfgW
	 sQfLtTHbVfptWrMxz5esjpPqqVSHbo+NTWyg4ZzGQQHah8gi/ZidOtVZESucMZM+PV
	 0Hrat1oFOHpBoWeQ5krLf+YsQelixQWf0T2GQqvdF2wNcVD388coEnvVe8JjJzYXeU
	 E5ApLFFl6o2fQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 16 Sep 2024 22:20:25 +0200
X-ME-IP: 90.11.132.44
Message-ID: <c794b4a6-468d-4552-a6d6-8185f49339d3@wanadoo.fr>
Date: Mon, 16 Sep 2024 22:20:15 +0200
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
Subject: Re: [PATCH v2 00/15] timers: Cleanup delay/sleep related mess
To: Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 11/09/2024 à 07:13, Anna-Maria Behnsen a écrit :
> Hi,
> 
> a question about which sleeping function should be used in acpi_os_sleep()
> started a discussion and examination about the existing documentation and
> implementation of functions which insert a sleep/delay.
> 
> The result of the discussion was, that the documentation is outdated and
> the implemented fsleep() reflects the outdated documentation but doesn't
> help to reflect reality which in turns leads to the queue which covers the
> following things:
> 
> - Split out all timeout and sleep related functions from hrtimer.c and timer.c
>    into a separate file
> 
> - Update function descriptions of sleep related functions
> 
> - Change fsleep() to reflect reality
> 
> - Rework all comments or users which obviously rely on the outdated
>    documentation as they reference "Documentation/timers/timers-howto.rst"
> 
> - Last but not least (as there are no more references): Update the outdated
>    documentation and move it into a file with a self explaining file name
> 
> The queue is available here and applies on top of tip/timers/core:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc
> 
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>

Hi,

not directly related to your serie, but some time ago I sent a patch to 
micro-optimize Optimize usleep_range(). (See [1])

The idea is that the 2 parameters of usleep_range() are usually 
constants and some code reordering could easily let the compiler compute 
a few things at compilation time.

There was consensus on the value of the change (see [2]), but as you are 
touching things here, maybe it makes sense now to save a few cycles at 
runtime and a few bytes of code?

CJ

[1]: 
https://lore.kernel.org/all/f0361b83a0a0b549f8ec5ab8134905001a6f2509.1659126514.git.christophe.jaillet@wanadoo.fr/

[2]: 
https://lore.kernel.org/all/03c2bbe795fe4ddcab66eb852bae3715@AcuMS.aculab.com/




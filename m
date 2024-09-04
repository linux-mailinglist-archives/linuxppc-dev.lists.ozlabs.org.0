Return-Path: <linuxppc-dev+bounces-991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099F96C109
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 16:45:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzQJG4lHDz2yVM;
	Thu,  5 Sep 2024 00:45:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725461102;
	cv=none; b=RmTReMgmjH/qymVC7SEyhpQ0O96HgLij2z0w75/w56eZsYIYyoigGww8v8J4V/6AuLpRW4+AjRVfP978DsuVvnXIbjWmLF3CwVlZbHWy0fpzh12MDY0igqNjBe0KAVlw4BxC/XeJ/M27DenkRmHg0n5+cdlnTbKtfeOkdXtSu5MHju7FEqg8toFwH9csmOMwhsaQY+VBHFrbheWp25S3KuuQO+Osi9ReyjaMj/oogzyWmQ2wWSr6RiO3wXIqyx9NWAlmy8tsoYath+C0s5ad5PAzX/CL2xjNu1o+c8Pc7SAftDTBPJ9KdFV7/1UB3/m4Bd6sVIFQUSaZLEQjJejCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725461102; c=relaxed/relaxed;
	bh=Uu0nBMEsWQ03xP8pcUVRVc+x4Imnk32z5L6ejaG1Ms8=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=L1jl19FWq5RSLWkCjBpp1vzyKWQg2+u9Pw+JFClEtfjReKIDdaqUmoK/F6UhfNl063izZrBLJ7V4cdJkcWGls50AOz3YJ92HQepw0SZIikm/ln0P66/7dHTO+4RqxHxISWcHugVROAGdb5ZVSuPf85tQZbSwdcNsAue6G3Lrw8SjT1boz62eFk3+anfLDqSP+qS6PtZro0YaJ4kQCwfQ1I4hWovGeyCiIvb2pDvqedP26O8/tOxoSRJediJNlb4LN7kVQRTtuK9HQGPCNtQ5FJ9SZNNKBfn9q87a/BCWLuVZ7vLVaA46ywWk1bpp2OkVVFbt+9cBRQpenSBrDEqFMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMaeIFXV; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMaeIFXV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzQJG1lBvz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 00:45:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4EAE5C56FA
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 14:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD899C4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461099;
	bh=ArAPCxI1Kj/v1qq50FpqqDgsTk6eZ/UAqDvPFj1T2/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vMaeIFXVmG5TwnYwCPIyHpt12OpEsK/pI0cxjWT9uUKQHp1pWc4ZBU/WcIJSR0DZs
	 QzSqsGdkj+OuQ9wXdNsaJvxdRuzx7e3Rz9elyL9vkhWYfhdY3U6Zer/Cy/8idp3bGL
	 muQdcKV7rfHrAYEc67s94wy9Lkprb7fg0VbpeKve+qiPIbqPRDqhlIDDDj+MByqxQf
	 Y1zUwjFiV5emnv2A9qfHNjTv1ELkKIhBAjN9WVVJTS0ZaVhTLaQyh5YkRMzHiDywrR
	 XRVkQT8R+O7CVZ8tJC4KewPEtHaaBpJ+a8tPYK2FYZ9y7WDWjV/gQF9x/ubByzdmdx
	 vd6yrc+Yj9Vdw==
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3df0ec140dcso395096b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 07:44:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj+OVgaWEWXcB/BRJGJh1NRS+SH/hRUbWO7PhnB2kzfwFsJUBGO00ENFs3q4NQShP7JY3K+wrLAETlyDY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhnMx0zhnVqCxNcn70Np6HE+FVGD8cpYBeImZTrLATYp8OWwm6
	IZUKeZIjctw6MsHv+0RW6Hh6W1HpWaxMZPpSIOiOKYEzXeMF1NYK4cpQDs/WXtHux9FoOsiJ9ZN
	VDjDalsOc4JImkvnMMMUpUdW9Nzk=
X-Google-Smtp-Source: AGHT+IEv8U+fDbCjLqUFxz4//WKn6tB39IzLuCQnJWmLkgmLJZnbV32x+Njonp88P0xuQvY07t3qf0x9Ck/Ekt8R4EI=
X-Received: by 2002:a05:6808:138a:b0:3db:50ed:e121 with SMTP id
 5614622812f47-3e01315d6camr1093652b6e.0.1725461099193; Wed, 04 Sep 2024
 07:44:59 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
In-Reply-To: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 4 Sep 2024 16:44:47 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0i_tLZ6W2gb4VbqkYhDEfA_KM2EPyogQRFZGtsN=uGdpw@mail.gmail.com>
Message-ID: <CAJZ5v0i_tLZ6W2gb4VbqkYhDEfA_KM2EPyogQRFZGtsN=uGdpw@mail.gmail.com>
Subject: Re: [PATCH 00/15] timers: Cleanup delay/sleep related mess
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, netdev@vger.kernel.org, linux-sound@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 3:05=E2=80=AFPM Anna-Maria Behnsen
<anna-maria@linutronix.de> wrote:
>
> Hi,
>
> a question about which sleeping function should be used in acpi_os_sleep(=
)
> started a discussion and examination about the existing documentation and
> implementation of functions which insert a sleep/delay.
>
> The result of the discussion was, that the documentation is outdated and
> the implemented fsleep() reflects the outdated documentation but doesn't
> help to reflect reality which in turns leads to the queue which covers th=
e
> following things:
>
> - Minor changes (naming and typo fixes)
>
> - Split out all timeout and sleep related functions from hrtimer.c and ti=
mer.c
>   into a separate file
>
> - Update function descriptions of sleep related functions
>
> - Change fsleep() to reflect reality
>
> - Rework all comments or users which obviously rely on the outdated
>   documentation as they reference "Documentation/timers/timers-howto.rst"
>
> - Last but not least (as there are no more references): Update the outdat=
ed
>   documentation and move it into a file with a self explaining file name
>
> The queue is available here and applies on top of tip/timers/core:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.gi=
t timers/misc
>
> Cc: linux-kernel@vger.kernel.org
> Cc: Len Brown <len.brown@intel.com>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> To: Frederic Weisbecker <frederic@kernel.org>
> To: Thomas Gleixner <tglx@linutronix.de>
> To: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
> Thanks,
>
> Anna-Maria
>
> ---
> Anna-Maria Behnsen (15):
>       timers: Rename next_expiry_recalc() to be unique
>       cpu: Use already existing usleep_range()
>       Comments: Fix wrong singular form of jiffies
>       timers: Move *sleep*() and timeout functions into a separate file
>       timers: Rename sleep_idle_range() to sleep_range_idle()
>       timers: Update function descriptions of sleep/delay related functio=
ns
>       timers: Adjust flseep() to reflect reality
>       mm/damon/core: Use generic upper bound recommondation for usleep_ra=
nge()
>       timers: Add a warning to usleep_range_state() for wrong order of ar=
guments
>       checkpatch: Remove broken sleep/delay related checks
>       regulator: core: Use fsleep() to get best sleep mechanism
>       iopoll/regmap/phy/snd: Fix comment referencing outdated timer docum=
entation
>       powerpc/rtas: Use fsleep() to minimize additional sleep duration
>       media: anysee: Fix link to outdated sleep function documentation
>       timers/Documentation: Cleanup delay/sleep documentation

I like the changes, so

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

for the series.


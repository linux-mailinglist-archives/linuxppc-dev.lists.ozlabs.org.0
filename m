Return-Path: <linuxppc-dev+bounces-2350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F289A24D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 16:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTqjf1nLFz2yQL;
	Fri, 18 Oct 2024 01:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729174806;
	cv=none; b=NHMk8KBUuEOl69IBGuJShkzmKMV+MbHPjHNOEid6bLuL06jjBmbhd9wxP/MJ5mY3m38YjpiwY8h/zgV89YxAOd1CHvWmDDIafTGJVCRUUFQqaXiDsB5J7MHrzDFxCf83ICF+B/cR1ipVX3wbQcx0SlcLB1z7vXbB4XSZY+rrpiyBCrJSUO1bQxlOR5Fgjnp0vwJkdwu2Il9suYzhJTqPRAZ5Wf5zNk4X7kADnyiGFr/yzaUNC6GHEFulpK6Zj/VCTxYMyARyTmov84sQVh/sTPV4JYMplGMNYLNfJhqA7iy0aMOa8R+TQlgV5HRnYumHcxStLou2Ctkkt2ocQnd0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729174806; c=relaxed/relaxed;
	bh=oxTIqgByle40c0qgSyRRPWealLOb7gjozDp4ZfY8n8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O1JD/EMwidvYIp16WPjB7A9BUPL3Wivm/r/donpTdcL30JjUREyECME3f+fwiM94Xy1A/QCpyWXr3XMoPXG8x/FaM/1L/GktBcFamFJivKhtK1PeOfae/U3O8l/1WR8DvK8s6ZNLCP83OR+bpfUc96tImSm3/1TnXebX+aHfYth2uhVKbNif6sEomMdYg0lQUbPeMc2Hd3MXT988rSAhWPKjWi7z6N0lB+XkWPWuSJ3fZjYnhvef2Ruk8Tgzf9sl6wFI5d/ACAg9HLX/Hwbw8naypRaFLASk5YAXTXK/fcr0p50nlrGwsriRii6hl77Aqme7uD/uss4h5jX9OdGmdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJPU1l5K; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJPU1l5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTqjd1kD7z2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 01:20:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0B805C6120;
	Thu, 17 Oct 2024 14:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855DFC4CEC7;
	Thu, 17 Oct 2024 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729174803;
	bh=GLCrs3Dovv1NiZDErsK/6Wy5iJ7ydSzeUdxuxMzzEbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cJPU1l5Kps56v8mtpHDahoOu/sesVEsbfkxPxTBjZJUFVPTfhquqJmMWgfV57Mzxr
	 g1rd1vIx0qWhbCmkzM6IbOU0nOCP1F0T68LieQMKCfZIshfUbktERB0aoZhno+uJIB
	 A5o+vNmH35gCfzcJ1QOdrFU13evRECzSwE6VGCf7j0zJO0BnRmoebOmEkEyOrIn/Fv
	 R89L1k8bbBzfwhnKPHRNxgVxbKJcHvuhl0Yv/hVpD8djyoy1qYZwYfCn3aQs2Yl9av
	 VvVxXTl2yNmlJn7lkLhFj8V6hfAEtpxPJ6+iyN7zNxSED2vaeBmgGrG4sDBsIoQhrm
	 +AHc8oQp8Nn9g==
From: Mark Brown <broonie@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
 linux-arch@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 netdev@vger.kernel.org, linux-sound@vger.kernel.org, 
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org
In-Reply-To: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
References: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
Subject: Re: (subset) [PATCH 00/15] timers: Cleanup delay/sleep related
 mess
Message-Id: <172917479725.89568.14288418643818666155.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 15:19:57 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 04 Sep 2024 15:04:50 +0200, Anna-Maria Behnsen wrote:
> a question about which sleeping function should be used in acpi_os_sleep()
> started a discussion and examination about the existing documentation and
> implementation of functions which insert a sleep/delay.
> 
> The result of the discussion was, that the documentation is outdated and
> the implemented fsleep() reflects the outdated documentation but doesn't
> help to reflect reality which in turns leads to the queue which covers the
> following things:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[11/15] regulator: core: Use fsleep() to get best sleep mechanism
        commit: f20669fbcf99d0e15e94fb50929bb1c41618e197

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



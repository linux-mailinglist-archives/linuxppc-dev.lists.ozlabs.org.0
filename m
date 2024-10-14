Return-Path: <linuxppc-dev+bounces-2234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F299D488
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 18:22:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS2Zj0THZz3bn8;
	Tue, 15 Oct 2024 03:22:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728922973;
	cv=none; b=LMlutYUupBZvq0OukXVsFTeVaUqjBsXeiqS3Kx3nSh79DzwnqaPxkxH/hfkVBJ2y2ru5gQsdnegSabnmZxDvFu2f5zovIuAlCE181rcOiEEks6iBQvom/rMqtfTSK9vJKPwu/nTd3pbomZ735R6HraicjpEIwlY8GPzqPCLZfn83DMn2f01Je3V/5DM5oPDpna+otFhYadfBfUtLPir8e1i1CA4uZgk8S5fp83O8xdiJoWt21MYGOL8cf41S9opOXQ0kToR/kVg7U96GgImS3nRsCs/Cxo1C4Ds/nZlPSLbjFWq1iC0YSiRoRAMINXpeiY1/tY/XlRH0/hISUS0F0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728922973; c=relaxed/relaxed;
	bh=zZNrU78KdrNv/i9o8oMpP2bwXtuCEDiUCCl5FIT2v/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J9XtMz1DFP4KrKk/ihHOpglHtyIcIJ/FEQWentmz+GWL4LFsTOmABV9FzJ8vSmm4ue+DD/c0cZxwPmwei1zproV7foGBbC4yUxZckGr5X5TIjShXq4KCdIHiHuWc9SFK6istspwJuokrbqaCNS+smnYld2S65tPWqNiMG4Z80xQqGWBaEOVcLEYwke5jQBpKgdvkIeOw8SiOLFuqQkZJZJXF4ESJPvcCKhuDc7FM6Vp/iK2W7At43c5dhJmiTeShOtC05Z3vEtLu+aH47ay6R+TTPWANgQ7tsqMexoQocsOjnxcvo/DoqAAbyXt9ky1dO4C0TrGVjTIfgA0SF92VMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RjvASecr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RjvASecr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS2Zg6Svgz3bkc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 03:22:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A59BA5C5615;
	Mon, 14 Oct 2024 16:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98083C4CEC3;
	Mon, 14 Oct 2024 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728922968;
	bh=bOmZl1NspXLcp+g5lMmcQ+7bUkVBQAQpj9wx9QBEe50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RjvASecrxZpOpjKcvFG+IN8xFnp2LLI7I/RQfDEumNR/fQ3dS3+ADtMMRqHsQLGWi
	 EiXcmJWG9MDl8SGDSw1DA484/IMjM+uzu5CzVDAq1/IZ1dfy10hZAX9QXRftnPsrA6
	 v7nW9WsF7Me3GHVXmVVLGWhDBdcmlR96zubbrpQBmVXykyz0gLJxLv+tGOX0yPBgaW
	 wNNbKikiZGTeIOLxImqJAKhdV5na4sITHxDQQ+sWwUK9V8CsgLugxk6mMLUctaJkSS
	 rhI/oQh4z6V+zVrzmrZ5VVbpUJF+CUwKegliRYJmKRWN42rdZBaGoSPWbfHa9aKxxF
	 ZN7b3RxDizdUQ==
From: Mark Brown <broonie@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 damon@lists.linux.dev, linux-mm@kvack.org, SeongJae Park <sj@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, netdev@vger.kernel.org, 
 linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
References: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
Subject: Re: (subset) [PATCH v3 00/16] timers: Cleanup delay/sleep related
 mess
Message-Id: <172892295715.1548.770734377772758528.b4-ty@kernel.org>
Date: Mon, 14 Oct 2024 17:22:37 +0100
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
X-Mailer: b4 0.15-dev-99b12
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 14 Oct 2024 10:22:17 +0200, Anna-Maria Behnsen wrote:
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

[11/16] regulator: core: Use fsleep() to get best sleep mechanism
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



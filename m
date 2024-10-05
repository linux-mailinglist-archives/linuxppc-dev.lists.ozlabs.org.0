Return-Path: <linuxppc-dev+bounces-1768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE84991590
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2024 11:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLLJP02BJz2yF6;
	Sat,  5 Oct 2024 19:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728121844;
	cv=none; b=Y5pDQKyOCQWjfFRcYTe8Bt2/HHhgWWQhy9xG41Wcw5v474j2axa5S/TTtJVGLJ5d7Ax7A5NhChcJHF5juYzaczN8sJ92mubOsMW+19hVUsLPpEQBBBJ5gZwPcsnrbPy4E25TYmyOIsBpSeGCqU9kEhfC1kD/ew87CRVGvrlFQ4rVZgWCtekpNQrHY6M0dm5LnkdEIK9wRZ+2EWPjdZFUqrrKf1c3jPthS+CbVD8LO+el89G/X3HQkYjLEG5pwer2zPDxEO/TCxaewnwowiFnJVr6dzQl953zIkQBAmRD5YX6434NfOQ0ARpeB6IkNXDXkW5sUl3ugAbYi75cwsrphw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728121844; c=relaxed/relaxed;
	bh=qLY8PzRJkMtiU+3Qcs8N6DjYLmH4D/H6XnOR9N2EQZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lHxrLfRE/1Ori+m+SCaSczdwgE1tAe0pvYH44Saw0R8NvtWyIJpPnFQoa+KKSgMIkC9Wr263pBcULbLlrqNDkArJkXOwiRNhtCQu1AtAan0oTcEoGDUd5e2Hhr5f9tXPw0u0pRS8J8BamTA1fvu/QnHyR2tnVKt5zNRhhBkOSGWoLkrLvgxSWKnYX92H6IHUX7z87UN4rfnEqissIbLzOgbmvio7cggxR7a1OUEx7/o9o/s2A7qhfuzAO/tlu0yI+f9eeF71e8sbiLO2TtGbZpm56MO/jmvqRhTyfs5H62wiXY2LvcnM2+MO9U5eYQ4uJuDNqJ9Ub62PEq5iGyNC+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GaVYUAhI; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GaVYUAhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLLJM5Y68z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 19:50:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBC785C5450;
	Sat,  5 Oct 2024 09:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9972FC4CEC2;
	Sat,  5 Oct 2024 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728121840;
	bh=wUQjLZzpHEAHwW5NYCB95sIsPmmiGfq1M5ccwnjqYcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GaVYUAhI+bKnmfCoaBMuc8M05yXqaDC4sXcuvXuJDBS5yOdV/CKkEcHImislnzgF4
	 vOu2dKkr+K+Qf5BfAy0uoYVbsB8YsuNKMCajV3BaBbhydc6U4nqU2xkDEnXt8WcpEE
	 QVrgnKeiE2MVo6oIxc8nsI+X+yb7eNl4IXHUgBEWHvRWvziK17GLEM/iIWmbls/x1M
	 dT6+WkQ8/530Fnu6I8UqjbPjG4vL/oUVg+cvAIVpATPKjtfQqQgqxZVVm9FlCK0F5g
	 nP+Xm9Voqi5gxgd+jnAytypKLyveK3mFYN2OfA6oas06qEknaatVi7gMI0tRoe++D9
	 KfiqWSRpw+CDQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up
 {hp,mic}-det-gpio handling
Message-Id: <172812183435.891737.5699490340500862525.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 10:50:34 +0100
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

On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
        commit: cfd1054c65eefec30972416a83eb62920bc1ff8d
[02/11] ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
        commit: e58b3914ab8303a2783ec1873c17b7a83dd515f7

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



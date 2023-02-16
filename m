Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8469A2B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 00:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHsGp3T5Qz3chp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:53:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rACrYxab;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHsFr6KXFz3Wtp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 10:53:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rACrYxab;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PHsFq0GS4z4x89;
	Fri, 17 Feb 2023 10:53:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676591584;
	bh=fP7M6V+cjNdWp1AJeaYpecLEvF9ZpOfTM+q7vfHAObU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rACrYxab0E15ubVIDUkicHNZ9A7o6QYmslTZDcOJQfv/F/0NBjWDNSogqxgIeXY6/
	 ES7W5herbayThve7MD61VmbV1VgH9umTLzCioelUwYSDn5NuYy2zyhj33GJlWsir8a
	 ulpOs7iyxfs3sCIy0239wGGeto2v+Mo4XuIdQOnmhKX8lsw/gpAqMubXK7uzmr+MjE
	 fsVJHz/hJPLnVYPKrLNaflekWVbGGbrv7w8dC0g5WWu6f2WLbfm5nYmyePabZYU7Tz
	 xBdgnLQfW2lEvmPa2LK2SR31sA6tFbYUXnUOPsQzeJnqx7s55RErGykHtpIo2Udk4K
	 i8Rj2sYAlIr1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herve Codina <herve.codina@bootlin.com>, Herve Codina
 <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Qiang
 Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
In-Reply-To: <20230216134226.1692107-1-herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
Date: Fri, 17 Feb 2023 10:52:58 +1100
Message-ID: <87mt5dyxph.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herve Codina <herve.codina@bootlin.com> writes:
> Hi,
>
> This series adds support for audio using the QMC controller available in
> some Freescale PowerQUICC SoCs.

Who's going to take this series?

By lines of code it's mostly in drivers/soc/fsl, so I was expecting it
would go via that tree.

Or is it a sound series that should go via one of the sound trees?

cheers

...
>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      |  172 ++
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml |  234 +++
>  .../bindings/sound/fsl,qmc-audio.yaml         |  117 ++
>  MAINTAINERS                                   |   25 +
>  arch/powerpc/platforms/8xx/cpm1.c             |    2 +-
>  drivers/soc/fsl/qe/Kconfig                    |   23 +
>  drivers/soc/fsl/qe/Makefile                   |    2 +
>  drivers/soc/fsl/qe/qmc.c                      | 1533 +++++++++++++++++
>  drivers/soc/fsl/qe/tsa.c                      |  869 ++++++++++
>  drivers/soc/fsl/qe/tsa.h                      |   42 +
>  include/dt-bindings/soc/fsl,tsa.h             |   13 +
>  include/soc/fsl/qe/qmc.h                      |   71 +
>  sound/soc/fsl/Kconfig                         |    9 +
>  sound/soc/fsl/Makefile                        |    2 +
>  sound/soc/fsl/fsl_qmc_audio.c                 |  735 ++++++++
>  15 files changed, 3848 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
>  create mode 100644 drivers/soc/fsl/qe/qmc.c
>  create mode 100644 drivers/soc/fsl/qe/tsa.c
>  create mode 100644 drivers/soc/fsl/qe/tsa.h
>  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
>  create mode 100644 include/soc/fsl/qe/qmc.h
>  create mode 100644 sound/soc/fsl/fsl_qmc_audio.c

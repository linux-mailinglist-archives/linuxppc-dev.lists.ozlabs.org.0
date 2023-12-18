Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD6817DFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 00:17:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=KC9IcCdB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvG2955Wjz3vlL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 10:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=KC9IcCdB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sv08X0HDlz3bV3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 23:52:12 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CB7159C04BD;
	Mon, 18 Dec 2023 07:42:09 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id a22CMRJ0P6OD; Mon, 18 Dec 2023 07:42:09 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 22D809C068C;
	Mon, 18 Dec 2023 07:42:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 22D809C068C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903329; bh=nNJwBxDmzL960mEI1mqFgHu2Oy9OWJ5ye2uPUgqVOL8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=KC9IcCdB/ndeBn1iClkNzQdFvCYwcAae8mB8HjDOuwe7VNhtuAysf0Iv6nV2CFid3
	 DkpOU2cx0klXMN+DKDOxk8e5e0ixq2mAUckeyG+WHeX0HMe6UFvdS6vptU3NuVN3w1
	 Buxz9EwOLYdfBjg/iEgA4UtCe5oey/qmQdjEU6C4zKRpXHs1q9zZGJA+F+NBEnF0dw
	 r0vOh6SZZXliSB5dt9R7WXiMEIAFVE3xhro3SfHWX/ctYXpktccGcICcIpgsfVPuOm
	 a1vT4MAYhBo7gsLEKK0Dw9QAqWr8piej7xrY6Is2n8gO1A6mDQeUYFKWFp3b8/X/9g
	 yiTaqU9TxyFFA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OZ6vMlRS6mOD; Mon, 18 Dec 2023 07:42:08 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id F0A0F9C04BD;
	Mon, 18 Dec 2023 07:42:06 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility integration of a generic codec use case for use with S/PDIF controller
Date: Mon, 18 Dec 2023 13:40:48 +0100
Message-Id: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 19 Dec 2023 10:10:16 +1100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This is the v3 of the series of patch aiming to make the machine driver
"fsl-asoc-card" compatible with use cases where there is no real codec
driver.
It proposes to use the "spdif_receiver" and "spdif_transmitter"
drivers instead of the dummy codec.
This is a first step in using the S/PDIF controller with the ASRC.

The five first patches add compatibility with the pair of codecs
"spdif_receiver" and "spdif_transmitter" with a new compatible,
"fsl,imx-audio-generic".
Codec parameters are set with default values.
Consequently, the driver is modified to work with multi-codec use cases.
It can get 2 codecs phandles from the device tree, and the
"fsl_asoc_card_priv" struct now has 2 "codec_priv" to store properties
of both codecs. It is fixed to 2 codecs as only "fsl,imx-audio-generic"
uses multiple codecs at the moment.
However, the driver now uses for_each_codecs macros when possible to
ease future implementations of multi-codec configurations.

The remaining patches add configuration options for the device tree.
They configure the CPU DAI when using "fsl,imx-audio-generic".
These options are usually hard-coded in "fsl-asoc-card.c" for each
audio codec.
Because the generic codec could be used with other CPU DAIs than
the S/PDIF controller, setting these parameters could be required.

This series of patch was successfully built for arm64 and x86 on top of
the latest for-next branch of the ASoC git tree on the 14th of December.
These modifications have also been tested on an i.MX8MN evaluation
board, with a linux kernel RT v6.1.26-rt8.


We also have a few questions, following remarks made by
Krzysztof Kozlowski in a previous email for patch 10/10:

> >>> The compatible list for this generic sound card currently:
> >>> @@ -48,6 +51,8 @@ The compatible list for this generic sound card
> >>> currently:
> >>>
> >>> "fsl,imx-audio-nau8822"
> >>>
> >>> + "fsl,imx-audio-generic"
> >>
> >> Generic does not look like hardware specific.
> >
> > Even if our end goal is to use it with the S/PDIF controller, this ne=
w
> > support can be used with different hardware that doesn't
> > require a codec. Thus, we don't really want to specify "spdif" in it.
> >
> > Is this compatible string not suitable ?
> > Should we rename it to something else, like "fsl,imx-audio-no-codec" =
?
>=20
> Maybe Mark or Rob will help here, but for me "imx-audio" is just way to=
o
> generic.

* Which generic name should we use ? Or how should we change it?
=20
> Also, you add several new properties, so I really expect either
> converting old binding to DT schema first or adding new device in DT
> schema format.

* fsl-asoc-card.txt currently follows the old dt-bindings format.
Should we update it to DT schema format in this patch series
before adding my new properties?


Best regards,
Elinor Montmasson


Changelog:
v2 -> v3:
* when the bitmaster or framemaster are retrieved from the device tree,
  the driver will now compare them with the two codecs possibly given in
  the device tree, and not just the first codec.
* improve driver modifications to use multiple codecs for better
  integration of future multi-codec use cases:
    * use for_each_codec macros when possible.
    * "fsl_asoc_card_priv" struct now has 2 "codec_priv" as the driver
      can currently retrieve 2 codec phandles from the device tree.
* fix subject of patch 10/10 to follow the style of the subsystem and
  previous commits of the file.
* v2 patch series at:
https://lore.kernel.org/alsa-devel/20231027144734.3654829-1-elinor.montma=
sson@savoirfairelinux.com/

v1 -> v2:
* replace use of the dummy codec by the pair of codecs
  "spdif_receiver" / " spdif_transmitter".
* adapt how dai links codecs are used to take into account the
  possibility for multiple codecs per link.
* change compatible name.
* adapt driver to be able to register two codecs given in the device
  tree.
* v1 patch series at:
https://lore.kernel.org/alsa-devel/20230901144550.520072-1-elinor.montmas=
son@savoirfairelinux.com/


Elinor Montmasson (10):
  ASoC: fsl-asoc-card: add support for dai links with multiple codecs
  ASoC: fsl-asoc-card: add second dai link component for codecs
  ASoC: fsl-asoc-card: add compatibility to use 2 codecs in dai-links
  ASoC: fsl-asoc-card: add new compatible for a generic codec use case
  ASoC: fsl-asoc-card: set generic codec as clock provider
  ASoC: fsl-asoc-card: add dts property "cpu-slot-width"
  ASoC: fsl-asoc-card: add dts property "cpu-slot-num"
  ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-freq"
  ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-dir-out"
  ASoC: bindings: fsl-asoc-card: add compatible for generic codec

 .../bindings/sound/fsl-asoc-card.txt          |  28 +-
 sound/soc/fsl/fsl-asoc-card.c                 | 299 +++++++++++-------
 2 files changed, 218 insertions(+), 109 deletions(-)

--=20
2.25.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE808C6841
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 16:06:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Td6C1HQc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfZlx67qDz3fwm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 00:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Td6C1HQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfZdm2pl2z3cYB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 00:01:32 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4A7719C5818;
	Wed, 15 May 2024 09:54:21 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id fFMLMWQGlLgx; Wed, 15 May 2024 09:54:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E10049C58EA;
	Wed, 15 May 2024 09:54:19 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E10049C58EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781260; bh=9rD/3giniaHUn4tfYhFlufR+6C3wG/E6x6qDZI5qkbI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Td6C1HQca4ZqBgvcF6hj2mgY9wXFWGbiyXP/Yp4HUmYsTdKKQqcLMmlsWdK1i3+Fy
	 x9z2MdmShQG3NlTVhIXzYiKWXiHiDoaOLMA3Ms26RXmTReq52KGGP9VZJTd6HVQ2Iv
	 wybi9Od8okL9AGj4fkgwhLaXZ7reXVDGQw4vPkk0+G5ndH6RSOtr7D/59u3CBG9o7J
	 9Nnu2XO88JxrkB3qxOnVYPvGvYQnm17cAxPbANDSvchiUFll5FneSheUsjUoVWvgoG
	 OEzv3gqVB3YFlPLvFKm15XRs6G98kHvwNJej+xhjjtc+LCChJAfOiTPtC0Dgq7/X21
	 8vbun28p1Pj9g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3sJiTzQkGwk9; Wed, 15 May 2024 09:54:19 -0400 (EDT)
Received: from gerard.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id CEC679C5818;
	Wed, 15 May 2024 09:54:17 -0400 (EDT)
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
Subject: [PATCHv4 0/9] ASoC: fsl-asoc-card: compatibility integration of a generic codec use case for use with S/PDIF controller
Date: Wed, 15 May 2024 15:54:02 +0200
Message-Id: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=quoted-printable
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This is the v4 of the series of patch aiming to make the machine driver
"fsl-asoc-card" compatible with use cases where there is no real codec
driver. It proposes to use the "spdif_receiver" and "spdif_transmitter"
drivers instead of the dummy codec.
This is a first step in using the S/PDIF controller with the ASRC.

The five first patches add compatibility with the pair of codecs
"spdif_receiver" and "spdif_transmitter" with a new compatible,
"fsl,imx-audio-generic". Codec parameters are set with default values.
Consequently, the driver is modified to work with multi-codec use cases.
It can get 2 codecs phandles from the device tree, and the
"fsl_asoc_card_priv" struct now has 2 "codec_priv" to store properties
of both codecs. It is fixed to 2 codecs as only "fsl,imx-audio-generic"
uses multiple codecs at the moment.
However, the driver now uses "for_each_codecs" macros when possible to
ease future implementations of multi-codec configurations.

The three following patches add configuration options for the
devicetree. They configure the CPU DAI when using
"fsl,imx-audio-generic". These options are usually hard-coded in
"fsl-asoc-card.c" for each audio codec. Because the generic codec could
be used with other CPU DAIs than the S/PDIF controller, setting these
parameters could be required.
These new options try to follow the style of the simple-card driver:
* standard TDM properties are used, as defined in "tdm-slot.txt".
* the CPU DAI system-clock can be specified, allowing the codec to
retrieve its frequency.
* the CPU DAI system-clock direction can be specified through a new
binding, the same way it is done in simple-card.

The last commit updates the DT bindings documentation and add a new
example for the generic codec use case.

This series of patch was successfully built for arm64 and x86 on top of
the latest=C2=A0"for-next" branch of the ASoC git tree on the 14th of May
2024.
These modifications have also been tested on an i.MX8MN evaluation
board, with a linux kernel RT v6.1.26-rt8.

If you have any question or remark about these commits, don't hesitate
to reply.

Best regards,
Elinor Montmasson


Changelog:
v3 -> v4:
* Use the standard TDM bidings, as defined in "tdm-slot.txt", for the
new optional DT bindings setting the TDM slots number and width.
* Use the clock DT bindings to optionally specify the CPU DAI system
clock frequency, instead of a dedicated new binding.
* Rename the new DT binding "cpu-sysclk-dir-out" to
"cpu-system-clock-direction-out" to better follow the style of the
simple-card driver.
* Merge TX an RX bindings for CPU DAI system-clock, to better follow the
style of the simple-card driver, and also as there was no use case in
fsl-asoc-card where TX and RX settings had to be different.
* Add the documentation for the new bindings in the new DT schema
bindings documentation. Also add an example with the generic codec.
* v3 patch series at :
https://lore.kernel.org/alsa-devel/20231218124058.2047167-1-elinor.montmass=
on@savoirfairelinux.com/

v2 -> v3:
* When the bitmaster or framemaster are retrieved from the device tree,
the driver will now compare them with the two codecs possibly given in
device tree, and not just the first codec.
* Improve driver modifications to use multiple codecs for better
integration of future multi-codec use cases:
    * Use "for_each_codec" macros when possible.
    * "fsl_asoc_card_priv" struct now has 2 "codec_priv" as the driver
    can currently retrieve 2 codec phandles from the device tree.
* Fix subject of patch 10/10 to follow the style of the subsystem
* v2 patch series at:
https://lore.kernel.org/alsa-devel/20231027144734.3654829-1-elinor.montmass=
on@savoirfairelinux.com/

v1 -> v2:
* Replace use of the dummy codec by the pair of codecs spdif_receiver /
spdif_transmitter.
* Adapt how dai links codecs are used to take into account the
possibility for multiple codecs per link.
* Change compatible name.
* Adapt driver to be able to register two codecs given in the device
tree.
* v1 patch series at:
https://lore.kernel.org/alsa-devel/20230901144550.520072-1-elinor.montmasso=
n@savoirfairelinux.com/


Elinor Montmasson (9):
  ASoC: fsl-asoc-card: add support for dai links with multiple codecs
  ASoC: fsl-asoc-card: add second dai link component for codecs
  ASoC: fsl-asoc-card: add compatibility to use 2 codecs in dai-links
  ASoC: fsl-asoc-card: add new compatible for a generic codec use case
  ASoC: fsl-asoc-card: set generic codec as clock provider
  ASoC: fsl-asoc-card: add use of devicetree TDM slot properties
  ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with generic codec
  ASoC: fsl-asoc-card: add DT property "cpu-system-clock-direction-out"
  ASoC: dt-bindings: fsl-asoc-card: add compatible for generic codec

 .../bindings/sound/fsl-asoc-card.yaml         |  96 +++++-
 sound/soc/fsl/fsl-asoc-card.c                 | 306 +++++++++++-------
 2 files changed, 287 insertions(+), 115 deletions(-)

--=20
2.34.1


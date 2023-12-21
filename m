Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2CD81AF3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 08:16:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=brWQPGiU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwhYs0vPMz3cT3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 18:16:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=brWQPGiU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwhY14y1jz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 18:15:45 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 667AE240003;
	Thu, 21 Dec 2023 07:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703142940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d5yym5O1VKClvkIdsNsInUcAtV6XPHU70kR0aZfqF4=;
	b=brWQPGiUpw8jn/VUbTdMTzyOYbulYT5jaMoQc+khviTcSVEGT1J3vFPdQyAelUO2lliyvC
	FF4St6IrKsZGEfKchw7+jQDswUfKcclRhyhFDOlS4wwRegRlqPsut8DkahA8rLZvmRpavv
	TsS46QZ4JCAPlUqTYtWiwFDKFWX8wWI8kPd7i+iLsviPUC+dGUJBdTqOidyM1CctuOulS4
	M1/pfLBSBfYKip1qO7YkHgLbOx6eJfoN/N59khECDJmNZzG6dW2VGYggS85DDyFzK4pujo
	n7X1GQtoZPSHbxvU9lEW+BTGfKDe0mxQDhNbx6bM42ujinaQqBGah/KW+c3Cqw==
Date: Thu, 21 Dec 2023 08:15:35 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Jakub Kicinski
 <kuba@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd
 Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/17] Prepare the PowerQUICC QMC and TSA for the
 HDLC QMC driver
Message-ID: <20231221081535.22350442@bootlin.com>
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

As you suggested in the previous iteration [1], I sent a PR related to this
series:
  https://lore.kernel.org/all/20231212105514.273e8ab0@bootlin.com/

I didn't receive any feedback on this PR and it does not seem to have been
taken into account.
Did I miss something ?

Best regards,
Hervé

[1]  https://lore.kernel.org/all/81e78cb7-ec97-4cec-ac3a-674e296af93b@app.fastmail.com/
  
On Tue,  5 Dec 2023 16:20:57 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> This series updates PowerQUICC QMC and TSA drivers to prepare the
> support for the QMC HDLC driver.
> 
> Patches were previously sent as part of a full feature series:
> "Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]
> 
> The full feature series reached the v9 iteration.
> The v1 was sent the 07/25/2023 followed by the other iterations
> (07/26/2023, 08/09/2023, 08/18/2023, 09/12/2023, 09/22/2023, 09/28/2023,
> 10/11/23, 11/15/2023) and was ready to be merged in its v8.
>   https://lore.kernel.org/linux-kernel/20231025123215.5caca7d4@kernel.org/
> 
> The lack of feedback from the Freescale SoC and the Quicc Engine
> maintainers (i.e. drivers/soc/fsl/qe/ to which the QMC and TSA drivers
> belong) blocks the entire full feature series.
> These patches are fixes and improvements to TSA and QMC drivers.
> These drivers were previously acked by Li Yang but without any feedback
> from Li Yang nor Qiang Zhao the series cannot move forward.
> 
> In order to ease the review/merge, the full feature series has been
> split and this series contains patches related to the PowerQUICC SoC
> part (QMC and TSA).
>  - Perform some fixes (patches 1 to 5)
>  - Add support for child devices (patch 6)
>  - Add QMC dynamic timeslot support (patches 7 to 17)
> 
> Compare to the previous iteration:
>   https://lore.kernel.org/linux-kernel/20231128140818.261541-1-herve.codina@bootlin.com/
> this v2 series:
> - Removes a forward declaration in the driver.
> - Adds kernel test robot tags as the issue was detected.
> - Adds some missing Cc: stable.
> 
> Best regards,
> Hervé
> 
> [1]: https://lore.kernel.org/linux-kernel/20231115144007.478111-1-herve.codina@bootlin.com/
> 
> Changes v1 -> v2:
>   - Patch 1
>     Add 'Reported-by: kernel test robot <lkp@intel.com>'
>     Add 'Closes: https://lore.kernel.org/oe-kbuild-all/202312051959.9YdRIYbg-lkp@intel.com/'
>     Add 'Cc: stable@vger.kernel.org'
> 
>   - Patch 2, 3
>     Add 'Cc: stable@vger.kernel.org
> 
>   - Patch 15
>     Move qmc_setup_chan_trnsync() to avoid a forward declaration.
> 
> Patches extracted:
>   - Patch 1..6 : full feature series patch 1..6
>   - Patch 7..17 : full feature series patch 9..19
> 
> Herve Codina (17):
>   soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
>   soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
>   soc: fsl: cpm1: qmc: Fix rx channel reset
>   soc: fsl: cpm1: qmc: Extend the API to provide Rx status
>   soc: fsl: cpm1: qmc: Remove inline function specifiers
>   soc: fsl: cpm1: qmc: Add support for child devices
>   soc: fsl: cpm1: qmc: Introduce available timeslots masks
>   soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
>   soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
>   soc: fsl: cpm1: qmc: Remove no more needed checks from
>     qmc_check_chans()
>   soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
>   soc: fsl: cpm1: qmc: Add support for disabling channel TSA entries
>   soc: fsl: cpm1: qmc: Split Tx and Rx TSA entries setup
>   soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
>   soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and
>     stop()
>   soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
>   soc: fsl: cpm1: qmc: Introduce functions to change timeslots at
>     runtime
> 
>  drivers/soc/fsl/qe/qmc.c      | 658 ++++++++++++++++++++++++++--------
>  drivers/soc/fsl/qe/tsa.c      |  22 +-
>  include/soc/fsl/qe/qmc.h      |  27 +-
>  sound/soc/fsl/fsl_qmc_audio.c |   2 +-
>  4 files changed, 538 insertions(+), 171 deletions(-)
> 


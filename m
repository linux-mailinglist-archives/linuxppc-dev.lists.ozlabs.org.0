Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326E91D965
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 09:50:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nOwrn1G/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCJ9S1Dt7z3cfn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 17:50:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nOwrn1G/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCJ8k3TCVz2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 17:49:25 +1000 (AEST)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 2C86AC4B65
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 07:47:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDF99C0009;
	Mon,  1 Jul 2024 07:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719820043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSzCTTdVM/tcdktgKnj2I7uwAMajiojP6tk7tkVB+GU=;
	b=nOwrn1G/VVmjuD7GQhpAhtIOYD4Tk851VLzUI1ZTims5TqG4tZlpA7uSctgxtqbkI2K0Xj
	Nt7nlclZz9+hXabDud4SgSZrf1t0kwzdWf+0Of1xY8LXrf7cx4G4A3+uzneL3wK2ZwZS/z
	G6fOkCA5hspB4XuvatPoJSSf6RUlWv7PbcrhNxpDANZ2+l4lbXcGIPOkOiBOypxLqIANp+
	cR4r9RisDQab29H9k/zdkGFuwjlX9I6h4JU2gyDKM4IEyogbotiWf9VaNa0YGXMfuxBkSa
	zlt0sXdai9zB1+kvOGYnBomUFCe57yzDpOCXQ2X0hYLWj6dslwC+Nj9kHyH5pg==
Date: Mon, 1 Jul 2024 09:47:19 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 10/10] ASoC: fsl: fsl_qmc_audio: Add support for
 non-interleaved mode.
Message-ID: <20240701094719.14f2eda3@bootlin.com>
In-Reply-To: <20240620084300.397853-11-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
	<20240620084300.397853-11-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, 20 Jun 2024 10:42:57 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

...
> +static bool qmc_audio_access_is_interleaved(snd_pcm_access_t access)
> +{
> +	switch (access) {
> +	case SNDRV_PCM_ACCESS_MMAP_INTERLEAVED:
> +	case SNDRV_PCM_ACCESS_RW_INTERLEAVED:
> +		return true;
> +	default:
> +		return false;
> +	}
> +};
> +

The ';' at the end of the function should not be here and will be removed
in the next iteration.
Also, this function will be changed to
--- 8< ---
static bool qmc_audio_access_is_interleaved(snd_pcm_access_t access)
{
	switch (access) {
	case SNDRV_PCM_ACCESS_MMAP_INTERLEAVED:
	case SNDRV_PCM_ACCESS_RW_INTERLEAVED:
		return true;
	default:
		break;
	}
	return false;
}
--- 8< ---

Hervé

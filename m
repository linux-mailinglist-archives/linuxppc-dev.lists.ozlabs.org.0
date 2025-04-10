Return-Path: <linuxppc-dev+bounces-7567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C055CA843A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 14:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYKRd6YMlz3bmk;
	Thu, 10 Apr 2025 22:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744289437;
	cv=none; b=CvvlG/MSvFRe1PIgXTCTOWTKsIB7XidMKmKOFbvPAcbskh9zRnqrH2f2ICrZ6JW/tkp/HpPlYrJ7ioPYXr042Qdy4n4OS2yCSV+nD70bGw8yH2Trxa60P8ut7N8dH1E1pwWY1e/drabr4WCFgjUiYU7KX7LxmFHvOvrTod2MzPpFN7Ah8RCy6ZM04sM15kPp5twa+XeX7yZ107EK16ktdokvAH3+QjZvP5JYeMlAKlCjbxyOoPo3+wfZBodXhj+HDTGQ++xze10pDhiYp8zTlRGxA5yfTWxXwL3Ki9GCx/VNHUiewFKEnWz9eiMoQPHdWAD+1vfZx9bFqgDMa7PyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744289437; c=relaxed/relaxed;
	bh=nOaRtvwi5bV4oVQgPioJwq74EDoSWRxFQd9eDfqjPcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjETbY+eRpVcdawyuE7HuTNSScTIo89wAHRI1shs0FtcptamCjCeLkzfN0EXJJP5WbdYWj7VqE27OYILcXnVRBtYCvw80PDWmMrW+7yMJoG/PRzsl1vtnzpOQVsH6vuOQIiDoJtsSaOsquam7p4pRR3g5m1T5oJ937/tdXaWhDVKK+omnyO6Pl0ZbzTu3SxFAtx9zzsUw+gpvEZEZrfecWW7k028d/r+ELyubKQkGW1Aadzh/6T229RkbbDxZr6BpIqCa3SOI7IsMPg2qcpK+FnlkY1kDRCdHTCZ7K6SvhcbcdP49i4ig5/IMQ12v/z41vFJTaHReeCoGmzV5L1RmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYKRb6zHWz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 22:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZYJsP6tlKz9vL4;
	Thu, 10 Apr 2025 14:24:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6XqfgGmjU73; Thu, 10 Apr 2025 14:24:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZYJsP68B3z9s2l;
	Thu, 10 Apr 2025 14:24:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD0BE8B764;
	Thu, 10 Apr 2025 14:24:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id q8ya75z2-d-G; Thu, 10 Apr 2025 14:24:25 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 382C08B763;
	Thu, 10 Apr 2025 14:24:25 +0200 (CEST)
Message-ID: <66bccfab-66f0-4e67-8c81-24de09b85a81@csgroup.eu>
Date: Thu, 10 Apr 2025 14:24:24 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on
 TRIGGER_START event
To: Herve Codina <herve.codina@bootlin.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
References: <20250410091643.535627-1-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250410091643.535627-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/04/2025 à 11:16, Herve Codina a écrit :
> On SNDRV_PCM_TRIGGER_START event, audio data pointers are not reset.
> 
> This leads to wrong data buffer usage when multiple TRIGGER_START are
> received and ends to incorrect buffer usage between the user-space and
> the driver. Indeed, the driver can read data that are not already set by
> the user-space or the user-space and the driver are writing and reading
> the same area.
> 
> Fix that resetting data pointers on each SNDRV_PCM_TRIGGER_START events.
> 
> Fixes: 075c7125b11c ("ASoC: fsl: Add support for QMC audio")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> ---
>   sound/soc/fsl/fsl_qmc_audio.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
> index b2979290c973..5614a8b909ed 100644
> --- a/sound/soc/fsl/fsl_qmc_audio.c
> +++ b/sound/soc/fsl/fsl_qmc_audio.c
> @@ -250,6 +250,9 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
>   		bitmap_zero(prtd->chans_pending, 64);
> +		prtd->buffer_ended = 0;
> +		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
> +
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   			for (i = 0; i < prtd->channels; i++)
>   				prtd->qmc_dai->chans[i].prtd_tx = prtd;



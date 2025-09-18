Return-Path: <linuxppc-dev+bounces-12385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94100B8666F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 20:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSP860qcYz2yGM;
	Fri, 19 Sep 2025 04:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758219638;
	cv=none; b=MYJXkP+/Z79F9llz8CLet9hPVernJAKFSyhOo4FI6K8wmRNNe4qe2+CMFFa1PlWe8fyHS3UCmKGhpTOe3SfvhfNmQP6T4CDPz43lIYHGzWc+8NQLlPBth0QHC6i07bP2mmIoB8cmYhUUOFyAsD2qPR7f4TzBAX7/Dl8qUhysPhxvmUPdDgWVXKdW/alsm103Ppj5Ep5jB50nkO/OE8XF4ANSaoK8NUgLJA8ZaTRvCJoEyikZBAiSTSYt/HTkV54iktHxAHIPZhyNnDwiO9/VrlN13sd9EjT9rbYR5dSB99qkhaZb8/CRXCse2Z9zrR/5ZramQc8NYahPjONvIKDakA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758219638; c=relaxed/relaxed;
	bh=7oNy9QkuVfOzMkFgXo7Ye5EoocJCEZK9za4vo0VAhr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuFF9OP0N2tptRii8JjtNBRM0XP88CSLMELI9AWDv9J0PLVXzioo09tsuDZBEp7YxvXdQ/Gt1XgY3DbuSx4TSFY5mLgsRNCXBQN5F1OQWH54a/xOnKOiJv3dc52rDvgoo+pq5GN6NTq36HlvuI84kROREiPx9VS4ZinAnmSXSKOaGHrTelQWxmpGNqteEfNShNs0tHlI815YiUrKHQQHBD6kRSrN2LIHkmX/eLn5SYqmA5T04kGYATS2zL0QzuxR3WmtYj2lKq+iCod8oGA9lcvi389jG3/rYq13fuN3cOmG7ohpWXuCI3XGukeqROck1k121tgfocZvL8k61tBuAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSP8539pHz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 04:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLsR0SvSz9sgS;
	Thu, 18 Sep 2025 18:37:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-Hjp8AA_eSf; Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLsQ6Hsnz9sgR;
	Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0B908B776;
	Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OohEcxeSfQe1; Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EFF928B767;
	Thu, 18 Sep 2025 18:37:45 +0200 (CEST)
Message-ID: <bad14e16-0d1c-411a-8b3d-89d8df05b9b5@csgroup.eu>
Date: Thu, 18 Sep 2025 18:37:45 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/09/2025 à 17:34, Christophe Leroy a écrit :
> This is a RESEND of v3 sent one month ago, see:
> https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/

Sorry for the noise, v3 was 
https://lore.kernel.org/all/cover.1755504428.git.christophe.leroy@csgroup.eu/
The resent is correct though, only this reference in the cover is wrong.

Christophe

> 
> This series reduces significantly the amount of interrupts on
> fsl_qmc_audio device.
> 
> Patches 1 and 2 are preparatory patches.
> Patch 3 is the main change
> Patch 4 is a cleanup which is enabled by previous patch
> 
> Changes in v3:
> - Properly check the buffer descriptor is unused (Patch 1, comment from Herve Codina)
> - Fixed copy/paste error (patch 2, comment from Herve Codina)
> - Fixed build failure (patch 2, comment from Herve Codina and Test robot)
> 
> Changes in v2:
> - Don't remove UB bit (Patch 1, comment from Herve Codina)
> - Make sure audio channels are ordered on TDM bus (Patch 2, new patch, comment from Herve Codina)
> - Drop struct qmc_dai_chan  (patch 4, new patch)
> 
> Backgroup (copied from patch 3):
> 
> In non-interleaved mode, several QMC channels are used in sync.
> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
> fsl_qmc_audio: Add support for non-interleaved mode.")
> At the time being, an interrupt is requested on each channel to
> perform capture/playback completion, allthough the completion is
> really performed only once all channels have completed their work.
> 
> This leads to a lot more interrupts than really needed. Looking at
> /proc/interrupts shows ~3800 interrupts per second when using
> 4 capture and 4 playback devices with 5ms periods while
> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
> 
> The QMC channels work in sync, the one started first is the one
> finishing first and the one started last is the one finishing last,
> so when the last one finishes it is guaranteed that the other ones are
> finished as well. Therefore only request completion processing on the
> last QMC channel.
> 
> On my board with the above exemple, on a kernel started with
> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
> patch while it uses 26% CPU time without this patch.
> 
> Christophe Leroy (4):
>    soc: fsl: qmc: Only set completion interrupt when needed
>    ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
>    ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
>    ASoc: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan
> 
>   drivers/soc/fsl/qe/qmc.c      |  44 +++++++++---
>   sound/soc/fsl/fsl_qmc_audio.c | 125 +++++++++++++++-------------------
>   2 files changed, 87 insertions(+), 82 deletions(-)
> 



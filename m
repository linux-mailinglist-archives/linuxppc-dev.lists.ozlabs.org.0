Return-Path: <linuxppc-dev+bounces-8467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463BAB0EB9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 11:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv3Pw4fjrz2yDk;
	Fri,  9 May 2025 19:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746782436;
	cv=none; b=CCZqAGIFvZ1NeCq2AbnmRhH2rZxbn0cLfG/+Pn0ul2uWGBi8FrJ+laDnAJuiPDiynG5iqrJzpsvdqJICgl3DQrX4fKPRiA2Z5KIbL7FM2FBB6TMFWlOV6mpIn50xuSMAnECMcnueRbo2fqhjhMz1I7bsAdBcFCI6JQ8BPl16KHDxbkG9J067YKCNe3jMtquBb6LwStlStMER61zkpze004XTRT9ufTk2LQQ5w3FJ+0zatyb6+4U84bpkDUmSeKtNi2+nJ3TgLoVZc+3Q1I7beF3pi3P6I2kiqYlLyLyzfupnkLeg5aW8DOsQXGC0IHnv28VFmNc5OTDPJElCZ8ayCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746782436; c=relaxed/relaxed;
	bh=H/Eq7JvpxuQbytALETignqsCp5qjux+UBock55sW198=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bve8wlHh+gqr6AMF8LhXdjudZs+YcgKIkFmhgcQmgJuzU1uk8y6b608+0IJv1LqKdvLnrJMQIv4mooe64a90PbVtvC6Rw7DK+h2heeA779gsTnZizhAlizimMLwJLKu8UsKdw3NYAhHIRkQB+Xc7qa60dKa6sQDS0fW0MLtJaL/g1zvb9pHmdn85o3Q+BiRfh3nU6/C9Fk4rfVefzuJxgSCR/OsXdso2k+SjYWClWUpCT+Bvu9nE6f0bld98Im7cYs7xMc8Cif0XMFjgznnLzBuNGNlC5LsVfzMjLnvx79wVrmljnPOV9sgG7SuIwFfXunAvGcpAiHaVYEfbxkpvAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv3Pv70Q6z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 19:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zv3FQ06s9z9t7B;
	Fri,  9 May 2025 11:13:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8onC-g13dbh; Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zv3FP6VrMz9t2V;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D63998B776;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fVWNjZv3ZZLW; Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 21FC18B768;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
Message-ID: <bc561703-bf34-4c99-aaad-1b1aad5ced12@csgroup.eu>
Date: Fri, 9 May 2025 11:13:12 +0200
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
Subject: Re: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion on
 last channel
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
 <5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
 <20250509104544.5c375f05@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250509104544.5c375f05@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Hervé,

Le 09/05/2025 à 10:45, Herve Codina a écrit :
> On Fri,  9 May 2025 09:48:45 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> In non-interleaved mode, several QMC channels are used in sync.
>> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
>> fsl_qmc_audio: Add support for non-interleaved mode.")
>> At the time being, an interrupt is requested on each channel to
>> perform capture/playback completion, allthough the completion is
>> really performed only once all channels have completed their work.
>>
>> This leads to a lot more interrupts than really needed. Looking at
>> /proc/interrupts shows ~3800 interrupts per second when using
>> 4 capture and 4 playback devices with 5ms periods while
>> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
>>
>> The QMC channels work in sync, the one started first is the one
>> finishing first and the one started last is the one finishing last,
> 
> How can we be sure about that?
> 
> The mapping on the TDM bus has to be taken into account.
> 
> chan 0 -> TDM bits 0..8
> chan 1 -> TDM bits 16..23
> chan 2 -> TDM bits 9..15

In interleaved mode, the QMC will not allow that. You can have 
TS0-TS1-TS2 or TS1-TS2-TS0 but you can't have TS0-TS2-TS1.

In non-interleaved mode we mimic the interleaved mode so I don't expect 
it either.

> 
> In that case chan 1 can finish after chan 2.
> 
> qmc_chan_get_ts_info() could be used to get struct qmc_chan_ts_info
> and [rx,tx]_ts_mask field in the struct give the mapping information.
> 
> The channel that ends last is the one with the highest bit set in the
> mask (rx_tx_mask for capture and tx_ts_mask for playback).

That would be right if the channels were starting all at exactely the 
same time. But qmc_audio_pcm_write_submit() and 
qmc_audio_pcm_read_submit() are calling resp. qmc_chan_write_submit() 
and qmc_chan_read_submit() one by one.

Even if that happens it shouldn't be a problem on its own as there are 
only a few microseconds between each Timeslot (a full cycle is 125 µs). 
And also because calling snd_pcm_period_elapsed() doesn't have any 
destructive effect on ongoing processing.

So I wouldn't make it too complicated. Here the benefit is real and 
worth it.

Thanks,
Christophe

> 
> Best regards,
> Hervé
> 
>> so when the last one finishes it is guaranteed that the other ones are
>> finished as well. Therefore, only request completion processing on the
>> last QMC channel.
>>
>> On my board with the above exemple, on a kernel started with
>> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
>> patch while it uses 26% CPU time without this patch.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---



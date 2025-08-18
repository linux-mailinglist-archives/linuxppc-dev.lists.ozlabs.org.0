Return-Path: <linuxppc-dev+bounces-11118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D5B2B88F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 07:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5dG318Cqz3cmx;
	Tue, 19 Aug 2025 15:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755580843;
	cv=none; b=HhTKt/AVnliCYektwr6KdfzCckMw9nJQ69oRuEYR5aVhbbsl57Xgj/60VenCm2fnVWlyRWYu+xR7uB4r0ZuBIX+mSrN7tMw41DBVcMdYDrKhNmPN0gCFF0mk7gMvEHfYEqqWH7gAnb0ek2lJ9bavx/TQ4hCTJI/L8LgBWijuseVYKoOJyhs72XPZP8aDo9ad5rUpTzPpT8D7lCvvuv1gXx+a4pDbiS0RwZ8PKo9GpPQmqEG9qxgWdBBMn0fqHGUZPR+qCR5LZKBBLyi2JaUYxsC+6336rjRe6umfYukozWlHYx5M4yML8icQ2RATbAvDA7b/JQxm2d0Utvl7Cq1foA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755580843; c=relaxed/relaxed;
	bh=YJn0U2/tyMFIB/SctjyxEAKJkay78f83rJ0olwVtaYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=We7lxssQ+167F/IhpIRQ6sCHrUFuKgRUwJD4aexEvVYwXcgCUlQkl15muS6efb76HZvjFgaGD7m5Cg5d3qR5qEjcLlzDlFhWoTJ4riq8WdsULvCdIFr6YVFYOvFbLiOE9Y3QlximTVKEBn7/lJ35KDN3GSytZ4qnh7aC06nqj7vEAn1VvPVSjGzJa308L+zzcelrjBhs3vYTQcwozv7TeUjZyGoPgSf0e3qNBdGXAj65GARzC92SDSYxA2uyE7U8AMd5HEGhWclFop+R6n1P7Sqf7/ePODKUfX+8yztM13kM/WVJGtI638lHnBaBQB0sX1H6MRcWL4ijsXKJU36fiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5dG24lYcz3cm7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 15:20:42 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55FY6wKBz9sW0;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMU1reJG0jOi; Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55FY69pzz9sVx;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD3768B764;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id E2DQQggsZVWb; Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8617A8B763;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Message-ID: <384e2b94-186f-436c-aa69-3cc41a38552c@csgroup.eu>
Date: Mon, 18 Aug 2025 10:18:25 +0200
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
Subject: Re: [PATCH v2 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels
 are ordered in TDM bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
 <20250814094502.4b350b3e@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250814094502.4b350b3e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/08/2025 à 09:45, Herve Codina a écrit :
> On Tue, 12 Aug 2025 12:50:56 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> To reduce complexity of interrupt handling in following patch, ensure
>> audio channels are configured in the same order as timeslots on the
>> TDM bus. If we need a given ordering of audio sources in the audio
>> frame, it is possible to re-order codecs on the TDM bus, no need to
>> mix up timeslots in channels.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: New
>> ---
>>   sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
>> index 5614a8b909edf..0be29ccc1ff7b 100644
>> --- a/sound/soc/fsl/fsl_qmc_audio.c
>> +++ b/sound/soc/fsl/fsl_qmc_audio.c
>> @@ -791,12 +791,17 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>>   			       struct qmc_dai *qmc_dai,
>>   			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
>>   {
>> +	struct qmc_chan_ts_info ts_info;
>>   	struct qmc_chan_info info;
>>   	unsigned long rx_fs_rate;
>>   	unsigned long tx_fs_rate;
>> +	int prev_last_rx_ts = 0;
>> +	int prev_last_tx_ts = 0;
>>   	unsigned int nb_tx_ts;
>>   	unsigned int nb_rx_ts;
>>   	unsigned int i;
>> +	int last_rx_ts;
>> +	int last_tx_ts;
>>   	int count;
>>   	u32 val;
>>   	int ret;
>> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>>   				return -EINVAL;
>>   			}
>>   		}
>> +
>> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
> 
> qmc_chan_get_ts_info() need a struct qmc_chan as first parameter
> 
> qmc_dai->qmc_chans[i].qmc_chan instead of qmc_dai->qmc_chans[i].
> 
> The use of qmc_dai->qmc_chans[i] without .qmc_chan have to be done on patch 4 (cleanup patch).

Fixed in v3

Thanks
Christophe


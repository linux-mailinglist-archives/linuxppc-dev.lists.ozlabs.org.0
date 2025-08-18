Return-Path: <linuxppc-dev+bounces-11120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DDB2BE02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 11:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5lFZ6WWPz3d28;
	Tue, 19 Aug 2025 19:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755597042;
	cv=none; b=dGIv1aIgbWMY1FFNJwFWrVKRZI0xTzBkPvlpqSjU4iPOQIlu4oAFyEvwXKyYt6vAs2yVBJKVzQv5pxovSK5hBizzNNHL23J+qgjzqs9Exea/eyZuYSssAd2oIEfc2OPlqSTp6HuDUrqg9608UvSzqimuJCVQxfFtZYU9NIssVcRMtd/FLCqSDpzpftkhpaTkQgCysf7t53xguVj9KihNiMXldoC56RNc+LVFYD+Y/lYZ4jw3AljnUWmRQ4o2eLbiu/RhrFbrnJaiLSNwndiJRVlT2FQo5hb8dIbfj6iKdoCHlRBhTVLImamA7JWIsyCIfQu3TpUxV3QUxO8/N74GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755597042; c=relaxed/relaxed;
	bh=VKSZMsHxGJpaN9hFkYvVgxYMHGqP3GyUhVJIQ8h1HsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3ycXDpUXus8tEQ/miIZgfWMtetdNj49S9/kCbMQSAB/DKrOE6Nq2gMFMWWscETqpKUGXNNh/PfGR5xZxp3n+EoRqtXgP9BzhuVJbDjEnQKi8CQdhqj0UZk56HVw9gFsz/58udDAtxk8I7EPVZ7ZCZqcmVllXcoeLuxDfDeCsfFKa/h4RG0SAwaRA+/IdN0dwRys2HG8RorAtgBXvwMNDyZn1XW5yGG01a7fAkFndEhJ1GFivXtXxMBWlvdhUrcya+OZHNvTBYdc9O+0esMyEq+XjcmCtORKss30J5nzPPMFC0MMkQlelTcAK5xFwzFx3vZLdP6W3g4fKJHPFpyHeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5lFZ3BQWz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 19:50:42 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55Fx3PBzz9sW3;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vnj3VDrR4Hnq; Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55Fx2gYYz9sW1;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 465088B764;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uRYqQBvN43Yy; Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 137DE8B763;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Message-ID: <aacc97c0-2cc6-4192-9b19-5234ccd93504@csgroup.eu>
Date: Mon, 18 Aug 2025 10:18:44 +0200
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
 <20250813120657.1e93b16b@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250813120657.1e93b16b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/08/2025 à 12:06, Herve Codina a écrit :
> Hi Christophe,
> 
> On Tue, 12 Aug 2025 12:50:56 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> ...
> 
>> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>>   				return -EINVAL;
>>   			}
>>   		}
>> +
>> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
>> +		if (ret) {
>> +			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
>> +				qmc_dai->id, i, ret);
>> +			return ret;
>> +		}
>> +
>> +		last_rx_ts = fls64(ts_info.rx_ts_mask);
>> +		last_tx_ts = fls64(ts_info.rx_ts_mask);
>                                                
> tx_ts_mask instead of rx_ts_mask for last_tx_ts.
> 

Fixed in v3

Thanks
Christophe


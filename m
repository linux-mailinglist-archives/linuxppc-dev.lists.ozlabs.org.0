Return-Path: <linuxppc-dev+bounces-11152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C34B2CC69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 20:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5zDZ0fTQz2yQH;
	Wed, 20 Aug 2025 04:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755629438;
	cv=none; b=HP1gdKHZX5UzV71T6UVt6GAiJpNqTjKhAT8aEt7ky6AolwCdQBgAdoRcG10qKWx1c7vnQECiOVr1WMlYcM/jpTpvlvZJsQ/Wao8syWAMfZZNgJE5NF2FlXB4F3yKS5CX9aP3+BPEzlHQlqehDEdbs7Eu7gi0mKO7S0bNkwzIxanfklFNgq5fbMWJrEIufVw56xLJq6FocDIGjwSeVa8lf1CGoAXfLr1MlRPwCmUDWDZFBasvcaIMRKJUBn+TRyzF988x92xiFCuI1xu0gt8MRaa5oAgp6IMBJJh4jKf/RBAiYKYfDTrZsgZmJJIRTlIpjmQAFJz2L9VXgEccNpkEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755629438; c=relaxed/relaxed;
	bh=ldA8Cq56ir/d+Ws7ka9AVxzOxCQyUGzp7/Z3Z9LemSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5IZxTO1aCxa16B5iot8AqcPGytAzmCwvbpjVihuK991e0bWLCNK/pc1cih3jOMPW1ow3hqWR7opANZNYLsZRDa86e4K+tsLK26Qnb8HyDkaVHIHW+RX5gpBDwSDZVN8sdBnhacHwijI4EKT+D/ZPjtNROtfEv54UjtdCAegRVgTelUKbxxFabr3dCBB3gThwG0ROHEu7v5ajS8JNSjpMA039zGBJzQThy3GoG764u5MFQ0X7IrLTMYFS0JItnHrubqo/sQmuSkID2BR6VxV+jO4ZSEJwEgU8fSzMS+0ImpnjAcOzQfcECG1X3dZavUMZglPI0rsg0ELxepUuFIV/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5zDY2yVSz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 04:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55C50qHxz9sVk;
	Mon, 18 Aug 2025 10:16:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5xAwfCwBfZs; Mon, 18 Aug 2025 10:16:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55C46fb9z9sVf;
	Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CB4FE8B764;
	Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9jsli9on6cF7; Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C15C8B763;
	Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
Message-ID: <06c3012d-96f1-434a-af17-a1705eede7d6@csgroup.eu>
Date: Mon, 18 Aug 2025 10:16:16 +0200
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
Subject: Re: [PATCH v2 1/4] soc: fsl: qmc: Only set completion interrupt when
 needed
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <badb68a85910e5e6f1094ef3b01805209ac21854.1754993232.git.christophe.leroy@csgroup.eu>
 <20250813120651.27dc8467@bootlin.com> <20250814093443.1506b49f@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250814093443.1506b49f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Hervé,

Le 14/08/2025 à 09:34, Herve Codina a écrit :
> Hi Christophe,
> 
> On Wed, 13 Aug 2025 12:06:51 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
>> Hi Christophe,
>>
>> On Tue, 12 Aug 2025 12:50:55 +0200
>> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>>> When no post-completion processing is expected, don't waste time
>>> handling useless interrupts.
>>>
>>> Only set QMC_BD_[R/T]X_I when a completion function is passed in,
>>> and perform seamless completion on submit for interruptless buffers.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v2: Keep the UB flag to mark not completed buffers and seamlessly flag them as completed during next submit.
>>> ---
>>>   drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
>>>   1 file changed, 33 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
>>> index 36c0ccc06151f..8f76b9a5e385d 100644
>>> --- a/drivers/soc/fsl/qe/qmc.c
>>> +++ b/drivers/soc/fsl/qe/qmc.c
>>> @@ -461,9 +461,16 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>>>   
>>>   	ctrl = qmc_read16(&bd->cbd_sc);
>>>   	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
>>> -		/* We are full ... */
>>> -		ret = -EBUSY;
>>> -		goto end;
>>> +		if (!(ctrl & QMC_BD_TX_I) && bd == chan->txbd_done) {
>>> +			if (ctrl & QMC_BD_TX_W)
>>> +				chan->txbd_done = chan->txbds;
>>> +			else
>>> +				chan->txbd_done++;
>>> +		} else {
>>> +			/* We are full ... */
>>> +			ret = -EBUSY;
>>> +			goto end;
>>> +		}
>>>   	}
>>>   
>>>   	qmc_write16(&bd->cbd_datlen, length);
>>> @@ -475,6 +482,10 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>>>   
>>>   	/* Activate the descriptor */
>>>   	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
>>> +	if (complete)
>>> +		ctrl |= QMC_BD_TX_I;
>>> +	else
>>> +		ctrl &= ~QMC_BD_TX_I;
>>>   	wmb(); /* Be sure to flush the descriptor before control update */
>>>   	qmc_write16(&bd->cbd_sc, ctrl);
>>>     
>>
>> You try to purge one descriptor for which the transfer is done but you do that
>> when you have no more free descriptors.
>>
>> You end up with all descriptor "used". I think a better way to do that is
>> to purge all "done" descriptor configured to work without interrupts until a
>> descriptor with interrupt is found.
> 
> I have looked again at your code and looking for a free descriptor only when it
> is needed is sufficient. You can forget my previous proposal.
> 
> Back to your code, I think you need to be sure that the descriptor you want to
> re-use is really available and so you need to check the 'R' bit to be sure
> that we are not with 'R' = 1 and 'UB' = 1 which means "BD is used, waiting for
> a transfer".
> 

Fixed in v3.

Thanks
Christophe


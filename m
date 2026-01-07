Return-Path: <linuxppc-dev+bounces-15363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A052BCFCC04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:10:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMgh1RW0z2yMJ;
	Wed, 07 Jan 2026 20:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777008;
	cv=none; b=XC4zFBACTe4tF5u6AMnln5ecso5H65QQQizzZqBOXxPvfoW/RL16LTylto2grwQg3DFb48TOeEqDqAhKk6ZRb0JYawT+np49QLRW+Wip8Ir2jm7cFyj9TO+1mgj+Djt8kPt8VnZmyA0un83A71AxFmxVyHuXcCtOYbz5CzIRsJOyi7SD6bY/DRogMpxIhua0l0PQqkO9tyyj1RKLOMw0itHIIhH49QaEoZY0FU54LLijLk+BfkHnges+YFEDheI6hQzvZYkcnhaE3xcbSkWa9BVWSyD12yAe+lV3bHbNepLRP1dATEPmnwWwPWCyQYzAZfV0DvOGINo+qnpaQX8pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777008; c=relaxed/relaxed;
	bh=lnlpbCgmTxtOTglNGqjyaNJHb6k8FcV3Z6TUh/kkeRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXTPylwxRosdukU4+gyiVjyMapooZe8SSXqcddHcZAGo2aUoKKng7ZxJ4hUaeDY0u9cLLM680XbqGVhQtqSFxfaLPqs36tei10rnsEDDkgjCEaMDBGEWvnE+d+IATfLm3KKXPVWmX+GHZ1vtd4IrBYKILUi+IBUPPhui5JflVKPu2W6KosGD2M22GQFA8xz5JcUTTJgYAYjlxdNepfd4YsERIoxFcc6cTWtppLhqRBqE8NVA4NTcrjr4ocGD7tNbSUiqQy8ETbJBpZURFEcAhve5DXFXWh13epU1G3Snjym2Wjdlj5goKWldSVAcHoGvltynFz9511Uc7EGthX7cFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IpBgUSpA; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=richard.genoud@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IpBgUSpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=richard.genoud@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 405 seconds by postgrey-1.37 at boromir; Wed, 07 Jan 2026 20:10:06 AEDT
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMgf2Nfgz2yMB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:10:04 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 957991A26D4;
	Wed,  7 Jan 2026 09:03:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60AD6606F8;
	Wed,  7 Jan 2026 09:03:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE474103C86DE;
	Wed,  7 Jan 2026 10:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767776585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lnlpbCgmTxtOTglNGqjyaNJHb6k8FcV3Z6TUh/kkeRY=;
	b=IpBgUSpAyMC7CqPdKAOn+LjZDHc/4mwnVF8nyWXFl1gh2i7nNLmQRUwxjDLVi+GcZjZNTU
	FlVUT3eDuIprIT1rq+qBwii5qcu07LUd3VCZpETkXdyHHYc/SB0NV57oBykWQAI4XCRE4h
	H1AMXafJsLcq2LFw8S2Bmx746Qu8FG3ieY1iwUdrbMhtuTr/Q111xpc8QPN7kKlbXKBc+B
	vx7qe6A/zWEPu558hsz+SpXlI267uyhPD3hbvuvJ0xm6QR7BNgzYuCBKeAOfHPY3hO/hQ4
	+eHpMB/ZUfAMLXtmwy6dxg8cz185UH3iuJe6YQ9K+2PE4W4Ea46IjRVkh6UfIw==
Message-ID: <9a8eeb82-c40a-421c-8d57-dbbe317c270d@bootlin.com>
Date: Wed, 7 Jan 2026 10:03:00 +0100
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
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
 <da2988cf-8f4b-4f85-a915-d83ebcb9923e@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <da2988cf-8f4b-4f85-a915-d83ebcb9923e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

Le 06/01/2026 à 19:29, Christophe Leroy (CS GROUP) a écrit :
> 
> 
> Le 23/12/2025 à 08:25, Richard Genoud a écrit :
>> [Vous ne recevez pas souvent de courriers de 
>> richard.genoud@bootlin.com. Découvrez pourquoi ceci est important à 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
>> fq_table[fq->idx] state and freeing/allocating from the pool and
>> WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.
>>
>> Indeed, we can have:
>>           Thread A                             Thread B
>>      qman_destroy_fq()                    qman_create_fq()
>>        qman_release_fqid()
>>          qman_shutdown_fq()
>>          gen_pool_free()
>>             -- At this point, the fqid is available again --
>>                                             qman_alloc_fqid()
>>             -- so, we can get the just-freed fqid in thread B --
>>                                             fq->fqid = fqid;
>>                                             fq->idx = fqid * 2;
>>                                             WARN_ON(fq_table[fq->idx]);
>>                                             fq_table[fq->idx] = fq;
>>       fq_table[fq->idx] = NULL;
>>
>> And adding some logs between qman_release_fqid() and
>> fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.
>>
>> To prevent that, ensure that fq_table[fq->idx] is set to NULL before
>> gen_pool_free() is called by using smp_wmb().
> 
> You dismantle/reimplement qman_release_fqid(). Is that the only possible 
> approach ?
> Isn't it possible to just clear fq_table[fq->idx] _before_ calling 
> qman_release_fqid() ?
> 
I'm afraid that clearing fq_table[fq->idx] before calling
qman_release_fqid() will create another race condition:
In qm_mr_process_task() we have:
			case QM_MR_VERB_FQRN:
			case QM_MR_VERB_FQRL:
				/* Lookup in the retirement table */
				fq = fqid_to_fq(qm_fqid_get(&msg->fq));
				if (WARN_ON(!fq))
					break;
				fq_state_change(p, fq, msg, verb);
				if (fq->cb.fqs)
					fq->cb.fqs(p, fq, msg);
				break;
https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/soc/fsl/qbman/qman.c#L1509-L1518
with fqid_to_fq(fqid) expanding to fq_table[fqid * 2];

Is it possible for those "cases" (QM_MR_VERB_FQRN/QM_MR_VERB_FQRL) to
happen after fq_table[fq->idx] is cleared and before qman_shutdown_fq()
is called?
In doubt, I chose the safe side, but I'm not 100% sure it can happen.


Thanks!

Regards,
Richard
>>
>> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> NB: I'm not 100% sure of the need of a barrier here, since even without
>> it, the WARN_ON() wasn't triggered any more.
>>
>> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
>> index 6b392b3ad4b1..39a3e7aab6ff 100644
>> --- a/drivers/soc/fsl/qbman/qman.c
>> +++ b/drivers/soc/fsl/qbman/qman.c
>> @@ -1827,6 +1827,8 @@ EXPORT_SYMBOL(qman_create_fq);
>>
>>   void qman_destroy_fq(struct qman_fq *fq)
>>   {
>> +       int leaked;
>> +
>>          /*
>>           * We don't need to lock the FQ as it is a pre-condition that 
>> the FQ be
>>           * quiesced. Instead, run some checks.
>> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>>          switch (fq->state) {
>>          case qman_fq_state_parked:
>>          case qman_fq_state_oos:
>> -               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
>> -                       qman_release_fqid(fq->fqid);
>> +               /*
>> +                * There's a race condition here on releasing the fqid,
>> +                * setting the fq_table to NULL, and freeing the fqid.
>> +                * To prevent it, this order should be respected:
>> +                */
>> +               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
>> +                       leaked = qman_shutdown_fq(fq->fqid);
>> +                       if (leaked)
>> +                               pr_debug("FQID %d leaked\n", fq->fqid);
>> +               }
>>
>>                  DPAA_ASSERT(fq_table[fq->idx]);
>>                  fq_table[fq->idx] = NULL;
>> +
>> +               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
>> +                       /*
>> +                        * fq_table[fq->idx] should be set to null before
>> +                        * freeing fq->fqid otherwise it could by 
>> allocated by
>> +                        * qman_alloc_fqid() while still being !NULL
>> +                        */
>> +                       smp_wmb();
>> +                       gen_pool_free(qm_fqalloc, fq->fqid | 
>> DPAA_GENALLOC_OFF, 1);
>> +               }
>>                  return;
>>          default:
>>                  break;
>>
>> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
>> -- 
>> 2.47.3
>>
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


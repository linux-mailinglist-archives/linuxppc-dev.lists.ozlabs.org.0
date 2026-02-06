Return-Path: <linuxppc-dev+bounces-16647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHzaIj6VhWk7DwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 08:16:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF88FAE37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 08:16:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6lkL0MqVz2xWJ;
	Fri, 06 Feb 2026 18:16:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770362169;
	cv=none; b=YKsGuRhaIN3LoOiVF/z8uXIqls9epaOZ0mYLX5LJ7wJZBZVy4b9nQLJarZIHU+7BxSVHnek+aKE0QN8OrWqJEzZqH96wmJJ0RwtREcAmHpWQQcPDMT+u2vzCaGQD9tO1C0TuyzgdEoIq7j0/2TGOFherHbk+CbG7KoOmClelsGylLj3WfYKVVfWTv1R4KxNxRiXDFxhRrxpNUs8zR8wKmZQXH03UH9pIgL62hwt8frxKVjaUDSDQubqaMIdORRD8KkB4QpiBHgYr2RS5vE56eBLmKb2OENIo7FlR9E2k5Cds9biolJYLrrIUcfMkn087Z5mQJJKdUKoH1G7N8tEiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770362169; c=relaxed/relaxed;
	bh=nkMDM4rC7yGmXZE/CaMd6fZPIBX9ktS8WEKcs5QdQiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdIY1BaJl2x1bwmfGFS2ZPeoZ0Retk1Jvb3EIXjrNK2WYqVdGogPoCY6E04VWgwTyfjIFhi016FOxcmY4kjwhZ04fOGVnIMayjxyM5YZdXsgIXoM+3XMIoE/70b8T6MqzKeA3lMigbdVxV6BwqW6arDpM2JI5YPdlVQel00cPCy0F6jTQRI22YNxQeiMq6qrAAMVKrBMXqhEVDxndLuGtxptOLLpKMBzuaC5GKdy6BkNT077Arh72r9pWSEaHjZBRHa5fi9VdgFFj8oEz8tQoY2pROdBpDbxf1LvxEWUZdFlKkDXp5kViO6gsjcfbvvcMsUEZl9X8kSa4meydJGjdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ttr4vzmA; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ttr4vzmA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6lkK0Sq6z2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 18:16:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34AA56001A;
	Fri,  6 Feb 2026 07:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E952AC116C6;
	Fri,  6 Feb 2026 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770362166;
	bh=EQj88U1PIguqEAI0bHvHKRFIWmNh/CHWlfiSK+CikIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ttr4vzmAOWkSVKpkh3mIiwxnjyQYBOLTV4WPmeC6K+A4UgVq/Q6trh5HHQpzZ4sPp
	 hMpwYsrh05MItrVvB4p2pEIC/zTE9V4qIJD99iciQ1WGDAbbiHUBxkAqYKlrMV80Cp
	 JRkr8kaumkUtREeJXcZG/3A+kvu6mxSI2EbFxMo8R9PcokrV0RLJ/EqIgOvH8+UAxc
	 4iUALByznofDbaIUEyhTZJ/FW1+qUk6BeozjhHf7l2qy1rBrDqjKiMFMDFOoHiZK5s
	 bK0KITp3JQh0NpLNVp72lAosI5sZEsyfW9EIWMyHM2AJAysrba0dQUd1kKROMeFrtS
	 cxko2kfih5Jqg==
Message-ID: <f942c10a-73a7-4185-865f-c74c11f6fdcc@kernel.org>
Date: Fri, 6 Feb 2026 08:16:00 +0100
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
To: Richard GENOUD <richard.genoud@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
 <825baaef-bd76-4e2c-94ef-3daddf55243b@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <825baaef-bd76-4e2c-94ef-3daddf55243b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16647-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:richard.genoud@bootlin.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:roy.pledge@nxp.com,m:claudiu.manoil@nxp.com,m:oss@buserror.net,m:thomas.petazzoni@bootlin.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:thomas.champseix@alstomgroup.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,bootlin.com:email,alstomgroup.com:email]
X-Rspamd-Queue-Id: 8BF88FAE37
X-Rspamd-Action: no action

Hi,

Le 02/02/2026 à 13:54, Richard GENOUD a écrit :
> Le 23/12/2025 à 08:25, Richard Genoud a écrit :
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
>>
> 
> Tested on a LS1046A based board.
> With this patch, the warning is not triggered anymore.
> 
> Tested-by: CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>

This fix is now in linux-next. If everything goes well I will send a 
pull request for this fix in rc2 or rc3.

> 
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
>>   void qman_destroy_fq(struct qman_fq *fq)
>>   {
>> +    int leaked;
>> +
>>       /*
>>        * We don't need to lock the FQ as it is a pre-condition that 
>> the FQ be
>>        * quiesced. Instead, run some checks.
>> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>>       switch (fq->state) {
>>       case qman_fq_state_parked:
>>       case qman_fq_state_oos:
>> -        if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
>> -            qman_release_fqid(fq->fqid);
>> +        /*
>> +         * There's a race condition here on releasing the fqid,
>> +         * setting the fq_table to NULL, and freeing the fqid.
>> +         * To prevent it, this order should be respected:
>> +         */
>> +        if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
>> +            leaked = qman_shutdown_fq(fq->fqid);
>> +            if (leaked)
>> +                pr_debug("FQID %d leaked\n", fq->fqid);
>> +        }
>>           DPAA_ASSERT(fq_table[fq->idx]);
>>           fq_table[fq->idx] = NULL;
>> +
>> +        if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
>> +            /*
>> +             * fq_table[fq->idx] should be set to null before
>> +             * freeing fq->fqid otherwise it could by allocated by
>> +             * qman_alloc_fqid() while still being !NULL
>> +             */
>> +            smp_wmb();
>> +            gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
>> +        }
>>           return;
>>       default:
>>           break;
>>
>> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> 
> 



Return-Path: <linuxppc-dev+bounces-16522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E6nBuCfgGni/wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 14:00:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB3CC8D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 14:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4RY62qZPz30BR;
	Tue, 03 Feb 2026 00:00:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770037210;
	cv=none; b=RsC1lt98ukOaRvVQIt5xKRJ/8Qal3wIJQJ9ps6SXnFt6p8loG/3mJvHVMIt0Rv+3q9Ku4noer3Jo4eANrUSJGg2N/X4/fhH2VfjYENQIA2uL2U6MB5agRIo+U18KlYIet97Mf3mrUlFpty3NXdKN6c7nVfWfGug9z2mzvsIyFkYNaBgWgFEYrES/rVss/tY4v24xSN7kHuPehdcr81OLT6mvTRdpFP3r5fh4n1+qv9g9OSc/Jd4NwsipdI1c31kzsrKYJsc3WqTnsak4/lBfcoBq0+cXgT6w8yjcnDXy/46ypap+fDHuETbhhiCl0hbv8PzwwuWyzu8i7bvOOKNr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770037210; c=relaxed/relaxed;
	bh=uEc8TvjnHa5ctWLyR7nKKcSQVtFV4OpS/QLW1YcL9eM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yjoh02VAeOkfJVlaRpYJBPBw1E8UFvR2Dbk4RM2PPP5oLTGNwoyaLSYioAeq43lmdbeTKPB7ZIivMBS3i+XbgKl9yMbK57EfrtsYxmGFDTyvPWgrISx4Tih0/dc0rxIrLgtOAR0++d0XxGI2MZKWLyEJjZjsgKmTx1tyMIeWa/ogVY+auQVph3q/zxXr6J+mAMatW+sXhPTd+4ZV4oWxWK1AWF6hrspCYdRJ4p+aUoY7A2W2JsnlGkxaG2ZoZqHvrXwvmo1yPyOU3BQEF1ehDZnQMjW1A+//UsXeRoMFT8xpU9qBR0FvC/MRGntJchKSJihrZPUXMGlA2ctQhHLMFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O0uWghrH; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=richard.genoud@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O0uWghrH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=richard.genoud@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 321 seconds by postgrey-1.37 at boromir; Tue, 03 Feb 2026 00:00:08 AEDT
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4RY419h7z2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 00:00:06 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C33974E423BA;
	Mon,  2 Feb 2026 12:54:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 887B360767;
	Mon,  2 Feb 2026 12:54:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58917119A8891;
	Mon,  2 Feb 2026 13:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770036879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uEc8TvjnHa5ctWLyR7nKKcSQVtFV4OpS/QLW1YcL9eM=;
	b=O0uWghrHWXwaACUvUJKHzbTu4QLw59L0R/2S+wlYL3pxoyfqk9f0c54BD6+7bowN2+12Ss
	awylkXRFZduyC7o/tZRzRy2Y+FvEl1fsjer/2iNtWqE/oeazmwF3OdJC12pTpFjuFmM6d+
	SYqN8LApm6ddErnuQWEuzOo1BYdvSHbo1dsSl9jtjZA5xK06bTDVCqU3aFNMMOC5oduXzS
	MeezuuwwWFo2CucaaYP2gfY8ktltTJ2J4ubZEYqcAr2ahRPaIxtr9G64JSWFY/FtIQG18m
	sr5VJPZ5L4V3rQ7mAIYfmfJxvp4PfwYEagT1VRqllmmwKQRaI87K3GNxXGD59w==
Message-ID: <825baaef-bd76-4e2c-94ef-3daddf55243b@bootlin.com>
Date: Mon, 2 Feb 2026 13:54:34 +0100
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
To: Christophe Leroy <chleroy@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20251223072549.397625-1-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16522-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[richard.genoud@bootlin.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:marco.crivellari@suse.com,m:kees@kernel.org,m:roy.pledge@nxp.com,m:claudiu.manoil@nxp.com,m:oss@buserror.net,m:thomas.petazzoni@bootlin.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:thomas.champseix@alstomgroup.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.genoud@bootlin.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,alstomgroup.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E8AB3CC8D7
X-Rspamd-Action: no action

Le 23/12/2025 à 08:25, Richard Genoud a écrit :
> When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
> fq_table[fq->idx] state and freeing/allocating from the pool and
> WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.
> 
> Indeed, we can have:
>           Thread A                             Thread B
>      qman_destroy_fq()                    qman_create_fq()
>        qman_release_fqid()
>          qman_shutdown_fq()
>          gen_pool_free()
>             -- At this point, the fqid is available again --
>                                             qman_alloc_fqid()
>             -- so, we can get the just-freed fqid in thread B --
>                                             fq->fqid = fqid;
>                                             fq->idx = fqid * 2;
>                                             WARN_ON(fq_table[fq->idx]);
>                                             fq_table[fq->idx] = fq;
>       fq_table[fq->idx] = NULL;
> 
> And adding some logs between qman_release_fqid() and
> fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.
> 
> To prevent that, ensure that fq_table[fq->idx] is set to NULL before
> gen_pool_free() is called by using smp_wmb().
> 

Tested on a LS1046A based board.
With this patch, the warning is not triggered anymore.

Tested-by: CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>

> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>   drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> NB: I'm not 100% sure of the need of a barrier here, since even without
> it, the WARN_ON() wasn't triggered any more.
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 6b392b3ad4b1..39a3e7aab6ff 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -1827,6 +1827,8 @@ EXPORT_SYMBOL(qman_create_fq);
>   
>   void qman_destroy_fq(struct qman_fq *fq)
>   {
> +	int leaked;
> +
>   	/*
>   	 * We don't need to lock the FQ as it is a pre-condition that the FQ be
>   	 * quiesced. Instead, run some checks.
> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>   	switch (fq->state) {
>   	case qman_fq_state_parked:
>   	case qman_fq_state_oos:
> -		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
> -			qman_release_fqid(fq->fqid);
> +		/*
> +		 * There's a race condition here on releasing the fqid,
> +		 * setting the fq_table to NULL, and freeing the fqid.
> +		 * To prevent it, this order should be respected:
> +		 */
> +		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
> +			leaked = qman_shutdown_fq(fq->fqid);
> +			if (leaked)
> +				pr_debug("FQID %d leaked\n", fq->fqid);
> +		}
>   
>   		DPAA_ASSERT(fq_table[fq->idx]);
>   		fq_table[fq->idx] = NULL;
> +
> +		if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
> +			/*
> +			 * fq_table[fq->idx] should be set to null before
> +			 * freeing fq->fqid otherwise it could by allocated by
> +			 * qman_alloc_fqid() while still being !NULL
> +			 */
> +			smp_wmb();
> +			gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
> +		}
>   		return;
>   	default:
>   		break;
> 
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


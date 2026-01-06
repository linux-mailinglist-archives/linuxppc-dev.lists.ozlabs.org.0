Return-Path: <linuxppc-dev+bounces-15341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B069CFA26C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 19:29:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm07m117dz2xQB;
	Wed, 07 Jan 2026 05:29:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767724180;
	cv=none; b=djWJPQpzFgdoaphKKr/zgIkp28nlUF7AKs3eyJ3oCg3+o1ZWjExwKPv0LHXXue2a94mRNngtZH+uyspYrrCRBE9gBX8+kZ1k3hdrH/pGTj715+dNRfSb4OsgyrtxyY+/8AqMaLraSPhmlmByeJUQqtUzOPI7ixlk5lL40MONFpbc6XmZmKzzcQBW0a3eIgF4Pog6gQMAXmHWvREbRKexJVKyojYyW6PCzDBvziXQhIkIj1oe2lnpC+5yXXcd5DOfmoZDu7axKi7w+hqsVPlbDfJsLOuTaI8276c5kkPtJM/c60fKEI4bOMd6y6pWZ/GITYsY2z8rgpCgUXwWa4brmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767724180; c=relaxed/relaxed;
	bh=C6qFHxqoWBG7IV6u8Cbs7on3ylcj5l0UA0SsRBcTYU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjYgSxbjTTVmDB0bAMV+uDv5iG66ga7FOBaGvR7j5AUisWLPTYdmkcdNoSpyNiM2w+uV97VHkHS0fjdgx0dRICeo3Jl/b3cjh0d0ULY7YMxufnhOGdFrIlnArVHA+Z0lXvwz7JEF4JZzEGu7QKMnw8UnysyqUkrklAs/Jy4zBKZieggOiHl7zUZcM9I2f/T4R5dSJx5dIpZt4Bd5HeUioKnibw1TN+bNleuWYcnOnCheUfLnwt73gAjABaKzPVv26HlPadjxSuqMEufCa8tehRP6nOcjLSyG+wPuagsHUUkLv5hpUC2ffuycjXHlctBM0w6ecAyHpCh+O85tRtQTJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SyQv0/FV; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SyQv0/FV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dm07l0kz2z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 05:29:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 113EB60144;
	Tue,  6 Jan 2026 18:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3793EC116C6;
	Tue,  6 Jan 2026 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767724145;
	bh=viOFB4/yDJPmlUVK9aA8lHxdD5KZeK3qCbk9U703L4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SyQv0/FVAuHmLLwaUjLZZIbKRJ0Ehmu9FcOAuL/Te9JbKsrsAcuaCb+Hh5YGxuW6G
	 VkVl8ulqlqE9lEttQE8XxMTMSYEK1D96atzzOY+t6d3yb53OVWzVVs2F2Ptfg7EOAU
	 zeGB/Vs5BjrBO6KddnnwOZJag4OPAytBPKke+X49hvirea36YlOw3RKtTaZ/hhidQ8
	 Rn1333x7VB3pOwB+julHkI3YIxt7CFmNBtmk40LsDlrG0YeDPkkm45Pe7DCpPKl1hw
	 WOFU9KcQzE2WHLhzt+ILx6VR9mPYNNg+IHyLj4uk6TMckdb/PicweYTbTqAwAu5Mp3
	 yFArfhjPITKdA==
Message-ID: <da2988cf-8f4b-4f85-a915-d83ebcb9923e@kernel.org>
Date: Tue, 6 Jan 2026 19:29:00 +0100
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
To: Richard Genoud <richard.genoud@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251223072549.397625-1-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 23/12/2025 à 08:25, Richard Genoud a écrit :
> [Vous ne recevez pas souvent de courriers de richard.genoud@bootlin.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
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

You dismantle/reimplement qman_release_fqid(). Is that the only possible 
approach ?
Isn't it possible to just clear fq_table[fq->idx] _before_ calling 
qman_release_fqid() ?

> 
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
> +       int leaked;
> +
>          /*
>           * We don't need to lock the FQ as it is a pre-condition that the FQ be
>           * quiesced. Instead, run some checks.
> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>          switch (fq->state) {
>          case qman_fq_state_parked:
>          case qman_fq_state_oos:
> -               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
> -                       qman_release_fqid(fq->fqid);
> +               /*
> +                * There's a race condition here on releasing the fqid,
> +                * setting the fq_table to NULL, and freeing the fqid.
> +                * To prevent it, this order should be respected:
> +                */
> +               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
> +                       leaked = qman_shutdown_fq(fq->fqid);
> +                       if (leaked)
> +                               pr_debug("FQID %d leaked\n", fq->fqid);
> +               }
> 
>                  DPAA_ASSERT(fq_table[fq->idx]);
>                  fq_table[fq->idx] = NULL;
> +
> +               if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
> +                       /*
> +                        * fq_table[fq->idx] should be set to null before
> +                        * freeing fq->fqid otherwise it could by allocated by
> +                        * qman_alloc_fqid() while still being !NULL
> +                        */
> +                       smp_wmb();
> +                       gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
> +               }
>                  return;
>          default:
>                  break;
> 
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> --
> 2.47.3
> 



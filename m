Return-Path: <linuxppc-dev+bounces-16610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KQsAb8+hGlU1wMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 07:54:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D382EF2B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 07:54:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f67J85hTXz2yFb;
	Thu, 05 Feb 2026 17:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770274488;
	cv=none; b=Bx+K7lOYJSBuQ8qLMQX+69aZMlKpM9K54NGPGZekrsmCwfv3dnKmgWuj/wRBhiuI79mb54BV/y/4nXWlJqHE9eUZ9NwOh+XaCYQ6ACosqnUgN44Rakgnipg0Z+RVoNvmro4MRcwtG9/aIzR4NS+0ydksdChDRKmOohqsLTL/zpGchXqkosL4Bda7pzuOChri+QaRnqgQzeKuK+qTIPfqx329DU/lgR56x93eHWZCpWduqCmvVLFn8HN9/LeiSxr6v5RYh24KFRDikI9yABtEvFAFh+dx9704uwnycsqCOKzObZDFHeTwcDnh+CrmTvawxoooEi2ECH3T0pzagRJ8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770274488; c=relaxed/relaxed;
	bh=5T0ktCjmh8RZLUEP0esqkY26ecLoJfpVXJxSRbhD2VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQYMyAgcjc05yDXlbZZwBm51+eze1SX0N1vQSgtXs4wP2zqPy3IOmjrXRB01cTGY/9GeiUnhabq08J4G65lwRWa0xzOpEk+8qRuwprwJY/sZUMgcF4JegdiHJWyqaDF1CgUxvrVpI9g74FHnZ2Qswf9QWu/uk1xaDqKzlPRX1DAcv+BmF0qtSNAWLgCNyuEK3KA89rSrmx1sH1ZJ4H+8upKmgKB0dyc6qPNpob8qgsCHpvnxzZ0k+W2jeR2eBodLea71XHNvtOAWFn3s2shmnU5nNq6utnSXoNNLJP40F8QwRDEAdgafpuAIfJ5IHnvvUh7CIjPqMkHijQKRhN+k7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YnI6RNMr; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YnI6RNMr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f67J801fdz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 17:54:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 281CC43C1C;
	Thu,  5 Feb 2026 06:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82EBC4CEF7;
	Thu,  5 Feb 2026 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770274485;
	bh=EEyaIS7c/Np/w/ayZ/fwd6oYNont392luQLgCjnHcqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YnI6RNMrjB8P3QuDfeXZj4xszCtFy0YMF+8N8ZMfymdZ9gx4glVSoc6aRgF77Vk35
	 GiPTaWQItTOr2z6lOoLDGYAUjBjrPbgaDWXzlw0W95uqE9vFGCkxQS5qrtPD/46hW5
	 lTcRlZnhqDGHWw0Qh8GmOmADpM6NsRyEaOTZLcrli79mJ0YkVDip7IgU/J2yIegRsg
	 jy25oKzOzuDLytA6X0XcVplJ2qcU+RDYgJBZBGeVhxbAvHmnUWr/epxFrwQLqomGMv
	 nhXo0pvsdNRyyP+iVz1jw1cSNd1jN5v4rzs6EpgYzQBU/Qgs+SNAo3W6MLBHabzMRN
	 TqZfvChTSpuBg==
Message-ID: <54bf1026-7d71-466d-b6c0-8714c7230f9f@kernel.org>
Date: Thu, 5 Feb 2026 07:54:41 +0100
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
Subject: Re: [PATCH net] net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in
 uhdlc_memclean()
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Zhao Qiang <qiang.zhao@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20260204162548.94160-3-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260204162548.94160-3-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16610-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:qiang.zhao@nxp.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:netdev@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8D382EF2B3
X-Rspamd-Action: no action



Le 04/02/2026 à 17:25, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The priv->rx_buffer and priv->dma_rx_addr are alloc'd together as

You mean priv->rx_buffer and priv->tx_buffer I guess.

> contiguous buffers in uhdlc_init() but freed as two buffers in
> uhdlc_memclean().
> 
> Change the cleanup to only call dma_free_coherent() once on the whole
> buffer.
> 
> Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   drivers/net/wan/fsl_ucc_hdlc.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
> index f999798a5612..59cd861d13d6 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -790,19 +790,11 @@ static void uhdlc_memclean(struct ucc_hdlc_private *priv)
> 
>          if (priv->rx_buffer) {
>                  dma_free_coherent(priv->dev,
> -                                 RX_BD_RING_LEN * MAX_RX_BUF_LENGTH,
> +                                 (RX_BD_RING_LEN + TX_BD_RING_LEN) * MAX_RX_BUF_LENGTH,
>                                    priv->rx_buffer, priv->dma_rx_addr);
>                  priv->rx_buffer = NULL;
>                  priv->dma_rx_addr = 0;

You also have to do:
		priv->tx_buffer = NULL;
		priv->dma_tx_addr = 0;


Which that and commit message fixed you can add Reviewed-by: Christophe 
Leroy (CS GROUP) <chleroy@kernel.org>




>          }
> -
> -       if (priv->tx_buffer) {
> -               dma_free_coherent(priv->dev,
> -                                 TX_BD_RING_LEN * MAX_RX_BUF_LENGTH,
> -                                 priv->tx_buffer, priv->dma_tx_addr);
> -               priv->tx_buffer = NULL;
> -               priv->dma_tx_addr = 0;
> -       }
>   }
> 
>   static int uhdlc_close(struct net_device *dev)
> --
> 2.43.0
> 
> 



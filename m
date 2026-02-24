Return-Path: <linuxppc-dev+bounces-17120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOiEDTDcnWmuSQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 18:13:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1618A5E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 18:13:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL4703p0Gz3cZk;
	Wed, 25 Feb 2026 04:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771953196;
	cv=none; b=iBiGd+KdEdTMSJ45ns7Wrs/a3ZaaKuGyYIG1KCH9KfB3rmjMkGoPfnUs3swvTr8ZZK7rXwWNTpi5t596qVGjSKyxW+JgjQUaZWkytMKYDWO4BwhqZbmvwQZUBNQug2ZQJ/VXcgEdToqq0weAgGzI7b0eiHKBsGRXzYFEp3DzBQcWwANA7bwZxA86K/ZmrqQ44mM30WSPrAzWFdgy/JUtE/N5u38qZw6yenJFBlIuZwEgim1CnphpN5cuRtXsq7yhDVeFp5Y+kpEE0FDxzFeRji2LeMByQx6+xN90W1BftFM3JgUUAnc9cqigmsIv53q1x1Uo1rD9F5asMtl6Lv9c8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771953196; c=relaxed/relaxed;
	bh=epuvrQKCM59JFBCR0XyEyFzp+5O4HjdaM6TXsY+H6rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIlZpAaXQOAGkzzsvahl/Ji3mnGtXrqOmnFUOT8QLPbSTnkflfDuBaKjALod7y1pExtvobX8XQzBnwqFDkoukgKlgXK3i++K5blScCNSDCVdryBB5Koi7aSjXXzidKBBZNRg22wKqEslh9ASqC2fRxySviOxrIlGA24QMvvHkoYDs6CRDHt7c5XdGJsgEnV7LDHVDtRGgVd9KNbJw5D+KTXuEFxNEuNhM9e/pFEWBftrwbxv0EO2QAyrEi6fOHkALvjpUdEF/9yoMU/ZgeBIOi+NzAh5VpVpJw7zD20fzMTEmaaIqmiVw1TQ2CibVNO+OZ5W8j/FdWYLccmKKN2qOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YcpSCJpf; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YcpSCJpf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL46z6JX4z3cZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 04:13:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6CE3600AD;
	Tue, 24 Feb 2026 17:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDA9C19423;
	Tue, 24 Feb 2026 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953192;
	bh=Bh0vMs/UoAW2yNPLuqgfJHTBII6cu61y5+RNft69p7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcpSCJpfPcTtdXL4ikvaXuDBKwShC31gIYz3XKU3Z0Wcf0p1oqGZLm1WyMfnD5KwL
	 2vu3JNwNZennOMmgkoly+ACUzh46Q3qQXNZl+HlrjitsI4HdLZEHQBKa+iL9k+BamD
	 pcphOTQYXxIHvWClPifBObu9NiJlNlaxLDLlgl+BURzcsqqQNcbXpFok0kIS2gph66
	 futP61kyTVKxRs1x1ooH9WL0trLf7gGSbwqXP/90ZmAkahMVWmeIwfRPLGAUo24+7A
	 +z+0OO8Q2nuN4DQLOeUOFx5AA8g01MBt/8aeCv4l8RLVFjoJ0IKwQ8t5qQ/dqSSJiM
	 No3Fpap6iiS5w==
Date: Tue, 24 Feb 2026 17:13:08 +0000
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER" <linuxppc-dev@lists.ozlabs.org>,
	open list <linux-kernel@vger.kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next] net: freescale: ucc_geth: call of_node_put once
Message-ID: <aZ3cJI86dknRg_mk@horms.kernel.org>
References: <20260224014141.352642-1-rosenp@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224014141.352642-1-rosenp@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17120-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:maxime.chevallier@bootlin.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[horms@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[horms.kernel.org:mid]
X-Rspamd-Queue-Id: 3BC1618A5E8
X-Rspamd-Action: no action

+ Maxime


On Mon, Feb 23, 2026 at 05:41:41PM -0800, Rosen Penev wrote:
> Move it up to avoid placing it in both the error and success paths.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  drivers/net/ethernet/freescale/ucc_geth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index 78d72409b6e0..4d598693d7a6 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -3470,14 +3470,13 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>  	phy_node = of_parse_phandle(np, "phy-handle", 0);
>  	if (phy_node) {
>  		prop = of_get_property(phy_node, "interface", NULL);
> +		of_node_put(phy_node);
>  		if (prop) {
>  			dev_err(&ofdev->dev,
>  				"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
> -			of_node_put(phy_node);
>  			err = -EINVAL;
>  			goto err_put_tbi;
>  		}
> -		of_node_put(phy_node);
>  	}
> 
>  	err = of_get_phy_mode(np, &phy_interface);
> --
> 2.53.0
> 
> 


Return-Path: <linuxppc-dev+bounces-5306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B6A12E00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 23:00:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYKgg5kKYz304N;
	Thu, 16 Jan 2025 09:00:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736978447;
	cv=none; b=NFyxO1JmhBDNq9gfDuUYsbkRFmzrwDlhDI59ErNdLvya1haea8mNbgApcP9B6jOF1m+Im+OGUxF/VkJ6oF9+bY6bIiMqryGHziO6G1g1WM9mBJo37aj7eCZx6CEdMDJZEqg5hUMy9fieMBwzH/xHCiOrC6N8N4ujsFFUBIgC5Gq5KD01YYmjD230L+a2ajT3i4MRsLuAB//10ZNklkTMgkxba/q7ImQjciERJM0T4t4cvJCj+n/1vyNH8U+cLXwWFzrqgyGxMZnDFM64jNmrJ2LXF99R5gItcPehoV/b9ppLNbkk6zTos9BYqhNBN9DPqKAI6/vE06+qBA/fnCroxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736978447; c=relaxed/relaxed;
	bh=xZMULtA3pvMEGT/4urvYl1mZaU5QZOvvQy8LlegvQtA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ax4ze8xoCAETAutMI60J7Fn61VQd01N/8gfNXpt8i1dAx2c9JhaTCnv99HoK5JkEJnZF6x1djzAjEup9vMS6YwHqGwBOF13FKXnvsqX8JELgW6TEcGSpE+AdAskA9FYsR+gYexekylmzWk34mVdLZE8fiCDNFVdMHwYEWe1wHhJwmGZBYXx6BHLQij1SU5R19lUCUPVqoLsFolhoNe+vEjyOCK8c/aWvz3Kwj4zOV79y8961mQ9JkmjiPScbclnWlH/M1WMEPTJEUuMzTJtn2ofGd4KJhDnKZlt/8Pkqbr/ffQroXb5JJsqYvrd+pf+teCov+A0+RyluXA5a60eDPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTXpjadQ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTXpjadQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYKgg10y6z2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 09:00:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81529A425D3;
	Wed, 15 Jan 2025 21:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8036C4CED1;
	Wed, 15 Jan 2025 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736978444;
	bh=keIMQnDJxBzpB6xvALOz2UCHABne6y4Z0KtjLyVep5o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iTXpjadQmUDeZ0NqHYPMeKUPWl24TTEJXe90UuH6alD/w/TPayh70MuTKNekAjDpE
	 VGaAvz6OaUPLF0gYbwFfqs3Xd4uEmc48PeR/UoQPsV4n250F/RWAQki2ObaYjqcPYq
	 O+RzY4z2xcBfcqbW+GeD6YSHEKOu9peWXnnroxkmpscbMb2QKCcb3Xzw3KXEmLhg6c
	 lYL8gXVsXX+uw4/geqD076j9LVuyxGKNgps2oga2SmyKeqatBNNxe6N/Bb7kRVKmVr
	 TO5Z2iE3Fv23C0VuB7qyn0RbbhU5cOWNsIh3hiT8SOTUibQ6kRClU7wGMO9EOQ85sr
	 n0Zdppzc/cuNg==
Date: Wed, 15 Jan 2025 14:00:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 net-next 07/13] net: enetc: add RSS support for
 i.MX95 ENETC PF
Message-ID: <20250115140042.63b99c4f@kernel.org>
In-Reply-To: <20250113082245.2332775-8-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
	<20250113082245.2332775-8-wei.fang@nxp.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 16:22:39 +0800 Wei Fang wrote:
> Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve the
> network performance and balance the CPU loading. In addition, since both
> ENETC v1 and ENETC v4 only support the toeplitz algorithm, so a check for
> hfunc was added.

This and previous commits are a bi hard to follow. You plumb some
stuff thru in the previous commit. In this one you reshuffle things,
again. Try to separate code movement / restructuring in one commit. 
And new additions more clearly in the next.

> +static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *key)
> +{
> +	int i;
> +
> +	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> +		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)key)[i]);
> +}
> +
> +static void enetc4_get_rss_key(struct enetc_hw *hw, u8 *key)
> +{
> +	int i;
> +
> +	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> +		((u32 *)key)[i] = enetc_port_rd(hw, ENETC4_PRSSKR(i));
> +}

Isn't the only difference between the chips the register offset?
Why create full ops for something this trivial?

> +static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
> +			    u32 *rule_locs)
> +{
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
> +
> +	switch (rxnfc->cmd) {
> +	case ETHTOOL_GRXRINGS:
> +		rxnfc->data = priv->num_rx_rings;
> +		break;
> +	case ETHTOOL_GRXFH:
> +		return enetc_get_rsshash(rxnfc);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}

Why add a new function instead of returning EOPNOTSUPP for new chips 
in the existing one?

> @@ -712,6 +730,12 @@ static int enetc_set_rxfh(struct net_device *ndev,
>  	struct enetc_hw *hw = &si->hw;
>  	int err = 0;
>  
> +	if (rxfh->hfunc != ETH_RSS_HASH_NO_CHANGE &&
> +	    rxfh->hfunc != ETH_RSS_HASH_TOP) {
> +		netdev_err(ndev, "Only toeplitz hash function is supported\n");
> +		return -EOPNOTSUPP;

Should be a separate commit.
-- 
pw-bot: cr


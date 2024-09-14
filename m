Return-Path: <linuxppc-dev+bounces-1374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726F979193
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 16:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5Yq261nlz2xpm;
	Sun, 15 Sep 2024 00:44:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726325070;
	cv=none; b=OO8jBA/2GYCYnL/9INJUY4qaASLK+N5Se/AWm5/N0YV/Kxh1JqPUst47z606OdbqahDZc2TJPAkNEBCow7/jqhxW+7aJe0uCwIv/OSQU9DdBcbOnFyrkL9Z43+SzdTk2tly1YFVSBTjquEEIuWgcrr7f0QQ4qDrYWFSCMz5PgrgSJncG1EyBaQ/2Mtlj4TqrpqjDSPy/1/nuI4Ip+v3gMam56xW/Li0Yg3O8IH3ab+ZQraw/T4z7XCdQ2VciW7s6sJI7pCyNFY6uSjAnEmyg4QOg2WIue2A4eYHWMgH9uA0pMIhovCHR/CAE6iaGxI7aWYeDeQo1mQX4NiOgfxQL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726325070; c=relaxed/relaxed;
	bh=knYckm5aJnSchYoHGjtSQ5Mu9N8dnHyi0u0NUCdhg5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YyAnLmP+TiKj/r6jH+bhfkF69rdkE0UikFtsjbP49ntp9xsMdTgBkU3KFIm2iP2GlzguDWOwCXXzGdj0xwxflTfrhJ/WqfioyBTF7Mg9MY8A8Y3WeG75mJot7Ogv8h4hz5qBNtoq5hQgZuTR4WjDSVc0y5ESnXswDVD77MPK0eiNs+gXBu5vj6kMR8GHTnWWoy7QfIAI3DnbgTZRn2tXRb7gRCN/Hfe3MbQ1BZw1mdHzw9FTC7VAIUVrza2G0h0V5gQ34Zo60SQtT3ZUNV0V8U+H94vjq532Y3yyMehd64rCP0dfdtaST5b0fmS9J6rr9XIHhH5cWkrW5zNvRbJqgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=JCUsxhlW; dkim-atps=neutral; spf=pass (client-ip=80.12.242.19; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=JCUsxhlW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.19; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5Yq06x3zz2xmh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2024 00:44:26 +1000 (AEST)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pOfCshuFQv6ompOfCsZIYM; Sat, 14 Sep 2024 11:01:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726304518;
	bh=knYckm5aJnSchYoHGjtSQ5Mu9N8dnHyi0u0NUCdhg5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=JCUsxhlWfnXYG7qqBlHRwqWbVdqUSsjgkQL6eUR58kbIeuUVtWohDGPbV5/s2q8Ee
	 4TSYJVLz5jqr29u0eDWEUW4IbLK1xdclOTn/+c3sdiztY4zYW4r4FmWssPaOiPGkxd
	 qRyk0A8vwwRLQnQcfRqCScBOLofMPnqZla4+sQTtxLXVZ+u7gpbUnuQ0ubJc4JtXZ7
	 PvIXA2Y6oFzDf8jmElTU3OgoFNv5CyODjrReBzHeuebceWwtXjgjNs9Gj7fI4OTV1W
	 w7OJ2fPASMTBKQDpp11+MMZJeuY/RIGb4o9kswfaRZOEh96zUxkZBK/jXewddbJz7I
	 srteqXsdDNv8A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 14 Sep 2024 11:01:58 +0200
X-ME-IP: 90.11.132.44
Message-ID: <484a980a-8ea4-490b-89b3-9fca3c471133@wanadoo.fr>
Date: Sat, 14 Sep 2024 11:01:53 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ethernet: fs_enet: Make the per clock
 optional
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>
References: <20240914081821.209130-1-maxime.chevallier@bootlin.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240914081821.209130-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/09/2024 à 10:18, Maxime Chevallier a écrit :
> Some platforms that use fs_enet don't have the PER register clock. This
> optional dependency on the clock was incorrectly made mandatory when
> switching to devm_ accessors.
> 
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/netdev/4e4defa9-ef2f-4ff1-95ca-6627c24db20c@wanadoo.fr/
> Fixes: c614acf6e8e1 ("net: ethernet: fs_enet: simplify clock handling with devm accessors")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> This patch fixes a commit in net-next.
> 
>   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> index d300b01859a1..3425c4a6abcb 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> @@ -895,7 +895,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
>   	 * but require enable to succeed when a clock was specified/found,
>   	 * keep a reference to the clock upon successful acquisition
>   	 */
> -	clk = devm_clk_get_enabled(&ofdev->dev, "per");
> +	clk = devm_clk_get_optional_enabled(&ofdev->dev, "per");
>   	if (IS_ERR(clk))
>   		goto out_free_fpi;
>   

Reviewed-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks


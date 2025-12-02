Return-Path: <linuxppc-dev+bounces-14566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06063C9C11B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 17:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLQW35lHHz3byk;
	Wed, 03 Dec 2025 03:01:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764691295;
	cv=none; b=mtAF8Bg4T3jOu0h4MyZNrShsUsVKQhimbFbTHFfuOA+7W5NGwqTTU5OfMEIM6TOAxlBLSoNqXr2oXIHysIddq2hJm3CzcjfnGRrs0cCB59BdbFdiMndS6XS6cbK26Pn8LJBiVhcByfOvW1L3ih4HXMmlBt7tZUCNMDxhFJxAq1JvizIByz6kKelOc7h8tR3grbZu2ZZs0oYwY4cuIKkaEPnVbUArtzZMNy7CCW54Vxclme5HCb4zAOLFTwlG+fNirHvqAgMOIJK5R0Ux/1qPin2zSetuUTUkDtRgMyBLTfHJ+75bIF4iEGRbh+/rYT8/wNfd5mthUtyYHCVrImSezw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764691295; c=relaxed/relaxed;
	bh=H97oONlOBEI+K6se4wyh3v0/o6NJ2eBiSCzFI/xfAOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oobt8qZU/sQc/S/LS21AAKpmVYiq/gEzuIdW4x/zc3QCHtL+97v8bQm2AP80j0/O8SQJnjl0ehIwkkvk8yS+ELs8IaGV1A5Lc+9Gnbm+/KcfIFyvEC6fq/j1SBJxJMRACJw9ZStz/wMJZvvT7ZeTiAkSxCbsCNBFHQR0/fqLRn2yMd06gFF1C223EaKS11XEMEU1L3VXvCFf1DXRIefor89ib621tY8E3LMzSAoQnQtyQpQFdzKBkTQTiGFCp/WAu6C26trLokZnlrKU+S7dSxpmbzevram+KPqNzGzw2rL69SCNYCxcq9KG54CkzQ624twmypfhaGYHrf+wAgJ67A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LIOQ0cG+; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LIOQ0cG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLQW257jcz3btn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 03:01:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AD8541ABD;
	Tue,  2 Dec 2025 16:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6166CC4CEF1;
	Tue,  2 Dec 2025 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764691291;
	bh=ad7U7ulnAPAGBT1DtnhQfiOVTWQUSJ5fl50U51O8d/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LIOQ0cG+0Cs3ZxrKu/i3e/OAhfK6NID1CK1zn/fo+R5+DpA9nfW449+wjpugGk5ZA
	 q3Fnfn8naybNVVIwlai0KCspZFcG9wHSVlMuOMyqtBWqqFP5Jdwew9HTArflFvmQVw
	 E6Ty5gkccQRb11t45Yj9tnrlkcMg/OX4BHCcfAjoUlq9EDc62y+ahoYV5I+axCDJhd
	 6NTcVfMQ0mX/SuxcpO0mz8RpKrVDNs9d6aWNh3/sOGtMoVtL0GjwGlLJ0w4HLN4frS
	 U+1wUhJxbM8zx4u6UBAG9CzoBHQ7eO0R4mTfp6SWqE7j1V4Wex3SGvC7Ftxyr3qZ2s
	 AoQuWugSKJg2A==
Message-ID: <a2964be2-bd18-49bb-b279-28402b65b51e@kernel.org>
Date: Tue, 2 Dec 2025 17:01:26 +0100
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
Subject: Re: [PATCH v2] powerpc: 82xx: fix uninitialized pointers with free
 attribute
To: Ally Heev <allyheev@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20251116-aheev-uninitialized-free-attr-km82xx-v2-1-4307e2b5300d@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251116-aheev-uninitialized-free-attr-km82xx-v2-1-4307e2b5300d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 16/11/2025 à 15:25, Ally Heev a écrit :
> [Vous ne recevez pas souvent de courriers de allyheev@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Uninitialized pointers with `__free` attribute can cause undefined
> behavior as the memory allocated to the pointer is freed automatically
> when the pointer goes out of scope.
> 
> powerpc/km82xx doesn't have any bugs related to this as of now, but,
> it is better to initialize and assign pointers with `__free` attribute
> in one statement to ensure proper scope-based cleanup
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FaPiG_F5EBQUjZqsl%40stanley.mountain%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cffef37bc0fba4c2c5d4d08de251c0ccd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638988999594823658%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=spMNfEUgHH43vUqoyG3EAs99MzCC5bMnlWUvsBa0o6Y%3D&reserved=0
> Signed-off-by: Ally Heev <allyheev@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Fixes: 4aa5cc1e0012 ("powerpc-km82xx.c: replace of_node_put() with __free")

> ---
> Changes in v2:
> - updated commit description
> - Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20251104-aheev-uninitialized-free-attr-km82xx-v1-1-903be69f2cd4%40gmail.com&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cffef37bc0fba4c2c5d4d08de251c0ccd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638988999594847235%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ehJtEL%2F3GHIwW2mPuiD730V%2FDgkuDvudK2gM%2F72QIDE%3D&reserved=0
> ---
>   arch/powerpc/platforms/82xx/km82xx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
> index 99f0f0f4187672614f4f8ad46ab7906f7ad8078b..4ad223525e893c0de15540db2b2c4d239d6d841e 100644
> --- a/arch/powerpc/platforms/82xx/km82xx.c
> +++ b/arch/powerpc/platforms/82xx/km82xx.c
> @@ -27,8 +27,8 @@
> 
>   static void __init km82xx_pic_init(void)
>   {
> -       struct device_node *np __free(device_node);
> -       np = of_find_compatible_node(NULL, NULL, "fsl,pq2-pic");
> +       struct device_node *np __free(device_node) = of_find_compatible_node(NULL,
> +               NULL, "fsl,pq2-pic");
> 
>          if (!np) {
>                  pr_err("PIC init: can not find cpm-pic node\n");
> 
> ---
> base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
> change-id: 20251104-aheev-uninitialized-free-attr-km82xx-00c4cb7c3d69
> 
> Best regards,
> --
> Ally Heev <allyheev@gmail.com>
> 



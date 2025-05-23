Return-Path: <linuxppc-dev+bounces-8917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE34AC21E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 13:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3jQ12FFVz30Vj;
	Fri, 23 May 2025 21:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747999241;
	cv=none; b=G9BLeG911EHE9BqvhOfii3aVhbSf1PRTlOeK9qFpSy5z1eDfsritMk//8vrRBffEn1z7V0jJTNFqxLbt2vVtEZU0d/eebzmtK0ffmHe5lDgvg4QaCn0jnXVsS9C2x03T7V0VlLgpIrk1tu9BeI+ZQizv8zOZwn6aNKBedKIAAN7no9pIgQ/GOK3fgKdWUOCEeE/PjIxSbEEdi6FGjvsfFhFPHjzHAVnuprNtQpJmoeGdEA31YwCU2sFv8je2IlyZ4ddDwTgLEZSDsZTk9sKLCw0bEvOFWoRbSoPQB7JMRhiRBWrh+GI2Q0ELUCmHZ02flwZZqSLTkuMWwqurBNI6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747999241; c=relaxed/relaxed;
	bh=kdhVZ27fT6CE3QToaexz4mdCDbpmw+kJMYcK8ovDzqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM5LUCQ+jnsWvL2V94fN4rjEPzMxTyS1h1Z5fRgZqWrdP5ny1zFQyD57Gi3MR2/6OB2pfmCR/AYIa5JfAHB7nE+DUBk3ozi5sOWWXax0ufOTFY+GZkngIOql5HKoOZD68gEfpZQ1gPOiWyjK+FjgHA54nm7AT7uOsBH5oD91HwVC096xqgkdrtLqQGuqVJB9bOzhy79iwiekW41uOO621Ns5f5zJfgGROQghaXWGGu6Ncm+33BvFYroJX+wrvdtBtWbXLPsW5rZZ9rPZJhOijWu5+LiNILJArf0ut9XplEQMKOAP7InfiYb436pNTEHKkWWCc/e4EA2uyc7DAbPQ1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3jQ040tpz30V3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 21:20:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b3hmd3T2Mz9vXt;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6OGEq_bauYM; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b3hmd2TkFz9vXs;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4884C8B769;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id p6vSVHiM0Uvz; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E138B763;
	Fri, 23 May 2025 12:51:43 +0200 (CEST)
Message-ID: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Date: Fri, 23 May 2025 12:51:43 +0200
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
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com,
 johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/05/2025 à 07:02, Ai Chao a écrit :
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.

I don't understand this explanation.

You say "no need to call of_node_put()" and the only thing you do in 
addition to changing from for_each_child_of_node() to 
for_each_child_of_node_scoped() is to _add_ a new call to of_node_put().

I would expect to see a _removal_ of some of_node_put() when I read your 
description.

Christophe

> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>   sound/aoa/soundbus/i2sbus/core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
> index ce84288168e4..20a4c5891afc 100644
> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -207,6 +207,8 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>   			}
>   		}
>   	}
> +	of_node_put(sound);
> +
>   	/* for the time being, until we can handle non-layout-id
>   	 * things in some fabric, refuse to attach if there is no
>   	 * layout-id property or we haven't been forced to attach.
> @@ -335,7 +337,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>   
>   static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>   {
> -	struct device_node *np;
>   	int got = 0, err;
>   	struct i2sbus_control *control = NULL;
>   
> @@ -347,7 +348,7 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>   		return -ENODEV;
>   	}
>   
> -	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
> +	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
>   		if (of_device_is_compatible(np, "i2sbus") ||
>   		    of_device_is_compatible(np, "i2s-modem")) {
>   			got += i2sbus_add_dev(dev, control, np);



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA52A26C2A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 14:19:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrzgZ5cL4zDqWp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 22:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=VVh4lZYP; 
 dkim-atps=neutral
X-Greylist: delayed 359 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Sep 2020 22:18:04 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrzdS1yWPzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 22:18:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1600258672;
 bh=qScRLO8kLseMI6NKcnB6M674mdhaDUEHqHLxLBJsQMk=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=VVh4lZYPIDR9n4nuLWYe1oGRyuSwRr+brrzNdmJnFTCn4XSnxWBEhaVxCiNyFChsz
 XNVGv3cVCBKd9B7DTmxtNy4By+8mAaeFakYkSFtTZVIN0Zz3Jk/uJXsZyK+2m174Xn
 g3icCh8MWv+F7ymhbCBMgGcsLO+6y1zihHDo/j0Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.146.165]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1k74CG0ldi-00OydJ; Wed, 16
 Sep 2020 14:10:50 +0200
To: Xu Wang <vulab@iscas.ac.cn>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] fsl: imx-audmix: Use devm_kcalloc() in imx_audmix_probe()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <de79bd45-aba0-e497-4f33-5153ecebc6be@web.de>
Date: Wed, 16 Sep 2020 14:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:J57nP3tFLxyk+UVxx/ZboHnjdtnZ1yXL0hVwQmeo26SqzPMGxDp
 y0AVxTFgM3QPQQ1yysikky+kKNLfXlkt+Pkmprxl9NgTbknD4wUvKOpaAM3UFIBgc0MV0Rd
 q7ij9wypdUNt/VnTVMNbyTjjP65Id2rBh3pTHPAswbLUkeJBnygCe0wtwzRFNv0Y9o4K4vw
 sLld04YUZjThucQPqyqPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bACKaonxlj0=:VXW44eN4nTEF8lytUzPu8M
 faEtZzBEdJDH3iwMwhM4v9V7ob1eYygLpvd7dPqsBWuvrDKzzgSHoNUchiAhvoxwvcDNhfuST
 9qXrOLZFmm4Hkdg4TUhPufshW5GFeeJa8+9AM28GLtx4b9WHtGkaERClE2cF4Rpvo8iGxOICf
 KAs/akYgONAibLlBfNNuSPwy8T34aEIaPXW4k5N22PKrA3fQKbwHDe4IzxXywg9ke+i0vP/8L
 yXP+GqIrXNxp2awR1rnDnztl9lL5rUk77ShgGrZAcgmvT7Y3YNec1B7bn/IHGBaMfnPOc7/9c
 0ZgVEg2NcfzUnTG5V91zy9YRsYjecdmeEqrlkxCtJ0rjhMPsD8UZOr/hRhCRgzKHlbz/6GR2U
 iVpX7hfousd2OAiTLABEpESwLzAuqopLvQJnC0HVLvCBitDdVy1rFj0X+FIP6GjsE5WG4IL5Q
 pgWVi/yrmB0XYNYD1Zqq7A76ouXD4xY6LFVefIlE0nlu3tvJ4Sd5qgIX7ApaxgbuNmC7bfIJQ
 Sbl/So/TEURPtu3nDCxyKdJ2JmfWxIFT7KJFn6cpF/l/eWGuFuq7OyakLX43neQfmYgjC+Gud
 CcyMCNDwTGoDW5w/mGkf10MZ9v/2aV3q8XGq9leSdzxJ8iMYJrZCPGgp9sDxqgQltn7dBynFb
 uTgZXp12+pl+GbTnQTbxPpnstsqrDrN7iLuuYiLfKBWtQ2Wzsc4FgxIJ6ySA555aF6nViKL+7
 FsRucQ50I0B/wR7D9SsRUWq6xONfYwvWMLrnrVUaNxG+oFkLuzBNrefwwSf6oMt2iiTwu2D62
 ZbxDUQhHLIx3Dmacyq82FWq/cUu+lxf70CccNNl0ncB6WnV04u3b8BH5JZkIUdw6wZtvpCfii
 XXusYXl+Gj8Hy+mUBD3Jtgw58RyikwXXHoP2ResNi5Uo75BUly++0G/fdZjuMHhPpqmo2JbhQ
 E+ygGAwS3YMStSfMh7j7d/ALtPQa01L/lEjF4CKEcJsvNLKwBVftoyFzb0Rd+t9CEAy4LNhFG
 fqusfOPvLCX5YhWejCXiRgFIZjkZQU6dZS+Cw1tlSttGFiy4FwZH0Am5Qe5aU4e4Ievt2xWSF
 Fx5XPv6qdE9XLki1+7jAYj3urPtwyn8NC9xoGEqGAsln92tWEZvTmS1td/qL+CckyF9vTvpRU
 Vv86Y7KQNh2U/jVkKm7QL7mWxkuicYmQWsSiZOvezTtSwlO8T7CyRlWN2YMRkggZ6u7/vql1H
 nKjYQVUQKAoS3Bn55bqGflP8PZXiBmFiFzD6nmw==
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

I find the previous patch subject inappropriate.
Would you like to choose an alternative?

Regards,
Markus

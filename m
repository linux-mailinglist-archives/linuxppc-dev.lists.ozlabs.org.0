Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EED1B77C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 16:02:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497wpp6Q9dzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 00:02:26 +1000 (AEST)
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
 header.s=dbaedf251592 header.b=kJsLJJdG; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497wj817ZXzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 23:57:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587736587;
 bh=hfMhg2gfEQzVXboyXrze7k444ZL6NjpOuu5e9U298DI=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=kJsLJJdGu13+Zs8gFl19fp7Lmm2En3u+0cq61hOl6AKooTiVsX43YCUyoPajbhBEX
 M9k6Nqrntw1HBCxYytfxlrV2io+fA2EY85+Dznan6/CyqEEeuIY3+ak66RJZBnsM+L
 oduR/ldpFZ/Qk418hhhOTZfXSmW0IJgjGREbKSVg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.129.82]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEmc2-1jPBo11QWQ-00FyDm; Fri, 24
 Apr 2020 15:56:27 +0200
To: Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_ASoC=3a_fsl=5feasrc=3a_Check_for_null_p?=
 =?UTF-8?Q?ointer_before_dereferencing_=e2=80=9cctx=e2=80=9d_in_fsl=5feasrc?=
 =?UTF-8?B?X2h3X2ZyZWUoKQ==?=
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <46dd43d7-72ac-be74-9fc6-4ba931d3871b@web.de>
Date: Fri, 24 Apr 2020 15:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:oJTSXsbcZ2GPfOV8GtyhZaXjSYx+5KO4WkTlTTFmZqtiJGBVIaa
 73ejqWmpHC1hdxOT4jNaGz3bnZSLopy0P9VPPnWS77y8Ye6a+ASt+iMIR+Jyv+Eb4k8x23t
 N+2OI75gDQd+GP34dvo40Xsl714pFFTWU1cWyFwPZboi8xx+UgU/jU41LpTlLbes0FCxZux
 um2uKPKs2VeV/BPiWktRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:++oRII4ZkSo=:i3wGc0tk9o3ED3R05WQCoa
 DeCIdt5oVkbiKPO+PMlJSfuMrq9Xt3wAdTw6PxRm90y1gIXwbyjyq9qT7WPRzbEadMXGTSJkO
 ZJH7sHFodd/8FvgR2VzA2wY1zMJzj/rExgePvA1/emgDO+cq3DeJT26Osy9pWgS3y1Sidtgtn
 Y/VkzWwjBgHyEsSvyc5exVG72SmoD8W3Qat6CeS9UxE24eMqsHTnveTTKwI6eXBHddw7w4Zlw
 LxZpFA+/oj73zvSJjsYv9PQYXUPy/Eqav4GARdXoavabHDfDrd5uk43PHWOLzpCaIpnp/+uIH
 u5t+5EMxFrS+OEJb3o9kllxW1vZC+t+QvV/7xYgdCQtMpEx4+dijglIebIcyiWJkP2pGXLbFw
 BGc0ynQ1a7xMR3Qx3ko4lPRzVxJytNwPnbYwKE1kNqXGDQYJ5HG8eHiX5klaoPZpEWIiU61mP
 NxxKY0Bg89FviR0hzXGg3R3p97F4yDt+LpCJWYpIWjRwMVlztr75+wRU9kUv37/sv05atFxM5
 5sOgCjSSG5UlBF3hTUTrO2ytuYobEm2ekE619NwU/uJ4wRHzzvDVKyRgk4pBf1uC2/wmjfuKl
 k6MCVme55CHrSM5fTWRaW8tsnpzx+BIXi+N7HDgGgzJS/SyZbz1fMGD+BXJQWgQ2Zyot9ATWI
 9WjKnh+DAnb4cwxTg/kn0xOwSgc/G44KjydSTKbXWRDscuyibWabnAxB35arrMxN/wSIMlH6S
 ZT95Sq0VnT1Ybr6EIFiLsjQyP9nko4LYXAiJOr+ZRgDtdwR8gSOJYn87GIUotlr+KNvI3kdFS
 1cDT5tPzg9JPF9G35vWXLEY45WrwhOYouc9xH2nXLoKBVBTIaxa8iY8EMZcIGEpSrFVilBeDe
 +H8Z+2kq3C+SA36Jp54YmQgYMAOO2Ksz06LBeNuz+Ixw+GRWiMblYzX7RDv5iM79KngzncUm4
 Btt07UVa5LPWhiOkFD+bnFvB+LTm9/PqAiSPjXw+Ru568weDAwMBdcINBrpaUG9sSULCMI2o/
 VDpp7vZnZHA+YBDDJwROfFmj4pkT1+Tl2ySt8adlSdPZXWE/lrlzG5LwGSTRlERo4EQqwHM0G
 MLHlqLIl3ppXR4uAAQDzjI7KWTWYQGNsmLV+66zSyQZ8NsFwOSpxtcfWqxAkqUI9nVAEW1vzw
 wXOenTrYg+Hq5Nbh3I2ZUGYOIyOs8N7kx87YoQQVd9fjMHZWP3UWrc2HwXi/G4Dr2Fd8DmZc0
 g2Kqc149SUlhNfRxH
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
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:
>
> sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
> warn: variable dereferenced before check 'ctx' (see line 1527)

Please avoid a typo in the final commit subject.

Regards,
Markus

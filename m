Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30A759E92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 21:28:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=I3Uy6Dwh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5m8S2035z3bX2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 05:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=I3Uy6Dwh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5m7W2cH3z30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 05:28:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689794857; x=1690399657; i=markus.elfring@web.de;
 bh=tOOVF5RkiOgi7PvT8eFAGuSeS37l7RghBPvO4WGeMrQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=I3Uy6DwhqZLS5DB18htbg90sk2Srs+M55ebjqQsLiFODdInnfUMSnaNi74sszFQfW+z2x7B
 9+D38/27rZDSbA2VviWPSH9WzhFvjG5kV7f/LAd4qH9NkTmdRksQxBhTq4NczAwEJaOo0AGnT
 kSzzczaknfq9hlf7kpgpDTkLgXNDIAAxS1AMBBJ6MEu5e43yVG6sG9/7aPq8C/LdjyDJ/9zs5
 euImndX2PKTlbgWqJ9H0E3+TCvAiN6G10VrywcVFngzi7/zJEAtep/Sjf4GB8Lueslok/vqc2
 3/gz5u9ZVa0M++veO3mN0NxLeqAWDpNKH3cnLa7syjh69Jd2HpPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXoYS-1qPWEP2o7I-00YF8K; Wed, 19
 Jul 2023 21:27:37 +0200
Message-ID: <901fdc6a-a560-a431-adc9-aa73d7f69e7a@web.de>
Date: Wed, 19 Jul 2023 21:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] PCI: layerscape: Add support for Link down
 notification
To: Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <20230719155707.1948698-1-Frank.Li@nxp.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230719155707.1948698-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y4xC58aU4AA7rTGeebv3Bmu6UO4ApCIAz2t4ZBBDpZgJEp6h4mi
 G1eeFrDKdw3d0304bhQPWwvlKSnIMmF6mUY0oMFMLXezizyJ2BP0h+zAsfUg34K7Wz8IgmJ
 NkPjMJswSONNozT9ZzVs8xL30PrCf/f/gzf1QsDxqMLGu6i6INCs6S9xspfGkQBBbivgJ8i
 kR0yApk2KrTJ37quN0iPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/CVLspWjoKc=;K00rwHyed+MI3jRcrdfpmh8I5cx
 +Zzz5c9cRHrT8f7ZzndlJvOyllzB58aNWSzuYUcdbIkTSWSsjgygpngaaOGryvPLrpYXHCuQl
 MoL7D5ShXv3v+4QQ5c/pZgDd0j3nYXmqLOyadJ5q0WYLlgPA3QS8zgaFlS6eKIvvsRzD3ur1B
 +YdCbPJiL7/KlsKVQPedELa6GaWOW/8iHrUec7fBqk/MoMvWeJZMfVhjlY/1RVLr+lfL0ZZkn
 2LFJrwhQSP6diubEU8jImP1LtA93Epk3rh0/w2UUlPBeORtpsK657VTacFbo2KYpobqbu0j99
 ckF4R5iVzSLsNJv1rxUPCuy0/YXL0taQmvIewm6/eAdtMJsrZMjFCSGqSLjUbRAQL925dHVNI
 iZTQKJV2j6Xnv/RMAOecd33G4FbX/9sw0/Db73fXMeTOgN89im9rOsBHybp/Zgsz5o283Max2
 25RBhLpYgp0PeMg2PfZ4SjcR799iEta4gqDywJyjgmhgwY/Z4uS36F4ekBPpJEuY3duFBHNtY
 2W3IXGCQkvTAHGWd9FLhZhb29hHwFsgkqJOaOPGeseFWkFU3Eth+OC70ov2qQ8CSMkUMuGEqS
 HKUYocePB5U0FmCyLm6BWgTcyvKy0d5UcuheDNKathkZ+1yLTlWGZzu3NxRzPxcjQV4yzcq/q
 mX064ok2S2e7G+IEbKJVtzRYj9Rn0r6oE2w9yhHlc/Ppbo+4fof+EM1OD3wVdE2mPzsyOZDU+
 Pkk6XnIrc1OK7ufrrlK33C6e983MrAaUw4EyPw6q62a+UhffRumjDQllWgqyA/eGWx2HBj1/W
 8WGnQFJ5KM4PVatLak1CkQ9TNqu8PIgT/6+HtmaDMsMo15NtzTmIgwmhcY76Sadl/4/ncAwmR
 Morxal0ZQcbG4zLpDg+Z2vCK6db0yqqzKWsKcQJxeu9oDjt+FB56MIqTSsexhKyMMRhYwWYoI
 1gmYSQ==
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
Cc: imx@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, LKML <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Add support to pass =E2=80=A6

Why did you omit a cover letter for the discussed patch series once more?

Do you care for consequences according to message threading?

Regards,
Markus

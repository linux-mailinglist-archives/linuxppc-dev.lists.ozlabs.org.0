Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF0759F5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:09:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lzZtZBIj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5n3H1vNMz3c0n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 06:09:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lzZtZBIj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5n2N0w6dz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 06:08:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689797298; x=1690402098; i=markus.elfring@web.de;
 bh=7FB9Ngbj5uz4/U3sAYz+STFkems0TVhX2iVucsGsdzY=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=lzZtZBIjdt3eB4n+r7aHbhD0MMcj2dVyzXg2kOi3tzwVl15aXH7D/Qp9L9jmJWU4G0AFGRR
 hsnqypFTjStKUOdRUl4YYzBL5gd/G4Rs+yQ1ZZyyKcZALA8+aYc1sl22mVdhZwAiLGB1fh/D0
 tELeGpgBtNrdDrf3BvHAHueyF44qwQxKJ292L7L/JiHqhySD7SXaEmNUe94NJfPvksnINM6Fa
 DrHhySExkGuAkTmAoa2pDrC1HRA8D6kzt1fvvQrT9cicXgHbaMdjTvAEyyOUUb4WkrquYnruL
 AL7gIFcCPjNthVFo9/CgZwBjj9zE4dg3u13doHtAHFe45FBuLmcw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzTPQ-1q0IrZ3Pto-00vczO; Wed, 19
 Jul 2023 22:08:17 +0200
Message-ID: <065b12d7-d46f-adf9-e806-40802fe888cf@web.de>
Date: Wed, 19 Jul 2023 22:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v3 1/2] PCI: layerscape: Add support for Link down notification
Content-Language: en-GB
To: Frank Li <Frank.li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <20230719155707.1948698-1-Frank.Li@nxp.com>
 <901fdc6a-a560-a431-adc9-aa73d7f69e7a@web.de>
 <ZLg9Mw/FvmMdNLjX@lizhi-Precision-Tower-5810>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ZLg9Mw/FvmMdNLjX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tO6PODTVp6h1Dgf0P/tT/iKMfODho/RDxrAZJYiWcv9PSXHNMvH
 yzvnkB3omQjvxPNrGgFfarElNEjH2JIqlMRQrPQlqkS6N66YQNSTpNKOk/E1Q3FkcB+re36
 64wLhGugLBUpINWWXA2QG0MK9GBXyFXVPd5ZtIDK3HGGSpe4ci6JykMgphpkI/H6tbJwjdS
 rlOrNLy6m/9YKyl8pAfEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nv+M7xsVP9k=;Rz/KnQAJz3+31/J9F2ULBSOTouO
 aZlBTcDfO4+bdy64KAUK/v62AfBzodxg6m0pJRHfFo7ramHuPsNnOcd8nPmwWmvFwgL1KHh3x
 R0AA3VrPW+BDEGW8XEL+Fe+eyEB4np5SX+xXLELLDIZw2IveIduCuVrEHo8BigmMPANx3ddqA
 41DzV99PySfTyoaTv7+Iamq8NrO5jseFfu/ZBwk9gahpe7DYr3itffirXHHY1tJ0PBUu0uf/n
 ov8LcO9WTSnHuZuFOffWnihLL6HnkbfZKqzlG9xGyNYEJLgfdnpsHH+FlGdMq/DT3URNOws90
 xr+Ea2v6ZLR9/Lw0jsB8+yNMZWJQ+i49NC0j2YIjB350sgWBEE6N3PE8W0f2hZSmCATetLw6k
 XfvznFTwI2iCrMLlDx3vpsAnXDswVdGHMwGAHfGUPJkBxIHRHf6uiGMYbkBHBOBntVuq6kyDZ
 vxr2moEW7VJ4Dyrx7A5J1FRuucWO6IjoSUMdHzieFUnm270otL5aq3MCAPCQjXgsrSk6KRKEP
 RRi1d10Cb/KzLhZlM9DXYnA0nGYidDk6xnAUdZiEYvYcKc16hvF7rGrLPY8bzof2m8i/B1FjB
 awIatcCdjCMctzYmOQG8TafysZYLmmdVK5w/sUddO/3O025Y+WZnB0mUjFWKxsuWC8eiCWeXR
 fqVxaaTv4HoPODgdOPlogAtT5q5HdksDguTYKSRsDeFZZ5T3Fv6ThMZvdUiuDYHB/tBFYbXVB
 ONcVsql0r3dehiKyZTX0h5WhElK8DDSQHjcNIJncCnkBAGvZ8v/q4p9vhlK+oHw1cfWfi3/w7
 QzBvpKU0MQi5w4ka8u21yqnAmqbpQeJM/WtgBlTaJ/B3Gu7RT+W3vDaB83AmBD+HGpI5PxaYl
 UC4k+7ARgufCTnTvc2Bkoj2p4aIQZmvJURjgnZQHBtiA1qwcyO4kQ1HZ9SzCo4XEdouj1I5CE
 tz7T/A==
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

> Cover letter just annoise people here.

How do you think about advices from another information source?

See also:
https://kernelnewbies.org/PatchSeries

Regards,
Markus

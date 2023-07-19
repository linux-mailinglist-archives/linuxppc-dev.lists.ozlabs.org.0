Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5C75952F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:33:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=efRsCp0g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5ZwW00H6z3bpd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=efRsCp0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 322 seconds by postgrey-1.37 at boromir; Wed, 19 Jul 2023 22:32:12 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Zvc3T3zz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:32:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689769927; x=1690374727; i=markus.elfring@web.de;
 bh=BEg4VEyO1JURsTxwHcxFLPIFxlro5BRbE2q/bmQSx/0=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=efRsCp0gA+F9yqDb6KZTtSkX2YjFRtl9z4M2jOuAK2gHj+Bv1VJ06zAUWxSCCN/ztbkxA+2
 UIbwfc5CmeN367LZ85+ptLwh3fAUbZhBwVfdwqYA4FWEtMznVXzcqI3+eY1yjlvCvb3d90I9R
 r7DFMTKH/HyX4DKVeVswRlpDkZw2Yc9D8fKzh4OyRovf5px47bRDXsoRmm99pixQzJw4K2Drw
 GC6G1uBctkNCVRYssbFGvicqB1h7D0GLYrLK2psirNjWHKbcRAn1LwBeVMHNXp2y6C/kLQh2T
 s0Ay1ae+vXzTrUtVz2MSqqAMlZ+6Ke/gJjQ3RrtL9ZZ3cLhC7Bqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqqTV-1pZJEm45yr-00mkG8; Wed, 19
 Jul 2023 14:26:18 +0200
Message-ID: <48020d1a-471d-1f82-f399-52014651b822@web.de>
Date: Wed, 19 Jul 2023 14:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Rob Herring <robh@kernel.org>, Roy Zang <roy.zang@nxp.com>
References: <20230615164113.2270698-2-Frank.Li@nxp.com>
Subject: Re: [PATCH 2/2] PCI: layerscape: Add the workaround for lost link
 capablities during reset
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230615164113.2270698-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AIjvDM8s9vNXubm4WHz1OKvLwQ10Q4CK5reiwidoHJ97tp/jpdC
 qg+7hCtBXAiPdWKdT+6ZjAWzKXkUpmP1Y8lgIR26qmEzLyHgqXqmAShYm2Q+nVdvbkyDsqC
 Dg9LL26GuAixjmMpQkhPpevQ1wK48ZE2RlaZ55itD7PM0sWOzgqnIqDWbRrXe4qmI3IPSdo
 FDMlTVrCDQMGTYnp28QKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bVeOPNEStXo=;UdZR11jICB692hHDodoK2DNiQr9
 AdJPhOWPz0quvzovC3GWk0dBtMOu+tf8DpPlM3hkNVszJQfDDVBs/OkwiCg1Tu8peOM9fBlao
 CBMB45Ao/GW7CYH8eIloDrGvit98RZrHvkagoXjkohHWVZWnBHiQIKKA5HquIwsctUWcYO5Rz
 gkWkaGnumGYPfz0slYVJ1FyfTwmKuCfGn32mreIAQjNw+/rDncNjF+1A0WWEa+UK6v+5phd4O
 LlRnpp87tGXuV3qDrrFy1HZFh4gRLhsBEzaO1uBKNO3y3bCYDiOAy+oMCsmPYqjelSU1OkLdv
 KZGU9++ybKWMzujgSFIcI+QH6hQ1YEqG9nfRuMWrwVI+QFQ3FJQi4iQvo0ZBpm9HDgGGeyqQq
 a7tlty+eg9WndmIuOJZM2/mLuvdrclQFyE4w7+JJaYFfe5OXtAqq6roNR+7tR5KZwKwd6vWLs
 TqP5IJmivEiZOHS2oYklrBqoJHvm28QEdWKU0wvZsI7cTo9o6NvrFQ+C45kPT8w7KvUQ745wp
 olYBSbzUqwTlcDBkUANM9xDLTmVfLe0jaoTGPE+kjBF4KCTYk/gOjxwhZrOM6xXt6Esr40IuU
 m3n4jFQ81r8X70Oxq8BH2kdJhux7kwymeYif9WEfBxN8hgm51dvRBKanBN2+dnVZ8fb49N+Kw
 STr8UiJiHi31gMwIFW8QBap6iN7vfl52ApIZLwFFEH16x4LvQf5HKgliks0XLgce72dvc80Df
 Kac4TGT10j4VPRsIqleJJu/APc6w+PpROIQsFw+pYOxpQBagi8C+1Ah9leKayRCJ9ntY0xBDF
 74sDaJgl6NUu1j1fGPdGlKJZ3eYv78fCyIVDAfiL8KDfZCyWvlbMTxyInzTA+1f+JWxiaoQeE
 yUPk/sBL6tUrHayADJNfB+9lb4RntbUkEOu9raRBk6J11C7moPVOqolq96Gt0L41gRpxlZ58M
 uUuc3A==
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
Cc: imx@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> A workaround for the issue where =E2=80=A6

Would you like to avoid a typo in the subject for the final commit message=
?


Will a cover letter become helpful also for the presented small patch seri=
es?

Regards,
Markus

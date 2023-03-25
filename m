Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C837F6C8E90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:41:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKx959g1z3fQl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iljR48N2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iljR48N2;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkKw83Fx3z3cLf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:40:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679751616; i=markus.elfring@web.de;
	bh=lRoWN9GUUYimS2BBB1F/Au4aB0mJQoK2OFg0/or2gR4=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=iljR48N2ISK4ji74ogClq9/g7sMQh/XfauudPea01HVqlD50IK6UhHBlg+6CDGilk
	 C610HqemqI7SLFXfF91nsQsFwsvLU7ZrScf2sk5pNkbcHY46uCfogGsoIa5nqkdsDk
	 18qmxvdp0wG8nDfp49VbXry+U7Ik5dDlcPzRrHZFgOlSG8qNQ43B3NJF3v+tkVHGFQ
	 hL5ikEUsVcNp0uinMHB1z8g8ovFOBiDkmRKGfZbsDSiEu898OpgQrLfOc/kmrskmFa
	 R/O6ZDLKr7O2qfUE/WqzkYYQapWnn0EDmsrXlNyezL1ywy3S6gUxLFEuW0mHSgoIDj
	 p1P28TaVLWHbw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLAVa-1px31012Li-00IE91; Sat, 25
 Mar 2023 14:40:16 +0100
Message-ID: <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
Date: Sat, 25 Mar 2023 14:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH resent v2 0/2] powerpc/pseries: Fixes for exception handling
 in pSeries_reconfig_add_node()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
 <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
In-Reply-To: <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:buliI++mbLivrPirtf837mS+GlJgikN3OEFdGeTCMGXnrjtwIeF
 DQKkwH8tMwGZefcuFs8I5peVX6lfAJH8xBch9Mb14JwwU5N6rIZU0ZN9PDHqh0Mimi4kG8w
 vVvZTjn9R9vsEmrsb7xw0y6fvHM1iJjRsYVWydMmEwuv7jjQXkoNOKRWeMG8l9h8g3Q0NYE
 ZsEtXZ2egmNNjPQIrRgfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TAHde6W2yT4=;OOErgJQ94CfmXPWl3Pyok2dqxkd
 CdY8B93M9ewX9Y++8EybdcoOTgHX4vmYXtqHmSFcugDeg6Ds8ez5fFIPf8UGU3E4oz3S47VOW
 rUOUT9pz/k6TGVR/yI42J0g8VBEgxfXf+aI1q1e+2YLnOFt3qAgbJw9uM69y+06hzwgwas5BR
 zuLOuXJUphP7wSwNngy58DZEQosEU4vRHTFDy9D6U54nc1J12Ks99A9UOijUk6wf90sLoJeX5
 aYXRU0y3CzF0upY8kNpowcf2Qyk6rpF0sAQF99Mtxr8g5hZ58CEjklxUh12OLTRlernfeuHDN
 bYL8f/9TcPyIrandblF3Hduf1uybCf/zr+Gsz7MoMckum51n1djdCc+j+OBnp3ZudhfqTG/fP
 PZda/eTMVeX1GfnPZhzqw6MT41AasAGIUhojxcbiwEfUIuxqdb53v7WLINX5Ph2WZokzuhEuH
 dznE3jxEnl7iYpl+P+mOPGgVVMpUSg4Uc9ywZGWgOCm8LhsSbsky5CUFZgAOolSArDILjWRsi
 04Ab9UoS4wk3DH0EjcaCzPWEgIJixCgnCFlhXU0SfqUwMdr1qk7fSSYNeDq4MGhGfuDs07145
 ZQsGi8449CZ87qXn0gQRkRe0pZycVet//rGbnbwHUhTx41gzo2JqD0MUnibOk9Tg3ur+vDI5W
 L4mZDhsxWx3M0Id6cAPnwpibfaUZXhpourrkHb6MzHznX9VYErmt65Cu0+hORu1j6zIIMKoWj
 p+NiN2rxL8oLqv0XakSj3dOcysKXOOg9uKoY19uNGQ55SbT/bMX8Cuifk2tiANITkP7fZ7KRM
 1duF9lFGZxv0PpHhKyzDeK5APLJoC8HTKmkjBM9DVV9H9P8N7D5l44iPJNN+c0HEQBJWumDKU
 kTYthiGZKeS6EonPLou4PS6OfJQUxn3m52WMHQ6TsC/Aiq0NHBcx3tYqi
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Date: Tue, 21 Mar 2023 11:26:32 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Do not pass an error pointer to of_node_put()
  Fix exception handling

 arch/powerpc/platforms/pseries/reconfig.c | 26 ++++++++++++-----------
 1 file changed, 14 insertions(+), 12 deletions(-)

=2D-
2.40.0


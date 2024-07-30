Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25F940D6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 11:26:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=CbWJN3ji;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WY8xc4t0Pz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 19:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=CbWJN3ji;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY8ws6STTz3chL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 19:26:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722331528; x=1722936328; i=markus.elfring@web.de;
	bh=UuXPUKpAxDUJSU7l9ijEWWWr13YM4cXuW3gjBPRNm0A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CbWJN3jib0JHsUqML0cfbUsCpoVIXwrEAp4um1p1ZXrQnbPsLAdzmjtLCjzHoGyA
	 RX4lCwa8DEKaSIDXORdG9MVXZKZJ7Pfd8rxaECmwt43AFpQ63umvVIt0yGgohBVYu
	 PYmD1PIAjlQwaSNHXCTPYQYQFZKObRKggSzYG1y09BjVkXydAl2PqNHUUDUnKuHzS
	 LjinVc9VJqK909fcj/tjFcBgBB2ZCCHfjVdzO7n918mHdOuUd0no2WgOsN862Y7r3
	 pGTY5S/Wg3Z1Ekwr+igGsHwVkEtOagg2IohZh+b9Rz4yjE1LM3YStZkEm2zOwLGQS
	 /ZwJpKonFm/8KlDDCQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLzmv-1sqfV30ZZx-00W9SH; Tue, 30
 Jul 2024 11:25:28 +0200
Message-ID: <7ed0f4dc-9865-4139-bd88-7ca270b9a466@web.de>
Date: Tue, 30 Jul 2024 11:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herve Codina <herve.codina@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Mark Brown <broonie@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Rob Herring <robh@kernel.org>
References: <20240729142107.104574-15-herve.codina@bootlin.com>
Subject: Re: [PATCH 14/36] soc: fsl: cpm1: tsa: Add support for QUICC Engine
 (QE) implementation
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729142107.104574-15-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Enr+kaZULtHao8xj1MEf/uKFDf7xcXnvnwHaPuDxNtdiZHuvaY1
 faTKq0TSqBUp5PnbVfJHtSKkWkSvb14oZqqMrmafdm9no2GWN+cFWhjHN15JJxYtMz9Y+u+
 rlbcI5vrBr9iXxgxveDoHTs1RKZ9xgqvf3m/bg2joG0pnQwCi/b1i14gAI/SZySsyF82FFS
 2x8gGxTr1kypTc+y1/2nQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:m0k7Pq+00cY=;zaWDnDXkBAX0V6Qm/QR6xTJQWOt
 lAzDsi9PqBK3FR60RDK/jWhujt8nktX2uQqP+P1rZpIjM6bcrcbu7XF4jxeK7o5Dt223usX35
 BBqN7NnPy3zRkbJ9sSQHLljufz3JvkdfSn112I6X0ooGDqUSYtQl9PTh6KkkFhWiUOETGeFgW
 XIZ5qSKnxOU76/JX5GRyBBVCvQGWTRPzbjJ66wkoKI4p8mGV26r2lJ3Q/8JLKvO0KUIg+EM12
 uUeYj+q40/yNl2shqnpXHYqjZttEdqgsi7MFjoP0YJMcrqCVAgGLZtPdtQOeXMj8ak/5ejWRd
 ylynbfeCMHWELfdbyuewGClmsxHONIG0Esg1PAX4WOtCuX5bh42F0wREKEXMe5E287j822sHu
 5i5XVkYFSbw9BGJkwDEb9GJaklRvCTM5JbRjCdiiH2QwW62Q0Ak9jalIolsECfVWMMQVqC01z
 Vcpolul3yrBMxSt7jqfO0jFdU+UBgZCIZ4L0NU5qfDtFvgJYGFasD4zivPogv1ONbg+qjTXPf
 7UtYgTmnkEm86b7xm0BjmK72gKSCdUYlZxM3ThVuKcsYLn6mn7s5T1jyTEcXsVDZK5lCS7oM0
 Sbx20VAB2q99Vx5shGWmbnNcbOIhaaefhqvszRRfSCy9FMxLTy6cZ1mkMFM4L+QlA7ghXjRdX
 +aGhCK0qr99HW+SvCxyFearKhmz5L16uGS53BatAUNTk4M05+aUJgjwvZHzKHQFRmAcuc0dLz
 E52BPCsWSgYAbpm4Dvr+4xqEgos82xxwSC/EsjogHDCNv26J98AWK8HRD8YwoHvSnpAC8v54f
 N2mHin7mhcn4fXhNJ1jmq+Bg==
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
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> +++ b/drivers/soc/fsl/qe/tsa.c
=E2=80=A6
> +static int tsa_qe_serial_connect(struct tsa_serial *tsa_serial, bool co=
nnect)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&tsa->lock, flags);
> +	ret =3D ucc_set_qe_mux_tsa(ucc_num, connect);
> +	spin_unlock_irqrestore(&tsa->lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&tsa->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc1/source/include/linux/spinlock.h=
#L572

Regards,
Markus

Return-Path: <linuxppc-dev+bounces-12221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE30B57C68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 15:09:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQQNK38cfz3dTZ;
	Mon, 15 Sep 2025 23:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757941761;
	cv=none; b=f/MgDfV3PYmUkdcWLv3uz8upremwS9NK5UHDcnhD2mnFNY+WWbBwSxVz4xNEzfHJhRL/hd5U4ExSyM2LEtxEV/vS+mHVcDTeK/vonkRA0OQWqMXPT8cF6dkXdNyv6i1wtUA6xsNP5Ey/c+a7AGEJGnHu1fDyCYD9UbEnr8ww++MX+tGvIhMNu9CoU5q6M7WUh22A3lPAgmGBE/yW4z9sS4bNwuHLpmd3vGeiVpzqp5b56Bym1GVBr7prrj27G3f092OIGqLJ0VkkecqXLGeDkQB2dU4qXX2qUg3J9SnPDGD/hibjaTPmKZ/iVwl+MLC5bFaW9s/X3UvtACJ7knEIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757941761; c=relaxed/relaxed;
	bh=NhtemnjAxvA/8fLmGMmQnGfrrMMgLd4Wke3MQ3tQQMs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mgK3vwOnDs/uu3d48nyDwi2iPHBvzw2LrqqS+dti3ciKjp9O1RVDv8NnYGAkEcu6SoN6qGx/bX+yuY8xKyPoj+3wBm2ENS7Wz0DI+3HcOvhoa+tJnYqEc1VAJQ5XiuFlqrW9oCq2rJyCsehiuDvZL+ur4DnTHJmlPd1dsgYwoFj/IrPI+44C0f/0tjtplD+/nQoyhrud/F9lxjAeqFgU6a4qRL6D9WQmorQWHOC/2zwxinT1Uy6EXUaTWyTaWGnUBSwF6gwatIYoZFyMdo6HBL/ItPLfRgexhzt5ySP6mVUZlA728Lt/H3Vt9NiwFKREjs+0zmrQFcYT+zWLU5KG3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=gFbcfHWU; dkim-atps=neutral; spf=pass (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=gFbcfHWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 529 seconds by postgrey-1.37 at boromir; Mon, 15 Sep 2025 23:09:16 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQQND6Swbz3dKw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 23:09:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1757941752; x=1758546552; i=markus.elfring@web.de;
	bh=NhtemnjAxvA/8fLmGMmQnGfrrMMgLd4Wke3MQ3tQQMs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gFbcfHWU/8giPk/NKU9QWM+aeaM3t4K5XjV/MD/5OMMFhx5qggMxTrPGBntZ2kqi
	 wbr93PtPhPCopzErVDVGnCv39GgG2bfHVVXws3am9hxYSsB99f1fq5W5UEWy0tSPR
	 DVF5bzevH3NtwQrAFbQ/Yl+pT26TTZjbGSsvITBZFJX5mJrZJ1t81JYdpgAolRQmr
	 k4LNCsI6HsNVb4cEtJC89/dC5a4VpFCe1E2iHYfHdTlmGR9PeMp0Lihtfu8iIrvEd
	 H/OGYah5mKOl7Q8cPTfgiL0ocgMA3HP37Gut4Ig2fadSSa5Cy6+wd5d8RsLTHXRAK
	 eeIaZ+hPBNOzd9Wm2g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.188]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFrxl-1vB6ai2Sit-00Di0i; Mon, 15
 Sep 2025 14:52:59 +0200
Message-ID: <80453b77-01ca-4fff-8a5a-deed4203be0f@web.de>
Date: Mon, 15 Sep 2025 14:52:42 +0200
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
To: linuxppc-dev@lists.ozlabs.org, Kumar Gala <galak@kernel.crashing.org>,
 Alexandre Bounine <alexandre.bounine@idt.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jin Qing <b24347@freescale.com>, Li Yang <leoli@freescale.com>,
 Liu Gang <Gang.Liu@freescale.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [bug report] powerpc/fsl_rio: Missing of_node_put() calls in
 fsl_rio_setup()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZWxN3Ysz7mZYnylO6nqSUzTVLku6/7Sr4VvsnGOn1UNtzXXh8lq
 hhbS/eTW8oiqPNDG6Rrum+DkZxXhTWbACybnryoGioY493DKc0cxvv+f/T+8NAfphMIooIJ
 bt4FVnEl1EeM0XnFaD6knIrF01eFQgd8gzV7EUdwxKtcUzRHcnaytQt6LeThujLQHNA3CnQ
 vs3bFkT34/0HDwOLURgjA==
UI-OutboundReport: notjunk:1;M01:P0:FVc9glNrJFU=;TN+H0+AVB8A9IdtnTU0nKS097fZ
 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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

Another script for the semantic patch language (Coocinelle software) point=
ed
details out also according to the implementation of the function =E2=80=9C=
fsl_rio_setup=E2=80=9D
for further development considerations.
https://elixir.bootlin.com/linux/v6.17-rc5/source/arch/powerpc/sysdev/fsl_=
rio.c#L439-L731
https://lore.kernel.org/cocci/504107f9-09eb-47fe-96ea-53e375b17eac@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2025-09/msg00023.html

* I got the impression then that the function =E2=80=9Cof_node_put=E2=80=
=9D should be called
  in more cases here.

* How do you think about to avoid a bit of duplicate source code
  by another update step?

* Further implementation details can be improved.


Regards,
Markus


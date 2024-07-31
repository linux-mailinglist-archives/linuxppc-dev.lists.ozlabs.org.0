Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 125ED942A5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 11:24:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BA2isd2h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYmrt0BHcz3dC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 19:24:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BA2isd2h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYmr85Qjgz3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 19:24:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722417784; x=1723022584; i=markus.elfring@web.de;
	bh=0YmNy+yZCoJdyxtRmqU9DnXpRRd2Yx16nCVHhrQoPMI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BA2isd2hoBTUGxqViXo1jxACTMcqCndC1NusIza1e4/+646x6+82yMjc+DYI0iFM
	 t6I0w4OBKEl42YHUvYPFR3IQ9Zvd17WNXj+UNbMeMqpMG2OmlypOhEvU9Jj9cwJj2
	 Oqunx/+pZekAg8rtKLdN4iZ10zxnUt7i8zHnHMoH8MWqP2eShKfX2GR6LTElvS8il
	 CaIiWej3y71IZQTaiYlpNRT2OsSeX3sXiIwdYJczriiomSMoRcXVQ0npqkECuA23b
	 59Ohm1+3uQQQfCD97hlzJ6hgiTu7bWQiBEOFuNRCgKCqnrwIn7mKcCYdRrZKY5pFg
	 dmnHcG2KoLQVeFN4Uw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1rTG-1sWtge05Wq-001lGJ; Wed, 31
 Jul 2024 11:23:04 +0200
Message-ID: <6c6d2e8e-1392-4c1b-aa39-46149ff2956c@web.de>
Date: Wed, 31 Jul 2024 11:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herve Codina <herve.codina@bootlin.com>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20240730063104.179553-1-herve.codina@bootlin.com>
Subject: Re: [PATCH net] net: wan: fsl_qmc_hdlc: Convert carrier_lock spinlock
 to a mutex
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240730063104.179553-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ptvWP2JpA+KQ0oIRv9Hv1yCYM6e8ZIPJX3xm8Jrs46Z0EYQIqAO
 GTmbcWD4zNO8atDH8Qk5/8G2dLdADEYw64kLSUwUQhW7HcDvzjgdREg5AtiwDq3XbAXIYIU
 PIrsil/Woseyo+psqQdJ3UtIttMstZsiaY3amt2lW0HetwPxLfkmZg7ZYHBgb5RevM6GwZT
 uyR8HNRV2dQUiouIRmyfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wduvmi2tmRY=;ycowwX4dgWkZRr2SN8rxOYtybyH
 BsaNdh8FrLq0bxUnmtcLmTxQM9V26OJv9OswClzpFUO9VmaQ8561jja/JquD0WKSKsQHATLJ4
 Ja243VQjxtTJADdVtP51Q5wCB5PNhpbeEdkz1AQJN22Nou1WBfXYtbfVJAloQAURq7sJcZS+3
 AeOeIyhZeLlMc4vSXF5Mfi0Pn8bwDh3+GERNPnN0esQANY0vwqw9XXs+owhTuzzBraAU3AfrK
 2O2vmkt5roG3iugmdoNtzDk1jzfOJh7Lj7Bqh3vOxEKqg76aMj5DDG31tXBaGxv0W2z3htfLr
 5qcIExaulObRJKhjzX74bTLzfTyXR7cYz4GcWM0K1sMJnCt+Hu4e1P7yfd5uRmhLD3Tt+5gNG
 tlLzMBE83gI7gbiY79guOPG8BEsTWjzKoe+NkCNtBVAxGqHzlaL51lFLyI2zQ6kCwIymGIDfJ
 cXtOI7OROfs33qe5VetOItaake1ysbnnt0WAU5xPlDpJB39XjHh4IRwcpP1y1ukMhNzAi6EkU
 jXLjsI45MoY0ZYrInQ4iukNtMnONXMA9FxK3PEg5s20GpKbt1wCYZx3jk3MtpFW1HpxstyrLu
 uT3ZJUUHcqzl2m/e9gJMHZU1Rwh5Mqb0W+jxvVQ61hctcvF44z91uZsrfzFTUP2uUFx1Y/zwG
 mWbQx1cGIvvqFA/fNn4ZbNOV9ID84MpUcxvrKs26ar/Zfn0J17CV+fjokSc5mma/lFKPLU4md
 vXHCU9oXFyjemUTCPnvV1gtUE/Zn2IUQWLbVafJxd4XnlrzTJ5HC/+vdROjvsxhT6F0HA35hw
 vHmGqNXj/CeEFX6d5XVbua0g==
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Simon Horman <horms@kernel.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> hold, framer_get_status() is called witch in turn takes a mutex.
=E2=80=A6

                                      which?

Regards,
Markus

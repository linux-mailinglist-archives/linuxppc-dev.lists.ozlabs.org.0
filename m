Return-Path: <linuxppc-dev+bounces-1755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0726898FA14
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 00:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKRjG6MT6z3bZr;
	Fri,  4 Oct 2024 08:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727973854;
	cv=none; b=isAlsfAoSkejNehYv5wMWIrzZLmmOp9NHmMzumaFLX+vyeWDpTemE9FJzH+jbYG/0exQp05Y8hEWSIQfo5Q4erYzDs3NRVtKPdjGfH64F/yNktZAg6/Oow5/WIrk2YD95KnRfUIuImCjxT9iG+AcKn3JI953G2OBWpLvsDAXxq1KID93NTrz2nLl2fqn2arN4TSbCSGjiwAAAqEHoUVB/6n5UcJj0LTTWAimMA/oKNFUbMZOtVZlMSc9SGS5fQPkUH2Jw+zT52XjGjKTqR9D4bmGXcd2riqLTlcAeaswXHEAvomyBpA0Cm1xo1UM5Ol9VVP+8mbET7vZZwmCACu9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727973854; c=relaxed/relaxed;
	bh=F+1z7U/n6yl7iV1NAosWW0C7oJG63omhcZcSrRfRnkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXt0P45TkcO8kG6eRdiBPwhXpMDfleH1F0+FXXkhDS/6nF4VE+46zoJF6su+wLRKXM74IUUujH9WC4UwpradjcymST6scOAOqWK1CzW11LvR31xxUqOF5MM8TTCPn54KvWwkrQ51XG5HSK3jOwyrJaJ0gxi9MUoQ+/fFA+rf/dLA8nGaWrn5DLyqqziSCIYg91Pp74XEhxM0q5JZ1nAJ3QKwgXo27Odi4Z0yF/eaQmOGvW8K2jTUHJ8EX488gp0wW/pYy6eEYOfLXDs8L15y65ZDgc8ZGX73WfAAT6Xe7JctadiWBPTE7Z5QOO11n5+3GXNavPlDkyXXHhA9goA1jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LsfcAtmQ; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LsfcAtmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKHZN69fqz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 02:44:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727973843; x=1728578643; i=markus.elfring@web.de;
	bh=F+1z7U/n6yl7iV1NAosWW0C7oJG63omhcZcSrRfRnkQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LsfcAtmQMUQGdsVzWVNBx57kZ3pR2fojoP5MnKLrYFlXuT/Nj0/DQs8qpRilEXkU
	 9ClNyxkC84UkoqqCuM3by8mCLezOhJKESQKz7VFuevk7Y5k5KgF1KA1q+pJi8QieH
	 S3J7I5MybZ5IksteH+VCiH9hW/C37Yv9YfxaTfncVJeCG7ODgF9l9k0rwywOrKKvQ
	 riaMfuQ9qsXhN4dAoBYUd65MXnzVK3mW7lrNTyLd0bd3oqJmPnKy+9p/WUPjzrouA
	 nZrxtxWlNmTBaqWaviTxl0Kb0MpMRU7sITOvEfFqcc4wdgF+2mFpZKfjRUg60Zdfh
	 f2DNbKofrbpvRgnhAw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M76XN-1soRPz0pDj-005cKX; Thu, 03
 Oct 2024 18:38:16 +0200
Message-ID: <28632df9-0ea6-4fda-a83a-5ff7c23f97c6@web.de>
Date: Thu, 3 Oct 2024 18:38:08 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] powerpc/4xx: Fix exception handling in
 ppc4xx_pciex_port_setup_hose()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Josh Boyer <jwboyer@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Stefan Roese <sr@denx.de>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
 <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
 <e68a714b-32f2-de9f-066e-99a3f51a264f@web.de>
 <8edc93c8-b146-4507-8336-0709b2596cb9@csgroup.eu>
 <66655a11-888b-4c50-8e57-06552b82f922@web.de>
 <e843b3f9-2214-4945-bc07-68fe935551a5@csgroup.eu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e843b3f9-2214-4945-bc07-68fe935551a5@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RPueEfq7odGfIrQtPnI4m0PJ39ogJF2r0KLnd9Jt8NBOXvCvNQD
 v9sYqSOgYyLAwLzY2q2dSHG8z80OZGDse0kNGxc1wzRMAUQ4wpdl//k5KQVKKu8leMVdWUs
 AmUA9QW8FfX5I1VBApoGncX4nDU7bY0ldHefJ9WnIH7cFLDmtpmQ/2LgKvUqjUaDKG414PD
 3tRzt6aoGOCZK8T9lKkTQ==
UI-OutboundReport: notjunk:1;M01:P0:c1SWlyeeUag=;AGpdFhU5kOhAqfWwNmehbmlaC4C
 /M1QdvCXIi9rzRIh6SLDAjlpCetQr3KqXlC00ouxqxP0LKK8JbTgTBywD25l8Z/T75YUwOEfX
 D3rfOrUCj7Gbn+h/oBSJnhL/wD42CZGKMfUHdp+MjzJwrtY4XYg6bXGMW3In4bPVydEfGl8Fu
 YmxAJKSkB8X40tpn3JdlpYAt/MfhGpFMwIqYoRRP/Z4vlbDQE9319SwOI/93NDSaFKb2f+dRo
 iHIQPg0fld7MUzxktouHuf+oi00ReFMjmyUMu+bnAYtPad6VisZS331y759f3XRtTqFmybZry
 lToKR6OUacgHd8EeJ0iMllpo3swAMgvInp1RqRqgdKbCk6MzhxlHppHj4IN0lGKxoupRYpGa/
 4tviaJ444rns/GY25MtWhEruwYXtUXPee/e/glFM21REZhKdykiDFlBGuMhgjH+NllPR/B0Ae
 tINKLPTGJLNc4YuOp0+u4VUqlf4zcp41HVn/nWnJnJLS8tr8JLI1GbTlRdqfX2cjfa2OJvtEK
 xcMKj3rLjCeseDyP8pmyqKC/gKC8AkFwT5qVFyUNgfdfSQRi4PB0KG06jhklYzl97n8pdmXpn
 O1zGx0fQfspQmR05fA8r2hjuxOQUKkvycAJU+qh5XtTDl8wBpEITtk8HUb9XY08aY3c/tm9aU
 aAoGms8obEpbx1AX/pUpr7D/2iQn6kG7TIU0UosjQjlODoZ5fcI6FXFJEiLXZSZyZ+doNaFd6
 YGPL3Vp/inEPKbOeDQd1wOQCO2XcJuR8z/xKYnBv+8zyfoA4GKWgmXVXxNJSbMYc0ACaTkFMB
 /dAI1q/Z5Imij+EDPhf9oBWw==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

>>> Looks like you have messed up your patches,
>>
>> There were special communication settings involved which hindered desir=
able
>> data processing for known information systems.
>
> Don't know what you mean.

My email address was blocked in selected Linux mailing lists for a while.


>>> there is no much we can do it seems:
>>>
>>> $ b4 shazam e68a714b-32f2-de9f-066e-99a3f51a264f@web.de
>>
>> Please take another look also at published information according to fur=
ther
>> mailing list archive interfaces.
>
> Another look to what ?
>
> It seems like several patches were posted with the same Message-Id and/o=
r with an unrelated In-Reply-To:
>
> b4 is lost and cannot apply your series, it applies the patch at https:/=
/lore.kernel.org/all/82aebf6c-47ac-9d17-2d11-6245f582338e@web.de/
>
> You may consider fixing and resending the series as an independant serie=
s.
It seems that another information system did not get confused with publish=
ed data.

Example:
[v2,1/4] powerpc/4xx: Fix exception handling in ppc4xx_pciex_port_setup_ho=
se()
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/e68a714b-32f2-de9f=
-066e-99a3f51a264f@web.de/

Can we benefit any more from such information already?

Regards,
Markus


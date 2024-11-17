Return-Path: <linuxppc-dev+bounces-3392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 808FB9D05E0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 21:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs2jv6mL3z2yyJ;
	Mon, 18 Nov 2024 07:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731876115;
	cv=none; b=UZOp+MJEAordJQXIcCfbqp26CKUVlz48V4garafX8HDLNc3cIVtzqkB44Me2ar2sURRW/B2by0DnbMjbTs4OQPiNO5qfsZenB1jLz1GuTZixToUtHLZB79AEjGEdoqM4kuNnp0j2fd1pLTfsxf5zQjWlg7LpSZ8KEF8dsHk1QPBO1C016I5YeXDCMcYVw7Z3xlc8c7Yhuuktb9NNmB+YiNAfCIomLHMbPJ46rybQlz1z7K14unp/FB89+mPydS4pTY2eevggLtSH9EdTdbDyNJux5qop8sJ34Hv4UXAu9aP2RmY2iFqRNFxkNOtTugnGtkxDeq32S8hj+G1jkG8lfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731876115; c=relaxed/relaxed;
	bh=wBbUFxuRpefUDoTWDdR4oG541pCxAjV12MOKKMSPMLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX4gDD9p+3Dz2XzBNUz9YrTFk3RH1o3CHfUfxpiTczPVXS1dpvh0lgxLxqMU5fh9Codf4XwSjdSLzttG+qCE8SjlMYl+l4sjW+Vo2z9CrznmZuyOY4WswuAnvca4rq4hubvmuF8ZujeRVNnaSOcovDJE9AlN2/1eKwY9tkQC/tjG66jttMbglI11VLTnwl4fP0HTThoXGSRpsotD6jA5qTII3GmbzYlqujaO6CG2784kA2Hi2Sbmfts5avm2ka4CnwQiIGcLfUHSUfBsv8xgoa6UUJoZGUZy7nuvQfB6PlrYq3U5F0hNrcCJlx5Wk9eZddNSS7HJehZ7dewC60wuBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=gerhard_pircher@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=nrfq5OBA; dkim-atps=neutral; spf=pass (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=gerhard_pircher@gmx.net; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=gerhard_pircher@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=nrfq5OBA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=gerhard_pircher@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 325 seconds by postgrey-1.37 at boromir; Mon, 18 Nov 2024 07:41:52 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xs2jr2VMXz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 07:41:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1731876100; x=1732480900; i=gerhard_pircher@gmx.net;
	bh=wBbUFxuRpefUDoTWDdR4oG541pCxAjV12MOKKMSPMLg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nrfq5OBAxGkw+UPNgauVp3GoEPrAz64DyqdFQv26CLyyTeHtwfDVkEGdXb5AfbiL
	 MeNsr4gK3hK+AxM8z7GMFi4Chdwqga99dbaOl64qR2B069fVnJSiabLzvTF72DxFH
	 /kwrTRbFwLdbzkxsp9Fadj7ErM4WpxohstIcPzTFnEwFgEolpzixWRW151iymBPPd
	 Atn1pXNieT0XW+w4GclchgM4cZVGTUEbgEgo3kESLmHf7kviGs3uK/YQ/k7QchNKM
	 Y6Af3bMweo/K35gYzu1HucKGnProrbAfBLRQH9eoWRtaONUACYuS4j+trtVIUfIhh
	 X/9vd8HVJnICP00XbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.24.73] ([45.95.211.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1tuawb0FJD-012bDQ; Sun, 17
 Nov 2024 21:36:02 +0100
Message-ID: <7e8a2788-f0ab-4d98-b26c-114e04558fb3@gmx.net>
Date: Sun, 17 Nov 2024 21:36:00 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, arnd@arndb.de
References: <20241114131114.602234-1-mpe@ellerman.id.au>
Content-Language: de-AT, en-US
From: Gerhard Pircher <gerhard_pircher@gmx.net>
Autocrypt: addr=gerhard_pircher@gmx.net; keydata=
 xjMEZgsLXBYJKwYBBAHaRw8BAQdAFQBjng5ejD4ROI9G+eNIrECAOKsI0dEqMh4uW/vHjfrN
 KUdlcmhhcmQgUGlyY2hlciA8Z2VyaGFyZF9waXJjaGVyQGdteC5uZXQ+wpkEExYIAEECGwMF
 CRLMAwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQRvJ2HWg8s/bjPDPanyPTewbNK3vQUC
 ZgsLtAIZAQAKCRDyPTewbNK3vVErAQCnjZo9vq/Z+bcO5xA4NTIEjFNWGX5ezKIdycZwh083
 dQD9HyN3IE0xKU78rBok4lgimReA0zIoXIB2cWoi9cCjWgfOOARmCwtcEgorBgEEAZdVAQUB
 AQdAw8jGfsYGYHfXSiHhEk8zkKAFbkAodKiSLAqp/YxKMkcDAQgHwn4EGBYIACYWIQRvJ2HW
 g8s/bjPDPanyPTewbNK3vQUCZgsLXAIbDAUJEswDAAAKCRDyPTewbNK3ver4AQCkOqp9UwZO
 HAk+IuqBcdIf9qxFT5U00N9QCFMSiJtFEwEAyEpRNkXaPu2VroSiuZFBtQPd9uwS7QzdyR+w
 NTurFwY=
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IIKJU9JoBpa6kQg3YVBs1CsTZpTHWzfg+ZLwzYhCZvdRNURyHKx
 hS7h4Bxu2npIFKzWRQ4+p/9lWWHeVBCwZSKm4BEOw8/KQDa0PCN3j4+gp0NyjlZ4UQ87oP6
 ompBnAyJgm2Vb8HZOPsTTKgD+phDsBZMqKDgnhCvBUr7YD2e5UrZweEh9ttURvR/ktSppGs
 JImmgr25Iw/vvDIqA7zTQ==
UI-OutboundReport: notjunk:1;M01:P0:tdhg6O7NWHs=;rhRP561aDvvFjjAMnc/KyTU0Z6i
 YE/g5RAlwddQPqcXA/9t+QEgCZPoae78eLhx0U8xHr+sUAltfL3GMtrIYkNY0EVMkgXDA2Egu
 4m8kmtkPK1vmKA8Ri2Gf5z4h93ud9SNfNL5043uTAlf0L6FHDNhohZXpjst0je6pCHIJp7NBL
 TDjqR7jZ4vTAt3K3qrWcm5L6Ue6P/aWy/wX/szo5EcB7oQBASbUlk5jX2OAQFw6Kr4EpMg2zX
 kdaFDls8JirH63Zjpuq0MPTfiC1Us3oCxEIwstTUWi4q3eVPUX5pG3+RRU6BTDOKcD/AubBeF
 g1Q2ixna7xZIWRJZabfWJZITGbX5WSqitDD9VtrcuqscxYl93eE7Y0hZg7UK2jNm7Kj0aCrKZ
 ZLOU4JUKsQuq9gBXIze8MLtfii0yxU4U/+QRJotmu8WTQvhv/MykUOTqTejX0nz5vX4CUzy/E
 Uh7f43Ec8CaFVzLO+di6hiaY6wd3AZu8lI4a/CZ3ROoP1v/7dOJT77+Vkp51e0mv/dBeI5I0U
 OqV8YUM4efkejrNIIgPUhzJJSWbDEjP1X4HenQ0X2VrrOICgJi5xdMscVlWeOhylJFS5Ey74m
 o7va+eYxSXyIW83Y2WHnaHy6cLnvj54S6639ZbRHaGW+wfsXzGr45ll+L4dHN9WXZf57p6L/o
 YHNp2nr44uEaZMjT+YZPzlrDa8cAPqmo5ZvfqqGrj3/IpNwBzsDUdUrWOtvGsuEjasZzU5iOi
 8qvdXs+m/Nb324KNOdBNIj2iBwIfsx9PJoYIOsQDnnn+KiXaI3MtreSRHpvorQ6iAt0cnE8uG
 npKWzOoDHLuLRva7qNEL0GPePURWwe7PQz4Alfkzb7jCiJvRn6Vl3iPGMu8JmXXdU4zKwROSa
 h2vFJyC0Ls4bDbTMEsVuvp/fWuokZp1CawJOBPMCXABM6grKBgdoexarS
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Am 14.11.24 um 14:11 schrieb Michael Ellerman:
> CHRP (Common Hardware Reference Platform) was a standard developed by
> IBM & Apple for PowerPC-based systems.
>
> The standard was used in the development of some machines but never
> gained wide spread adoption.
>
> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
> some from Motorola? No Apple machines should be affected.
>
> All of those mentioned above are over or nearing 20 years old, and seem
> to have no active users.
Pegasos2 users still exist, but admittedly they mainly use MorphOS and
AmigaOS4 on these machines.

br,
Gerhard


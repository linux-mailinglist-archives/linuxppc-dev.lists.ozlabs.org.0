Return-Path: <linuxppc-dev+bounces-1754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBC98FA10
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 00:49:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKRgR0zcCz2yDY;
	Fri,  4 Oct 2024 08:49:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727970484;
	cv=none; b=QydlKFpoDX0mhslGLqlgzjlUtedewxZZHhiklbhITyqkmgncOrvfwc0fRBTonQyWPjCbQswMbr6+QgdoW3v2vres0v7cEAH9R3rqzyV6UNEgODQ1RIPMF6Egb+qo8L6ObdBVO7u8f0pXaz5eBXXtNYdvFzQ5MUYh92wFysFCQTJmepsPXH4WefX7G0qi/OCxYmQ3ZrH1IV8dhMHeIgARN7m26F4b5/hhfhOnv7/AZwAkMyO4U9towKqauFRKe2o06vLbX1m0b1FOWj+mq8X+CT1sQgYPBco2jeC+KEminSwtt8ChDun1ujoZUbm6bzDrnMj5NAJEPWL4BuhnpDgWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727970484; c=relaxed/relaxed;
	bh=6YtWEy943w6XN6R2AHNa0OznWZOmWncdEFICHNQpfYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGClrmW5f5ECUUjo/cjxt/85drNGwBq30JjSYfi5H4MfPP+a6mY2XclnXNMxd2uI2oTQvF0+lZb1hOSDE2/p9m/v/i5MZekelTIcp2xDwF63JRIY16VZ9LUsvpWME7JeELpQqADbQuNI8vipdOdHsMuiW6G8oGEHgvPPkZma9ESKrcPdC1zMCWarOtgiEQAyEMmoxzH8GLlo/MEDRwh6sl3fG+f230JCWTnopyWtcKw/nDB8tMnDSmEjJnUe/392D0q8THDmOAXZc4/PULdiIEpg+zhJv4tO6xXraIvclwjB++4ji+XgGvvBJ1AjLohhFEhk1taqiRDwz1YX1r8wUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=uRKwIq89; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=uRKwIq89;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKGKW4HHtz2yLC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 01:47:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727970445; x=1728575245; i=markus.elfring@web.de;
	bh=6YtWEy943w6XN6R2AHNa0OznWZOmWncdEFICHNQpfYU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uRKwIq89YSdIDUSSN6xXQU2nxgDwzu+GmR2DgpocW/h55ZNLZnSWP9uBlEFhQnPs
	 9L6jHYFdPAFZp9magrXVsE3kkyBVu2IkLUt1R559o0aP/pMcbyDfG2006txOwD5wb
	 wACAJtxuxztRUk/CZiNLcjh8W7OWCsvvmVRZF3w1Zuv5SyyNGQtTsQfkbfLHcdCOq
	 6osE6+vaBsOjhy6nIwdMNWbdlhoDDbOuuCk7TAoiICbE/1RxKkDIXpL1TWVbK2Gkk
	 Cv8xmq8/Ucthxov1RL07qgsmCc2y11DzZQ5ivRa4VxF3MKw2NBHxDyK5K4GRjJKnR
	 CMakiobT8kqbkFynog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MS13Z-1sTXja2faV-00QQXB; Thu, 03
 Oct 2024 17:47:25 +0200
Message-ID: <66655a11-888b-4c50-8e57-06552b82f922@web.de>
Date: Thu, 3 Oct 2024 17:47:06 +0200
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
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8edc93c8-b146-4507-8336-0709b2596cb9@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7MPgs994GP7PFwTjO44hqBW56mTWsQeui4bBMdSxXLvJc+I18VO
 s3LsKLJlB0WoxgwzjZ3tpXnNToRVLOajOQJrK5FHuToJD9iwBaTwB3/EYIyHLfak5541MD4
 z+J/lsV1Ae+bTBuAk96TDFTiscjOfyOrECsQUkwKqq8FY+kMmfdCeB0a1TdZ+DpOjv0/T3O
 ehS3hOXBDffyRnAy/y4yw==
UI-OutboundReport: notjunk:1;M01:P0:GJwRiYMBY8M=;LW10UzlCbGnHFde9E838MAi2OIL
 wSC/ml98zkbeD4DWod8gSxUewZX3IEkJ5aExpsgM3RjbNjXc1PEtBUvuv7gOczmmdtqArMJAZ
 3czz0b56geNY56a8I6Pde7f9u0Lpz2ByxceN4jElHLmdKCDkPuTXACBmPZQVvxG3vJmPB42ZM
 nHPrJLCvnp2qz8H1swUjXdHY93ft1ten354QN1DeyeDzxOM9XvarY9sc2mTJedPK9C78yOROL
 svdUlaxvCGJ/o1nf06qMfLEc4SaYgG/AlmzFTpYk3WYiPmEekwyuIydN6t6+ujd7h5SL12DxD
 0yeUZifEA7Z3Au8tXix2iIh/PPo6YpM3O4P3nx00is0Lgmvv9TKxBRa/D+R5ai736S4KiN/GA
 7CQb89+v6OvVXWnxF+xUTliWQMD/VHtlD6EPcOaA3Hb35mWZigPOP1sTZNVawgdiqNX/ENM0N
 ALQw/4ri9OPoQhi42TzkJXUHlaLBOfGbCuBebLKqoqq1b2XQZL79tZPDQf6ZBOKStk7epP1XZ
 OvxsdVQzRv2GoSZL3pWUYHvYL84eFkme/bjS8oH/H/9UOttoeKaME+rZEn1geQ2thpRIUl7tt
 we0NIepxreeXWJA1xyOId/kD0mFoKnWvaicqFYXAAkYkvHPND7Nze62E5lfEzQRmTfT6dhl93
 Of8/rbbkxHPsBpXT9l4TzcwVnMPrJpxu3cDL+iFvbW/YNjJzUPXQ/jeJHYizZlAX+fhA486x3
 ePgbTSI7opOvpCjqhWv+IY4f+TvpzNiqh7owCEn+4FTfl8lNDApOHpTKaoUfAsYVNZNiagFyH
 pF/EzXXeriqSBJZ3hj8VYbjw==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

=E2=80=A6
> Looks like you have messed up your patches,

There were special communication settings involved which hindered desirabl=
e
data processing for known information systems.


> there is no much we can do it seems:
>
> $ b4 shazam e68a714b-32f2-de9f-066e-99a3f51a264f@web.de

Please take another look also at published information according to furthe=
r
mailing list archive interfaces.

Example:
[PATCH v2 0/4] powerpc/4xx: Adjustments for four function implementations
https://lore.kernel.org/cocci/ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2023-03/msg00079.html


Regards,
Markus


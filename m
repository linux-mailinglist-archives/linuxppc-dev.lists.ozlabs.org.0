Return-Path: <linuxppc-dev+bounces-1750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841598F39E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 18:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKGnJ6CYzz2yVd;
	Fri,  4 Oct 2024 02:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727971716;
	cv=none; b=SwKXAuNcSGJnEOf5acPVJyYlaG1WPUtpU564LFF+9YDVUTIh3qfwPQLt3vPmlzVKL288BwQbqgyQQY75eQdT2R5mSUQV3aehsj2G2czx0OO4DSSfVf+YfqbFC4wwuxyq9B8boZYF2BsTqi1unof/+mUAYDOUkJr3VtLLax6mychQfHAK3jY/oxwCiXPJ30nsbp+ZKwlWDZps6wcBQRoqnSwy/T7c2cYdpsrb1EEkgyW5QpFQm2WRC1jBGOiCO9dCc5op2N+zP8I/fzqkizQ3T27ZoB2803/gB6FU/LOsiKlqYJyzxoSNHUmshLb3i4ZLD+iZtig9Vw2oEZE3s6Oi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727971716; c=relaxed/relaxed;
	bh=L8cjJxiopdZIrFsl8/fSAo6MTDy0aQWAvDgxgjCpnXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiVkggAt6dS9+DrvrOWNO6WI8+j4kC0kG8wpUCervukYoW/WcFDxCoekfWf2LTIT7sA9jMCYZnlEMU57Tka3+FWlWYAn7vtSig3AG/UFMeQxwx2cMNNtW3gzjxu1iF+tF4nEcdAyxqPuNEWVOU2OcITOYajhxReJ+uzlwWSSZx4kANZshVG0/HVWCComjRN+bN/gjsYdWcLgkMUXgbDQUqiWraiD2zWJXl1DOqKrm6TasFvksEwu/jOAJwi1Li1u06TqUs/beHL9LH2bk32gFk+joEKi31jonbCrkcq8AUTkO50ufMktr3gvXgyU8jtoeroOOX/1ZQKCmoSHfRqBcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKGnH4CLgz2yLC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 02:08:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XKGnC4DHvz9sPd;
	Thu,  3 Oct 2024 18:08:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGOblWKlMNCc; Thu,  3 Oct 2024 18:08:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XKGnC3Qphz9rvV;
	Thu,  3 Oct 2024 18:08:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F7EE8B77A;
	Thu,  3 Oct 2024 18:08:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id m8Cmdue2PRME; Thu,  3 Oct 2024 18:08:31 +0200 (CEST)
Received: from [192.168.232.46] (unknown [192.168.232.46])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C1E108B770;
	Thu,  3 Oct 2024 18:08:30 +0200 (CEST)
Message-ID: <e843b3f9-2214-4945-bc07-68fe935551a5@csgroup.eu>
Date: Thu, 3 Oct 2024 18:08:30 +0200
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
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <66655a11-888b-4c50-8e57-06552b82f922@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 03/10/2024 à 17:47, Markus Elfring a écrit :
> …
>> Looks like you have messed up your patches,
> 
> There were special communication settings involved which hindered desirable
> data processing for known information systems.

Don't know what you mean.

> 
> 
>> there is no much we can do it seems:
>>
>> $ b4 shazam e68a714b-32f2-de9f-066e-99a3f51a264f@web.de
> 
> Please take another look also at published information according to further
> mailing list archive interfaces.

Another look to what ?

It seems like several patches were posted with the same Message-Id 
and/or with an unrelated In-Reply-To:

b4 is lost and cannot apply your series, it applies the patch at 
https://lore.kernel.org/all/82aebf6c-47ac-9d17-2d11-6245f582338e@web.de/

You may consider fixing and resending the series as an independant series.

Christophe


Return-Path: <linuxppc-dev+bounces-1673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94607988E96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2024 10:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XG16Z5Lfdz2xlF;
	Sat, 28 Sep 2024 18:42:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727512934;
	cv=none; b=UoNbaAkhWIInGD8onf8MbJ4ZHvFcxdtRCPtAPHAAsdE22iHlsAWSje63/ihqIPuybNgjsmGtYEnUpylbZuE4ymTEhDkpoDa8fSEHN/Gn9oDxmp3oqqFZE1LvlgXZJCTzwn8k06Uqm37Zv+HpADvJVmShfSzWO1T7gQBBP1x10F5DgTlNzi8lgDfD1MwsFTr2x5XHgWiUFjRFTRclW9wlnNJ/r68mrhXLKjZT2ea30ZvzQHiDstn8h0Qw9Co1Qn/dAsIrqOC9dNY7zEhK4BKAa2Gpni2TiHy0PdJWAG11myDXIBkx5mGGsKkw8pe1Wx0uvSx0nUny8QK8WSqmCto9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727512934; c=relaxed/relaxed;
	bh=zVuWCm27RoZTqx0DawySJAhRA2GDoHOxzPu+3t2sExE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrSisgDKDKUSQrN8/fiVVKzfqIadhQaPveI0UP178u7O4BCObknhDHkKRbTm0LdRPvPExtwTJ+p79Q5wYB40LTIaa+ekErQISOksLPWScwgGLKmpqqONpQkuvVxSu7f9IyI+Iu5vO8LqpFH6VyKEeNyMhmlGHXN+iB8GsfbJxJwavd+Ykybwv/SJQs5EOdyLz6S8ivfGUCYYU2xS3McE8h+//UO3jnyMdZ0w2RAy/wrOY3vADubs9qCf1Kk56FkGvkRAEpZgRp8OTMd51Xp/zo2640t/8jtDa0kcw2D7NAt5aMeuNwk68fTgYQfqIGn8r5X9DOy+PR6rGZFxC2pJzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XG16Z2gcnz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 18:42:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XG16R4Jbxz9sSK;
	Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcEHH360jGYl; Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XG16R3Wyhz9sRy;
	Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 66F6A8B766;
	Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yxf-oHR6bVmE; Sat, 28 Sep 2024 10:42:07 +0200 (CEST)
Received: from [192.168.232.146] (unknown [192.168.232.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0804E8B765;
	Sat, 28 Sep 2024 10:42:06 +0200 (CEST)
Message-ID: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
Date: Sat, 28 Sep 2024 10:42:05 +0200
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
Subject: Re: FSL P5040 board doesn't boot after DRM updates
 (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
 <20EA4BE5-B349-4406-89EA-3D442717EC03@xenosoft.de>
 <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
> On 28 September 2024 at 09:21am, Christian Zigotzky wrote:
>  >
>  >> ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
>  >> <chzigotzky@xenosoft.de> wrote:
>  >>>
>  >>> Hi All,
>  >>>
>  >>> The lastest Git kernel doesn't boot anymore after the latest DRM 
> updates
>  >>> (drm-next-2024-09-19). [1]
>  >>>
>  >>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
>  >>> Radeon HD 5870 (Cypress XT).
>  >>>
>  >>> I reverted the DRM updates and after that the kernel boots without any
>  >>> problems.
>  >>>
>  >>> Please note: Due to a lack of time, I can't do a bisect.
>  >>>
>  >>> Please check the latest DRM updates.
> ------------
>  >>
>  >> Can you attach your dmesg output?  There was a regression in the dma
>  >> subsystem what was fixed by this commit:
>  >>
>  >> commit b348b6d17fd1d5d89b86db602f02be
>  >> a54a754bd8
>  >> Author: Leon Romanovsky <leon@kernel.org>
>  >> Date:   Sun Sep 22 21:09:48 2024 +0300
>  >>
>  >>    dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>  >>
>  >> Alex
>  >>
> 
> ------------
> Hi Alex,
> 
> I tested the latest Git kernel on my FSL P5040 board today and it 
> doesn't boot. Our FSL P5020 boards boot without any problems.
> 
> I connected my FSL P5040 board with a serial cable to my PC for getting 
> error messages. Unfortunately there aren't any error messages after the 
> loading of the uImage.
> 
> This means, that the dma-mapping patch doesn't solve the boot issue.
> 
> Please check the latest DRM updates.

Can you bisect the problem ?

Christophe


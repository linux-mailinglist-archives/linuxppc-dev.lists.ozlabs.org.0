Return-Path: <linuxppc-dev+bounces-1674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD556988F15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2024 13:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XG5Cw1TvDz2xpp;
	Sat, 28 Sep 2024 21:47:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727524025;
	cv=pass; b=YYTK+3/6Beu7U3VtGMiIhXaUhVYZMVIQmZCvPjQn44S8Pl5pNzzumqzt44eUdIMaPM1i1PHvIq0E40HysknbUwgHOnhJgt9giEFf9zayliAw49kHx7UpnOfBYeq8GS0a/RavpDZVu4f1AGVbEcezotJ+eVimV3uknDmf5Bc7UF+crokpktFPAW7+6l9iszfbbskCNNEBmsNMB5nCpuamLSUb+ADM/5l7di6q8kYnQJryYntLyLAPg4rEoCwZJbILxhIbfmhTgfhpwRZMAW7DInAIPZOQAGZpp+jiSQK4GNc6yuVqTR+ZgNpB9awnvw6xxylYm2SfmW0cRghKUx+v7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727524025; c=relaxed/relaxed;
	bh=cNqZK79n0h5loJC6DEyWm5/Lek29SPYfqhi1EUUaNQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Imhtl++wl7oPmz9mIuYeuRrkqlCqvjVicuoTJm79t5ch7IgeMxw2ZeooLeUXgHYZBn3arlPsSkZV1BN4dN8C2MmGEecWn+RvB/FiGKU9LQSOBhzOcNmcLwgBrkbDNAzD5c/VuJeOTXpuS02FFi4JWyJ4Z/FknK4YlMjN6FT4T3syapgDNI7Nj/yaoOX+g+Vr+AW2Tq1wGz8OVXOKFG03P1Rmb+atKDUm3JAph/UXIPTQy76Bf7ocVnjAVzqQ8t7gw6s8tXeGDVjneb2bcKu4o7NUnCfDWiSPsK9FnnlMbkk8TY0164yFOQP6DU7wsmz1iAmloMV+k/qsbdZzKyd/QQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DtwF8sf/; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=d4gaaVBL; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DtwF8sf/;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=d4gaaVBL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XG5Cp417Zz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 21:46:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1727524009; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gIYZ4YuP64h6Dgmd8Nmi1ihP6g9kBi9TJrvLw0XRGov666gfb3yp97HcDbPhVnXbP4
    xOqPloIBeuK966xk8JXg35KjxxOKWYrrzj1ix7H1oHI9QO1OJGAUhCQ4mPAOJm4mZLC0
    oGgShxMJJRrYjCQxPijzA+/U2xMLsDuTQiy87RhaFck1yOomkdxf9GW9ULK6arsXTW8c
    c7m3juZjK2m6ZdXK/OWofnAOBLoB+ITdBZI0BYb3B45QKsYB7wsrF43kadE+csZhSYtQ
    8PLAP5HydXFB6Ihir+2o3E7HaZXnLtHzJgo44W9/M/RhF4tjBjKoVt2NfpxPiHIdhcGH
    ym7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727524009;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=cNqZK79n0h5loJC6DEyWm5/Lek29SPYfqhi1EUUaNQk=;
    b=rUfuTnUqn8S+NJ4brT4CHYHygI2qPBMHgSSu9VhoTwQimo9SdE4RxfcOuQsuhQpcUT
    vG6Au5kx1U1T6UV1wmPSQEYcph12WAREl+adr4HrFk8PMaQy1bQCCXh6bsw+JglyZFbR
    wQ9lSqT/BsJQcc7UMOl/aIxRlDcm6VVMcGAe6GKDZZOTS9/zizR+yhbyVbIL/fQgTNlN
    e8LvZfTB2jNe5GTyKY4oOLifGt1xo17VXgY8SKp+F6yuYiH753hz7mAvkmcA0Qa2b2em
    omt9cKGK9w78KjohGqmCk9TiTzz+Md84BeCY6fvI66nXHM4l3YicCUdMTYqFmeu+Dg9O
    5Dvw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727524009;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=cNqZK79n0h5loJC6DEyWm5/Lek29SPYfqhi1EUUaNQk=;
    b=DtwF8sf/t1xjeNrjO/1JwOJg0SPyohrSUO9SnW2/dmrKWkyWQtV4+Ys8mRwlqxZC2f
    QB5ZPxqu9x331RslxtVMlUiqK0w4uFt5tywbDhqIxsa+q/gBnt5vqr70nV55FCBme20x
    IxH5sxFmdFRNchTc2JXxwKqnvsWq7WoSX1gNcRKBbWPg0b9rwrvDuqw5DRkphJt94mYV
    BNrL0/oH1Wd/ZEJ5y73TdITXlfhMoZLs/psVvG76bxWUbgz+t39E2ShwG3Db34o5xk24
    DVMXvGbb3YPbhIMtYQtzBj9toK4j21r0oCDXA1L8fd8uRYMIsIYm+z7LZ896geH0RZog
    uWvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727524009;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=cNqZK79n0h5loJC6DEyWm5/Lek29SPYfqhi1EUUaNQk=;
    b=d4gaaVBLTnL/lXu4IDs08gBXkPWsSq+uDlGyU8OEtA40d7OAhAKMeBqnYgjZSI6bPq
    2C/xdkCmnYvwe9N0iJCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz46lpM="
Received: from [192.168.178.134]
    by smtp.strato.de (RZmta 51.2.8 DYNA|AUTH)
    with ESMTPSA id e0da1a08SBkmNn2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Sep 2024 13:46:48 +0200 (CEST)
Message-ID: <d10b0d41-8389-4b09-a531-c9c5d67df3b7@xenosoft.de>
Date: Sat, 28 Sep 2024 13:46:48 +0200
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
 <20EA4BE5-B349-4406-89EA-3D442717EC03@xenosoft.de>
 <48f59b5b-b26e-49c5-9b58-1c877bea394d@xenosoft.de>
 <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on boromir.ozlabs.org

Am 28.09.24 um 10:42 schrieb Christophe Leroy:
> Hi Christian,
>
> Le 28/09/2024 à 09:40, Christian Zigotzky a écrit :
>> On 28 September 2024 at 09:21am, Christian Zigotzky wrote:
>>  >
>>  >> ﻿On Sun, Sep 22, 2024 at 12:28 AM Christian Zigotzky
>>  >> <chzigotzky@xenosoft.de> wrote:
>>  >>>
>>  >>> Hi All,
>>  >>>
>>  >>> The lastest Git kernel doesn't boot anymore after the latest DRM 
>> updates
>>  >>> (drm-next-2024-09-19). [1]
>>  >>>
>>  >>> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
>>  >>> Radeon HD 5870 (Cypress XT).
>>  >>>
>>  >>> I reverted the DRM updates and after that the kernel boots 
>> without any
>>  >>> problems.
>>  >>>
>>  >>> Please note: Due to a lack of time, I can't do a bisect.
>>  >>>
>>  >>> Please check the latest DRM updates.
>> ------------
>>  >>
>>  >> Can you attach your dmesg output?  There was a regression in the dma
>>  >> subsystem what was fixed by this commit:
>>  >>
>>  >> commit b348b6d17fd1d5d89b86db602f02be
>>  >> a54a754bd8
>>  >> Author: Leon Romanovsky <leon@kernel.org>
>>  >> Date:   Sun Sep 22 21:09:48 2024 +0300
>>  >>
>>  >>    dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>>  >>
>>  >> Alex
>>  >>
>>
>> ------------
>> Hi Alex,
>>
>> I tested the latest Git kernel on my FSL P5040 board today and it 
>> doesn't boot. Our FSL P5020 boards boot without any problems.
>>
>> I connected my FSL P5040 board with a serial cable to my PC for 
>> getting error messages. Unfortunately there aren't any error messages 
>> after the loading of the uImage.
>>
>> This means, that the dma-mapping patch doesn't solve the boot issue.
>>
>> Please check the latest DRM updates.
>
> Can you bisect the problem ?
>
> Christophe
I would like ... but I don't have time for it. Sorry.


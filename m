Return-Path: <linuxppc-dev+bounces-4104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DEA9F093B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 11:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8lbN03KWz3bSb;
	Fri, 13 Dec 2024 21:15:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734084943;
	cv=none; b=H1irLEMZiPQJMIpuqTjBGGdMYC3U/Lu0W6xBDllQxiZqyLVU3NUDo/gmRvyXslJ7zgktC9fC3eMweJrECnR70ii1uBPIYeF8lzc4wSmSSiVXzIJYommx8FgBkoQn9pFPgapnGaFIz+0P6Ytq82WC4HCZN3eZAWr5Gz3uP1gTq/twIWllx1zUjD/iBO2QjC/+/I22FJ11AwKfRoKQkoFZLIXrC2Sgv6HPl4WiNXN0ATqfzrpmFumDO1cum26xiB7U1wZGA6lC5xGS+cZRT8LkgbeDLyFqzGeWHFMgCwEgHjR4R+BsJm6EiOc3953zGZU09ygoNKLugnZkbrU/9tgtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734084943; c=relaxed/relaxed;
	bh=imrNzC5BrNhUj601qf2yEiiFTVJuEMvkicfOm30huIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEiVbrkKm5KyoaF70KVabOy55KeU0nCsOiIHwYsxVVH1ANuKXVojVdG7RRwOUj2EFw9RW1SWeuJIvQyu04QYWbKmViazRDnIAlOJIfgLKLKJB1XDhfejKIFuKq+kKLcbCYvPoVQ1SueImNXBbZBDEH5VEkiZs3GBIUNfAw+3Wn2arkpP0wOz5XvAe9O2qdT9WiHoQ046mBfg5+bnpBfvivvZ8mR+DaKHWoIokPacxnjiVWs8NzUFID61qmV1XGMSzi3aY2WG+i01IXtNwUdjDq75ikgc97pQBoeMmIneZp6PkaQ7z4e4JqOcSiiJQYilMAB4rjDJPablePIqVPyAMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8lbL2HZVz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 21:15:40 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8lbF67nTz9svS;
	Fri, 13 Dec 2024 11:15:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-COpe8Oi0vZ; Fri, 13 Dec 2024 11:15:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8lbB1Gh4z9svV;
	Fri, 13 Dec 2024 11:15:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 197918B773;
	Fri, 13 Dec 2024 11:15:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YjGKXVr-q2aq; Fri, 13 Dec 2024 11:15:34 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96D688B763;
	Fri, 13 Dec 2024 11:15:33 +0100 (CET)
Message-ID: <941b3560-6572-476b-9e9f-c0a6df3e9ff4@csgroup.eu>
Date: Fri, 13 Dec 2024 11:15:33 +0100
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
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
 <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
 <690acce6-3e57-4731-9949-f8bb06d9cb58@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <690acce6-3e57-4731-9949-f8bb06d9cb58@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/12/2024 à 09:41, Thomas Zimmermann a écrit :
> Hi
> 
> 
> Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>>
>>>
>>> The attached patch selects backlight support in the defconfigs that 
>>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>>> patchset and report on the results?
>>>
>>
>> That works for the defconfig but it is still possible to change 
>> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>>
>> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
>> deselect it.
> 
> Here's another patch that make it depend on BACKLIGHT_CLASS_DEVICE=y. 
> Can you please try this as well?

That looks good, no build failure anymore with BACKLIGHT_CLASS_DEVICE=m


Return-Path: <linuxppc-dev+bounces-3046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4B9C1C06
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 12:17:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlGcs6KmJz3btp;
	Fri,  8 Nov 2024 22:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731064653;
	cv=none; b=EqTUH0HXAi/4+m3w1O66MUbMhSHmlLKE69kw+qVoK1ePNB3zz6X2y8v3Zw9D8uhM9AkYTnFXRJ35ZMTpSb8U0/AZrcuIzxtksG+RPOOKzxMGZ0nwVy5DELiV2cVEmNocH27tqCFDNMAmCepVmobJyZLnM2OGps0DAPkPUDv5E3bmxqThZwuUfCzw6wbRkRno/x187CtomvbHOTBmOtd16ZGDgawsWOR8rw3lGYNxuxWdOIk//BHyIkbOBXErQzMM22yoREtKKtTqbYHDxYU3gjo1gPaayFFep7/NsoiqG3RLuZhRz/+HWkL1aupJup8H6gh/7bCcKaGpFJRJtFno5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731064653; c=relaxed/relaxed;
	bh=mAL3Q0x3xHcCLw+vQCWWuleKRmNj/JvTFn7z/D8K7HI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G24YZqFkjjbgE/MSVuZAqJ5+TCB8EsWnVGGyygbqL52iok0ntt7w9AcnGZiUgIUB2dSv5f/rvCWd6b3u7WNONUyc2V2KdMzxgRn+XlDbQwTadkXSrQkqlEkKFoKkY7SOZhg7GkkksCw4U+HWdXqW9QNIIkK2QY+FE3xDG7V12B5kWpiH1yg2s+JEWSt5NzMg0WGGCSJ4DaaR7Fm3JMAYUr58B4M3G7xyr1WrcL7+6HhuCBPmrTv9hskBZXrFr2sQXxkPhJI08rhKXQeaoPHPmXp7QsuXMb07Hpd6RCIdHkUV2VJ0a4mcsr31ua+xG1ims8r+p7wN0+x39AVAtgWeHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlGcr6CwFz2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 22:17:32 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XlGcn3jX0z9sSL;
	Fri,  8 Nov 2024 12:17:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jedhCAK4NTvb; Fri,  8 Nov 2024 12:17:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XlGcn2v6Rz9rvV;
	Fri,  8 Nov 2024 12:17:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F1248B780;
	Fri,  8 Nov 2024 12:17:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s51MEc62SJBS; Fri,  8 Nov 2024 12:17:29 +0100 (CET)
Received: from [192.168.232.253] (PO25383.IDSI0.si.c-s.fr [192.168.232.253])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF8D88B77A;
	Fri,  8 Nov 2024 12:17:28 +0100 (CET)
Message-ID: <98b8084f-8f66-4e87-b182-dda6bf0c3d57@csgroup.eu>
Date: Fri, 8 Nov 2024 12:17:28 +0100
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
Subject: Re: drivers/net/ethernet/freescale/ucc_geth.c:2454:64: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Linus Walleij <linus.walleij@linaro.org>,
 kernel test robot <lkp@intel.com>,
 "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>,
 netdev <netdev@vger.kernel.org>
Cc: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <202410301531.7Vr9UkCn-lkp@intel.com>
 <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
 <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/11/2024 à 11:30, Christophe Leroy a écrit :
> 
> 
> Le 08/11/2024 à 09:18, Linus Walleij a écrit :
>> On Wed, Oct 30, 2024 at 8:05 AM kernel test robot <lkp@intel.com> wrote:
>>
>>> tree:   
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C5a1ff6cef1f642fba00a08dcffce0903%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638666507603442752%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=2dgpku3%2BPjovwZxpedYowAAB%2BR%2FeyxOc0Ys3kE0KK6E%3D&reserved=0 master
>>> head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
>>> commit: b28d1ccf921a4333be14017d82066386d419e638 powerpc/io: Expect 
>>> immutable pointer in virt_to_phys() prototype
>>
>> Ugh Stanislav do you have ideas around this one?
>>
>>>     drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse:     got 
>>> restricted __be32 [noderef] __iomem *
>>>     drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse: sparse: 
>>> incorrect type in argument 1 (different base types) @@     expected 
>>> unsigned short volatile [noderef] [usertype] __iomem *addr @@     got 
>>> restricted __be16 [noderef] [usertype] __iomem * @@
>>
>> They all look the same, it's from this:
>>
>> static void set_mac_addr(__be16 __iomem *reg, u8 *mac)
>> {
>>      out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);
>>      out_be16(&reg[1], ((u16)mac[3] << 8) | mac[2]);
>>      out_be16(&reg[2], ((u16)mac[1] << 8) | mac[0]);
>> }
>>
>> Is it simply that we need a paranthesis extra around the thing casted
>> to (u16) else it becomes u32?
> 
> Not at all. The one you point here are:
> 

...

Note however that there is work in progress on this driver that will 
impact hundreds of lines, so maybe wait until that is done ? See 
https://patchwork.kernel.org/project/netdevbpf/cover/20241107170255.1058124-1-maxime.chevallier@bootlin.com/

Christophe


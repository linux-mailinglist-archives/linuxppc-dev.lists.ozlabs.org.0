Return-Path: <linuxppc-dev+bounces-4085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68E9F05A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 08:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8hCW3P2Jz30h8;
	Fri, 13 Dec 2024 18:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734075799;
	cv=none; b=hzJ4h0LwZ3uSU6udcxOaeBWX4BKQT0sWB8SQt55+/DrnFukQuZZCzJunVi6AIX3iSLyy682R9lkNy9MtWzcIvDE2Pj9Y8Yz4dO+nTARpIXZy6zLO/ePy7nkfXRJcKePf2WgwYBt/XCyozV+dsnm1N0Oo8FzdK6bF1SlXDgsqRTQ8951pMcNVkDbUAF2ogK+6twbwPqx+tc93NKbdrEvTGiK42aqbuk8y2T0QVsMGUFZpO1lscEshoRtIQsYkE89gEPL6cM/6t4vw9TYLSuJoi4Vls4X0Qvp/WZr1RJYEvZ7nfA72lobZzgZqdwceG2s1wn3jo0iyHoPhSMN8A4vv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734075799; c=relaxed/relaxed;
	bh=cJM2jKywz4HG/jtRCLmitoeIu/me2FoLtvt9tU5+5nw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gyOpY/UzeXm2+vmNWHs0xJ1sOuHfrzKKmXGFat4aYbogal8lDXiqQf3oUt+lfBGFIk9PW/mpV29aoDCmcD+kXg/k8afV4ci1A9GdEmXU7fF/KT0UoKALaKiD6LQkoSpSibtjgGaGzD1hzkOl8G4R5oRzCiShNCaJiTa/P9YDvsTTOmSx37Xp61ojqtFdGg8t6FdhfmN6vgRPOUEW3t7hPTFXqcvkMyNZIDKV4zZ4lYbvHFCnXoC9UaHOeUdz8MdQkXK4s/mQ0F+PdwaXf4tW/O0v8VK3TGd8YbE58N8RyXEv78hUqE+NT5q9CFAmK736YN8+sRKGzvYlt+5hOmKT5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8hCT62BHz30gs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 18:43:17 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8hCP6s0pz9str;
	Fri, 13 Dec 2024 08:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqXrq8Q9y3uF; Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8hCP640Pz9stm;
	Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BF4F98B773;
	Fri, 13 Dec 2024 08:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EOoiRkgTR9wb; Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50B3C8B763;
	Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Message-ID: <722e77ed-6f7d-400b-a988-9cbc7e1adcc2@csgroup.eu>
Date: Fri, 13 Dec 2024 08:43:13 +0100
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
Subject: Re: [PATCH v2 2/3] drm/fbdev: Select FB_CORE dependency for fbdev on
 DMA and TTM
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-3-tzimmermann@suse.de>
 <d41785b1-7246-46fa-a2e8-881a04e8da35@cs-soprasteria.com>
Content-Language: fr-FR
In-Reply-To: <d41785b1-7246-46fa-a2e8-881a04e8da35@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/12/2024 à 08:40, Christophe Leroy a écrit :
> 
> 
> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>> Select FB_CORE if GEM's DMA and TTM implementations support fbdev
>> emulation. Fixes linker errors about missing symbols from the fbdev
>> subsystem.
>>
>> Also see [1] for a related SHMEM fix.
>>
>> Fixes: dadd28d4142f ("drm/client: Add client-lib module")
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Link: https://patchwork.freedesktop.org/series/141411/ # 1
>> ---
>>   drivers/gpu/drm/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> Build fails which pmac32_defconfig :
> 
>    LD      .tmp_vmlinux1
> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in function 
> `pmu_backlight_init':
> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
> `backlight_device_register'
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] Error 2
> 
> 

Sorry that failure is from patch 1.




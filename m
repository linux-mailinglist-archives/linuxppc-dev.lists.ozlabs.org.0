Return-Path: <linuxppc-dev+bounces-7181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD8A6762D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 15:20:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHDWh1xQWz2yfR;
	Wed, 19 Mar 2025 01:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742307616;
	cv=none; b=MymznXDZJKM56QwR8tsDpWV4LG1YrKkphJVDHDQIV1Yj0WJYmDu0WRVZbmxsXvuezythSAkixSmwoe0H3X1E8GC7/Qlwy+z2+wthAgFhOTwyLRTJLtMr8R5VcqKdfpSB9fpEl17wvVAjzzuXEcy4zB5dM9UhDRYgXyb2ZfCdhXFEXsZSqyfqjdRy5leH5aQ2d8daeQ4vg7YCtfnyMPHJxxKWudMfX8/onjr/8W4mltWhVeBmeUcS8VDggFL88Mx/LbddH04WUyqP3lmsgQouNi5o+tis7mOY+2LgMWMRJtovVUUp5hXp3ht+jozh5O05boFhexuT3dLOuh2ZBIDEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742307616; c=relaxed/relaxed;
	bh=xOnA6nviu53bwL49WOTHWCfNXrgBhCoDBxv3GK4RUTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjChcRQS2TvE3O14CB71LPMmJepthkS4aQSOCiuX2ElrIrrqjug9D1l90DYebsfUwnu+80+bt8y7AcDnSnoCMtxjBUl8BlUFsZIRBWzs3wJ5WreguxXNBxfNDK8qszxY9ais8i92Lk6eehsWnweF8jtWB+XI5I94rD0XU8uclR7YL+bhlwrDy3no1r+lrTO15rEqkF3V7uksWBX+eLpndGWc8jVhTno7OhyMkAXqUX1bu2u/dujCMJdd+jzeYv/hPSac111EYMxcvO7Y8pP3YGHojeNkmifQ7b5a+yEFMZUmlYYMDrrMsWpvyF6wUhVG+JxrsA5YpLvNbMtWOhSQzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHDWg0tLcz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 01:20:11 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZHCnD3VgPz9sT8;
	Tue, 18 Mar 2025 14:46:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13JVH6dmrxGs; Tue, 18 Mar 2025 14:46:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZHCnD2cQvz9sSq;
	Tue, 18 Mar 2025 14:46:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47E9D8B78F;
	Tue, 18 Mar 2025 14:46:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cGsNLrlU5MWU; Tue, 18 Mar 2025 14:46:56 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E0EE68B763;
	Tue, 18 Mar 2025 14:46:55 +0100 (CET)
Message-ID: <1d822960-85a7-42b3-88cf-9d3dbc75a831@csgroup.eu>
Date: Tue, 18 Mar 2025 14:46:55 +0100
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
Subject: Re: Maintenance path for the fsl-mc bus
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stuart Yoder <stuyoder@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <2xzljdzktgpsyag5jhfwbxc2sroaacljecsq36hlxefu6jnz6g@zlorxu7niqnq>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <2xzljdzktgpsyag5jhfwbxc2sroaacljecsq36hlxefu6jnz6g@zlorxu7niqnq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ioana,

Le 18/03/2025 à 11:40, Ioana Ciornei a écrit :
> [Vous ne recevez pas souvent de courriers de ioana.ciornei@nxp.com. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi,
> 
> As highlighted by the discussion in the following thread, the
> maintenance path for the fsl-mc bus is not clear.
> 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-arm-kernel%2FZ9Lj9_yM1EK5pKee%40gallifrey&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C00bf096aa0fe40f9d8e908dd66094d7d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638778912314503921%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2F%2B%2FXzSQ9VUY81xPbjB8%2F0vIIF9ChaTRXupWd59%2Fvfco%3D&reserved=0
> 
> The fsl-mc bus driver was first added to drivers/staging and because of
> that, Greg was to one to pick up patches through his tree. Once it was
> moved to drivers/bus/fsl-mc, patches on this driver were picked either
> by Greg or by the Freescale SOC maintainer at that time - Li Yang.
> 
> Conceptually speaking, the fsl-mc bus driver is contributing to the same
> infrastructure level as the SoC drivers maintained now by Christophe.
> 
> Christophe, would you be open to pick up patches for this bus driver
> through your tree?

Yes its fine for me to take it via my soc fsl subtree unless Arnd tells 
different. But be aware that it will be purely administrative. I will 
have no mean to check whether any changes are actually working properly.

In that case please add the following entry in MAINTAINERS:

L:	linuxppc-dev@lists.ozlabs.org


> 
> As a side note, I know that the MAINTAINERS entry for this driver is not
> up to date - Laurentiu's email bounces. I will send a patch updating it
> after it's clear to whom I should send it.
> 
> Thanks,
> Ioana



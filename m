Return-Path: <linuxppc-dev+bounces-13735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB568C30D1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 12:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d16Fn3NhXz3bfM;
	Tue,  4 Nov 2025 22:50:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762257005;
	cv=none; b=f81kQuSCxNh1Kkdd52zFtSHZGTw+ra3F75wIRgwQ0z7mVXjowMN96+F2eEMKC1N3sAxqZa12M2P5B3HI47iQBRDqtYl++nzbQvXggM93ezw2qPiGcdW37cldS0A/tRXgCINwF4jZJ3ZhOgfS4WUy5RnR7GXT/W27JsRMV8r9R7vuezj8TiFrUiFpCzbmmV0vNO0attK69hgCEU4vlVg7qMaWALd5dlRdCzk+WKs/OhWPnSsYtNnYpa6QO5QluDmzqCy1odShizTZvcYRq4G0jP5yyCnS89JIApKP6RwgbAOrkZf1pbJNk43FFDGODiHH4WTl06i6r5NUcuohj0rD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762257005; c=relaxed/relaxed;
	bh=MchFiUtjHMwhm2YBQcH9TBZ9aUjZSwC9W8kvKKyZlUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mxwz8edD2Fc36CmFu9CTG1EG/+hE1XV/CMM3ifqxaUhswRmxJLemzb8yJtIiUalSJMGZqQcoWqgeBsle3j+tJX//ksqGw5fyhfC3mJ2XRjnFIIr7mzZhpcxzQZx9wz4IsZeEYGWTdCSwhAquiejxh7k9I3ew+B6J7gUoH9lgvUbItH2ulvoxtgbZasyzi/JLtACpGdzdEF4pq0h55UyiPjes3sIaB1aO/MYCc3EUPVhtUDc7GEv8tVPZy1tSFA3U5/CN5mpsEhF6fYS1axny8a7NMiOrxy0EKluwlNrZMLd215Y/mmo5VhT0nPmXtZFtUpxWxXnMo3TivzJbHIZLfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d16Fm4G3Fz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:50:03 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d15pT73Vrz9sS8;
	Tue,  4 Nov 2025 12:29:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cT7tdgBSNYbn; Tue,  4 Nov 2025 12:29:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d15pS6HmPz9sS7;
	Tue,  4 Nov 2025 12:29:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C3DFA8B76D;
	Tue,  4 Nov 2025 12:29:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yIjqGquuNwdS; Tue,  4 Nov 2025 12:29:52 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D3EA8B763;
	Tue,  4 Nov 2025 12:29:52 +0100 (CET)
Message-ID: <70a965d7-9839-4973-a306-4da4f1089bfc@csgroup.eu>
Date: Tue, 4 Nov 2025 12:29:51 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fixes for pmac32_defconfig after fb.h removal from
 backlight.h
To: Nathan Chancellor <nathan@kernel.org>, Lee Jones <lee@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Thompson <danielt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org,
 patches@lists.linux.dev, Thierry Reding <treding@nvidia.com>
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

Le 26/09/2025 à 01:46, Nathan Chancellor a écrit :
> Commit 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header
> file") exposed some necessary includes that were missing from a few
> powerpc drivers, breaking the build. This series resolves them.
> 
> This should go via the backlight tree, which includes 9f218f9bb9d2, but
> I have included the PowerPC folks for visibility.

What is the status of this fixing series ? I see a couple of similar 
redundant patchs (see below) roaming around, which make me wonder if 
this series has been properly processed in the backlight tree.

https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20251029150940.2523328-1-thierry.reding@gmail.com/
https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20251027140646.227025-1-tzimmermann@suse.de/

Christophe

> 
> ---
> Nathan Chancellor (2):
>        powerpc/powermac: Include linux/of.h in backlight.c
>        macintosh/via-pmu-backlight: Include linux/of.h and uapi/linux/fb.h
> 
>   arch/powerpc/platforms/powermac/backlight.c | 1 +
>   drivers/macintosh/via-pmu-backlight.c       | 2 ++
>   2 files changed, 3 insertions(+)
> ---
> base-commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2
> change-id: 20250925-ppc-fixes-for-backlight-fb-h-removal-2b6a87cced02
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 



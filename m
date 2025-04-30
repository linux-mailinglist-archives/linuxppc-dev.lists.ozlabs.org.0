Return-Path: <linuxppc-dev+bounces-8186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC70AA4D4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 15:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znd913VgDz2xS9;
	Wed, 30 Apr 2025 23:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746019237;
	cv=none; b=oUfTT9c7AnYqb1LAbFsTmnXyRTJxBsErLUdFRK4K1CuWIPsFdPO4WvzmXP/0G+5rvEFuc0t69RqDkL4MRkLIN9zzxCM/7F/0NQdOsT1sa/V0JmTqmSUulZObNOPLp7nJF6dUfQkMYoWii3Q9eUpvL8brSXnj3pWVfjZJj/J1U/dgEAhyukvr5lk1XU20P5G15WTKk3Hb90zqkbzb4NbiTAMX/SAcaftZ+Ove09t4HXzTF7E4KA+dm6duDfpuCJC+N7sq3EqR1NEXqxLqhpqE7Sq4zhaC9HFGVrQKG+IgwrBF21bNJdGegUa9kF3qEYBaEbSJ2EUm+7TPDObRVF+btA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746019237; c=relaxed/relaxed;
	bh=mQuSRbkJ+gYQyQG+DGQCw/t5NIPtxsvEROjm1gRx12c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMu13c061aQ3AMtrnOrAtlWcdJ0cpPDpjth0Bs9XrlLUCp00CeIunNpmQhdUf35Y9/0xbu/zEqzYN37Hfpq6W+DSdBwjO15J/jNDAb6mr77cwlPPPaWLKFPXmyRpxeQjrulAOPI0nK1m3h6aW1GbTIV5/x+V3G1vmKRNDGt/D4SCfnAL2G3vpdN0oTNcdf2Cd/JNkhFDS8NfvIpfoZc1ZzBKwd14tjqVhmw6fuJEd/BiQCCwaTpElSesSTancnd9W4uYvGpFIE5IRMAkQEQxpCqE0Q9iuarqgbB9hILZJqwmIfwoR5gxu+SYO/w4OfvTkKTWiR2WozIsTZZQsDSn+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Znd905b8Tz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zncb14Cgcz9sCk;
	Wed, 30 Apr 2025 14:54:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv9ioGE5cEZR; Wed, 30 Apr 2025 14:54:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zncb13TLtz9sB2;
	Wed, 30 Apr 2025 14:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CB2C8B765;
	Wed, 30 Apr 2025 14:54:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id x3PWoPD_y1-d; Wed, 30 Apr 2025 14:54:37 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C33508B763;
	Wed, 30 Apr 2025 14:54:36 +0200 (CEST)
Message-ID: <1ada639a-8dc0-4553-899f-265e6bc5e44f@csgroup.eu>
Date: Wed, 30 Apr 2025 14:54:36 +0200
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
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on
 TRIGGER_START event
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
References: <20250410091643.535627-1-herve.codina@bootlin.com>
 <174429282080.80887.6648935549042489213.b4-ty@kernel.org>
 <4b42c00a-0ef5-4121-9e40-9214bf9a1197@csgroup.eu>
 <aBFtesqln2Xeab-d@finisterre.sirena.org.uk>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <aBFtesqln2Xeab-d@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/04/2025 à 02:23, Mark Brown a écrit :
> On Mon, Apr 28, 2025 at 11:20:42AM +0200, Christophe Leroy wrote:
>> Le 10/04/2025 à 15:47, Mark Brown a écrit :
> 
>> Would it be possible to get this patch into one of the v6.15 rc as it is a
>> bug fix ?
> 
> It appears to be queued as a fix, could you be more specific please?
> 


Maybe I misunderstood. You said applied to ... for-next, so I thought it 
was for v6.16.
If it goes into one of v6.15rc as a fix it is fine for me.

Thanks
Christophe


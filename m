Return-Path: <linuxppc-dev+bounces-1727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 022A798D0DF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 12:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJVtP6Q8Sz2yR9;
	Wed,  2 Oct 2024 20:10:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727863821;
	cv=none; b=WKxXbkB5xD4Wp+hgTVUFSPdeSLk1BRady+ae3eOt7fcXw2zXrac3cPqQBKbXk36L91j/EdOHAt79raIqGIY7arxbuqejqztAPGP9QNz0ekxrBc79IVAmEYNW5AMkgHTdYr218ToTEBP8HsgKxWND5/Abp4oZtb2JF7ZlWBR54xfYnhRW9ylfn6LZqDB9CQBMBT5nfBgcuQZDbojY6xPaFAOrJ4x4KspxTdaWbvoVpj0bYffRIzNOLN7ZmxFT9FbUMbpk7RCQyfE9yXDhVxh10+SiYkXjeuQxu8IHTm73lWDLjFUdd6yoyJM5MPrf4bCyteh937VBV8S2f47DbCv5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727863821; c=relaxed/relaxed;
	bh=HNg0n2glN95XXiar/4f/StZhb/+WadKcRDMm4zp3s+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSpoFyvyPNoOTPJxEqEnVfUMYzUcKvhEtw8yqfINBixmT4rNnH/ajO73DsTNsfvlKaj7HzHLaTHtPC93Czgdu0hbJYQHNPC+qGZ3MIXtbfg/9XlOzUtLfGRxQkXIoxAK0MhkRJX4f4M45wFYNEQ+byrmiZPFKGHcVv6jy0u83GrTg3FBY2nXlKoE2CqJreRWWtfkeRKdKu4gcXGI/Fdcp3AQUo1jP9GTNjHFfrpANk6Jk6lbTF2bhj5VIctMNtsPUjFVE/opFr8GwIUpg3hb4IrDcaUQVnNoagR4tpjbJRxD7sO6YFBEDqCNNvkNAf2XuEGJSvs7DMk4UPsvcea0vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJVtM52c1z2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 20:10:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XJVt93Qntz9sPd;
	Wed,  2 Oct 2024 12:10:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAxfHpw7w94M; Wed,  2 Oct 2024 12:10:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XJVt92cCwz9rvV;
	Wed,  2 Oct 2024 12:10:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47F118B766;
	Wed,  2 Oct 2024 12:10:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5qsxC_p6Tauv; Wed,  2 Oct 2024 12:10:09 +0200 (CEST)
Received: from [192.168.233.39] (unknown [192.168.233.39])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CECCE8B763;
	Wed,  2 Oct 2024 12:10:08 +0200 (CEST)
Message-ID: <368e38d3-5883-4192-b9cf-f66d0f558528@csgroup.eu>
Date: Wed, 2 Oct 2024 12:10:08 +0200
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
Subject: Re: [PATCH 1/2] powerpc/vdso: Add a page for non-time data
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <20241002104334-b655500b-901b-42db-a2c8-582e10826889@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241002104334-b655500b-901b-42db-a2c8-582e10826889@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 02/10/2024 à 10:54, Thomas Weißschuh a écrit :
> [Vous ne recevez pas souvent de courriers de thomas.weissschuh@linutronix.de. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Christophe,
> 
> On Wed, Oct 02, 2024 at 10:39:28AM GMT, Christophe Leroy wrote:
>> The page containing VDSO time data is swapped with the one containing
>> TIME namespace data when a process uses a non-root time namespace.
>> For other data like powerpc specific data and RNG data, it means
>> tracking whether time namespace is the root one or not to know which
>> page to use.
>>
>> Simplify the logic behind by moving time data out of first data page
>> so that the first data page which contains everything else always
>> remains the first page. Time data is in the second or third page
>> depending on selected time namespace.
>>
>> While we are playing with get_datapage macro, directly take into
>> account the data offset inside the macro instead of adding that offset
>> afterwards.
> 
> FYI
> 
> I am currently working on a series to unify the storage of the
> VDSO data for most architectures, including powerpc.
> This will also include a dedicated rng data page.
> 
> That generic infrastructure would replace the need for Patch 1.
> Obviously, if your series gets applied, I can adapt mine for that.
> 
> If you are about to also modify other architectures in a similar way,
> we may want to coordinate.
> 

I'm not going to do anything on other architectures.

Indeed my patch is an outcome of the discussion at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu/

I'm all fine if you are doing something generic for all architectures. 
For powerpc will it handle the entire non-time data, not only rng ? The 
purpose being to revert 
https://github.com/torvalds/linux/commit/c73049389e58c01e2e3bbfae900c8daeee177191

Christophe


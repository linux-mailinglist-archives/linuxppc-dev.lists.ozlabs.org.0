Return-Path: <linuxppc-dev+bounces-8544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6EAB5C2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 20:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxlCC295zz2yg0;
	Wed, 14 May 2025 04:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747160439;
	cv=none; b=d/60DPeSWRL686ehR4Gip+TVhizJZV7Hj63hd1aj7abBFZs6HSec4sdtS3XpbN3R/Jzk3xWQOrGxh6vqT4v6jItcTJjLnpG0ZOpK9Yu3XrsydU0SHKgd4aWaba/nbCFcyuiNpc81GLgwfbKfsTL4AYuqQWpD1W47OZjOkgamxbyObS9xhepS9WDRQzMoVdX3rLQdBCge/u9sKXdprCnOh1WzQIXc+2PTBJf3mxn/2gL1v8apIHPC5jqeei4ajFSV0b9zWK5VgpduWhSqixqWsPsKUsOv+Anf7F7ej8qJt3dRl/XO0ZYe5bDqUVo4Xs+jtyOn8RX2BfgqT5aP0hy0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747160439; c=relaxed/relaxed;
	bh=LeSsgpJbTjsACVNwwA/DT93hXwDzYlf4n6Wt+mPsSHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZ+TFpf1c7vLrF6v7JcSaRQ6weu7979nhaBj/xUqjaO1ac/e2kS+hZoDdYaLqeyCS3WPidTEliW5p1JuaeRTB8BCZT2TRDX1NPwR2L/q0LxgTsq4Ec6JPDfnaz8HJw0yOL/wcDHGKFMdczAzi4oFkzrR2rfCnQSdseqP1T1w7f/9YF79Hvh/07trlLQZScuAOL0gZeVR1l96UgCKLk4A4565FIpkDlr2psKVt/SHFKveZDla3zq+1y0AYDTmMjOY3SmnaHH1UQSKy6xOcuyZaNSeLW1oomn9ZDKkMhiw+iPQyZqrZ9nYr0C/xCb/fEADmi1prnOqe/69CWoYKina/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxlCB2vS8z2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 04:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZxkVJ4CxBz9sB6;
	Tue, 13 May 2025 19:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_pXDJnk3gqN; Tue, 13 May 2025 19:48:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZxkVJ39wtz9s9J;
	Tue, 13 May 2025 19:48:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 61B228B765;
	Tue, 13 May 2025 19:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mu0GiejjUCCv; Tue, 13 May 2025 19:48:40 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A6598B763;
	Tue, 13 May 2025 19:48:39 +0200 (CEST)
Message-ID: <922be2ed-aed2-4c55-b7b0-37abfc745500@csgroup.eu>
Date: Tue, 13 May 2025 19:48:38 +0200
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
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
 <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
 <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/05/2025 à 16:10, Thorsten Blum a écrit :
> On 7. Jan 2025, at 13:16, Thorsten Blum wrote:
>> On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
>>> Isn't our file just a copy of the one from binutils ? Shouldn't we adjust it based on commit https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fbminor%2Fbinutils-gdb%2Fcommit%2F2ce18a16268a&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cab93fab4ad1e43fbaaee08dd9227edf0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638827422381661999%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pYe0b3WZhhmX3IHNh58Ogf%2BFMLYsdA7zn93%2B74D%2F%2FsA%3D&reserved=0 ?
>>
>> It looks like it's a copy and the name is spelled the same as in my patch:
>>
>>   "Mimi Phuong-Thao Vo"
>>
>> What's missing to get this merged?
> 
> Does it make sense to resubmit this or do we leave the name and the
> FIXME as is?

Thanks for the ping, your patch is not lost, it is still here: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20241110162139.5179-2-thorsten.blum@linux.dev/

Maddy, what do you think about the way forward ?

Thanks
Christophe


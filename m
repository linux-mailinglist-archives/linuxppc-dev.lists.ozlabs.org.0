Return-Path: <linuxppc-dev+bounces-11540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668BB3CA20
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 12:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDWP11f5xz2yN2;
	Sat, 30 Aug 2025 20:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756549237;
	cv=none; b=kxJKoIwF7EzQxCGSSBTeK41lNZMaJqMyVNGpGTbznpZ645Oee84vt/bO3DXhOAdUM5wXh9NUKGaehrIMf03k/piORAUu8hbsdIaHfrIBK/Uk9VEzROVro5uWXGLNaNpBqPfBsfuT+/dp/EGTAiZZ13fpEJVrTlnhCTXS9N5hzEjnI6jIoDP+CEG/lIlUu82IXYZ9TJIdoNNb7qKj5+WxB81gCTHqFH+oMfi5wPcBZVpNO4aI11HYDGzisKl+ZFoCeSTpa4EjNGNH5mv/vyIHpkLC33XyY+VXyVfEOtqnRKnipxNCKa3NFiVjErFmHvAbkkHvr/IPP38KbMEh+1RXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756549237; c=relaxed/relaxed;
	bh=Sg4DUdO8k1wuWRXs3zz42R4Sjc4H3rGWBIo4Cx8iTb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErF0kAqBd79lSSoF2EFkeOGMZgwWfIBr8lZI0naI0jf6zYg9tpHf/FCGunKoUy461785JwSm3Av+SDPumUtHWDWNCDxvCbVC12vIKNB+fa25/Z0v4DDJ+mafaeVow0zXYuQUb3hs7CWQtnwS0CT4Z8Xrs4ML7FA3bYJ6UcEeFCwxZNJgEyJClRvLCcL9n3L5Fvs/y2BvMtEje5VxnGmbkq9XFCNJessRcii14g2G3Ddz+w6zcxIDKg2lQRrn2ucJPwKiVEQDkiiQlZSvyEAor0bweXfwWSkHT3X4HcOszNBPcR+RUAnXAVNUZ7KuAVA+mfwGjHf50Dls69Ns3UAtwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDWP040y8z2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 20:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cDQQb63LTz9sSN;
	Sat, 30 Aug 2025 08:36:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1omiCCaRbP8; Sat, 30 Aug 2025 08:36:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cDQQb5BNGz9sSL;
	Sat, 30 Aug 2025 08:36:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9ED5C8B778;
	Sat, 30 Aug 2025 08:36:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HvuU5xK1e8Gy; Sat, 30 Aug 2025 08:36:39 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2779F8B776;
	Sat, 30 Aug 2025 08:36:39 +0200 (CEST)
Message-ID: <e1222528-911d-4558-b483-bceed8a99f2b@csgroup.eu>
Date: Sat, 30 Aug 2025 08:36:38 +0200
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
Subject: Re: [RFC 6/8] powerpc/book3s64/slb: Make preload_add return type as
 void
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.ibm.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
 <90acc8e1de6e9575f31f41182077571e7c34a794.1756522067.git.ritesh.list@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <90acc8e1de6e9575f31f41182077571e7c34a794.1756522067.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/08/2025 à 05:51, Ritesh Harjani (IBM) a écrit :
> We dropped preload_new_slb_context() in the previous patch. That means

slb_setup_new_exec() was also checking preload_add() returned value but 
is also gone.

> we don't really need preload_add() return type anymore. So let's make
> it's return type to void.

s/it's/its

> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Donet Tom <donettom@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/mm/book3s64/slb.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index 7e053c561a09..780792b9a1e5 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -294,7 +294,7 @@ static bool preload_hit(struct thread_info *ti, unsigned long esid)
>   	return false;
>   }
> 
> -static bool preload_add(struct thread_info *ti, unsigned long ea)
> +static void preload_add(struct thread_info *ti, unsigned long ea)
>   {
>   	unsigned char idx;
>   	unsigned long esid;
> @@ -308,7 +308,7 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
>   	esid = ea >> SID_SHIFT;
> 
>   	if (preload_hit(ti, esid))
> -		return false;
> +		return;
> 
>   	idx = (ti->slb_preload_tail + ti->slb_preload_nr) % SLB_PRELOAD_NR;
>   	ti->slb_preload_esid[idx] = esid;
> @@ -317,7 +317,7 @@ static bool preload_add(struct thread_info *ti, unsigned long ea)
>   	else
>   		ti->slb_preload_nr++;
> 
> -	return true;
> +	return;

You don't need a valueless return at the end of a function

>   }
> 
>   static void preload_age(struct thread_info *ti)
> --
> 2.50.1
> 



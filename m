Return-Path: <linuxppc-dev+bounces-8716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736FABCEC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 07:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1kDY73Pcz2yZZ;
	Tue, 20 May 2025 15:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747720237;
	cv=none; b=nLuo9dmgKqYlYW2dAs5oGtl8kSha2lVP2avSNNdazEBQ5W9JIXaIUji85MRGrHP7AnqUGfskjV5pndKlRnRWZS4fPQBr4+bLe3gxyhINZ3t1nYFeUCNHgWW+8VCy7cCG7G7h+8nVxeqkiAxs6kVZtXdIUJQ1bZhNATs70AEa41KBlX6HMHgCBHD/LtBPZnDsrud4iC6T5Lu5Msa22Eqwa1vTvn8+c3G+8APaG6MLYAQnR6URCMbGpIkeU/gAql2sg6Uph7kdJvafZkiGC2CmFJ01aJtkmsLtlgW2Bm1213Rlz6g5tnABbd7no+CYBz7BrWINGC+9y1YFh+HiZ3Z4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747720237; c=relaxed/relaxed;
	bh=3N9YU6U8YgFq0z9oORCf0wa/s20KeT/2rT9w5dLBVFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1yt4t6VTO/jXMNgi4HWQOSvk8d3VnDci0RJk46xNRJbKXpqphcj/LhOHQ6NJuTKMJMS3eKR9fnIMvUyxljpts8HwjZrNLXQ8u6hfsvKPS1Iu7Xm0TPAL8mp/T4rMBL4/3SG26h27TqBlZmuFRbwXmCAg7N7/3X4OKhcwjADKb69+U+goJvHqh2TnGBXQsR847ZwDFxdTIZZ6EKWxeEkNsINDHKnSPcWdY7Z0QBTqcaPfMo7L362/VJUm6c2Wwt4mtwJH0zibjSBtax2Od0+QPzuMxfw7TjjnsDOKVqLEBaXlrr4OcP2kX3RoPYT2gw74nbR+0P19qnDvxRHwrBHlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1kDX0xWzz2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 15:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b1jVC1shBz9sWb;
	Tue, 20 May 2025 07:17:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBxSY6Tt1GUC; Tue, 20 May 2025 07:17:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b1jVC0pHqz9sVS;
	Tue, 20 May 2025 07:17:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A9598B765;
	Tue, 20 May 2025 07:17:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6gA5yYbrJAGp; Tue, 20 May 2025 07:17:22 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 71E518B763;
	Tue, 20 May 2025 07:17:22 +0200 (CEST)
Message-ID: <633eb665-d1d4-4433-b81f-8ff831cf795c@csgroup.eu>
Date: Tue, 20 May 2025 07:17:22 +0200
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
Subject: Re: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, naveen@kernel.org, dtsen@linux.ibm.com,
 segher@kernel.crashing.org, stable@vger.kernel.org
References: <20250514051847.193996-1-ebiggers@kernel.org>
 <aCRlU0J7QoSJs5sy@gondor.apana.org.au> <20250514162933.GB1236@sol>
 <aCVNG2lm9x9dzu6x@gondor.apana.org.au>
 <02c22854-eebf-4ad1-b89e-8c2b65ab8236@csgroup.eu>
 <aCvp1rzh2vV9L4g_@gondor.apana.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <aCvp1rzh2vV9L4g_@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/05/2025 à 04:32, Herbert Xu a écrit :
> On Mon, May 19, 2025 at 03:55:16PM +0200, Christophe Leroy wrote:
>>
>> As far as I can see related patches found in linux-next tree were not sent
>> to linuxppc-dev@lists.ozlabs.org.
> 
> I just checked and it was definitely sent to linuxppc-dev:

Oops sorry, my mistake.

I see them in patchwork, they still have status 'New'.

> 
> Cc: oe-kbuild-all@lists.linux.dev, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
> 
>> Could you resend them, and split out the introduction of
>> CONFIG_ARCH_SUPPORTS_INT128 from other parts of patch "crypto:
>> powerpc/poly1305 - Add SIMD fallback" and add the lib/tishift.S in the patch
>> which adds CONFIG_ARCH_SUPPORTS_INT128 ?
> 
> I'll just revert them and mark powerpc/poly1305 as broken.  You
> guys can sort it out later.

Fine, lets do that and make sure all necessary bits are there when 
enabling CONFIG_ARCH_SUPPORTS_INT128

Thanks
Christophe


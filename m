Return-Path: <linuxppc-dev+bounces-8669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B443ABC06F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 16:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1KbX6pk0z2yfS;
	Tue, 20 May 2025 00:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747664440;
	cv=none; b=Z/7KKKW8JpekblP5XCAPw/c+XSr78wr/IUvbh/zr27gpuI46t3G7yKeJ2VUTh5uf2HWeGsdU+KPfp5xHI2xy1UkOcxmlVZV3Gl7ffHOhIwzDOL4Q9CgB78jtRwUiu4U6/ryMl1kNY1fNpjaAxQNY9VpfAdNZL32kP0p48H6E3edtLIgFjc72HueasVrg7aveSTLqFFWJ6OCIpMJZHog9iojuQmlS1txJ9/qD4lMPU6JJHpaBs6cKcvkpa3Ks9eA+QEHkKsjupeTDZt71LBiPYvWA88yVZ8czCd3Q65AQp5KQznwzsn0uYophwNZ6U49nsK9sWpUYowR8h/lG+e2IHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747664440; c=relaxed/relaxed;
	bh=I2gkJANvUUeDyCB17O4p3bg7D+d2nWQ1tOoP2UY/rmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSj+qqwHKOSGIsr1b+o+DJfeISNC8GB5K//SstXuoKCn4b4sBCm51qEUcWDJ7t+Kd78GUpoVn4/Kxy3Dmm93BfDvAVR3CH7NSnprzBTWsU48u24WACQq1jtjzL5tvai63xHqtscnlrJHFLzUgj0OOCs2NBO0aeaoAhFqFNX6HCy28AZGk5NOy6IOp6XMdy5gG9NThEPNb3z1e/Zje8CJeKXrrG06jPlCuA8itUtppEst5+vTyeVp1a/VyvIkbdI35gPWX36+UwIlysOuyGNfmNxjjSOTrNIj6OD9TzsItsL+N/ZSbiJfBqtLsdlPr7H4/DPKuQTFuuKfdhnv5QepMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1KbX1HVyz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 00:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b1K2Z0j89z9sgR;
	Mon, 19 May 2025 15:55:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1tLa2scvF_G; Mon, 19 May 2025 15:55:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b1K2F3Z3xz9sl0;
	Mon, 19 May 2025 15:55:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 74BA68B767;
	Mon, 19 May 2025 15:55:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ERUmtIadJGXE; Mon, 19 May 2025 15:55:17 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AA9E88B763;
	Mon, 19 May 2025 15:55:16 +0200 (CEST)
Message-ID: <02c22854-eebf-4ad1-b89e-8c2b65ab8236@csgroup.eu>
Date: Mon, 19 May 2025 15:55:16 +0200
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
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 naveen@kernel.org, dtsen@linux.ibm.com, segher@kernel.crashing.org,
 stable@vger.kernel.org
References: <20250514051847.193996-1-ebiggers@kernel.org>
 <aCRlU0J7QoSJs5sy@gondor.apana.org.au> <20250514162933.GB1236@sol>
 <aCVNG2lm9x9dzu6x@gondor.apana.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <aCVNG2lm9x9dzu6x@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 15/05/2025 à 04:10, Herbert Xu a écrit :
> On Wed, May 14, 2025 at 09:29:33AM -0700, Eric Biggers wrote:
>>
>> I didn't notice that.  Probably, though I don't have time to review this subtle
>> Poly1305 code.  Especially with all the weird unions in the code.  Would be
>> great if the PowerPC folks would take a look.
> 
> Of course more reviews would be great and I think they're all on
> the cc list.
> 
> I did test this by manually forcing the conversion, which is how
> I discovered that powerpc wasn't even using donna64.
> 

As far as I can see related patches found in linux-next tree were not 
sent to linuxppc-dev@lists.ozlabs.org.

Could you resend them, and split out the introduction of 
CONFIG_ARCH_SUPPORTS_INT128 from other parts of patch "crypto: 
powerpc/poly1305 - Add SIMD fallback" and add the lib/tishift.S in the 
patch which adds CONFIG_ARCH_SUPPORTS_INT128 ?

Thanks
Christophe


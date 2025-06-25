Return-Path: <linuxppc-dev+bounces-9735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FACAE8284
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 14:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS19z70kzz307K;
	Wed, 25 Jun 2025 22:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750854039;
	cv=none; b=ABkF8ajbcuQ6TDo1jXcYIwN/9b1TGqkxPB0b8CSY7/eZ0eRomHA7WIkCbF8/zz7JhcREChWbyTt0xDjCq7siHl3gFd5+RVQopAPNy9LsjP5TEvxZngZds9BcvMjc/OTjuHqoRmGNG9IDIt8VidZoEOzmBLKaH7ftxt7vMWgRryxYZVxg0Yq8sRFfB6awOguDyPtfpIdq2WDN+k+EE/Jx9SNCt+LpKNPKWOJr2mBKehzSgOirBVC6yfrKBOw1oKTZ06Oz91gsXZ7wDv3MmdmWy/XrSwpJe9ZCBfPmwsIlL5+n+95flc0XZaLjatJYA3OTKuP87P7maSmPV8/ijEEpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750854039; c=relaxed/relaxed;
	bh=3a4sekYOIoKPTcsxrLRc+zk+wxz53oyg/zv9+AP4v48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfnVhvW0goW3wMkeWTXCX2HguULfHrTqGd33RcepdDDJn5an4TIONgbrWeAQOo94xxBSzFJVslXFSH4jcTzgUeqg1HqPD8fhjqbWfLTGFn1qs4K6nm00hqwP0aXTRTstKnuBkAzIDeuy0OxKK5ytsJyrLxVOFIiLeg7oPgzOx+EhYB2rycSbR8Qa9SuwnpUCPWGhnCGkLOeBdH/0LAL4pfEh/mDesAGkLp+FrQdmpCuLUg8StpBPFNYq6N4jSAhOcm2qQMKfQJ1oJ/KMe9u9j+eyuSLW+ZTT/ZSrY9mLbHaI2mZzVIOxqwA2t5OA8mPoSmX+iH5MkyoDuGr10q0pBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS19z1rYmz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 22:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bRys55D17z9vDH;
	Wed, 25 Jun 2025 12:35:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-qPa8r-zWGB; Wed, 25 Jun 2025 12:35:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bRys54JGWz9vDF;
	Wed, 25 Jun 2025 12:35:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 87F7D8B7B7;
	Wed, 25 Jun 2025 12:35:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Tp4ps0JWzqlx; Wed, 25 Jun 2025 12:35:53 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 942C38B7A7;
	Wed, 25 Jun 2025 12:35:51 +0200 (CEST)
Message-ID: <db30beb6-a331-46b7-92a3-1ee7782e317a@csgroup.eu>
Date: Wed, 25 Jun 2025 12:35:51 +0200
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
Subject: Re: [PATCH 1/9] kasan: unify static kasan_flag_enabled across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
 akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com, geert@linux-m68k.org, rppt@kernel.org,
 tiwei.btw@antgroup.com, richard.weiyang@gmail.com, benjamin.berg@intel.com,
 kevin.brodsky@arm.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250625095224.118679-1-snovitoll@gmail.com>
 <20250625095224.118679-2-snovitoll@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250625095224.118679-2-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 25/06/2025 à 11:52, Sabyrzhan Tasbolatov a écrit :
> Historically the fast-path static key `kasan_flag_enabled` existed
> only for `CONFIG_KASAN_HW_TAGS`. Generic and SW_TAGS either relied on
> `kasan_arch_is_ready()` or evaluated KASAN checks unconditionally.
> As a result every architecture had to toggle a private flag
> in its `kasan_init()`.
> 
> This patch turns the flag into a single global runtime predicate that
> is built for every `CONFIG_KASAN` mode and adds a helper that flips
> the key once KASAN is ready.

Shouldn't kasan_init_generic() also perform the following line to reduce 
even more code duplication between architectures ?

	init_task.kasan_depth = 0;

Christophe



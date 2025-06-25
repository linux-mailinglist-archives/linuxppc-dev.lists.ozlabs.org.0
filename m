Return-Path: <linuxppc-dev+bounces-9761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0AFAE8714
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 16:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS4W26pk8z3bh0;
	Thu, 26 Jun 2025 00:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750863038;
	cv=none; b=iq3+l5esWHABk241FtmutjIzKMgpmjjXbSSZTY3BHnFBNmTdqsOtcAEHUh54yxJVeKX+E3R57/7a31egXmmXQDjo5lFcVfNnkJdSNhc4Rqt+lwCE2LeR7wRm41TsdKKEFf7PYNau3JPI5+Qh6jNaElI7mSp1BsJ+ovELASPAKZLHceevD9nmAgaErUshsUDjYyMxFch9F/4frqHOVHSjHBLMHj8JlwkJDhMm5wIvzv9u+CftQkga+/tAcxwtMZ6IqC4jgR0nYdrlMwU5XUrhJak4UHpn6ScV7aAGaN6aUw/sdkY6csqhBMTtqO/qW4Nfy6jkUfc44xBNrjTjOlxAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750863038; c=relaxed/relaxed;
	bh=GillNPWED+I7+g+LPn4LlQ45F2dOjncNPtfp8jyTpgU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YAaow4j3J2CwkpHvlLy/322W/uu8AfEgCjC8Ul+7bI+Ky0n941HtgkO67GCdLLROzCs8pmz8sJnHRpY5kGoVuKf4QKi6lZDuyQjdmFDFrAYRr0ERagz2+UFs+oYdkoglZlWlIkYe47fOq2wBbCeocNNa3Z2AMZIvrbsLA332za3oSDBHwN9otsV0y1SgbFgCV8o49T5WzeSkxjsbrSeswul2UQcEhCR4DALq1fwpaoJ4akcAdYkE3n5tS6LGIv76mt2Zdno1QtkTxnL90L6hzkoQRUUX4YMouy5qz/K/Voqto20lUhKWuDXSpLqck1FOidr/cjU0wcW9aNADnn0K2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS4W12XXcz306l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 00:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bRyfz3MTKz9vBt;
	Wed, 25 Jun 2025 12:27:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2o-Y-FdKUAQ; Wed, 25 Jun 2025 12:27:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bRyfz2RdKz9vBC;
	Wed, 25 Jun 2025 12:27:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 435058B7B7;
	Wed, 25 Jun 2025 12:27:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vvosXbHhLt2e; Wed, 25 Jun 2025 12:27:07 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BC418B7A7;
	Wed, 25 Jun 2025 12:27:04 +0200 (CEST)
Message-ID: <750b6617-7abf-4adc-b3e6-6194ff10c547@csgroup.eu>
Date: Wed, 25 Jun 2025 12:27:04 +0200
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/9] kasan: replace kasan_arch_is_ready with kasan_enabled
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
 <20250625095224.118679-3-snovitoll@gmail.com>
Content-Language: fr-FR
In-Reply-To: <20250625095224.118679-3-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 25/06/2025 à 11:52, Sabyrzhan Tasbolatov a écrit :
> Replace the existing kasan_arch_is_ready() calls with kasan_enabled().
> Drop checks where the caller is already under kasan_enabled() condition.

If I understand correctly, it means that KASAN won't work anymore 
between patch 2 and 9, because until the arch calls kasan_init_generic() 
kasan_enabled() will return false.

The transition should be smooth and your series should remain bisectable.

Or am I missing something ?

Christophe



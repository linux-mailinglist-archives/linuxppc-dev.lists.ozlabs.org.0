Return-Path: <linuxppc-dev+bounces-9736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72721AE8285
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 14:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS1B45stYz30LS;
	Wed, 25 Jun 2025 22:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750854044;
	cv=none; b=GVnDWiF9wPa6k57NjiiBtgooB2AfHmkRX4lyNHfTWJCQeMhKVdAwiIj8gtcA11EMJwMsrmcT/Kwo5QQoE12tJ8JITcPcmTL3XlAvl/ugRdg4CY94rmFeacZ67Wg3DRfBG266mZX4uWeFfh8EBn4s58ZqHATHP2iKxTY7xuBTVpQQcc71ndC1qiLDZVXTJYiHzwXGM7tsfCD06Z0zZBSdApGicl5FaZNF3r5uf7jjkY0UUvgd0NFbZ36sxNh+0nH9TAnrApe/52dl4pYmXvtPLZswnXWkCyfDJ57/5u/acLe/P9f4egerYokKX0J7wQVsY71z9RAXE9s3gSreHyF6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750854044; c=relaxed/relaxed;
	bh=aekhGqf6P/O199m3eOaLFTaZxD8oT2lv9cl8d0b7XDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRZiq2OVhRP4vQTn4nzg3Xvy0rVYsAxqczvcMBTLP2GIHDH3AIfGKmxqanZE9ogBpzkYtTjK5kWoWhse55M/vnw/PkSYtBOhMln1gyt+t58QTJN9tL8JrZA4Tw543ziXxp+iO4vr/LFoQ19b5SlwrTEvbh+17seSrLQ5YUmPZO2vIvzgswnxwmRdtBeQomlD/7vnHDkKMbR2O2LQ49Oii2EqNkaFbG+wys6xrLHUsJ+/yeDn4AWR5zuOY6YaUOwJmYwl9gYgEcX8jp8yscm2H56lfCRAC4iyw1yMoHxe4R4Exl73L6m6L4EZV6XhnKPkF+0FWc/5RpeAAb4fbExFig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS1B41Ymlz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 22:20:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bRynq72Rpz9vCc;
	Wed, 25 Jun 2025 12:33:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wkd8VwLop-3S; Wed, 25 Jun 2025 12:33:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bRynq5zBhz9vDF;
	Wed, 25 Jun 2025 12:33:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C1DE58B7B7;
	Wed, 25 Jun 2025 12:33:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3S-OpwLkq4z3; Wed, 25 Jun 2025 12:33:03 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EAC428B7A7;
	Wed, 25 Jun 2025 12:33:01 +0200 (CEST)
Message-ID: <4d568111-9615-4fba-884a-f2ae629776fe@csgroup.eu>
Date: Wed, 25 Jun 2025 12:33:01 +0200
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
Subject: Re: [PATCH 9/9] kasan/powerpc: call kasan_init_generic in kasan_init
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
 <20250625095224.118679-10-snovitoll@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250625095224.118679-10-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 25/06/2025 à 11:52, Sabyrzhan Tasbolatov a écrit :
> Call kasan_init_generic() which enables the static flag
> to mark generic KASAN initialized, otherwise it's an inline stub.
> Also prints the banner from the single place.

What about:

arch/powerpc/mm/kasan/init_32.c:void __init kasan_init(void)
arch/powerpc/mm/kasan/init_book3e_64.c:void __init kasan_init(void)

Christophe



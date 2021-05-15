Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0D381650
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 08:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhwTQ0B0Lz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 16:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhwT03yCWz2xvH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 16:28:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FhwSs2YMvz9sbb;
 Sat, 15 May 2021 08:28:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEapEaUkxjZf; Sat, 15 May 2021 08:28:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FhwSs1YWcz9sbT;
 Sat, 15 May 2021 08:28:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A8538B76E;
 Sat, 15 May 2021 08:28:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TQ3BUIWyNMAO; Sat, 15 May 2021 08:28:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5554B8B765;
 Sat, 15 May 2021 08:28:28 +0200 (CEST)
Subject: Re: [PATCH] arm64: Define only {pud/pmd}_{set/clear}_huge when usefull
To: Andrew Morton <akpm@linux-foundation.org>
References: <73ec95f40cafbbb69bdfb43a7f53876fd845b0ce.1620990479.git.christophe.leroy@csgroup.eu>
 <20210514144200.b49ee77c9b2a7f9998ffbf22@linux-foundation.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ae1be8a1-8412-1288-31d4-23dc2cf4e5e7@csgroup.eu>
Date: Sat, 15 May 2021 08:28:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514144200.b49ee77c9b2a7f9998ffbf22@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, naresh.kamboju@linaro.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/05/2021 à 23:42, Andrew Morton a écrit :
> On Fri, 14 May 2021 11:08:53 +0000 (UTC) Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> When PUD and/or PMD are folded, those functions are useless
>> and we now have a stub in linux/pgtable.h
> 
> OK, help me out here please.  What patch does this fix?
> 

Both this one and the x86 one from the day before fix 1cff41494b15cd82c1ec418bb5c ("mm/pgtable: add 
stubs for {pmd/pub}_{set/clear}_huge")

I think both the x86 fix and the arm64 fix should be squashed into that patch at the end.

I checked, the only other architecture involving pud_set_huge() and friends is powerpc, and powerpc 
doesn't have this problem as it only defined those for book3s/64 platforms which have 4 level page 
tables by definition.

Thanks
Christophe

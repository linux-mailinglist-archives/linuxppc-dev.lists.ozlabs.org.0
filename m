Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A145C3C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzhxP4zXBz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:41:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzhww54Txz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:41:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hzhwp35fcz9sSd;
 Wed, 24 Nov 2021 14:40:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJsxtdgyCAiz; Wed, 24 Nov 2021 14:40:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hzhwp2K8rz9sSc;
 Wed, 24 Nov 2021 14:40:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 38BC98B774;
 Wed, 24 Nov 2021 14:40:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WedtkgjjuB1f; Wed, 24 Nov 2021 14:40:58 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F21158B763;
 Wed, 24 Nov 2021 14:40:57 +0100 (CET)
Message-ID: <e1fea487-8014-658d-84cd-ea1d7c89ee08@csgroup.eu>
Date: Wed, 24 Nov 2021 14:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/8] Convert powerpc to default topdown mmap layout
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, alex@ghiti.fr,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
 <1637759994.e3mppl4ly7.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1637759994.e3mppl4ly7.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/11/2021 à 14:21, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of November 22, 2021 6:48 pm:
>> This series converts powerpc to default topdown mmap layout.
>>
>> powerpc provides its own arch_get_unmapped_area() only when
>> slices are needed, which is only for book3s/64. First part of
>> the series moves slices into book3s/64 specific directories
>> and cleans up other subarchitectures.
>>
>> Then a small modification is done to core mm to allow
>> powerpc to still provide its own arch_randomize_brk()
>>
>> Last part converts to default topdown mmap layout.
> 
> A nice series but will clash badly with the CONFIG_HASH_MMU
> series of course. One will have to be rebased if they are
> both to be merged.
> 

No worry, it should be an issue.

If you already forsee that series being merged soon, I can rebase my 
series on top of it just now.

Christophe

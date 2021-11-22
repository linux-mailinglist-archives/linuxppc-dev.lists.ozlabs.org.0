Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05B458DC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 12:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyQW542dfz3c66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 22:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyQVb01xDz2xRp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 22:47:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HyQVT4f10z9sSk;
 Mon, 22 Nov 2021 12:47:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkgrPNJYfsxj; Mon, 22 Nov 2021 12:47:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HyQVT3h2Rz9sSZ;
 Mon, 22 Nov 2021 12:47:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 662C68B774;
 Mon, 22 Nov 2021 12:47:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fbOL2ToGz7tZ; Mon, 22 Nov 2021 12:47:13 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20B3A8B765;
 Mon, 22 Nov 2021 12:47:13 +0100 (CET)
Message-ID: <2dd4a22e-f1a5-683c-2d17-ce726f03f4c5@csgroup.eu>
Date: Mon, 22 Nov 2021 12:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 6/8] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Content-Language: fr-FR
To: Alex Ghiti <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
 <e2209d0f1f3c1b581592bd6c32243402ccfe3dde.1637570556.git.christophe.leroy@csgroup.eu>
 <325663a5-d9a1-a8b8-7f16-c2985c319864@ghiti.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <325663a5-d9a1-a8b8-7f16-c2985c319864@ghiti.fr>
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



Le 22/11/2021 à 12:22, Alex Ghiti a écrit :
> Hi Christophe,
> 
> Le 22/11/2021 à 09:48, Christophe Leroy a écrit :
>> Commit e7142bf5d231 ("arm64, mm: make randomization selected by
>> generic topdown mmap layout") introduced a default version of
>> arch_randomize_brk() provided when
>> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.
>>
>> powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>> but needs to provide its own arch_randomize_brk().
>>
>> In order to allow that, don't make
>> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT select
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE. Instead, ensure that
>> selecting CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
>> selecting CONFIG_ARCH_HAS_ELF_RANDOMIZE has the same effect.
> 
> This feels weird to me since if CONFIG_ARCH_HAS_ELF_RANDOMIZE is used 
> somewhere else at some point, it is not natural to add 
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT: can't we use a __weak 
> function or a new CONFIG_ARCH_HAS_RANDOMIZE_BRK?


Yes I also found things a bit weird.

CONFIG_ARCH_HAS_RANDOMIZE_BRK could be an idea but how different would 
it be from CONFIG_ARCH_HAS_ELF_RANDOMIZE ? In fact I find it weird that 
CONFIG_ARCH_HAS_ELF_RANDOMIZE is selected by 
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and not by the arch itself.

On the other hand CONFIG_ARCH_HAS_ELF_RANDOMIZE also handles 
arch_mmap_rnd() and here we are talking about arch_randomize_brk() only.

In the begining I was thinking about adding a 
CONFIG_ARCH_WANT_DEFAULT_RANDOMIZE_BRK, but it was meaning adding it to 
the few other arches selecting CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT.

So I think I will go for the __weak function option.

Thanks
Christophe

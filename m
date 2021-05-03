Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64337118F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 08:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYXp625NVz3bSx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 16:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYXnH0c8qz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 16:17:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FYXn84YcGz9sTN;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGmplfnQL6Sb; Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FYXn83Sl9z9sTM;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5696A8B776;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CP2hKwLive3m; Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 140408B775;
 Mon,  3 May 2021 08:17:00 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
Date: Mon, 3 May 2021 08:16:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/05/2021 à 17:15, Masahiro Yamada a écrit :
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]
> 
> I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

One point I missed when I saw your patch first time, but I realised during the discussion:

Up to 4.9, GCC was numbered with 3 digits, we had 4.8.0, 4.8.1, ... 4.8.5, 4.9.0, 4.9.1, .... 4.9.4

Then starting at 5, GCC switched to a 2 digits scheme, with 5.0, 5.1, 5.2, ... 5.5

So, that is not GCC 5.1 or 5.2 that you should target, but only GCC 5.
Then it is up to the user to use the latest available version of GCC 5, which is 5.5 at the time 
begin, just like the user would have selected 4.9.4 when 4.9 was the minimum GCC version.

Christophe

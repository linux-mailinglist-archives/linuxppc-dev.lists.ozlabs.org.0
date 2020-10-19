Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB52923FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 10:56:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF9c02D5qzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 19:56:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF9Yz2B9VzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 19:54:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CF9Yf5vBYz9v07J;
 Mon, 19 Oct 2020 10:54:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fbqZzeGnX00j; Mon, 19 Oct 2020 10:54:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CF9Yf4fxFz9v07C;
 Mon, 19 Oct 2020 10:54:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4EF68B75E;
 Mon, 19 Oct 2020 10:54:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ACvILMQBGHbJ; Mon, 19 Oct 2020 10:54:51 +0200 (CEST)
Received: from [10.25.210.27] (po15451.idsi0.si.c-s.fr [10.25.210.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D3578B797;
 Mon, 19 Oct 2020 10:54:51 +0200 (CEST)
Subject: Re: [PATCH] asm-generic: Force inlining of get_order() to work around
 gcc10 poor decision
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <96c6172d619c51acc5c1c4884b80785c59af4102.1602949927.git.christophe.leroy@csgroup.eu>
 <CACPK8XfgK0Bj3sLjKCi80jS6vK34FN5BTkU8FvBGcMR=RQn4Xw@mail.gmail.com>
 <0bd0afae-f043-2811-944b-c94d90e231d2@csgroup.eu>
 <20201019083225.GN2672@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <188e00e1-ae41-693e-1d05-f8d87e7ee696@csgroup.eu>
Date: Mon, 19 Oct 2020 10:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201019083225.GN2672@gate.crashing.org>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/10/2020 à 10:32, Segher Boessenkool a écrit :
> On Mon, Oct 19, 2020 at 07:50:41AM +0200, Christophe Leroy wrote:
>> Le 19/10/2020 à 06:55, Joel Stanley a écrit :
>>>> In the old days, marking a function 'static inline' was forcing
>>>> GCC to inline, but since commit ac7c3e4ff401 ("compiler: enable
>>>> CONFIG_OPTIMIZE_INLINING forcibly") GCC may decide to not inline
>>>> a function.
>>>>
>>>> It looks like GCC 10 is taking poor decisions on this.
> 
>>> 1952 bytes smaller with your patch applied. Did you raise this with
>>> anyone from GCC?
>>
>> Yes I did, see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97445
>>
>> For the time being, it's at a standstill.
> 
> The kernel should just use __always_inline if that is what it *wants*;
> that is true here most likely.  GCC could perhaps improve its heuristics
> so that it no longer thinks these functions are often too big for
> inlining (they *are* pretty big, but not after basic optimisations with
> constant integer arguments).
> 

Yes I guess __always_inline is to be added on functions like this defined in headers for exactly 
that, and that's the purpose of this patch.

However I find it odd that get_order() is outlined by GCC even in some object files that don't use 
it at all, for instance in fs/pipe.o

Christophe

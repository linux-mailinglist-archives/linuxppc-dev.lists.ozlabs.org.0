Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B04458ED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 13:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyS4n6vVNz301g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 23:58:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 5712 seconds by postgrey-1.36 at boromir;
 Mon, 22 Nov 2021 23:58:08 AEDT
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyS4J232cz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 23:58:06 +1100 (AEDT)
Received: (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F15E724001C;
 Mon, 22 Nov 2021 12:57:56 +0000 (UTC)
Message-ID: <eb070ba0-2131-cc4e-4742-ec20c13d72ef@ghiti.fr>
Date: Mon, 22 Nov 2021 13:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 6/8] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
 <e2209d0f1f3c1b581592bd6c32243402ccfe3dde.1637570556.git.christophe.leroy@csgroup.eu>
 <325663a5-d9a1-a8b8-7f16-c2985c319864@ghiti.fr>
 <2dd4a22e-f1a5-683c-2d17-ce726f03f4c5@csgroup.eu>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <2dd4a22e-f1a5-683c-2d17-ce726f03f4c5@csgroup.eu>
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

On 11/22/21 12:47, Christophe Leroy wrote:
>
>
> Le 22/11/2021 à 12:22, Alex Ghiti a écrit :
>> Hi Christophe,
>>
>> Le 22/11/2021 à 09:48, Christophe Leroy a écrit :
>>> Commit e7142bf5d231 ("arm64, mm: make randomization selected by
>>> generic topdown mmap layout") introduced a default version of
>>> arch_randomize_brk() provided when
>>> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.
>>>
>>> powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>>> but needs to provide its own arch_randomize_brk().
>>>
>>> In order to allow that, don't make
>>> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT select
>>> CONFIG_ARCH_HAS_ELF_RANDOMIZE. Instead, ensure that
>>> selecting CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
>>> selecting CONFIG_ARCH_HAS_ELF_RANDOMIZE has the same effect.
>>
>> This feels weird to me since if CONFIG_ARCH_HAS_ELF_RANDOMIZE is used 
>> somewhere else at some point, it is not natural to add 
>> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT: can't we use a __weak 
>> function or a new CONFIG_ARCH_HAS_RANDOMIZE_BRK?
>
>
> Yes I also found things a bit weird.
>
> CONFIG_ARCH_HAS_RANDOMIZE_BRK could be an idea but how different would 
> it be from CONFIG_ARCH_HAS_ELF_RANDOMIZE ? In fact I find it weird 
> that CONFIG_ARCH_HAS_ELF_RANDOMIZE is selected by 
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and not by the arch itself.


IIRC, this was a request from Kees Cook who wanted to enforce this 
security measure.


>
> On the other hand CONFIG_ARCH_HAS_ELF_RANDOMIZE also handles 
> arch_mmap_rnd() and here we are talking about arch_randomize_brk() only.
>
> In the begining I was thinking about adding a 
> CONFIG_ARCH_WANT_DEFAULT_RANDOMIZE_BRK, but it was meaning adding it 
> to the few other arches selecting 
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT.
>
> So I think I will go for the __weak function option.


Ok, thanks.

Alex


>
> Thanks
> Christophe

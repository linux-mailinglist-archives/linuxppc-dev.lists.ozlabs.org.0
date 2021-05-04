Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82843725DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 08:33:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ96D37hLz30Gc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 16:33:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ95s5jM2z2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 16:33:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZ95j6mwJz9sVX;
 Tue,  4 May 2021 08:33:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGDPogYyxA6u; Tue,  4 May 2021 08:33:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZ95j5hZJz9sVW;
 Tue,  4 May 2021 08:33:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8088B8B78D;
 Tue,  4 May 2021 08:33:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id keUR0x4FyadH; Tue,  4 May 2021 08:33:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C34068B763;
 Tue,  4 May 2021 08:33:27 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
 <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6615493a-252c-ee40-a9fa-27cf5ad8922b@csgroup.eu>
Date: Tue, 4 May 2021 08:33:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/05/2021 à 07:30, Alexander Dahl a écrit :
> Hello Arnd,
> 
> Am Mon, May 03, 2021 at 11:25:21AM +0200 schrieb Arnd Bergmann:
>> On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
>>>
>>> Desktops and servers are all nice, however I just want to make you
>>> aware, there are embedded users forced to stick to older cross
>>> toolchains for different reasons as well, e.g. in industrial
>>> environment. :-)
>>>
>>> This is no show stopper for us, I just wanted to let you be aware.
>>
>> Can you be more specific about what scenarios you are thinking of,
>> what the motivations are for using an old compiler with a new kernel
>> on embedded systems, and what you think a realistic maximum
>> time would be between compiler updates?
> 
> One reason might be certification. For certain industrial applications
> like support for complex field bus protocols, you need to get your
> devices tested by an external partner running extensive test suites.
> This is time consuming and expensive.
> 
> Changing the toolchain of your system then, would be a massive change
> which would require recertification, while you could argue just
> updating a single component like the kernel and building everything
> again, does not require the whole testing process again.

Not sure to follow you.

Our company provides systems for Air Trafic Control, so we have the same kind of assurance quality 
process, but then I can't understand why you would need to upgrade your kernel at all.

Today our system is based on GCC 5 and Kernel 4.14. At the time being we are using GCC 5.5 (Latest 
GCC 5) and kernel 4.14.232 (Latest 4.14.y). Kernel 4.14 is maintained until 2024.

The day we do an upgrade, we upgrade everything including the tool chain then we go for another 6 
years without major changes/re-qualification, because we can't afford a new qualitication every now 
and then.


So really, I can't see your approach.

Christophe

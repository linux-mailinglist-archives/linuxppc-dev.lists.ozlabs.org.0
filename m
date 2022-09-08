Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B8A5B1497
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 08:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNTbH43pcz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 16:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNTZs62pkz2xJS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 16:23:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MNTZk44fPz9shS;
	Thu,  8 Sep 2022 08:23:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHoH0HldHIAZ; Thu,  8 Sep 2022 08:23:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MNTZk2zXtz9sfJ;
	Thu,  8 Sep 2022 08:23:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 510528B78B;
	Thu,  8 Sep 2022 08:23:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jdKROmnRdIVA; Thu,  8 Sep 2022 08:23:10 +0200 (CEST)
Received: from [192.168.232.247] (unknown [192.168.232.247])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B26C98B763;
	Thu,  8 Sep 2022 08:23:09 +0200 (CEST)
Message-ID: <f60e0a73-f608-b25c-358e-f4dcb09d8923@csgroup.eu>
Date: Thu, 8 Sep 2022 08:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
Content-Language: fr-FR
To: Oliver O'Halloran <oohall@gmail.com>, Guenter Roeck <linux@roeck-us.net>
References: <20210716221159.3587039-1-linux@roeck-us.net>
 <20210717175750.Horde.TLZWyADKWFGAyFWIYtmglA2@messagerie.c-s.fr>
 <20210717162359.GA3130272@roeck-us.net>
 <CAOSf1CGxp2xuEgR=Fb2AL+Ra5owqdN5=MtK6o_MCYqp=+P9arw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAOSf1CGxp2xuEgR=Fb2AL+Ra5owqdN5=MtK6o_MCYqp=+P9arw@mail.gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

Le 18/07/2021 à 18:09, Oliver O'Halloran a écrit :
> On Sun, Jul 18, 2021 at 2:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sat, Jul 17, 2021 at 05:57:50PM +0200, Christophe Leroy wrote:
>>> Guenter Roeck <linux@roeck-us.net> a écrit :
>>>
>>>> This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
>>>> discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
>>>> static").
>>>>
>>>> Running the upstream kernel on Qemu's brand new "pegasos2" emulation
>>>> results in a variety of backtraces such as
>>>>
>>>> Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
>>>> ------------[ cut here ]------------
>>>> Bug: Write fault blocked by KUAP!
>>>> WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230
>>>> do_page_fault+0x4f4/0x920
>>>> CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
>>>> NIP:  c0021824 LR: c0021824 CTR: 00000000
>>>> REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
>>>> MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000
>>>>
>>>> GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60 c1085c58
>>>> 00000000
>>>> GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000 00000000
>>>> 00000004
>>>> GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000 00000001
>>>> 40b14000
>>>> GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1 00000000
>>>> c1085e60
>>>> NIP [c0021824] do_page_fault+0x4f4/0x920
>>>> LR [c0021824] do_page_fault+0x4f4/0x920
>>>> Call Trace:
>>>> [c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
>>>> [c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4
>>>>
>>>> and the system fails to boot. Bisect points to commit 407d418f2fd4
>>>> ("powerpc/chrp: Move PHB discovery"). Reverting this patch together with
>>>> commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
>>>> the problem.
>>>
>>> Isn't there more than that in the backtrace ? If there is a fault blocked by
>>> Kuap, it means there is a fault. It should be visible in the traces.
>>>
>>> Should we fix the problem instead of reverting the commit that made the
>>> problem visible ?
>>>
>>
>> I do not think the patch reverted here made the problem visible. I am
>> quite sure that it introduced it. AFAIS the problem is that the new code
>> initializes and remaps PCI much later, after it is being used.
> 
> Right. The bug is that on 32bit platforms the PHB setup also maps one
> of the PHB's IO space as "ISA IO space" as a side effect. There's a
> handful of platforms (pegasos2 is one) which use an i8259 interrupt
> controller and configuring that requires access to IO / ISA space. The
> KUAP faults we're setting are because isa_io_base is still set to zero
> so outb() and friends are accessing the zero page.
> 
> I don't think there's any real reason why we need to have PCI fully
> set up to handle that situation. A few platforms already have early
> fixup code which parses the DT directly rather than using the fields
> of pci_controller (which are parsed from the DT anyway) and I'm pretty
> sure we can do something similar.
> 
>> Also, the
>> patch introducing the problem was never tested on real hardware (it even
>> says so in the patch comments). That by itself seems to be quite
>> problematic for such an invasive patch, and makes me wonder if some of
>> the other PHB discovery related patches introduced similar problems.
> 
> The legacy platforms are maintained on a best-effort basis. Ellerman's
> CI farm covers most of the powerpc CPU types, but there's no real way
> to test the bulk of the platforms in the tree since most of the
> hardware is currently in landfill.
> 
>> Anyway, I do not use or have that hardware. I was just playing with the
>> latest version of qemu and ended up tracking down why its brand new
>> pegasos2 emulation no longer boots with the latest Linux kernel.
>> I personally don't care too much if ppc/chrp support is broken in the
>> upstream kernel or not. Please take this patch as problem report,
>> and feel free to do with it whatever you like, including ignoring it.
> 
> Problem reports are fine and appreciated. I'd be less cranky if you
> included the kernel config you used in the initial report since I
> wasted an hour of my saturday trying to replicate it with various
> kernel configs that had SMP enabled since that's what the
> chrp_defconfig uses.
> 


What is the status now ? I see this revert patch is still hanging around 
in patchwork, is there still a problem ?

Thanks
Christophe

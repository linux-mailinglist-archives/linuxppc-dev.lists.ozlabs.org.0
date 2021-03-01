Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C83288AA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 18:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq73H3hpnz3cSX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 04:46:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq72y05FNz30Qk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 04:45:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dq72b2Rzsz9txw5;
 Mon,  1 Mar 2021 18:45:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id itzHZIp104h4; Mon,  1 Mar 2021 18:45:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dq72b18Hqz9txw4;
 Mon,  1 Mar 2021 18:45:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB8D8B7A9;
 Mon,  1 Mar 2021 18:45:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YA7oJihd7iq9; Mon,  1 Mar 2021 18:45:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E373F8B7A3;
 Mon,  1 Mar 2021 18:45:31 +0100 (CET)
Subject: Re: [PATCH 0/2] Fix CMDLINE_EXTEND handling for FDT "bootargs"
To: Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Daniel Walker <danielwa@cisco.com>
References: <20210225125921.13147-1-will@kernel.org>
 <CAL_JsqJX=TCCs7=gg486r9TN4NYscMTCLNfqJF9crskKPq-bTg@mail.gmail.com>
 <20210301144153.GA16716@willie-the-truck>
 <CAL_JsqJ11D-7a3pwLTVd+rHjqDGBb=b8OU_a6h3Co-at+2qMtQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bbbf5def-a168-9a4c-1106-b80883dfd389@csgroup.eu>
Date: Mon, 1 Mar 2021 18:45:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ11D-7a3pwLTVd+rHjqDGBb=b8OU_a6h3Co-at+2qMtQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Doug Anderson <dianders@chromium.org>,
 Tyler Hicks <tyhicks@linux.microsoft.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Max Uvarov <muvarov@gmail.com>,
 Android Kernel Team <kernel-team@android.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/03/2021 à 18:26, Rob Herring a écrit :
> +PPC folks and Daniel W
> 
> On Mon, Mar 1, 2021 at 8:42 AM Will Deacon <will@kernel.org> wrote:
>>
>> On Mon, Mar 01, 2021 at 08:19:32AM -0600, Rob Herring wrote:
>>> On Thu, Feb 25, 2021 at 6:59 AM Will Deacon <will@kernel.org> wrote:
>>>> We recently [1] enabled support for CMDLINE_EXTEND on arm64, however
>>>> when I started looking at replacing Android's out-of-tree implementation [2]
>>>
>>> Did anyone go read the common, reworked version of all this I
>>> referenced that supports prepend and append. Here it is again[1].
>>> Maybe I should have been more assertive there and said 'extend' is
>>> ambiguous.
>>
>> I tried reading that, but (a) most of the series is not in the mailing list
>> archives and (b) the patch that _is_ doesn't touch CMDLINE_EXTEND at all.
>> Right now the code in mainline does the opposite of what it's documented to
>> do.
> 
> Actually, there is a newer version I found:
> 
> https://lore.kernel.org/linuxppc-dev/1551469472-53043-1-git-send-email-danielwa@cisco.com/
> https://lore.kernel.org/linuxppc-dev/1551469472-53043-2-git-send-email-danielwa@cisco.com/
> https://lore.kernel.org/linuxppc-dev/1551469472-53043-3-git-send-email-danielwa@cisco.com/

This was seen as too much intrusive into powerpc.

I proposed an alternative at 
https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1554195798.git.christophe.leroy@c-s.fr/ but 
never got any feedback.


> 
> (Once again, there's some weird threading going on)
> 
>>>> with the upstream version, I noticed that the two behave significantly
>>>> differently: Android follows the Kconfig help text of appending the
>>>> bootloader arguments to the kernel command line, whereas upstream appends
>>>> the kernel command line to the bootloader arguments. That is, except for
>>>> the EFI stub, which follows the documented behaviour.
>>>>
>>>> I think the documented behaviour is more useful, so this patch series
>>>> reworks the FDT code to follow that and updates the very recently merged
>>>> arm64 idreg early command-line parsing as well.
>>>
>>> I can just as easily argue that the kernel having the last say makes
>>> sense.
>>
>> Dunno, I'd say that's what CMDLINE_FORCE is for. Plus you'd be arguing
>> against both the documentation and the EFI stub implementation.
> 
> CMDLINE_FORCE is a complete override, not a merging of command lines.
> 
>>> Regardless, I'm pretty sure there's someone out there relying on current
>>> behavior. What is the impact of this change to other arches?
>>
>> On arm64, I doubt it, as Android is the main user of this (where it's been
>> supported for 9 years with the documented behaviour).
>>
>> The other option, then, is reverting CMDLINE_EXTEND from arm64 until this is
>> figured out. I think that's preferable to having divergent behaviour.
>>
>> As for other architectures, I think the ATAGs-based solution on arch/arm/
>> gets it right:
>>
>>    static int __init parse_tag_cmdline(const struct tag *tag)
>>    {
>>    #if defined(CONFIG_CMDLINE_EXTEND)
>>            strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
>>            strlcat(default_command_line, tag->u.cmdline.cmdline,
>>                    COMMAND_LINE_SIZE);
> 
> The question is really whether any arm32 DT based platform depends on
> the current behavior. RiscV could also be relying on current behavior.
> Powerpc also uses the current behavior (and the documentation is also
> wrong there). Changing the behavior in the FDT code means the powerpc
> early PROM code and the FDT code do the opposite.
> 
> Arm32 has had current behaviour for 5 years. Powerpc for 1.5 years and
> Risc-V for 2 years. Then there's MIPS which has its own Kconfig
> symbols for this and is its own kind of mess. Either we assume
> existing users didn't really care about the order or we have to
> support both prepend and append.
> 
>> For now I think we have two options for arm64: either fix the fdt code,
>> or revert CMDLINE_EXTEND until the PREPEND/APPEND series is merged. Which
>> do you prefer?
> 
> Like anything copied across arches, I want someone to look at this
> across all architectures and make this common instead of just copying
> to new arches. The prepend/append series is the closest we've come.
> 
> Rob
> 

Christophe

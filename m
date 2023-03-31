Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4B6D23C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp3ht67fgz3fYv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:13:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp3hP09Smz3fL0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:13:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C21D02F4;
	Fri, 31 Mar 2023 08:13:33 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8D83F6C4;
	Fri, 31 Mar 2023 08:12:37 -0700 (PDT)
Message-ID: <cc3a78b6-b126-226f-b41a-061716aacd15@arm.com>
Date: Fri, 31 Mar 2023 16:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean()
 helper
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
 <df6340c8-6ac2-4459-a9e5-c411020962d6@app.fastmail.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <df6340c8-6ac2-4459-a9e5-c411020962d6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal 
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/03/2023 3:00 pm, Arnd Bergmann wrote:
> On Mon, Mar 27, 2023, at 14:48, Robin Murphy wrote:
>> On 2023-03-27 13:13, Arnd Bergmann wrote:
>>>
>>> [ HELP NEEDED: can anyone confirm that it is a correct assumption
>>>     on arm that a cache-coherent device writing to a page always results
>>>     in it being in a PG_dcache_clean state like on ia64, or can a device
>>>     write directly into the dcache?]
>>
>> In AMBA at least, if a snooping write hits in a cache then the data is
>> most likely going to get routed directly into that cache. If it has
>> write-back write-allocate attributes it could also land in any cache
>> along its normal path to RAM; it wouldn't have to go all the way.
>>
>> Hence all the fun we have where treating a coherent device as
>> non-coherent can still be almost as broken as the other way round :)
> 
> Ok, thanks for the information. I'm still not sure whether this can
> result in the situation where PG_dcache_clean is wrong though.
> 
> Specifically, the question is whether a DMA to a coherent buffer
> can end up in a dirty L1 dcache of one core and require to write
> back the dcache before invalidating the icache for that page.
> 
> On ia64, this is not the case, the optimization here is to
> only flush the icache after a coherent DMA into an executable
> user page, while Arm only does this for noncoherent DMA but not
> coherent DMA.
> 
>  From your explanation it sounds like this might happen,
> even though that would mean that "coherent" DMA is slightly
> less coherent than it is elsewhere.
> 
> To be on the safe side, I'd have to pass a flag into
> arch_dma_mark_clean() about coherency, to let the arm
> implementation still require the extra dcache flush
> for coherent DMA, while ia64 can ignore that flag.

Coherent DMA on Arm is assumed to be inner-shareable, so a coherent DMA 
write should be pretty much equivalent to a coherent write by another 
CPU (or indeed the local CPU itself) - nothing says that it *couldn't* 
dirty a line in a data cache above the level of unification, so in 
general the assumption must be that, yes, if coherent DMA is writing 
data intended to be executable, then it's going to want a Dcache clean 
to PoU and an Icache invalidate to PoU before trying to execute it. By 
comparison, a non-coherent DMA transfer will inherently have to 
invalidate the Dcache all the way to PoC in its dma_unmap, thus cannot 
leave dirty data above the PoU, so only the Icache maintenance is 
required in the executable case.

(FWIW I believe the Armv8 IDC/DIC features can safely be considered 
irrelevant to 32-bit kernels)

I don't know a great deal about IA-64, but it appears to be using its 
PG_arch_1 flag in a subtly different manner to Arm, namely to optimise 
out the *Icache* maintenance. So if anything, it seems IA-64 is the 
weirdo here (who'd have guessed?) where DMA manages to be *more* 
coherent than the CPUs themselves :)

This is all now making me think we need some careful consideration of 
whether the benefits of consolidating code outweigh the confusion of 
conflating multiple different meanings of "clean" together...

Thanks,
Robin.

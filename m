Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484AB52EA1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 12:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Ndt0nJpz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 20:44:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=ash@heyquark.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 25376 seconds by postgrey-1.36 at boromir;
 Fri, 20 May 2022 20:44:26 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4NdQ0bmZz3bjq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 20:44:24 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04FB3E000B;
 Fri, 20 May 2022 10:44:08 +0000 (UTC)
Message-ID: <935b426a-6c64-beb0-907f-8c3f0a089ab7@heyquark.com>
Date: Fri, 20 May 2022 20:44:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 11/12] powerpc: wiiu: don't enforce flat memory
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20220302044406.63401-1-ash@heyquark.com>
 <20220302044406.63401-12-ash@heyquark.com>
 <20220513224353.n56qg5fhstbaqhfz@pali>
 <d84e4d24-f350-80fc-6c31-b7e7f8d429f4@heyquark.com>
 <20220520080454.c3cqodsdbfbkmg56@pali>
From: Ash Logan <ash@heyquark.com>
In-Reply-To: <20220520080454.c3cqodsdbfbkmg56@pali>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/5/22 18:04, Pali Rohár wrote:
> On Friday 20 May 2022 13:41:04 Ash Logan wrote:
>> On 14/5/22 08:43, Pali Rohár wrote:
>>> On Wednesday 02 March 2022 15:44:05 Ash Logan wrote:
>>>> pgtable_32.c:mapin_ram loops over each valid memory range, which means
>>>> non-contiguous memory just works.
>>>
>>> Hello! Does it mean that non-contiguous memory works for any 32-bit
>>> powerpc platform, and not only for wiiu? If yes, should not be
>>> non-contiguous memory support enabled for all 32-bit ppc boards then?
>>
>> Hi! Sorry for my delayed response. As best I can tell, it does indeed
>> Just Work, but I have only been able to test on wiiu which is missing a
>> lot of features other boards have (like PCI) - so it's possible there's
>> still an assumption elsewhere in the kernel that I haven't hit.
>>
>> As best I can tell, the Wii and Wii U are the only 32-bit powerpc boards
>> out there where it's even possible to have non-contiguous memory.
> 
> What is the reason that those two boards are the **only**? Is there some
> specific requirement from bootloader or hardware to "enable"
> non-contiguous memory support?

Not that I know of, I was just saying that I was only aware of those two
boards where the memory map isn't contiguous, and that is the only place
where it has been tested. Evidently you know of another board!

> I'm interested in enabling non-contiguous memory support for P2020-based
> board as it has gaps in its 32-bit memory layout and which could be used
> for RAM mapping when 4GB DDR3 module is plugged in (default is 2GB).

If it's like the Wii or Wii U (some memory at 0, a gap for MMIO or
whatever, then more memory at a higher address) then you should try a
patch along these lines, because barring the unknowns I mentioned before
it should work. At least as far as I'm aware ;)

>>>> Signed-off-by: Ash Logan <ash@heyquark.com>
>>>> ---
>>>>  arch/powerpc/mm/init_32.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
>>>> index 3d690be48e84..59a84629d9a0 100644
>>>> --- a/arch/powerpc/mm/init_32.c
>>>> +++ b/arch/powerpc/mm/init_32.c
>>>> @@ -125,10 +125,10 @@ void __init MMU_init(void)
>>>>  	 * lowmem_end_addr is initialized below.
>>>>  	 */
>>>>  	if (memblock.memory.cnt > 1) {
>>>> -#ifndef CONFIG_WII
>>>> +#if !defined(CONFIG_WII) && !defined(CONFIG_WIIU)
>>>>  		memblock_enforce_memory_limit(memblock.memory.regions[0].size);
>>>>  		pr_warn("Only using first contiguous memory region\n");
>>>> -#else
>>>> +#elif defined(CONFIG_WII)
>>>>  		wii_memory_fixups();
>>>>  #endif
>>>>  	}
>>>> -- 
>>>> 2.35.1
>>>>

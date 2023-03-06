Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D88946ABA02
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 10:36:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVYNr5qLSz3f3h
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVYNG0y2Fz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 20:35:40 +1100 (AEDT)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id D7AAE60017;
	Mon,  6 Mar 2023 09:35:17 +0000 (UTC)
Message-ID: <caaed678-4a5a-70e5-2ee7-cb2c8042afc0@ghiti.fr>
Date: Mon, 6 Mar 2023 10:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
 <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
 <674bc31e-e4ed-988f-820d-54213d83f9c7@ghiti.fr>
 <c500840b-b57d-47f2-a3d9-41465b10ffae@app.fastmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c500840b-b57d-47f2-a3d9-41465b10ffae@app.fastmail.com>
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
Cc: linux-m68k@vger.kernel.org, ysato@users.osdn.me, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.
 berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, gor@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, chris@zankel.net, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/3/23 17:40, Arnd Bergmann wrote:
> On Fri, Mar 3, 2023, at 12:59, Alexandre Ghiti wrote:
>> On 3/2/23 20:50, H. Peter Anvin wrote:
>>> On March 1, 2023 7:17:18 PM PST, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>>>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>>>>>> I assume?
>>>>> Yes, sorry for that. I got distracted while writing and used the wrong
>>>>> branch to look this up.
>>>> Alex: Probably worth adding that to the list in the cover letter as it looks like you were planning on a v4 anyway (which I guess you now have to do, given that I just added the issue to RISC-V).
>>> The only use that is uapi is the *default* length of the command line if the kernel header doesn't include it (in the case of x86, it is in the bzImage header, but that is atchitecture- or even boot format-specific.)
>> Is COMMAND_LINE_SIZE what you call the default length? Does that mean
>> that to you the patchset is wrong?
> On x86, the COMMAND_LINE_SIZE value is already not part of a uapi header,
> but instead (since bzImage format version 2.06) is communicated from
> the kernel to the boot loader, which then knows how much data the
> kernel will read (at most) from the command line.
>
> Most x86 kernels these days are booted using UEFI, which I think has
> no such interface, the firmware just passes the command line and a
> length, but has no way of knowing if the kernel will truncate this.
> I think that is the same as with any other architecture that passes
> the command line through UEFI, DT or ATAGS, all of which use
> length/value pairs.
>
> Russell argued on IRC that this can be considered an ABI since a
> boot loader may use its knowledge of the kernel's command line size
> limit to reject long command lines. On the other hand, I don't
> think that any boot loader actually does, they just trust that it
> fits and don't have a good way of rejecting invalid configuration
> other than truncating and/or warning.
>
> One notable exception I found while looking through is the old
> (pre-ATAGS) parameter structure on Arm, which uses COMMAND_LINE_SIZE
> as part of the structure definition. Apparently this was deprecated
> 22 years ago, so hopefully the remaining riscpc and footbridge
> users have all upgraded their bootloaders.
>
> The only other case I could find that might go wrong is
> m68knommu with a few files copying a COMMAND_LINE_SIZE sized
> buffer from flash into a kernel buffer:
>
> arch/m68k/coldfire/m5206.c:void __init config_BSP(char *commandp, int size)
> arch/m68k/coldfire/m5206.c-{
> arch/m68k/coldfire/m5206.c-#if defined(CONFIG_NETtel)
> arch/m68k/coldfire/m5206.c-     /* Copy command line from FLASH to local buffer... */
> arch/m68k/coldfire/m5206.c-     memcpy(commandp, (char *) 0xf0004000, size);
> arch/m68k/coldfire/m5206.c-     commandp[size-1] = 0;
> arch/m68k/coldfire/m5206.c-#endif /* CONFIG_NETtel */


I see, thanks your thorough explanation: I don't see this m64k issue as 
a blocker (unless Geert disagrees but he already reviewed the m64k 
patches),  so I'll send the v5 now.

Thanks again,

Alex


>
>       Arnd

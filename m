Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3256A96E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 13:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSmk73Hjdz3f7K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 22:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=217.70.183.199; helo=relay9-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSmjW5Ms3z3c65
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 22:59:25 +1100 (AEDT)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 078BCFF807;
	Fri,  3 Mar 2023 11:59:01 +0000 (UTC)
Message-ID: <674bc31e-e4ed-988f-820d-54213d83f9c7@ghiti.fr>
Date: Fri, 3 Mar 2023 12:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 hca@linux.ibm.com
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
 <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
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
Cc: linux-m68k@vger.kernel.org, ysato@users.osdn.me, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, dave.hansen@linux.intel.com, x86@kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, dalias@libc.org, sparclinux@vger.kernel.org, kernel@xen0n.name, Will Deacon <will@kernel.org>, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net, linux-sh@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, geert@linux-m68k.org, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, gor@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>, npiggin@gmail.com, ink@jurassic.park.msu.ru, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, tgl
 x@linutronix.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, svens@linux.ibm.com, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,


On 3/2/23 20:50, H. Peter Anvin wrote:
> On March 1, 2023 7:17:18 PM PST, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux.ibm.com wrote:
>>> On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
>>>> Hi Heiko,
>>>>
>>>> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>>>>> On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
>>>>>> This all came up in the context of increasing COMMAND_LINE_SIZE in the
>>>>>> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>>>>>> maximum length of /proc/cmdline and userspace could staticly rely on
>>>>>> that to be correct.
>>>>>>
>>>>>> Usually I wouldn't mess around with changing this sort of thing, but
>>>>>> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>>>>>> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>>>>>> increasing, but they're from before the UAPI split so I'm not quite sure
>>>>>> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>>>>>> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>>>>>> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>>>>>> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>>>>>> asm-generic/setup.h.").
>>>>>>
>>>>>> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>>>>>> part of the uapi to begin with, and userspace should be able to handle
>>>>>> /proc/cmdline of whatever length it turns out to be.  I don't see any
>>>>>> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>>>>>> search, but that's not really enough to consider it unused on my end.
>>>>>>
>>>>>> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>>>>>> shouldn't be part of uapi, so this now touches all the ports.  I've
>>>>>> tried to split this all out and leave it bisectable, but I haven't
>>>>>> tested it all that aggressively.
>>>>> Just to confirm this assumption a bit more: that's actually the same
>>>>> conclusion that we ended up with when commit 3da0243f906a ("s390: make
>>>>> command line configurable") went upstream.
>> Thanks, I guess I'd missed that one.  At some point I think there was some discussion of making this a Kconfig for everyone, which seems reasonable to me -- our use case for this being extended is syzkaller, but we're sort of just picking a value that's big enough for now and running with it.
>>
>> Probably best to get it out of uapi first, though, as that way at least it's clear that it's not uABI.
>>
>>>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>>>> I assume?
>>> Yes, sorry for that. I got distracted while writing and used the wrong
>>> branch to look this up.
>> Alex: Probably worth adding that to the list in the cover letter as it looks like you were planning on a v4 anyway (which I guess you now have to do, given that I just added the issue to RISC-V).
> The only use that is uapi is the *default* length of the command line if the kernel header doesn't include it (in the case of x86, it is in the bzImage header, but that is atchitecture- or even boot format-specific.)

Is COMMAND_LINE_SIZE what you call the default length? Does that mean 
that to you the patchset is wrong?

Thanks,

Alex



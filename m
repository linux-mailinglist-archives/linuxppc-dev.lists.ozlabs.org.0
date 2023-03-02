Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B316A8037
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 11:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS7852JXMz3f3c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 21:46:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS77V1jJyz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 21:46:13 +1100 (AEDT)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 75C8960014;
	Thu,  2 Mar 2023 10:45:54 +0000 (UTC)
Message-ID: <5712b56e-e2a7-c1d2-081c-bcbecdbeffb5@ghiti.fr>
Date: Thu, 2 Mar 2023 11:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
 <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
 <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xt
 ensa.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/2/23 11:44, Geert Uytterhoeven wrote:
> Hi Alex,
>
> On Thu, Mar 2, 2023 at 11:09 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> On 3/2/23 10:47, Geert Uytterhoeven wrote:
>>> On Thu, Mar 2, 2023 at 10:35 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>>>> This all came up in the context of increasing COMMAND_LINE_SIZE in the
>>>> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>>>> maximum length of /proc/cmdline and userspace could staticly rely on
>>>> that to be correct.
>>>>
>>>> Usually I wouldn't mess around with changing this sort of thing, but
>>>> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>>>> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>>>> increasing, but they're from before the UAPI split so I'm not quite sure
>>>> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>>>> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>>>> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>>>> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>>>> asm-generic/setup.h.").
>>>>
>>>> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>>>> part of the uapi to begin with, and userspace should be able to handle
>>>> /proc/cmdline of whatever length it turns out to be.  I don't see any
>>>> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>>>> search, but that's not really enough to consider it unused on my end.
>>>>
>>>> This issue was already considered in s390 and they reached the same
>>>> conclusion in commit 622021cd6c56 ("s390: make command line
>>>> configurable").
>>>>
>>>> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>>>> shouldn't be part of uapi, so this now touches all the ports.  I've
>>>> tried to split this all out and leave it bisectable, but I haven't
>>>> tested it all that aggressively.
>>>>
>>>> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-alexghiti@rivosinc.com/>:
>>>> * Added RB/AB
>>>> * Added a mention to commit 622021cd6c56 ("s390: make command line
>>>>     configurable") in the cover letter
>>> Thanks for the update!
>>>
>>>    Apparently you forgot to add your own SoB?
>> I do not know, should I? Palmer did all the work, I only fixed 3 minor
>> things
> If you are picking up patches, and submitting them to someone else
> for upstream inclusion, you should add your own SoB.
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L419


Great, thanks for the pointer, I'll do that then!


Thanks again,


Alex


> Gr{oetje,eeting}s,
>
>                          Geert
>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B644A6C7CB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 11:35:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjdrl4s26z3fT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 21:35:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ghiti.fr (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjdrC6XzCz3cFW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 21:34:51 +1100 (AEDT)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 55EDD100004;
	Fri, 24 Mar 2023 10:34:27 +0000 (UTC)
Message-ID: <877d03e1-b00b-7863-6104-21b42bc63711@ghiti.fr>
Date: Fri, 24 Mar 2023 11:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?Q?l?= <bjorn@kernel.org>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com>
 <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us>
 <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, nathan@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

On 3/22/23 19:25, Nick Desaulniers wrote:
> On Fri, Feb 24, 2023 at 7:58 AM Björn Töpel <bjorn@kernel.org> wrote:
>> Alexandre Ghiti <alex@ghiti.fr> writes:
>>
>>> +cc linux-kbuild, llvm, Nathan, Nick
>>>
>>> On 2/15/23 15:36, Alexandre Ghiti wrote:
>>>> From: Alexandre Ghiti <alex@ghiti.fr>
>>>>
>>> I tried a lot of things, but I struggle to understand, does anyone have
>>> any idea? FYI, the same problem happens with LLVM.
> Off the top of my head, no idea.
>
> (Maybe as a follow up to this series, I wonder if pursuing
> ARCH_HAS_RELR for ARCH=riscv is worthwhile?)


IIUC, the goal for using RELR is to reduce the size of a kernel image: 
right now, this is not my priority, but I'll add that to my todo list 
because that may be useful to distros.


>
>> Don't ask me *why*, but adding --emit-relocs to your linker flags solves
>> "the NULL .rela.dyn" both for GCC and LLVM.
>>
>> The downside is that you end up with a bunch of .rela cruft in your
>> vmlinux.
> There was a patch just this week to use $(OBJCOPY) to strip these from
> vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
> https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/


That's nice, that would be an interesting intermediate step until we 
find the issue here as I believe it is important to have the relocations 
in the init section to save memory.

Thanks for your answer Nick, really appreciated,

Alex



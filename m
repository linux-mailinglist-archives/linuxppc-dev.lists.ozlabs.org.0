Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D19B3674DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQYpP4VD0z300K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:38:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLWd276hz3c2N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:10:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQLWV02G6z9vBLd;
 Wed, 21 Apr 2021 15:10:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3N9b8eVAXEqi; Wed, 21 Apr 2021 15:10:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQLWT5ptNz9vBLc;
 Wed, 21 Apr 2021 15:10:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 04BB08B82B;
 Wed, 21 Apr 2021 15:10:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yvkEbdNGcAw4; Wed, 21 Apr 2021 15:10:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3C3C8B825;
 Wed, 21 Apr 2021 15:10:11 +0200 (CEST)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7dc31256-eb1d-dc93-5e55-2de27475e0c6@csgroup.eu>
Date: Wed, 21 Apr 2021 15:10:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Apr 2021 07:38:35 +1000
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
Cc: Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 paulburton@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Quentin Monnet <quentin@isovalent.com>, Dmitry Vyukov <dvyukov@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 grantseltzer@gmail.com, Xi Wang <xi.wang@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, KP Singh <kpsingh@kernel.org>,
 iecedge@gmail.com, Simon Horman <horms@verge.net.au>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Jianlin Lv <Jianlin.Lv@arm.com>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Wang YanQing <udknight@gmail.com>, tsbogend@alpha.franken.de,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>,
 linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 bpf <bpf@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/04/2021 à 05:28, Alexei Starovoitov a écrit :
> On Sat, Apr 17, 2021 at 1:16 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 16/04/2021 à 01:49, Alexei Starovoitov a écrit :
>>> On Thu, Apr 15, 2021 at 8:41 AM Quentin Monnet <quentin@isovalent.com> wrote:
>>>>
>>>> 2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
>>>>> On 4/15/21 11:32 AM, Jianlin Lv wrote:
>>>>>> For debugging JITs, dumping the JITed image to kernel log is discouraged,
>>>>>> "bpftool prog dump jited" is much better way to examine JITed dumps.
>>>>>> This patch get rid of the code related to bpf_jit_enable=2 mode and
>>>>>> update the proc handler of bpf_jit_enable, also added auxiliary
>>>>>> information to explain how to use bpf_jit_disasm tool after this change.
>>>>>>
>>>>>> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>
>>>>
>>>> Hello,
>>>>
>>>> For what it's worth, I have already seen people dump the JIT image in
>>>> kernel logs in Qemu VMs running with just a busybox, not for kernel
>>>> development, but in a context where buiding/using bpftool was not
>>>> possible.
>>>
>>> If building/using bpftool is not possible then majority of selftests won't
>>> be exercised. I don't think such environment is suitable for any kind
>>> of bpf development. Much so for JIT debugging.
>>> While bpf_jit_enable=2 is nothing but the debugging tool for JIT developers.
>>> I'd rather nuke that code instead of carrying it from kernel to kernel.
>>>
>>
>> When I implemented JIT for PPC32, it was extremely helpfull.
>>
>> As far as I understand, for the time being bpftool is not usable in my environment because it
>> doesn't support cross compilation when the target's endianess differs from the building host
>> endianess, see discussion at
>> https://lore.kernel.org/bpf/21e66a09-514f-f426-b9e2-13baab0b938b@csgroup.eu/
>>
>> That's right that selftests can't be exercised because they don't build.
>>
>> The question might be candid as I didn't investigate much about the replacement of "bpf_jit_enable=2
>> debugging mode" by bpftool, how do we use bpftool exactly for that ? Especially when using the BPF
>> test module ?
> 
> the kernel developers can add any amount of printk and dumps to debug
> their code,
> but such debugging aid should not be part of the production kernel.
> That sysctl was two things at once: debugging tool for kernel devs and
> introspection for users.
> bpftool jit dump solves the 2nd part. It provides JIT introspection to users.
> Debugging of the kernel can be done with any amount of auxiliary code
> including calling print_hex_dump() during jiting.
> 

I get the following message when trying the command suggested in the patch message:

root@vgoip:~# ./bpftool prog dump jited
Error: No libbfd support

Christophe

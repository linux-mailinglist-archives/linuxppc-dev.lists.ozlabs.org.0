Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 875CB5628C8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 04:15:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYzLB6yNjz3dvr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 12:14:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYzKm49Vcz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 12:14:32 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LYzGL0V9YzhYnN;
	Fri,  1 Jul 2022 10:11:38 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 10:13:56 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Jul
 2022 10:13:56 +0800
Message-ID: <dcbc25df-ce0c-45bf-35af-4d694e09ad37@huawei.com>
Date: Fri, 1 Jul 2022 10:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
From: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
	Sathvika Vasireddy <sv@linux.vnet.ibm.com>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, Marc Zyngier <maz@kernel.org>, "mbenes@suse.cz" <mbenes@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi everyone,

Hope I'm not too late for this discussion.

I'm not familiar with ppc so it spent me some time to reproduce this. 
But at last I didn't make it.

What I did:

1 checkout to tip/objtool/core

2 apply this patch

3 recover the unreachable() after WARN_ENTRY(..

4 compile on defconfig/allyesconfig

If anyone can point out which file will generate this problem it will be 
perfect.

On 2022/6/30 16:05, Naveen N. Rao wrote:
> Christophe Leroy wrote:
>> Hi Sathvika,
>>
>> Adding ARM people as they seem to face the same kind of problem (see 
>> https://patchwork.kernel.org/project/linux-kbuild/patch/20220623014917.199563-33-chenzhongjin@huawei.com/)

For my situation, the problem is, if there is an unreachable() used in 
the switch default case with nothing else, compiler will generate a NOP 
and is still a jump to this NOP branch while it is marked in 
.discard.unreachable.

When objtool deal with .discard.unreachable, it will *do nothing* to 
this NOP itself, but mark the previous instruction as "dead_end" (see 
check.c:ignore_unreachable_insn()). And checking will stop when reach 
this dead_end insn.

0x4: jne 0x14        <= jump for switch case

..

0x10: ret                <= dead_end

0x14: nop              <= real unreachable instructiond

However, actually we have a jump to NOP, which makes this reachable to 
this branch, and when this NOP is at end of function, it get a "fall 
through" warning.


I changed the unreachable to -EINVAL but it was criticized by the 
committer because he thought it is objtool's job to deal with these 
special cases.

>>
>> Le 27/06/2022 à 17:35, Sathvika Vasireddy a écrit :
>>>
>>> On 25/06/22 12:16, Christophe Leroy wrote:
>>>>
>>>> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
>>>>> objtool is throwing *unannotated intra-function call*
>>>>> warnings with a few instructions that are marked
>>>>> unreachable. Remove unreachable() from WARN_ON()
>>>>> to fix these warnings, as the codegen remains same
>>>>> with and without unreachable() in WARN_ON().
>>>> Did you try the two exemples described in commit 1e688dd2a3d6
>>>> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() 
>>>> with
>>>> asm goto") ?
>>>>
>>>> Without your patch:
>>>>
>>>> 00000640 <test>:
>>>>    640:    81 23 00 84     lwz     r9,132(r3)
>>>>    644:    71 29 40 00     andi.   r9,r9,16384
>>>>    648:    40 82 00 0c     bne     654 <test+0x14>
>>>>    64c:    80 63 00 0c     lwz     r3,12(r3)
>>>>    650:    4e 80 00 20     blr
>>>>    654:    0f e0 00 00     twui    r0,0
>>>>
>>>> 00000658 <test9w>:
>>>>    658:    2c 04 00 00     cmpwi   r4,0
>>>>    65c:    41 82 00 0c     beq     668 <test9w+0x10>
>>>>    660:    7c 63 23 96     divwu   r3,r3,r4
>>>>    664:    4e 80 00 20     blr
>>>>    668:    0f e0 00 00     twui    r0,0
>>>>    66c:    38 60 00 00     li      r3,0
>>>>    670:    4e 80 00 20     blr
>>>>
>>>>
>>>> With your patch:
>>>>
>>>> 00000640 <test>:
>>>>    640:    81 23 00 84     lwz     r9,132(r3)
>>>>    644:    71 29 40 00     andi.   r9,r9,16384
>>>>    648:    40 82 00 0c     bne     654 <test+0x14>
>>>>    64c:    80 63 00 0c     lwz     r3,12(r3)
>>>>    650:    4e 80 00 20     blr
>>>>    654:    0f e0 00 00     twui    r0,0
>>>>    658:    4b ff ff f4     b       64c <test+0xc>        <==
>>>>
>>>> 0000065c <test9w>:
>>>>    65c:    2c 04 00 00     cmpwi   r4,0
>>>>    660:    41 82 00 0c     beq     66c <test9w+0x10>
>>>>    664:    7c 63 23 96     divwu   r3,r3,r4
>>>>    668:    4e 80 00 20     blr
>>>>    66c:    0f e0 00 00     twui    r0,0
>>>>    670:    38 60 00 00     li      r3,0            <==
>>>>    674:    4e 80 00 20     blr                <==
>>>>    678:    38 60 00 00     li      r3,0
>>>>    67c:    4e 80 00 20     blr
>>>>
>>> The builtin variant of unreachable (__builtin_unreachable()) works.
>>>
>>> How about using that instead of unreachable() ?
>>>
>>>
>>
>> In fact the problem comes from the macro annotate_unreachable() which 
>> is called by unreachable() before calling __build_unreachable().
>>
>> Seems like this macro adds (after the unconditional trap twui) a call 
>> to an empty function whose address is listed in section 
>> .discard.unreachable
>>
>>      1c78:       00 00 e0 0f     twui    r0,0
>>      1c7c:       55 e7 ff 4b     bl      3d0 
>> <qdisc_root_sleeping_lock.part.0>
>>
>>
>> RELOCATION RECORDS FOR [.discard.unreachable]:
>> OFFSET           TYPE              VALUE
>> 0000000000000000 R_PPC64_REL32     .text+0x00000000000003d0
>>
>> The problem is that that function has size 0:
>>
>> 00000000000003d0 l     F .text    0000000000000000 
>> qdisc_root_sleeping_lock.part.0
>>
>>
>> And objtool is not prepared for a function with size 0.
>
> annotate_unreachable() seems to have been introduced in commit 
> 649ea4d5a624f0 ("objtool: Assume unannotated UD2 instructions are dead 
> ends").
>
> Objtool considers 'ud2' instruction to be fatal, so BUG() has 
> __builtin_unreachable(), rather than unreachable(). See commit 
> bfb1a7c91fb775 ("x86/bug: Merge annotate_reachable() into _BUG_FLAGS() 
> asm"). For the same reason, __WARN_FLAGS() is annotated with 
> _ASM_REACHABLE so that objtool can differentiate warnings from a BUG().
>
> On powerpc, we use trap variants for both and don't have a special 
> instruction for a BUG(). As such, for _WARN_FLAGS(), using 
> __builtin_unreachable() suffices to achieve optimal code generation 
> from the compiler. Objtool would consider subsequent instructions to 
> be reachable. For BUG(), we can continue to use unreachable() so that 
> objtool can differentiate these from traps used in warnings.
>
It is right and on arm64 only BUG() has unreachable and there is no 
annotation for __WARN_FLAGS(). Objtool works correctly on this. For that 
I support that unreachable() annotation shouldn't be with __WARN_FLAGS() 
because there should be an accessible branch after WARN() micro. However 
in the previous case, it's wired that compiler generates a bl to 
unreachable symbol, IIUC it is not a illegal call? (if it is allowed on 
ppc then objtool should be tell to recognize this)


It seems that your decoding only care about INSN_CALL for mcount, so 
maybe temporarily these control flow checking makes non-sense for you so 
the solution could actually be looser.

Anyway, maybe I can help more if I can reproduce that on my own machine.


Best,

Chen

.



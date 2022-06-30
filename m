Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC355617F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 12:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYZSZ0gsdz3dqp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 20:34:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYZS83pLbz2xsr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 20:33:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LYZS14zjSz9tBL;
	Thu, 30 Jun 2022 12:33:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSgth1V_9y_f; Thu, 30 Jun 2022 12:33:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LYZS13tnNz9tBG;
	Thu, 30 Jun 2022 12:33:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 746788B798;
	Thu, 30 Jun 2022 12:33:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Uvk3kpt0LjIu; Thu, 30 Jun 2022 12:33:37 +0200 (CEST)
Received: from [192.168.232.210] (unknown [192.168.232.210])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D8478B790;
	Thu, 30 Jun 2022 12:33:36 +0200 (CEST)
Message-ID: <ff623097-9f18-3914-5eae-bc6e4cd1510f@csgroup.eu>
Date: Thu, 30 Jun 2022 12:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 Sathvika Vasireddy <sv@linux.vnet.ibm.com>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
 <da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu>
In-Reply-To: <da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu>
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
Cc: Marc Zyngier <maz@kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/06/2022 à 11:58, Christophe Leroy a écrit :
> 
> 
> Le 30/06/2022 à 10:05, Naveen N. Rao a écrit :
>> Christophe Leroy wrote:
>>> Hi Sathvika,
>>>
>>> Adding ARM people as they seem to face the same kind of problem (see 
>>> https://patchwork.kernel.org/project/linux-kbuild/patch/20220623014917.199563-33-chenzhongjin@huawei.com/) 
>>>
>>>
>>> Le 27/06/2022 à 17:35, Sathvika Vasireddy a écrit :
>>>>
>>>> On 25/06/22 12:16, Christophe Leroy wrote:
>>>>>
>>>>> Le 24/06/2022 à 20:32, Sathvika Vasireddy a écrit :
>>>>>> objtool is throwing *unannotated intra-function call*
>>>>>> warnings with a few instructions that are marked
>>>>>> unreachable. Remove unreachable() from WARN_ON()
>>>>>> to fix these warnings, as the codegen remains same
>>>>>> with and without unreachable() in WARN_ON().
>>>>> Did you try the two exemples described in commit 1e688dd2a3d6
>>>>> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() 
>>>>> with
>>>>> asm goto") ?
>>>>>
>>>>> Without your patch:
>>>>>
>>>>> 00000640 <test>:
>>>>>    640:    81 23 00 84     lwz     r9,132(r3)
>>>>>    644:    71 29 40 00     andi.   r9,r9,16384
>>>>>    648:    40 82 00 0c     bne     654 <test+0x14>
>>>>>    64c:    80 63 00 0c     lwz     r3,12(r3)
>>>>>    650:    4e 80 00 20     blr
>>>>>    654:    0f e0 00 00     twui    r0,0
>>>>>
>>>>> 00000658 <test9w>:
>>>>>    658:    2c 04 00 00     cmpwi   r4,0
>>>>>    65c:    41 82 00 0c     beq     668 <test9w+0x10>
>>>>>    660:    7c 63 23 96     divwu   r3,r3,r4
>>>>>    664:    4e 80 00 20     blr
>>>>>    668:    0f e0 00 00     twui    r0,0
>>>>>    66c:    38 60 00 00     li      r3,0
>>>>>    670:    4e 80 00 20     blr
>>>>>
>>>>>
>>>>> With your patch:
>>>>>
>>>>> 00000640 <test>:
>>>>>    640:    81 23 00 84     lwz     r9,132(r3)
>>>>>    644:    71 29 40 00     andi.   r9,r9,16384
>>>>>    648:    40 82 00 0c     bne     654 <test+0x14>
>>>>>    64c:    80 63 00 0c     lwz     r3,12(r3)
>>>>>    650:    4e 80 00 20     blr
>>>>>    654:    0f e0 00 00     twui    r0,0
>>>>>    658:    4b ff ff f4     b       64c <test+0xc>        <==
>>>>>
>>>>> 0000065c <test9w>:
>>>>>    65c:    2c 04 00 00     cmpwi   r4,0
>>>>>    660:    41 82 00 0c     beq     66c <test9w+0x10>
>>>>>    664:    7c 63 23 96     divwu   r3,r3,r4
>>>>>    668:    4e 80 00 20     blr
>>>>>    66c:    0f e0 00 00     twui    r0,0
>>>>>    670:    38 60 00 00     li      r3,0            <==
>>>>>    674:    4e 80 00 20     blr                <==
>>>>>    678:    38 60 00 00     li      r3,0
>>>>>    67c:    4e 80 00 20     blr
>>>>>
>>>> The builtin variant of unreachable (__builtin_unreachable()) works.
>>>>
>>>> How about using that instead of unreachable() ?
>>>>
>>>>
>>>
>>> In fact the problem comes from the macro annotate_unreachable() which 
>>> is called by unreachable() before calling __build_unreachable().
>>>
>>> Seems like this macro adds (after the unconditional trap twui) a call 
>>> to an empty function whose address is listed in section 
>>> .discard.unreachable
>>>
>>>      1c78:       00 00 e0 0f     twui    r0,0
>>>      1c7c:       55 e7 ff 4b     bl      3d0 
>>> <qdisc_root_sleeping_lock.part.0>
>>>
>>>
>>> RELOCATION RECORDS FOR [.discard.unreachable]:
>>> OFFSET           TYPE              VALUE
>>> 0000000000000000 R_PPC64_REL32     .text+0x00000000000003d0
>>>
>>> The problem is that that function has size 0:
>>>
>>> 00000000000003d0 l     F .text    0000000000000000 
>>> qdisc_root_sleeping_lock.part.0
>>>
>>>
>>> And objtool is not prepared for a function with size 0.
>>
>> annotate_unreachable() seems to have been introduced in commit 
>> 649ea4d5a624f0 ("objtool: Assume unannotated UD2 instructions are dead 
>> ends").
>>
>> Objtool considers 'ud2' instruction to be fatal, so BUG() has 
>> __builtin_unreachable(), rather than unreachable(). See commit 
>> bfb1a7c91fb775 ("x86/bug: Merge annotate_reachable() into _BUG_FLAGS() 
>> asm"). For the same reason, __WARN_FLAGS() is annotated with 
>> _ASM_REACHABLE so that objtool can differentiate warnings from a BUG().
>>
>> On powerpc, we use trap variants for both and don't have a special 
>> instruction for a BUG(). As such, for _WARN_FLAGS(), using 
>> __builtin_unreachable() suffices to achieve optimal code generation 
>> from the compiler. Objtool would consider subsequent instructions to 
>> be reachable. For BUG(), we can continue to use unreachable() so that 
>> objtool can differentiate these from traps used in warnings.
> 
> Not sure I understand what you mean.
> 
> __WARN_FLAGS() and BUG() both use 'twui' which is unconditionnal trap, 
> as such both are the same.
> 
> On the other side, WARN_ON() and BUG_ON() use tlbnei which is a 
> conditionnel trap.
> 
>>
>>>
>>> The following changes to objtool seem to fix the problem, most 
>>> warning are gone with that change.
>>>
>>> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
>>> index 63218f5799c2..37c0a268b7ea 100644
>>> --- a/tools/objtool/elf.c
>>> +++ b/tools/objtool/elf.c
>>> @@ -77,6 +77,8 @@ static int symbol_by_offset(const void *key, const 
>>> struct rb_node *node)
>>>
>>>       if (*o < s->offset)
>>>           return -1;
>>> +    if (*o == s->offset && !s->len)
>>> +        return 0;
>>>       if (*o >= s->offset + s->len)
>>>           return 1;
>>>
>>> @@ -400,7 +402,7 @@ static void elf_add_symbol(struct elf *elf, 
>>> struct symbol *sym)
>>>        * Don't store empty STT_NOTYPE symbols in the rbtree.  They
>>>        * can exist within a function, confusing the sorting.
>>>        */
>>> -    if (!sym->len)
>>> +    if (sym->type == STT_NOTYPE && !sym->len)
>>>           rb_erase(&sym->node, &sym->sec->symbol_tree);
>>>   }
>>
>> Is there a reason to do this, rather than change __WARN_FLAGS() to use 
>> __builtin_unreachable()? Or, are you seeing an issue with 
>> unreachable() elsewhere in the kernel?
>>
> 
> At the moment I'm trying to understand what the issue is, and explore 
> possible fixes. I guess if we tell objtool that after 'twui' subsequent 
> instructions are unreachable, then __builtin_unreachable() is enough.

I get a nice result with the following changes (on top of Sathvika's 
series):

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index df6c11e008b9..73f5650f98df 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -89,7 +89,7 @@

  #define BUG() do {						\
  	BUG_ENTRY("twi 31, 0, 0", 0);				\
-	unreachable();						\
+	__builtin_unreachable();				\
  } while (0)
  #define HAVE_ARCH_BUG

@@ -97,6 +97,7 @@
  	__label__ __label_warn_on;				\
  								\
  	WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
+	__builtin_unreachable();				\
  								\
  __label_warn_on:						\
  	break;							\
diff --git a/tools/objtool/arch/powerpc/decode.c 
b/tools/objtool/arch/powerpc/decode.c
index 06fc0206bf8e..9a0303304923 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -68,6 +68,8 @@ int arch_decode_instruction(struct objtool_file *file, 
const struct section *sec
  		}
  		break;
  	}
+	if (insn == 0x0fe00000) /* twui */
+		*type = INSN_BUG;

  	return 0;
  }
---

Christophe

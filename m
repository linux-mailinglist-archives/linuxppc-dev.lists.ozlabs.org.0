Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4BE59F15C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8tY5dSgz3fmM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8cd3yYgz3c3V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:29 +1000 (AEST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MC8W55gFrzXf3N;
	Wed, 24 Aug 2022 10:02:41 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 24 Aug 2022 10:06:56 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 24 Aug
 2022 10:06:56 +0800
Message-ID: <3d479f53-9028-1640-985f-0fdd084c5037@huawei.com>
Date: Wed, 24 Aug 2022 10:06:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] objtool: replace _ASM_PTR with quad in macros
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220823133124.55914-1-chenzhongjin@huawei.com>
 <27c6906c-baf3-6802-9843-50b27df74a71@csgroup.eu>
Content-Language: en-US
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <27c6906c-baf3-6802-9843-50b27df74a71@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "sv@linux.ibm.com" <sv@linux.ibm.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "bp@suse.de" <bp@suse.de>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/8/24 0:47, Christophe Leroy wrote:
>
> Le 23/08/2022 à 15:31, Chen Zhongjin a écrit :
>> Macros STACK_FRAME_NON_STANDARD and ANNOTATE_NOENDBR uses
>> _ASM_PTR. It switch between .long and .quad based on 32bit
>> or 64bit. However objtool doesn't work for 32bit, so _ASM_PTR
>> makes no sense.
>>
>> Considering that _ASM_PTR comes from asm.h, which is x86
>> specific head file, while objtool.h is generic. Replace
>> _ASM_PTR with quad and remove asm.h reference.
> objtool is about to be used on powerpc on both PPC32 and PPC64, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=312955&state=*
>
> So if this part is meant to be used by all architectures, we need
> nothing that also works on 32 bits, don't we ?
>
> Christophe
>
ANNOTATE_NOENDBR affects nothing because it's for x86 IBT. Leaving this 
macro here is harmless now, but I think maybe it's better to move this 
to arch-specific.

The problem is STACK_FRAME_NON_STANDARD. The C version macro uses 
function pointer so the reloc symbol type can change between 32 and 64 bit.

Although I think quad is workable for both 32 and 64 bit, and this macro 
is .discard so it won't affect something else, but it may not keep reloc 
symbol type consistency.


Anyway, NO _ASM_PTR and asm.h, they are arch-specific and will break 
compiling on other arches.


Maybe we should create a macro similar to _ASM_PTR for other arches. 
Till now I didn't find one.

I'll send v2 patch to make this and Peter can judge.


Best,

Chen

>> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
>> ---
>>    include/linux/objtool.h       | 6 ++----
>>    tools/include/linux/objtool.h | 6 ++----
>>    2 files changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/linux/objtool.h b/include/linux/objtool.h
>> index 62c54ffbeeaa..d2413cb78037 100644
>> --- a/include/linux/objtool.h
>> +++ b/include/linux/objtool.h
>> @@ -45,8 +45,6 @@ struct unwind_hint {
>>    
>>    #ifdef CONFIG_OBJTOOL
>>    
>> -#include <asm/asm.h>
>> -
>>    #ifndef __ASSEMBLY__
>>    
>>    #define UNWIND_HINT(sp_reg, sp_offset, type, end)		\
>> @@ -87,7 +85,7 @@ struct unwind_hint {
>>    #define ANNOTATE_NOENDBR					\
>>    	"986: \n\t"						\
>>    	".pushsection .discard.noendbr\n\t"			\
>> -	_ASM_PTR " 986b\n\t"					\
>> +	".quad 986b\n\t"					\
>>    	".popsection\n\t"
>>    
>>    #define ASM_REACHABLE							\
>> @@ -144,7 +142,7 @@ struct unwind_hint {
>>    
>>    .macro STACK_FRAME_NON_STANDARD func:req
>>    	.pushsection .discard.func_stack_frame_non_standard, "aw"
>> -	_ASM_PTR \func
>> +	.quad \func
>>    	.popsection
>>    .endm
>>    
>> diff --git a/tools/include/linux/objtool.h b/tools/include/linux/objtool.h
>> index 62c54ffbeeaa..d2413cb78037 100644
>> --- a/tools/include/linux/objtool.h
>> +++ b/tools/include/linux/objtool.h
>> @@ -45,8 +45,6 @@ struct unwind_hint {
>>    
>>    #ifdef CONFIG_OBJTOOL
>>    
>> -#include <asm/asm.h>
>> -
>>    #ifndef __ASSEMBLY__
>>    
>>    #define UNWIND_HINT(sp_reg, sp_offset, type, end)		\
>> @@ -87,7 +85,7 @@ struct unwind_hint {
>>    #define ANNOTATE_NOENDBR					\
>>    	"986: \n\t"						\
>>    	".pushsection .discard.noendbr\n\t"			\
>> -	_ASM_PTR " 986b\n\t"					\
>> +	".quad 986b\n\t"					\
>>    	".popsection\n\t"
>>    
>>    #define ASM_REACHABLE							\
>> @@ -144,7 +142,7 @@ struct unwind_hint {
>>    
>>    .macro STACK_FRAME_NON_STANDARD func:req
>>    	.pushsection .discard.func_stack_frame_non_standard, "aw"
>> -	_ASM_PTR \func
>> +	.quad \func
>>    	.popsection
>>    .endm
>>    


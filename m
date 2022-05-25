Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743753422C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 19:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7dLm2QSQz3bmJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7dLM12PJz30BV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 03:27:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L7dLF0RBbz9t7f;
 Wed, 25 May 2022 19:27:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tczjtePghe9T; Wed, 25 May 2022 19:27:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L7dLD6TFDz9sRq;
 Wed, 25 May 2022 19:27:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A495E8B778;
 Wed, 25 May 2022 19:27:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wTlNO94Eyj_i; Wed, 25 May 2022 19:27:32 +0200 (CEST)
Received: from [192.168.203.180] (unknown [192.168.203.180])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BEA848B763;
 Wed, 25 May 2022 19:27:31 +0200 (CEST)
Message-ID: <f1decbb7-b441-a241-469a-4ba118e08212@csgroup.eu>
Date: Wed, 25 May 2022 19:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
 <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
 <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
 <578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
In-Reply-To: <578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/05/2022 à 15:33, Christophe Leroy a écrit :
> 
> 
> Le 24/05/2022 à 13:00, Sathvika Vasireddy a écrit :
>>>
>>>> +{
>>>> +    switch (elf->ehdr.e_machine) {
>>>> +    case EM_X86_64:
>>>> +            return R_X86_64_64;
>>>> +    case EM_PPC64:
>>>> +            return R_PPC64_ADDR64;
>>>> +    default:
>>>> +            WARN("unknown machine...");
>>>> +            exit(-1);
>>>> +    }
>>>> +}
>>> Wouldn't it be better to make that function arch specific ?
>>
>> This is so that we can support cross architecture builds.
>>
> 
> 
> I'm not sure I follow you here.
> 
> This is only based on the target, it doesn't depend on the build host so
> I can't the link with cross arch builds.
> 
> The same as you have arch_decode_instruction(), you could have
> arch_elf_reloc_type_long()
> It would make sense indeed, because there is no point in supporting X86
> relocation when you don't support X86 instruction decoding.
> 

Could simply be some macro defined in 
tools/objtool/arch/powerpc/include/arch/elf.h and 
tools/objtool/arch/x86/include/arch/elf.h

The x86 version would be:

#define R_ADDR(elf) R_X86_64_64

And the powerpc version would be:

#define R_ADDR(elf) (elf->ehdr.e_machine == EM_PPC64 ? R_PPC64_ADDR64 : 
R_PPC_ADDR32)

Christophe

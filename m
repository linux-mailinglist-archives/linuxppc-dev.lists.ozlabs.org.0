Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A34882CFB4F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 13:45:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp8Rb6wKXzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 23:44:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp8NM5TC2zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 23:42:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Cp8N95t0Tz9v0WS;
 Sat,  5 Dec 2020 13:42:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Aetkluoxj2BP; Sat,  5 Dec 2020 13:42:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Cp8N94zy2z9v0KH;
 Sat,  5 Dec 2020 13:42:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AE4A8B77F;
 Sat,  5 Dec 2020 13:41:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LW1N9ujtEu1S; Sat,  5 Dec 2020 13:41:58 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DDB928B75B;
 Sat,  5 Dec 2020 13:41:57 +0100 (CET)
Subject: Re: [PATCH] powerpc/mm: Fix KUAP warning by providing
 copy_from_kernel_nofault_allowed()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christoph Hellwig <hch@lst.de>, Michael Ellerman <mpe@ellerman.id.au>
References: <e559e60c43f679195bfe4c7b0a301431c6f02c7a.1607157766.git.christophe.leroy@csgroup.eu>
 <20201205084804.GA25452@lst.de>
 <0ede82c3-d4e9-6ce6-0590-6254272c3ae2@csgroup.eu>
Message-ID: <d7a9c47a-d539-d83e-7707-6b72cbcdfe93@csgroup.eu>
Date: Sat, 5 Dec 2020 13:38:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0ede82c3-d4e9-6ce6-0590-6254272c3ae2@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, viro@zeniv.linux.org.uk,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/12/2020 à 10:56, Christophe Leroy a écrit :
> 
> 
> Le 05/12/2020 à 09:48, Christoph Hellwig a écrit :
>> On Sat, Dec 05, 2020 at 08:43:06AM +0000, Christophe Leroy wrote:
>>> Since commit c33165253492 ("powerpc: use non-set_fs based maccess
>>> routines"), userspace access is not granted anymore when using
>>> copy_from_kernel_nofault()
>>>
>>> However, kthread_probe_data() uses copy_from_kernel_nofault()
>>> to check validity of pointers. When the pointer is NULL,
>>> it points to userspace, leading to a KUAP fault and triggering
>>> the following big hammer warning many times when you request
>>> a sysrq "show task":
>>
>>
>>
>>> To avoid that, copy_from_kernel_nofault_allowed() is used to check
>>> whether the address is a valid kernel address. But the default
>>> version of it returns true for any address.
>>>
>>> Provide a powerpc version of copy_from_kernel_nofault_allowed()
>>> that returns false when the address is below TASK_USER_MAX,
>>> so that copy_from_kernel_nofault() will return -ERANGE.
>>
>> Looks good.  I wonder if we should just default to the TASK_SIZE_MAX
>> check in  copy_from_kernel_nofault_allowed for architectures that select
>> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE?
> 
> Yes maybe that would be better.
> 
> Can you cook a patch an get it into 5.10 ?
> 

In fact it doesn't seem so easy because only s390, powerpc and x86 have TASK_SIZE_MAX while 
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE is selected by arm, arm64, powerpc and x86

So maybe for 5.10 we take the powerpc fix ?

Christophe

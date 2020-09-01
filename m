Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114025899B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 09:53:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgfSy0lZFzDqGY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 17:53:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgfQt2xp8zDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 17:51:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BgfQj5ZqZz9v4j1;
 Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id otG6xobMGX17; Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BgfQj4hHYz9v1SD;
 Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A99F68B774;
 Tue,  1 Sep 2020 09:51:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0bfitLpUFTsu; Tue,  1 Sep 2020 09:51:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8C8D8B75E;
 Tue,  1 Sep 2020 09:51:25 +0200 (CEST)
Subject: Re: [PATCH v3 08/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-9-aneesh.kumar@linux.ibm.com>
 <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
 <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
 <d80a91c3-0edf-7e2f-8101-2d37a371f4bd@csgroup.eu>
 <2fb4ac88-d417-2bdd-3c56-a816c356636a@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5d25b02a-887a-432e-7ecd-cc5cbcea9b02@csgroup.eu>
Date: Tue, 1 Sep 2020 09:51:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2fb4ac88-d417-2bdd-3c56-a816c356636a@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/09/2020 à 09:40, Aneesh Kumar K.V a écrit :
> On 9/1/20 12:20 PM, Christophe Leroy wrote:
>>
>>
>> Le 01/09/2020 à 08:25, Aneesh Kumar K.V a écrit :
>>> On 9/1/20 8:52 AM, Anshuman Khandual wrote:
>>>>
>>>>
>>>>
>>>> There is a checkpatch.pl warning here.
>>>>
>>>> WARNING: Possible unwrapped commit description (prefer a maximum 75 
>>>> chars per line)
>>>> #7:
>>>> Architectures like ppc64 use deposited page table while updating the 
>>>> huge pte
>>>>
>>>> total: 0 errors, 1 warnings, 40 lines checked
>>>>
>>>
>>> I will ignore all these, because they are not really important IMHO.
>>>
>>
>> When doing a git log in a 80 chars terminal window, having wrapping 
>> lines is not really convenient. It should be easy to avoid it.
>>
> 
> We have been ignoring that for a long time  isn't it?
> 
> For example ppc64 checkpatch already had
> --max-line-length=90
> 
> 
> There was also recent discussion whether 80 character limit is valid any 
> more. But I do keep it restricted to 80 character where ever it is 
> easy/make sense.
> 

Here we are not talking about the code, but the commit log.

As far as I know, the discussions about 80 character lines, 90 lines in 
powerpc etc ... is for the code.

We still aim at keeping lines not longer than 75 chars in the commit log.

Christophe

Christophe

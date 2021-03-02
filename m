Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55C329697
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 08:09:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqSts145sz3cy1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 18:09:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqStX2lQFz30Mm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 18:09:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DqStN5Y6wz9ty3x;
 Tue,  2 Mar 2021 08:09:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZDu3KoTvWhhv; Tue,  2 Mar 2021 08:09:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DqStN44CRz9ty3w;
 Tue,  2 Mar 2021 08:09:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7576B8B7AC;
 Tue,  2 Mar 2021 08:09:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V6-wUwb-6uGj; Tue,  2 Mar 2021 08:09:33 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFF088B75F;
 Tue,  2 Mar 2021 08:09:32 +0100 (CET)
Subject: Re: [PATCH V2] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1614661987-23881-1-git-send-email-anshuman.khandual@arm.com>
 <a3772544-1e84-1969-b71c-ea2a3d013471@csgroup.eu>
 <c33fe839-82c6-d0cd-32d6-b386d143ac51@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4452b859-9e72-974c-95b3-9c70c54472d1@csgroup.eu>
Date: Tue, 2 Mar 2021 08:09:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c33fe839-82c6-d0cd-32d6-b386d143ac51@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/03/2021 à 07:37, Anshuman Khandual a écrit :
> 
> 
> On 3/2/21 11:13 AM, Christophe Leroy wrote:
>>
>>
>> Le 02/03/2021 à 06:13, Anshuman Khandual a écrit :
>>> HUGETLB_PAGE_SIZE_VARIABLE need not be defined for each individual
>>> platform subscribing it. Instead just make it generic.
>>>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: linux-ia64@vger.kernel.org
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Suggested-by: Christoph Hellwig <hch@lst.de>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>> This change was originally suggested in an earilier discussion. This
>>> applies on v5.12-rc1 and has been build tested on all applicable
>>> platforms i.e ia64 and powerpc.
>>>
>>> https://patchwork.kernel.org/project/linux-mm/patch/1613024531-19040-3-git-send-email-anshuman.khandual@arm.com/
>>>
>>> Changes in V2:
>>>
>>> - Added a description for HUGETLB_PAGE_SIZE_VARIABLE
>>
>> You are doing more than adding a description: you are making it user selectable. Is that what you want ?
> 
> No, this was unintended. Will drop that description.
> 

The description in the help section is OK.

It is only the text after the "bool" that makes it selectable.

	bool "Allows dynamic pageblock_order"


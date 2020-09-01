Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E7258A10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 10:06:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgfmc6gfkzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 18:06:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgfjB28xKzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 18:03:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bgfj35351z9v0Hp;
 Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id o-eFXfCEiBu6; Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bgfj348tSz9v0Hm;
 Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7698C8B774;
 Tue,  1 Sep 2020 10:03:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UvDPBkwWDzC9; Tue,  1 Sep 2020 10:03:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 838268B75E;
 Tue,  1 Sep 2020 10:03:51 +0200 (CEST)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <52e9743e-fa2f-3fd2-f50e-2c6c38464b96@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c0de2c68-826b-bf0f-dc2c-a501fa7bef38@csgroup.eu>
Date: Tue, 1 Sep 2020 10:03:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <52e9743e-fa2f-3fd2-f50e-2c6c38464b96@arm.com>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Qian Cai <cai@lca.pw>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/08/2020 à 10:51, Anshuman Khandual a écrit :
> 
> On 08/19/2020 06:30 PM, Aneesh Kumar K.V wrote:
>> This patch series includes fixes for debug_vm_pgtable test code so that
>> they follow page table updates rules correctly. The first two patches introduce
>> changes w.r.t ppc64. The patches are included in this series for completeness. We can
>> merge them via ppc64 tree if required.
>>
>> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
>> page table update rules.
>>

> 
> Changes proposed here will impact other enabled platforms as well.
> Adding the following folks and mailing lists, and hoping to get a
> broader review and test coverage. Please do include them in the
> next iteration as well.
> 
> + linux-arm-kernel@lists.infradead.org
> + linux-s390@vger.kernel.org
> + linux-snps-arc@lists.infradead.org
> + x86@kernel.org
> + linux-arch@vger.kernel.org
> 
> + Gerald Schaefer <gerald.schaefer@de.ibm.com>
> + Christophe Leroy <christophe.leroy@c-s.fr>

Please don't use anymore the above address. Only use the one below.

> + Christophe Leroy <christophe.leroy@csgroup.eu>
> + Vineet Gupta <vgupta@synopsys.com>
> + Mike Rapoport <rppt@linux.ibm.com>
> + Qian Cai <cai@lca.pw>
> 

Thanks
Christophe

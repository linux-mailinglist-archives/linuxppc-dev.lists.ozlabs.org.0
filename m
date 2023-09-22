Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC87AAB53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:01:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPqT51Vrz3fJG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:01:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNvW6KVwz3djl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 17:20:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E51DA7;
	Fri, 22 Sep 2023 00:20:07 -0700 (PDT)
Received: from [192.168.68.106] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11BBC3F5A1;
	Fri, 22 Sep 2023 00:19:20 -0700 (PDT)
Message-ID: <f6ad20a0-2f3f-414a-845a-948f6d06aaf3@arm.com>
Date: Fri, 22 Sep 2023 08:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <9864a7eb-004d-14c6-c2bd-bb9333fe67be@csgroup.eu>
 <0958d813-15f8-5ed5-1e20-08b8feb465ad@csgroup.eu>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <0958d813-15f8-5ed5-1e20-08b8feb465ad@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 17:56:48 +1000
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/2023 07:44, Christophe Leroy wrote:
> 
> 
> Le 21/09/2023 à 20:43, Christophe Leroy a écrit :
>>
>>
>> Le 21/09/2023 à 18:20, Ryan Roberts a écrit :
>>> In order to fix a bug, arm64 needs access to the vma inside it's
>>> implementation of set_huge_pte_at(). Provide for this by converting the
>>> mm parameter to be a vma. Any implementations that require the mm can
>>> access it via vma->vm_mm.
>>>
>>> This commit makes the required powerpc modifications. Separate commits
>>> update the other arches and core code, before the actual bug is fixed in
>>> arm64.
>>>
>>> No behavioral changes intended.
>>
>> This patch doesn't build, allthough I have also applied patch 1. Is
>> something missing ?
>>
>>     CALL    scripts/checksyscalls.sh
>>     CC      arch/powerpc/kernel/setup-common.o
>> In file included from arch/powerpc/kernel/setup-common.c:37:
>> ./include/linux/hugetlb.h: In function 'huge_ptep_modify_prot_commit':
>> ./include/linux/hugetlb.h:987:28: error: passing argument 1 of
>> 'set_huge_pte_at' from incompatible pointer type
>> [-Werror=incompatible-pointer-types]
>>     987 |         set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
>>         |                         ~~~^~~~~~~
>>         |                            |
>>         |                            struct mm_struct *
>> In file included from ./arch/powerpc/include/asm/hugetlb.h:13,
>>                    from ./include/linux/hugetlb.h:815:
>> ./arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h:49:45: note: expected
>> 'struct vm_area_struct *' but argument is of type 'struct mm_struct *'
>>      49 | void set_huge_pte_at(struct vm_area_struct *vma, unsigned long
>> addr, pte_t *ptep, pte_t pte);
>>         |                      ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> cc1: all warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:243:
> 
> Oh, I realised that it requires patch 6 to build properly. This is not 
> good. Your series should be bisectable, that means it must build and run 
> successfully after each patch. Therefore you have to squash patches 1 to 
> 7 all togethers.

Yeah my bad - sorry about that. I thought it would be better to separate the
changes for each arch. But as already suggested by Andrew and Catalin, I'll
squash the first 7 patches into 1 for v2.

> 
> I'll send you comments on the powerpc part in another mail.
> 
> Christophe


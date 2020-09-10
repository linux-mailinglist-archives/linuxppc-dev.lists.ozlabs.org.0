Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90E265302
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:27:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnX6T6ZDpzDql8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=iyiND7wW; dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnX0x1NF3zDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:22:50 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f5a99180000>; Thu, 10 Sep 2020 14:22:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 10 Sep 2020 14:22:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 10 Sep 2020 14:22:45 -0700
Received: from [10.2.54.52] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 21:22:37 +0000
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
To: Jason Gunthorpe <jgg@ziepe.ca>, Linus Torvalds
 <torvalds@linux-foundation.org>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0c9bcb54-914b-e582-dd6d-3861267b6c94@nvidia.com>
Date: Thu, 10 Sep 2020 14:22:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910181319.GO87483@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599772952; bh=KgUwNS6Q+E8fqoYsN87vU1D8tqx/ffcZtMThZuyBhrY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=iyiND7wWuYHj8PeTvg/XtmrYveZZgQlXRnTEfuRaqVXA6x8uYqDCj3nrByA0pX5cI
 5pEdOff/AUuhqRtuvklooFd8NslrApTnPUOi4JcmLIL68MhkbQJc9AX9wpzPo47t5P
 WonYZKJQ7qlOSxr7z0+3iwfyQPcDStoEMZWR2//x0MYBmno68OCeOHSxdecN4/r9lr
 Jbhl/MI+cwSAsj1DIol///tYiiv7Ue7ZlwRJ+mqssEw4A5AmoU61blAy2i3+rfNZd4
 /0vhPiQoPG2wWvgPHKrzc4/jcDRLgdPpH3xb6nJhrSWHQnnGiRHTVHuGyPppzkiMo2
 pXOZNwCZ5mRKQ==
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
Cc: Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/10/20 11:13 AM, Jason Gunthorpe wrote:
> On Thu, Sep 10, 2020 at 10:35:38AM -0700, Linus Torvalds wrote:
>> On Thu, Sep 10, 2020 at 2:40 AM Alexander Gordeev
>> <agordeev@linux.ibm.com> wrote:
>>>
>>> It is only gup_fast case that exposes the issue. It hits because
>>> pointers to stack copies are passed to gup_pXd_range iterators, not
>>> pointers to real page tables itself.
>>
>> Can we possibly change fast-gup to not do the stack copies?
>>
>> I'd actually rather do something like that, than the "addr_end" thing.
> 
>> As you say, none of the other page table walking code does what the
>> GUP code does, and I don't think it's required.
> 
> As I understand it, the requirement is because fast-gup walks without
> the page table spinlock, or mmap_sem held so it must READ_ONCE the
> *pXX.
> 
> It then checks that it is a valid page table pointer, then calls
> pXX_offset().
> 
> The arch implementation of pXX_offset() derefs again the passed pXX
> pointer. So it defeats the READ_ONCE and the 2nd load could observe
> something that is no longer a page table pointer and crash.

Just to be clear, though, that makes it sound a little wilder and
reckless than it really is, right?

Because actually, the page tables cannot be freed while gup_fast is
walking them, due to either IPI blocking during the walk, or the moral
equivalent (MMU_GATHER_RCU_TABLE_FREE) for non-IPI architectures. So the
pages tables can *change* underneath gup_fast, and for example pages can
be unmapped. But they remain valid page tables, it's just that their
contents are unstable. Even if pXd_none()==true.

Or am I way off here, and it really is possible (aside from the current
s390 situation) to observe something that "is no longer a page table"?


thanks,
-- 
John Hubbard
NVIDIA

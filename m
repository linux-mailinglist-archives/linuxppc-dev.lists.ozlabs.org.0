Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220742654F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 00:20:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnYH10qrszDqkW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 08:20:13 +1000 (AEST)
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
 header.s=n1 header.b=pf7Gb/6Y; dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnYDd1b1HzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 08:18:08 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f5aa60d0000>; Thu, 10 Sep 2020 15:17:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 10 Sep 2020 15:18:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 10 Sep 2020 15:18:02 -0700
Received: from [10.2.54.52] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 22:17:55 +0000
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <0c9bcb54-914b-e582-dd6d-3861267b6c94@nvidia.com>
 <20200910221116.GQ87483@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7188221f-37db-9792-4885-d2fa14ff894d@nvidia.com>
Date: Thu, 10 Sep 2020 15:17:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910221116.GQ87483@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599776269; bh=iwRoz1y5O8TbYdNUszhiA+vAQr7U9YxF7ekZoQ5W1Yk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=pf7Gb/6YBDTqOCEDJuZ+rf4BfPFTGAk8OcLbOb7K+v6FIaG9RzNB0J3T6fe9quopL
 Z+ZPOoYzy+CPdC8eNfwxG52K013+7dFLb6XoB+71dt5jaaUjgW3/Yd+Qa0g/akV9fA
 tQooYBDWtKesVkRQCkYEkicElTFs+3GtpIu0ue7DQtpJI1f7AfE94uKLP6KsjC8rjc
 gBnPKFdEZZjBDt9zvqWyzMyouKLws8HP3qsfGIVfi7dffxmHX6EBFD/EhSz445AfW2
 xdXCwOn/c+CRugCswXB9NnGL9VhGOiW9DFF76qT//6Pd4taPGNhkyd7b8sw4GeB8yW
 gUNk5AGewIISQ==
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/10/20 3:11 PM, Jason Gunthorpe wrote:
> On Thu, Sep 10, 2020 at 02:22:37PM -0700, John Hubbard wrote:
> 
>> Or am I way off here, and it really is possible (aside from the current
>> s390 situation) to observe something that "is no longer a page table"?
> 
> Yes, that is the issue. Remember there is no locking for GUP
> fast. While a page table cannot be freed there is nothing preventing
> the page table entry from being concurrently modified.
> 

OK, then we are saying the same thing after all, good.

> Without the stack variable it looks like this:
> 
>         pud_t pud = READ_ONCE(*pudp);
>         if (!pud_present(pud))
>              return
>         pmd_offset(pudp, address);
> 
> And pmd_offset() expands to
> 
>      return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
> 
> Between the READ_ONCE(*pudp) and (*pud) inside pmd_offset() the value
> of *pud can change, eg to !pud_present.
> 
> Then pud_page_vaddr(*pud) will crash. It is not use after free, it
> is using data that has not been validated.
> 

Right, that matches what I had in mind, too: you can still have a problem
even though you're in the same page table. I just wanted to confirm that
there's not some odd way to launch out into completely non-page-table
memory.


thanks,
-- 
John Hubbard
NVIDIA

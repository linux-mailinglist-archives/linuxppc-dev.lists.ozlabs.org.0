Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F824BBB1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 20:17:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cXbV38T8zDqLj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 04:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="IesrxwT3"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cXXj5xP0zDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 04:14:45 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d890b960000>; Mon, 23 Sep 2019 11:14:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 11:14:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 23 Sep 2019 11:14:40 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 18:14:40 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 18:14:39 +0000
Subject: Re: [PATCH v2 11/11] powerpc/mm/book3s64/pgtable: Uses counting
 method to skip serializing
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-12-leonardo@linux.ibm.com>
 <1b39eaa7-751d-40bc-d3d7-41aaa15be42a@nvidia.com>
 <24863d8904c6e05e5dd48cab57db4274675ae654.camel@linux.ibm.com>
 <4ea26ffb-ad03-bdff-7893-95332b22a5fd@nvidia.com>
 <18c5c378db98f223a0663034baa9fd6ce42f1ec7.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8706a1f1-0c5e-d152-938b-f355b9a5aaa8@nvidia.com>
Date: Mon, 23 Sep 2019 11:14:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <18c5c378db98f223a0663034baa9fd6ce42f1ec7.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569262486; bh=hnHJJMFTAN0ei1gfv4FOxNz23ndZovcqznoxnEUvfuo=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=IesrxwT3lbKGbizW9P/9OxMi6bqhj+vZPtbe2evKesnrO1epatJQlhp5bQSpiigja
 wgbfAItGgBMC1lvKl+XE14e6eourA6MaNrLrhnPJO1QgBaVx2P0Ua60MRbnZ/LYN46
 ts0umeTp7pxvn0/kA91s/idMaD3AT8P0rS/Juvx1cqaoV+xKr9BMdbb0BFzl5vl6d5
 0Cr9oN5vDMTofAVwjHVTzaonfPZxehNoZ+99lvXMZBXqW+9zL6a27McjDZPk/Ljt2t
 y7z7/0vH8icTOCTJ6YwMhGy/FKoFBKd9sfSYUfNJRf/fURrmc78gyofDqNMIpD49es
 mNvei2JV5tprQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Keith Busch <keith.busch@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/19 10:25 AM, Leonardo Bras wrote:
> On Fri, 2019-09-20 at 17:48 -0700, John Hubbard wrote:
>>
> [...]
>> So it seems that full memory barriers (not just compiler barriers) are required.
>> If the irq enable/disable somehow provides that, then your new code just goes
>> along for the ride and Just Works. (You don't have any memory barriers in
>> start_lockless_pgtbl_walk() / end_lockless_pgtbl_walk(), just the compiler
>> barriers provided by the atomic inc/dec.)
>>
>> So it's really a pre-existing question about the correctness of the gup_fast()
>> irq disabling approach.
> 
> I am not experienced in other archs, and I am still pretty new to
> Power, but by what I could understand, this behavior is better
> explained in serialize_against_pte_lookup. 
> 
> What happens here is that, before doing a THP split/collapse, the
> function does a update of the pmd and a serialize_against_pte_lookup,
> in order do avoid a invalid output on a lockless pagetable walk.
> 
> Serialize basically runs a do_nothing in every cpu related to the
> process, and wait for it to return. 
> 
> This running depends on interrupt being enabled, so disabling it before
> gup_pgd_range() and re-enabling after the end, makes the THP
> split/collapse wait for gup_pgd_range() completion in every cpu before
> continuing. (here happens the lock)
> 

That part is all fine, but there are no run-time memory barriers in the 
atomic_inc() and atomic_dec() additions, which means that this is not
safe, because memory operations on CPU 1 can be reordered. It's safe
as shown *if* there are memory barriers to keep the order as shown:

CPU 0                            CPU 1
------                         --------------
                               atomic_inc(val) (no run-time memory barrier!)
pmd_clear(pte)
if (val)
    run_on_all_cpus(): IPI
                               local_irq_disable() (also not a mem barrier)

                               READ(pte)
                               if(pte)
                                  walk page tables

                               local_irq_enable() (still not a barrier)
                               atomic_dec(val)

free(pte)

thanks,
-- 
John Hubbard
NVIDIA

> (As told before, every gup_pgd_range() that occurs after it uses a
> updated pmd, so no problem.)
> 
> I am sure other archs may have a similar mechanism using
> local_irq_{disable,enable}.
> 
> Did it answer your questions?
> 
> Best regards,
> 
> Leonardo Bras
> 

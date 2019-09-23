Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57BBBD77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:59:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ccBh6V7xzDqD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="p3GRkh3S"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cc42171ZzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:53:37 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8930d20000>; Mon, 23 Sep 2019 13:53:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 13:53:32 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 23 Sep 2019 13:53:32 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:53:32 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:53:32 +0000
Subject: Re: [PATCH v2 02/11] asm-generic/pgtable: Adds dummy functions to
 monitor lockless pgtable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-3-leonardo@linux.ibm.com>
 <cb7d4196-c646-82c7-d61f-b28ee9ab47b9@nvidia.com>
 <007934281451e843a0428dc1e674f9dae149b75b.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0339a482-48b9-ca22-ff13-4892500844dc@nvidia.com>
Date: Mon, 23 Sep 2019 13:53:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <007934281451e843a0428dc1e674f9dae149b75b.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569272019; bh=Rg3KZ0g5slXwrYm7QwCemgYQBaqe/QDUEENbhGWrHpI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=p3GRkh3SrNbDF4z4y2JzDeQftWX/RAHi/RTO54xJeEwcKtRCSmSi8MpfjY0XqDLpv
 +ojFovxvh95v9OgzrB4FP5Dles2JkDcAuKzolHbdCOdizBHjchiP0mL/rpb5Yh0iiJ
 QMOr3X+iZI/55r8GzIywT3uxA2UDvmJijrEZ72zFAzt+ujgVy5n9CmbKQH5Tr+EGpA
 xVPCkXkfvxuGMt1J+gp21r8iudz4aWf3w93rlTpyGOpdvEPEUZNeferMk017/G9Qm4
 DoN+vO+vOwVCVsQ+Hqs5zSi9ukaAbf+wDnst4WVoGDLb4TnH4lb5PVTnZt//WI0Yny
 Vp3HPbUd1DZOQ==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
 Keith Busch <keith.busch@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Richard Fontana <rfontana@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/19 1:48 PM, Leonardo Bras wrote:
> Thanks for the feedback,
> 
> On Mon, 2019-09-23 at 13:39 -0700, John Hubbard wrote:
>> Please remember to include linux-mm if there is a v2.
> 
> Sure, I will include on v3.
> 
>> Nit: seems like it would be nicer to just put it all in one place, and use
>> positive logic, and also I think people normally don't compress the empty
>> functions quite that much. So like this:
> 
> I did this by following the default on the rest of this file.
> As you can see, all other features use the standard of 
> #ifndef SOMETHING
> dummy/generic functions
> #endif
> 
> Declaring the functions become responsibility of the arch.

I noticed that, but...well, I guess you're right.  Follow the way
it is. :)

thanks,
-- 
John Hubbard
NVIDIA

> 
>> #ifdef __HAVE_ARCH_LOCKLESS_PGTBL_WALK_COUNTER
>> void start_lockless_pgtbl_walk(struct mm_struct *mm); 
>> void end_lockless_pgtbl_walk(struct mm_struct *mm); 
>> int running_lockless_pgtbl_walk(struct mm_struct *mm); 
>>
>> #else
>> static inline void start_lockless_pgtbl_walk(struct mm_struct *mm)
>> {
>> }
>> static inline void end_lockless_pgtbl_walk(struct mm_struct *mm)
>> {
>> }
>> static inline int running_lockless_pgtbl_walk(struct mm_struct *mm)
>> {
>>         return 0;
>> }
>> #endif
>>
>> thanks,

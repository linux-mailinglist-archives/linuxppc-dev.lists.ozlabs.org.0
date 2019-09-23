Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326BBBD9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 23:10:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ccRm6wJRzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 07:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.143; helo=hqemgate14.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="SzjH/eLj"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ccPy6CqVzDqF1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 07:09:10 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d8934750000>; Mon, 23 Sep 2019 14:09:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 14:09:06 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 23 Sep 2019 14:09:06 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 21:09:06 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 21:09:05 +0000
Subject: Re: [PATCH v2 03/11] mm/gup: Applies counting method to monitor
 gup_pgd_range
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <20190920195047.7703-1-leonardo@linux.ibm.com>
 <20190920195047.7703-4-leonardo@linux.ibm.com>
 <2e060677-eadf-c32e-d8c5-8e22c8ca118e@nvidia.com>
 <907304d0599684b3caa6773197fd40e09191b48e.camel@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <badc1d09-a5aa-5252-f166-6ddc04891674@nvidia.com>
Date: Mon, 23 Sep 2019 14:09:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <907304d0599684b3caa6773197fd40e09191b48e.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569272949; bh=kycOKYOOy2iryJBYhGlRwbaTdWBiie5Bq6/GCZS4hXY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=SzjH/eLjKmhoLsdLthIYRULuajkjfzwsxC5cfvPeKprHP8ZqFqoKlhre8Y1SfJQj3
 WaoQI9wPCALeDOlyagDvFrHv8Pw6R6ibBycSeS5yMmiQWSKwjCh0Slsz3xXcQk1dV8
 ZWYS9OT+/LcNisMDc390NxXpY8/KfZX9PDlMNAogbG08JCCLsSW5gychxYlRiLznj+
 usbrB071y1DteIXCchE/i1a3XpyCvlL7Iz11URRwYsFCTNXObwY9n8jU/ulx/6jH/Q
 PAopijqQbEHIp+wMsdVGyVXtZbWaqv31O+cDq7ycB1fMkj9bGjwiqTkSCP80EFj2tt
 wPdc9SXpgIw4g==
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

On 9/23/19 2:01 PM, Leonardo Bras wrote:
> On Mon, 2019-09-23 at 13:27 -0700, John Hubbard wrote:
>> I'd also like a second opinion from the "core" -mm maintainers, but it seems like
>> there is now too much code around the gup_pgd_range() call. Especially since there
>> are two places where it's called--did you forget the other one in 
>> __get_user_pages_fast(), btw??
>>
> Oh, sorry, I missed this one. I will put it on v3.
> (Also I will make sure to include linux-mm on v3.)
> 
>> Maybe the irq handling and atomic counting should be moved into start/finish
>> calls, like this:
>>
>>      start_gup_fast_walk()
>>      gup_pgd_range()
>>      finish_gup_fast_walk()
> 
> There are cases where interrupt disable/enable is not done around the
> lockless pagetable walk.
> It may come from functions called above on stack, that's why I opted it
> to be only the atomic operation.
> 

That doesn't prevent you from writing the above as shown, though, for mm/gup.c.

(Also, let's see on the other thread if it is even valid to be indicating
a lockless walk, without also disabling interrupts.)

thanks,
-- 
John Hubbard
NVIDIA

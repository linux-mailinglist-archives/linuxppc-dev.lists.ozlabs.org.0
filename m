Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1361BBCD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 22:29:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbWb07hgzDqLb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 06:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="YAC7bHog"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbTH29BhzDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 06:26:58 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d892a8f0000>; Mon, 23 Sep 2019 13:26:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 23 Sep 2019 13:26:49 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 23 Sep 2019 13:26:49 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:26:49 +0000
Received: from [10.110.48.28] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Sep
 2019 20:26:48 +0000
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
 <8706a1f1-0c5e-d152-938b-f355b9a5aaa8@nvidia.com>
 <dc9fad3577551d34ead36c0f7340a573086c0cab.camel@linux.ibm.com>
 <1568b3ef-cec9-bf47-edaa-c775c2f544fb@nvidia.com>
 <c64d34118542d5c2d31b8f6b7802d2a29dac71ef.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b72cb1db-c341-4963-1a8b-ae71fe936458@nvidia.com>
Date: Mon, 23 Sep 2019 13:26:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c64d34118542d5c2d31b8f6b7802d2a29dac71ef.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569270415; bh=UcV4RD8PsGQCI3ECb3gttt6xlL6KcQV1be+lYQ3oGQI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=YAC7bHogRtgPIDCGrAn3YjCzVWsG5mEgDTDxy0IU3+mLwhkIoPNwCzaPmkkGtXzRh
 weRUFOOJlmEy9Sz/dY9f8f5cKPG1i70XQiy0zvGnTY5jMbye/VHXDpEJR1T4o9OGfB
 o5WA9AES+CeS38or7OUyrSaC45pGe6tGv65N4z6JbSKira2HQY3Jd2VySTKp5W9J/A
 CALJkz1Yl/xD5KTzh+NhlrunFa876dbixft662iNenv3iHTZjqNQKPesiqAn+5QdIw
 VlJgjCTT0PkI3TlMJExnI6O/TNKmCor4h/aJX5/1Aec/7io6PzXmjPa3eI64+ugo81
 M/LHDE08SxMkA==
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Richard Fontana <rfontana@redhat.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Keith Busch <keith.busch@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/19 1:23 PM, Leonardo Bras wrote:
> On Mon, 2019-09-23 at 12:58 -0700, John Hubbard wrote:
>>
>> CPU 0                            CPU 1
>> ------                         --------------
>>                                READ(pte) (re-ordered at run time)
>>                                atomic_inc(val) (no run-time memory barrier!)
>>                            
>> pmd_clear(pte)
>> if (val)
>>     run_on_all_cpus(): IPI
>>                                local_irq_disable() (also not a mem barrier)
>>
>>                                if(pte)
>>                                   walk page tables
> 
> Let me see if I can understand,
> On most patches, it would be:
> 
> CPU 0                            CPU 1
> ------				--------------
> 				ptep = __find_linux_pte  
> 				(re-ordered at run time)
> 				atomic_inc(val) 
> pmd_clear(pte)
> smp_mb()
> if (val)
>     run_on_all_cpus(): IPI
>                                local_irq_disable() 
> 
>                                if(ptep)
>                                   pte = *ptep;
> 
> Is that what you meant?
> 
> 

Yes.

thanks,
-- 
John Hubbard
NVIDIA

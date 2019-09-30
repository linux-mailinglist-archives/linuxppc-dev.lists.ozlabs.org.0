Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D49C25E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 20:01:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hqwX60qPzDqN9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 04:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nvidia.com
 (client-ip=216.228.121.64; helo=hqemgate15.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="SmdwlCKj"; 
 dkim-atps=neutral
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hqsx4DRXzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 03:59:32 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d9242870000>; Mon, 30 Sep 2019 10:59:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 30 Sep 2019 10:59:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 30 Sep 2019 10:59:27 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 17:59:27 +0000
Received: from [10.2.173.141] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Sep
 2019 17:59:26 +0000
Subject: Re: [PATCH v4 01/11] powerpc/mm: Adds counting method to monitor
 lockless pgtable walks
To: Leonardo Bras <leonardo@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <kvm-ppc@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
 <20190927234008.11513-2-leonardo@linux.ibm.com>
 <4ff1e8e8-929b-9cfc-9bf8-ee88e34de888@nvidia.com>
 <2533a13f226a6e1fab387669b6cced2aa8d2e129.camel@linux.ibm.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <48bf32ca-5d3e-5d69-4cd1-6720364a0d81@nvidia.com>
Date: Mon, 30 Sep 2019 10:57:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2533a13f226a6e1fab387669b6cced2aa8d2e129.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1569866375; bh=ida5NqYozcHsuQU0dgyz8EHV8y2ExlP90sInt7HRND4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=SmdwlCKjTZ+a+Cb3C2kWIEHJFaIrrAUy8mamA5p9yPYcDeKEUc3vBUd9LATvsLusU
 /XdXUFqrwMc8vNmqfFLjmbm8Ph/KPeIqr0B4ZsqRUDRjfcUisQDTB73NSBVk3a3p8x
 IzsUs0ly7yhI3/d3xNuFOHshq5QR9xw1S0PXhHTofoCXY74b5xY+iWJ5yCSGuOWHYd
 VBpMlM3WQFuQiiNxDaD2tJP+7wtdt7XbokYT0dvK54APzUTRbLR2wyKl3do65uGjWF
 cBcFt/9WpKt6c5n5cl4a37M5zW7VRK91+UYeIxxfQAw7ig06qycHkdqySjZrtEYeOu
 d4CxRscpuQBgQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Nicholas
 Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Keith Busch <keith.busch@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>, Mahesh
 Salgaonkar <mahesh@linux.vnet.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ira Weiny <ira.weiny@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/30/19 8:14 AM, Leonardo Bras wrote:
> On Sun, 2019-09-29 at 15:40 -0700, John Hubbard wrote:
>> Hi, Leonardo,
> 
> Hello John, thanks for the feedback.
> 
>> Can we please do it as shown below, instead (compile-tested only)?
>>
>> This addresses all of the comments that I was going to make about structure
>> of this patch, which are:
>>
>> * The lockless synch is tricky, so it should be encapsulated in function
>>     calls if possible.
> 
> As I told before, there are cases where this function is called from
> 'real mode' in powerpc, which doesn't disable irqs and may have a
> tricky behavior if we do. So, encapsulate the irq disable in this
> function can be a bad choice.

You still haven't explained how this works in that case. So far, the
synchronization we've discussed has depended upon interrupt disabling
as part of the solution, in order to hold off page splitting and page
table freeing.

Simply skipping that means that an additional mechanism is required...which
btw might involve a new, ppc-specific routine, so maybe this is going to end
up pretty close to what I pasted in after all...

> 
> Of course, if we really need that, we can add a bool parameter to the
> function to choose about disabling/enabling irqs.
>>
>> * This is really a core mm function, so don't hide it away in arch layers.
>>     (If you're changing mm/ files, that's a big hint.)
> 
> My idea here is to let the arch decide on how this 'register' is going
> to work, as archs may have different needs (in powerpc for example, we
> can't always disable irqs, since we may be in realmode).
> 
> Maybe we can create a generic function instead of a dummy, and let it
> be replaced in case the arch needs to do so.

Yes, that might be what we need, if it turns out that ppc can't use this
approach (although let's see about that).


thanks,
-- 
John Hubbard
NVIDIA

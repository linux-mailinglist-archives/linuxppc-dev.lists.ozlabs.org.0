Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF64156163
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 23:56:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DrJk5M6yzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 09:56:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=qqXHc6wK; dkim-atps=neutral
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DrGS4LgLzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 09:54:40 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3dea6a0001>; Fri, 07 Feb 2020 14:53:30 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 14:54:30 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 07 Feb 2020 14:54:30 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 22:54:30 +0000
Subject: Re: [PATCH v6 02/11] mm/gup: Use functions to track lockless pgtbl
 walks on gup_pgd_range
To: Leonardo Bras <leonardo@linux.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton
 <akpm@linux-foundation.org>, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Steven Price <steven.price@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Balbir
 Singh <bsingharora@gmail.com>, Reza Arbab <arbab@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Rapoport
 <rppt@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>
References: <20200206030900.147032-1-leonardo@linux.ibm.com>
 <20200206030900.147032-3-leonardo@linux.ibm.com>
 <760c238043196e0628c8c0eff48a8e938ef539ba.camel@linux.ibm.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0c2f5a89-4890-fd84-6a6d-e470ba110399@nvidia.com>
Date: Fri, 7 Feb 2020 14:54:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <760c238043196e0628c8c0eff48a8e938ef539ba.camel@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581116011; bh=hL0GxG3AZWC0D09Bdwot9dPs+jKalw2embmHLRKcnSQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qqXHc6wKJGDUDF5WUptm+LMkjfedSjWuOu7hMwGWAEkS/3j+Ej1V3oKUpca41Ng0y
 urYrrpUGJl5PZBrXWCNaNq1r74YQg17xXkIfJEWZ2ETV4sIRQXyC3DDK3t90yWS7il
 ZXJ/nzwWmzLVsoVKwO280dnaulqiEx3taYp7fGo5yaPYHNGnw7pCZS5Qjxa7jYDPsD
 BSwO7rSz/qtqmDQuTXDD1olCWd+q6M4eHN1MgscfP2hM2HIwSt7OPQQwDfmfujj3As
 e0W9hTPErF+Jl0u4dsX/7aGtT+P4HJYVsa+n+JpAOCxoK109dMJE9yLaNhzZA5BrNc
 GSGJo2lJJ8LpQ==
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/5/20 7:25 PM, Leonardo Bras wrote:
> On Thu, 2020-02-06 at 00:08 -0300, Leonardo Bras wrote:
>>                 gup_pgd_range(addr, end, gup_flags, pages, &nr);
>> -               local_irq_enable();
>> +               end_lockless_pgtbl_walk(IRQS_ENABLED);
>>                 ret = nr;
>>         }
>>  
> 
> Just noticed IRQS_ENABLED is not available on other archs than ppc64.
> I will fix this for v7.
> 

What's the fix going to look like, approximately?


thanks,
-- 
John Hubbard
NVIDIA

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C378C2A0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:43:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=CJy1hrkt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vbd7m6XTrz3cby
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 04:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=CJy1hrkt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 590 seconds by postgrey-1.37 at boromir; Sat, 11 May 2024 04:43:11 AEST
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vbd7340bhz30St
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 04:43:11 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8AD098286B62;
	Fri, 10 May 2024 13:33:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 6_lArAH4eB26; Fri, 10 May 2024 13:33:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BE7B9828545C;
	Fri, 10 May 2024 13:33:15 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BE7B9828545C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1715365995; bh=/XIFIR9y/2aocYtN3V2XjaxnPUosdNnwRa6IYBoAXzA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=CJy1hrktEB9x2OiZs64ig8A6vj/hAO/TrVpn4xyLbZrYt1jiF5E6+9uKZ8lcnwXhs
	 UTYcm1KtnLbVMzjSISe55+IxF/BbadMrJ3848lhIIXnj9P2J3ZR3iypriRFHaJsL0I
	 MYgsa2Nqe9lxgudeG0G8f12VdNsjaUYb2e4/U6/w=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DW4fhZglJ2dW; Fri, 10 May 2024 13:33:15 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id CCE2E82853A8;
	Fri, 10 May 2024 13:33:14 -0500 (CDT)
Message-ID: <202e8af6-8073-4d87-a38f-746644bb338d@raptorengineering.com>
Date: Fri, 10 May 2024 13:33:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/6] powerpc: pSeries: vfio: iommu: Re-enable
 support for SPAPR TCE VFIO
To: Jason Gunthorpe <jgg@ziepe.ca>, Shivaprasad G Bhat <sbhat@linux.ibm.com>
References: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
 <20240501140942.GA1723318@ziepe.ca>
 <703f15b0-d895-4518-9886-0827a6c4e769@amd.com>
 <8c28a1d5-ac84-445b-80e6-a705e6d7ff1b@linux.ibm.com>
 <20240506174357.GF901876@ziepe.ca>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240506174357.GF901876@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: tpearson@raptorengineering.com, robh@kernel.org, mahesh@linux.ibm.com, jroedel@suse.de, gbatra@linux.vnet.ibm.com, kvm@vger.kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org, npiggin@gmail.com, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, alex.williamson@redhat.com, oohall@gmail.com, joel@jms.id.au, ruscur@russell.cc, brking@linux.vnet.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/6/24 12:43 PM, Jason Gunthorpe wrote:
> On Sat, May 04, 2024 at 12:33:53AM +0530, Shivaprasad G Bhat wrote:
>> We have legacy workloads using VFIO in userspace/kvm guests running
>> on downstream distro kernels. We want these workloads to be able to
>> continue running on our arch.
> 
> It has been broken since 2018, I don't find this reasoning entirely
> reasonable :\
>

Raptor is currently working on an automated test runner setup to
exercise the VFIO subsystem on PowerNV and (to a lesser extent) pSeries,
so breakages like this going forward will hopefully be caught much more
quickly.

>> I firmly believe the refactoring in this patch series is a step in
>> that direction.
> 
> But fine, as long as we are going to fix it. PPC really needs this to
> be resolved to keep working.
>

Agreed. Modernizing/de-cluttering PPC's IOMMU code in general is another
task that we're working towards. As mentioned previously on the list,
we're working towards a more standard IOMMU driver for PPC that can be
used with dma_iommu, which I think will be a good step towards cleaning
this up. Initially PowerNV is going to be our target, but to the extent
that it is possible and useful, pSeries support could be brought in
later.

> Jason

Thanks,
Shawn

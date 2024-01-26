Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A883DDB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:40:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ZNQ6O6b4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM22y1jKjz3cb8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=ZNQ6O6b4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM22B1cJfz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:40:02 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E6FDE8284F1B;
	Fri, 26 Jan 2024 09:39:59 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ky2a-k1hCssy; Fri, 26 Jan 2024 09:39:59 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D322782854B8;
	Fri, 26 Jan 2024 09:39:58 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D322782854B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1706283598; bh=OoH5zbIDpJ396eDy00lpvlhmn5YGipLNWyOVCXIxgwA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ZNQ6O6b4mOaP6wy15ucg53rS7Hz3n8WNMxH9tAlODg32Ac+qNaqLgx5lQ0DTT8rdh
	 t2LEG8qSuyTGN4ZIA2ajj6NaCNvubCswJRn6u6jlUux0bR3RwCuxeTeRrRVYbmmdTQ
	 94Q4APuxwOswDXRHPHiNP/t48za48GveP4oVJVA8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uQvmigmfI0wM; Fri, 26 Jan 2024 09:39:58 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8E9328284F1B;
	Fri, 26 Jan 2024 09:39:58 -0600 (CST)
Date: Fri, 26 Jan 2024 09:39:56 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <1453449220.10126352.1706283596477.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20240126153806.GA50608@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com> <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com> <20240125155017.GW50608@ziepe.ca> <b825dd04-3d32-4fbd-91e3-523ddf96fc7a@linux.ibm.com> <20240126151701.GZ50608@ziepe.ca> <392247278.10124607.1706282995795.JavaMail.zimbra@raptorengineeringinc.com> <20240126153806.GA50608@ziepe.ca>
Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC112 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: iommu: Bring back table group release_ownership() call
Thread-Index: LjsszU7HTiVuL5lSzea+joNjeMRWPw==
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
Cc: jroedel <jroedel@suse.de>, gbatra <gbatra@linux.vnet.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, iommu <iommu@lists.linux.dev>, npiggin <npiggin@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, aneesh kumar <aneesh.kumar@kernel.org>, Timothy Pearson <tpearson@raptorengineering.com>, bgray <bgray@linux.ibm.com>, naveen n rao <naveen.n.rao@linux.ibm.com>, vaibhav <vaibhav@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, aik <aik@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Jason Gunthorpe" <jgg@ziepe.ca>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, "iommu" <iommu@lists.linux.dev>, "linuxppc-dev"
> <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Michael Ellerman"
> <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>, "christophe leroy" <christophe.leroy@csgroup.eu>, "aneesh kumar"
> <aneesh.kumar@kernel.org>, "naveen n rao" <naveen.n.rao@linux.ibm.com>, "jroedel" <jroedel@suse.de>, "aik"
> <aik@amd.com>, "bgray" <bgray@linux.ibm.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "gbatra"
> <gbatra@linux.vnet.ibm.com>, "vaibhav" <vaibhav@linux.ibm.com>
> Sent: Friday, January 26, 2024 9:38:06 AM
> Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group release_ownership() call

> On Fri, Jan 26, 2024 at 09:29:55AM -0600, Timothy Pearson wrote:
>> > On Fri, Jan 26, 2024 at 08:43:12PM +0530, Shivaprasad G Bhat wrote:
>> >> > Also, is there any chance someone can work on actually fixing this to
>> >> > be a proper iommu driver? I think that will become important for power
>> >> > to use the common dma_iommu code in the next year...
>> >> We are looking into it.
>> > 
>> > Okay, let me know, I can possibly help make parts of this happen
>> > 
>> > power is the last still-current architecture to be outside the modern
>> > IOMMU and DMA API design and I'm going to start proposing things that
>> > will not be efficient on power because of this.
>> 
>> I can get development resources on this fairly rapidly, including
>> testing.  We should figure out the best way forward and how to deal
>> with the VFIO side of things, even if that's a rewrite at the end of
>> the day the machine-specific codebase isn't *that* large for our two
>> target flavors (64-bit PowerNV and 64-bit pSeries).
> 
> I have a feeling the way forward is to just start a power driver under
> drivers/iommu/ and use kconfig to make the user exclusively select
> either the legacy arch or the modern iommu.
> 
> Get that working to a level where dma_iommu is happy.
> 
> Get iommufd support in the new driver good enough to run your
> application.
> 
> Just forget about the weird KVM and SPAPR stuff, leave it under the
> kconfig of the old code and nobody will run it. Almost nobody already
> runs it, apparently.

We actually use QEMU/KVM/VFIO extensively at Raptor, so need the support and need it to be performant...

> Remove it in a few years
> 
> From what I remember the code under the arch directory is already very
> nearly almost an iommu driver. I think someone could fairly quickly
> get to something working and using dma_iommu.c. If s390 is any
> experience there is some benchmarking and tweaking to get performance
> equal to the arch's tweaked dma_iommu copy.
> 
> Jason

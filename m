Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C878804F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:37:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=bZRSuirt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzgSf6ltfz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 05:37:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=bZRSuirt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzgRt64jPz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 05:36:58 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6486482853FD;
	Tue, 19 Mar 2024 13:36:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zNGRQb1hjFIX; Tue, 19 Mar 2024 13:36:53 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 95ED982857C6;
	Tue, 19 Mar 2024 13:36:53 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 95ED982857C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710873413; bh=jjl+qmMtiRVpAUsU+d+UXWZRLmd8K+2jgNQsp7lj+04=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=bZRSuirtYJVJx6DLzBTldOSSqPcXRGEoyzhi4eq6ezoK3oOseSQDCxWemf+VcT27i
	 P/2bOL4Vy81473wmz5gBDMJvZNe96fzmvW6jtLHauh0qPnwNM/o/JoLAm8dX1OX4HK
	 pEZEQTCZDnUY8x8A6J7bhD/nF/t+H+0XQdN7gKfc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id C_5K4lh6-1JZ; Tue, 19 Mar 2024 13:36:53 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 531A182853FD;
	Tue, 19 Mar 2024 13:36:53 -0500 (CDT)
Date: Tue, 19 Mar 2024 13:36:51 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <1386271253.24278379.1710873411133.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20240319143202.GA66976@ziepe.ca>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com> <171026725393.8367.17497620074051138306.stgit@linux.ibm.com> <20240319143202.GA66976@ziepe.ca>
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/iommu: Bring back userspace
 view for single level TCE tables
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC122 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc/pseries/iommu: Bring back userspace view for single level TCE tables
Thread-Index: eRa4lP8lSoGisWT5ua6Vo0RITwt14g==
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel <jroedel@suse.de>, gbatra <gbatra@linux.vnet.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Alex Williamson <alex.williamson@redhat.com>, npiggin <npiggin@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, aneesh kumar <aneesh.kumar@kernel.org>, brking@linux.vnet.ibm.com, Timothy Pearson <tpearson@raptorengineering.com>, kvm <kvm@vger.kernel.org>, naveen n rao <naveen.n.rao@linux.ibm.com>, vaibhav <vaibhav@linux.ibm.com>, msuchanek@suse.de, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, aik <aik@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Jason Gunthorpe" <jgg@ziepe.ca>
> To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>
> Cc: "Timothy Pearson" <tpearson@raptorengineering.com>, "Alex Williamson" <alex.williamson@redhat.com>, "linuxppc-dev"
> <linuxppc-dev@lists.ozlabs.org>, "Michael Ellerman" <mpe@ellerman.id.au>, "npiggin" <npiggin@gmail.com>, "christophe
> leroy" <christophe.leroy@csgroup.eu>, "aneesh kumar" <aneesh.kumar@kernel.org>, "naveen n rao"
> <naveen.n.rao@linux.ibm.com>, "gbatra" <gbatra@linux.vnet.ibm.com>, brking@linux.vnet.ibm.com, "Alexey Kardashevskiy"
> <aik@ozlabs.ru>, robh@kernel.org, "linux-kernel" <linux-kernel@vger.kernel.org>, "kvm" <kvm@vger.kernel.org>, "aik"
> <aik@amd.com>, msuchanek@suse.de, "jroedel" <jroedel@suse.de>, "vaibhav" <vaibhav@linux.ibm.com>, svaidy@linux.ibm.com
> Sent: Tuesday, March 19, 2024 9:32:02 AM
> Subject: Re: [RFC PATCH 1/3] powerpc/pseries/iommu: Bring back userspace view for single level TCE tables

> On Tue, Mar 12, 2024 at 01:14:20PM -0500, Shivaprasad G Bhat wrote:
>> The commit 090bad39b237a ("powerpc/powernv: Add indirect levels to
>> it_userspace") which implemented the tce indirect levels
>> support for PowerNV ended up removing the single level support
>> which existed by default(generic tce_iommu_userspace_view_alloc/free()
>> calls). On pSeries the TCEs are single level, and the allocation
>> of userspace view is lost with the removal of generic code.
> 
> :( :(
> 
> If this has been broken since 2018 and nobody cared till now can we
> please go in a direction of moving this code to the new iommu APIs
> instead of doubling down on more of this old stuff that apparently
> almost nobody cares about ??
> 
> Jason

Just FYI Raptor is working on porting things over to the new APIs.  RFC patches should be posted in the next week or two.

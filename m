Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E188666C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 06:50:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nZ6LzF89;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1BJ61lwhz3f0P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 16:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nZ6LzF89;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1BHM1Qz5z3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 16:49:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711086589;
	bh=3dxZ97h1bBewqFSrSCxZ0u2xq2+UB+rYnjeTo4PLAV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nZ6LzF89AlrxXzDXd3QYUcFV677SbDrpe7d8wTOKSI9z4sQrwflKXJiuKHFQPldHU
	 2zc466eC0WPNUECV45Sx3Xt0p3N3asRi0s9bzaBSan6JBwr3zOhhUVUrDs1T62ksm4
	 /W+rwkWmzx4DevQBKw1AJzPA5t1pSanKbIirVQKOl1jZT0nVbCmeAEmBtTx/5gJ6ZV
	 tqX6f6KtRH8uWu+PuXX29MEoCpJrX1QM48JFOi26G9jIV+8ciPHjHOwSGf2Y6qiB9B
	 GXhmKc0DU09lOC4tOeZLYPTsZblimmwcieKRF01BNk/vB3B1f4up32uBu2biiUybfD
	 VUSx1SnXOjBrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V1BHF6qs1z4wcF;
	Fri, 22 Mar 2024 16:49:45 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Gunthorpe <jgg@ziepe.ca>, Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [RFC PATCH 1/3] powerpc/pseries/iommu: Bring back userspace
 view for single level TCE tables
In-Reply-To: <20240319143202.GA66976@ziepe.ca>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
 <171026725393.8367.17497620074051138306.stgit@linux.ibm.com>
 <20240319143202.GA66976@ziepe.ca>
Date: Fri, 22 Mar 2024 16:49:43 +1100
Message-ID: <877chuke88.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, kvm@vger.kernel.org, gbatra@linux.vnet.ibm.com, aik@ozlabs.ru, alex.williamson@redhat.com, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, tpearson@raptorengineering.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Gunthorpe <jgg@ziepe.ca> writes:
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

It's broken *on pseries* (Linux as a guest), but it works fine on
powernv (aka bare metal, aka Linux as Hypervisor).

What's changed is folks are now testing it on pseries with Linux as a
nested hypervisor.

cheers

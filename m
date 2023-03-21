Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C67806C2F1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 11:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgnzY4xrTz3chZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:34:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NmottEFE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgnyc5WfBz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 21:34:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NmottEFE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pgnyc0xzqz4whr;
	Tue, 21 Mar 2023 21:33:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679394840;
	bh=AZBxZBErI7bC11AKURL/fDXfLU64bJPXSy0jubRl/1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NmottEFE7a/dSPZAqpGNXOii0lvujqTNochXP/A2xjAxplMCo5826IR1XghamjbiL
	 yBpJ7GT3bcNmN1deVy1dV3s71td0RwyFWQBVmTSYcYgtIK0Yd3ToyCYatSo1M6ZtOM
	 AUFiFuRX9nBBXh7VzgpryEqIaEaSJcInnAEAiIXjAhq5CwXr7lsNqeYWpDXQsZD1yC
	 FvFVoFaYwdpglqTvVEIiWXY2hEhxzLUZ1apH0PTozTjG18Mug0uoThZTqi1lE3Q2pR
	 G60to+oMPHhrnORuRrotwGqP7DuGb0aPkLouHl0yfzxeeIo4z63kZoY8ZfEE61X+41
	 0ATiOG3XCzYCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
In-Reply-To: <2099448392.25626899.1679166370571.JavaMail.zimbra@raptorengineeringinc.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
 <87bkl2ywz2.fsf@mpe.ellerman.id.au>
 <1816556668.17777469.1678390100763.JavaMail.zimbra@raptorengineeringinc.com>
 <2099448392.25626899.1679166370571.JavaMail.zimbra@raptorengineeringinc.com>
Date: Tue, 21 Mar 2023 21:33:57 +1100
Message-ID: <877cvav1ey.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Timothy Pearson <tpearson@raptorengineering.com> writes:
> ----- Original Message -----
>> From: "Timothy Pearson" <tpearson@raptorengineering.com>
>> To: "Michael Ellerman" <mpe@ellerman.id.au>
>> Cc: "Timothy Pearson" <tpearson@raptorengineering.com>, "kvm" <kvm@vger.kernel.org>, "linuxppc-dev"
>> <linuxppc-dev@lists.ozlabs.org>
>> Sent: Thursday, March 9, 2023 1:28:20 PM
>> Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
>
>> ----- Original Message -----
>>> From: "Michael Ellerman" <mpe@ellerman.id.au>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "kvm"
>>> <kvm@vger.kernel.org>
>>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>>> Sent: Thursday, March 9, 2023 5:40:01 AM
>>> Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
>> 
>>> Timothy Pearson <tpearson@raptorengineering.com> writes:
>>>> This patch series reenables VFIO support on POWER systems.  It
>>>> is based on Alexey Kardashevskiys's patch series, rebased and
>>>> successfully tested under QEMU with a Marvell PCIe SATA controller
>>>> on a POWER9 Blackbird host.
>>>>
>>>> Alexey Kardashevskiy (3):
>>>>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>>>>   powerpc/pci_64: Init pcibios subsys a bit later
>>>>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>>>>     domains
>>> 
>>> As sent the patches had lost Alexey's authorship (no From: line), I
>>> fixed it up when applying so the first 3 are authored by Alexey.
>>> 
>>> cheers
>> 
>> Thanks for catching that, it wasn't intentional.  Probably used a wrong Git
>> command...
>
> Just wanted to touch base on the patches, since they're still listed as Under Review on patchwork.  Are we good to go for the 6.4 merge window?

They've been in my next (and so linux-next), since last week. I just
haven't updated patchwork yet.

So yeah they are on track to go into mainline during the v6.4 merge window.

cheers

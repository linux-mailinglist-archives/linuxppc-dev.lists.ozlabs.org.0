Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9766BFC3E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 20:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pf9V81KsMz3f4X
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 06:07:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=PoMVTuDZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=PoMVTuDZ;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pf9T72sjZz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 06:06:17 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 7D78737E3A91F5;
	Sat, 18 Mar 2023 14:06:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vOHgNumnWw4D; Sat, 18 Mar 2023 14:06:11 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E149037E3A91F1;
	Sat, 18 Mar 2023 14:06:10 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E149037E3A91F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1679166370; bh=tFEPMhwT34mK+wj8HRIYX2GIZdNKI6YHgf1brhfccmY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=PoMVTuDZc1o5xO9fmDK9sCAyFnT/Icm6H51WwPWnaukwPqRdP+s/xsxSXx06rngxP
	 QRjA3iyhCNMfcYMfergEfdRDvmcKmfN9H4K3oT+T8H0Ps16sp6J1RLfUss0LEvsP6i
	 NiXThxKLqBm/t8L6ITQKMeyzx+T6fWghj58s4Xv0=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VYnaHQQPHGN4; Sat, 18 Mar 2023 14:06:10 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B72FA37E3A91EE;
	Sat, 18 Mar 2023 14:06:10 -0500 (CDT)
Date: Sat, 18 Mar 2023 14:06:10 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <2099448392.25626899.1679166370571.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1816556668.17777469.1678390100763.JavaMail.zimbra@raptorengineeringinc.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com> <87bkl2ywz2.fsf@mpe.ellerman.id.au> <1816556668.17777469.1678390100763.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC111 (Linux)/8.5.0_GA_3042)
Thread-Topic: Reenable VFIO support on POWER systems
Thread-Index: 5A2fst0q4NGeOTQFqq+CS6XF3WZlK3dFiO0I
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



----- Original Message -----
> From: "Timothy Pearson" <tpearson@raptorengineering.com>
> To: "Michael Ellerman" <mpe@ellerman.id.au>
> Cc: "Timothy Pearson" <tpearson@raptorengineering.com>, "kvm" <kvm@vger.kernel.org>, "linuxppc-dev"
> <linuxppc-dev@lists.ozlabs.org>
> Sent: Thursday, March 9, 2023 1:28:20 PM
> Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems

> ----- Original Message -----
>> From: "Michael Ellerman" <mpe@ellerman.id.au>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "kvm"
>> <kvm@vger.kernel.org>
>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> Sent: Thursday, March 9, 2023 5:40:01 AM
>> Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
> 
>> Timothy Pearson <tpearson@raptorengineering.com> writes:
>>> This patch series reenables VFIO support on POWER systems.  It
>>> is based on Alexey Kardashevskiys's patch series, rebased and
>>> successfully tested under QEMU with a Marvell PCIe SATA controller
>>> on a POWER9 Blackbird host.
>>>
>>> Alexey Kardashevskiy (3):
>>>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>>>   powerpc/pci_64: Init pcibios subsys a bit later
>>>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>>>     domains
>> 
>> As sent the patches had lost Alexey's authorship (no From: line), I
>> fixed it up when applying so the first 3 are authored by Alexey.
>> 
>> cheers
> 
> Thanks for catching that, it wasn't intentional.  Probably used a wrong Git
> command...

Just wanted to touch base on the patches, since they're still listed as Under Review on patchwork.  Are we good to go for the 6.4 merge window?

Thanks!

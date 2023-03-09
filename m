Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A926B2D92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 20:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXfPm3Gr6z3chZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 06:29:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=hvo0srl2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=hvo0srl2;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXfNq4yGFz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:28:26 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B3A4F37E30F1CD;
	Thu,  9 Mar 2023 13:28:23 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jGN-8Xydj9s9; Thu,  9 Mar 2023 13:28:21 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E9E2137E30F1C5;
	Thu,  9 Mar 2023 13:28:20 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E9E2137E30F1C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678390101; bh=CbCsmLeX1ddXkdY4a/6wh2/kLAFwgvzxaddcb7TsXOg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=hvo0srl2W1wk/0z2PB6k0D1eYDMw88uUE9wZw4OFoEkiqFEXVwVYwmCfafJN+Pqb+
	 p/lup1bjmyKawNSvlZdUEOan4eLhURzMnlHXnC1iOIs5AZ5bQecVxsB28gP/l+IHLA
	 MXBXLV6oHsmH7EwsLYveQDgia9kHbhNMHaQkRS+o=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3QKyq8qYSowy; Thu,  9 Mar 2023 13:28:20 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C417637E30F1BE;
	Thu,  9 Mar 2023 13:28:20 -0600 (CST)
Date: Thu, 9 Mar 2023 13:28:20 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <1816556668.17777469.1678390100763.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <87bkl2ywz2.fsf@mpe.ellerman.id.au>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com> <87bkl2ywz2.fsf@mpe.ellerman.id.au>
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC111 (Linux)/8.5.0_GA_3042)
Thread-Topic: Reenable VFIO support on POWER systems
Thread-Index: 5A2fst0q4NGeOTQFqq+CS6XF3WZlKw==
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
Cc: Timothy Pearson <tpearson@raptorengineering.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "kvm" <kvm@vger.kernel.org>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Thursday, March 9, 2023 5:40:01 AM
> Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems

> Timothy Pearson <tpearson@raptorengineering.com> writes:
>> This patch series reenables VFIO support on POWER systems.  It
>> is based on Alexey Kardashevskiys's patch series, rebased and
>> successfully tested under QEMU with a Marvell PCIe SATA controller
>> on a POWER9 Blackbird host.
>>
>> Alexey Kardashevskiy (3):
>>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>>   powerpc/pci_64: Init pcibios subsys a bit later
>>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>>     domains
> 
> As sent the patches had lost Alexey's authorship (no From: line), I
> fixed it up when applying so the first 3 are authored by Alexey.
> 
> cheers

Thanks for catching that, it wasn't intentional.  Probably used a wrong Git command...

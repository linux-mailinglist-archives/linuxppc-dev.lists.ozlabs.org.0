Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACEF5AA8CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:34:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJqRN6bGgz30Hm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YyrF+RKm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJqQp3DcQz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 17:33:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YyrF+RKm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MJqQl58dbz4x3w;
	Fri,  2 Sep 2022 17:33:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662104018;
	bh=hJz4SNP/i8v13NyeDRi0y+oMlEr1XHuTWGnDprX6daM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YyrF+RKm94p4H69k34qmNhTyfugOGBhOU1aA+9znafWxn/h4F9PHIWnES/jeymJrG
	 Otp/P6Sjl6ZBkzMpdoWscYZJV/urdVVi/ZtVji9B1j4DVjZEcdEMaAsgv8GPnPKX/J
	 0WJmvCVhTVgSRMngStPYDiUBoEf/tXQbwKJNBRqBiik7ii2FyafHLgqB1zSpTLdhzD
	 iiLxB6w6xVwGBix9fSd4eEBalk8whscbiUr7mRZh1RtCYd/FvlE1U9ULY4pf2q6fKy
	 qeqEOZJjT1enTLdk1hl2sl+p0hkG2ZKL7x061Fzi1at9SKk2H7jESsTY0clYyPHt3U
	 z8ptz8ECcdmxA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
In-Reply-To: <YxFMWs3c+m/rubVk@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
 <YxFMWs3c+m/rubVk@nvidia.com>
Date: Fri, 02 Sep 2022 17:33:30 +1000
Message-ID: <87tu5qtelx.fsf@mpe.ellerman.id.au>
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Gunthorpe <jgg@nvidia.com> writes:
> On Thu, Jul 14, 2022 at 06:18:19PM +1000, Alexey Kardashevskiy wrote:
>> Here is another take on iommu_ops on POWER to make VFIO work
>> again on POWERPC64.
>> 
>> The tree with all prerequisites is here:
>> https://github.com/aik/linux/tree/kvm-fixes-wip
>> 
>> The previous discussion is here:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220707135552.3688927-1-aik@ozlabs.ru/
>> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/
>> 
>> Please comment. Thanks.
>>
>> 
>> 
>> Alexey Kardashevskiy (3):
>>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>>   powerpc/pci_64: Init pcibios subsys a bit later
>>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>>     domains
>
> It has been a little while - and I think this series is still badly
> needed by powerpc, right?

Your comments on patch 3 left me with the impression it needed a respin,
but maybe I misread that.

Alexey's reply that it needed testing also made me think it wasn't
ready to pick up.

cheers

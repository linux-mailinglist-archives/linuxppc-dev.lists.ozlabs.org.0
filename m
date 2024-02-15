Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F38855986
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 04:37:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cjQTs2Lu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tb13C3nK6z3vXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cjQTs2Lu;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tb12Q0tJJz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 14:36:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707968201;
	bh=s71VglVzXMHExQHV0flXdlMkL0Er5JOLuJrclNyZ2YU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cjQTs2LumNQvps0w1v9ahJISdsxPzj0e6mQz9zzTwySFqnU8I+6KL4Q/lm609CWco
	 /71QVSEkdXue7HIPavkyUqbFSTskV3H32oYe8Fw2xFlwSe/8gdtDf3QidhKtPwVqz5
	 DQjGPi8tRyygya1FfuaPpxDs2N4v2Lgu9ulVOOHzx/F2UrpaZEN+NIgHkoq5Vz7Zs0
	 J2566AhsAZOR0kre8HKjn1OxEOmd8Y7iniRdfcWfTQ4ED30GRX/iW+iXM/4OMavMyp
	 HKwobuQXiN8IxYHYIy7GpK1P9NCb6plTcoPwXYTog8Nb2IG3+r+MnBXk4RXbCu+iRj
	 Fg10tpZIFsqxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tb12K1Jrjz4wcN;
	Thu, 15 Feb 2024 14:36:41 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 14
 (arch/powerpc/platforms/pseries/pci_dlpar.o)
In-Reply-To: <c501ff0a-170b-42a8-a5b7-623ebb6c7fba@infradead.org>
References: <20240214151426.0a398cf0@canb.auug.org.au>
 <c501ff0a-170b-42a8-a5b7-623ebb6c7fba@infradead.org>
Date: Thu, 15 Feb 2024 14:36:41 +1100
Message-ID: <8734tu760m.fsf@mail.lhotse>
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
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 2/13/24 20:14, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20240213:
>> 
>
> on powerpc64:
> when CONFIG_IOMMU_API is not set.
>
>
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/pci_dlpar.o: in function `init_phb_dynamic':
> pci_dlpar.c:(.text+0xc4): undefined reference to `ppc_iommu_register_device'
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/pci_dlpar.o: in function `remove_phb_dynamic':
> pci_dlpar.c:(.text+0x248): undefined reference to `ppc_iommu_unregister_device'

I'm pretty sure I reverted the commit causing that, the revert will be
in today's linux-next.

cheers

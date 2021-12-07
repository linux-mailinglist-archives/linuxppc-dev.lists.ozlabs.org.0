Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A473E46BA2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 12:36:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7dYN3Pj4z3c5d
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 22:36:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BMwzDWkP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7dXj3093z2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 22:36:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BMwzDWkP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7dXf3dSsz4xYy;
 Tue,  7 Dec 2021 22:36:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638876964;
 bh=lTsXMkBa68SdK2mCmwfpSshAWpT0dRMMMq4RDsTmMUc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BMwzDWkPEIYhXynBVAirAw4gLvuuvW+w979j7Yqtpl/UPXPORphUfbt+jK+l0pabP
 GTehyWDzuL/CjvtZ3vJKYoj5rsJPb1bnDWny7P2YlVPjCcML69cHmHBNG0AIDWe7Gz
 7IRiJMIJ4Kb9b5hGDoNDnHaxCTClNUWIJdKvD1WISOHxae57UeEHW0ELnQ3BY1ByPF
 1oPzO4gyeKDsiFe+zukx8HTbH7jtndcbjgt+u2Img9ev7FSfwZJM9PLRYWX7kshjFe
 JBwE+rXxecauzokxEZQ57uU9ynC6VsB3Nd14q1sEiH2ivRH0Hx8EhFL3DwxqA8pymw
 p3ZiZsIoOoIIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
In-Reply-To: <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
Date: Tue, 07 Dec 2021 22:36:02 +1100
Message-ID: <87ilw0odel.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> Hello Thomas,
>
> On 12/6/21 23:27, Thomas Gleixner wrote:
>> This code is broken since day one. ppc4xx_setup_msi_irqs() has the
>> following gems:
>>=20
>>   1) The handling of the result of msi_bitmap_alloc_hwirqs() is complete=
ly
>>      broken:
>>=20=20=20=20=20=20
>>      When the result is greater than or equal 0 (bitmap allocation
>>      successful) then the loop terminates and the function returns 0
>>      (success) despite not having installed an interrupt.
>>=20
>>      When the result is less than 0 (bitmap allocation fails), it prints=
 an
>>      error message and continues to "work" with that error code which wo=
uld
>>      eventually end up in the MSI message data.
>>=20
>>   2) On every invocation the file global pp4xx_msi::msi_virqs bitmap is
>>      allocated thereby leaking the previous one.
>>=20
>> IOW, this has never worked and for more than 10 years nobody cared. Remo=
ve
>> the gunk.
>>=20
>> Fixes: 3fb7933850fa ("powerpc/4xx: Adding PCIe MSI support")
>
> Shouldn't we remove all of it ? including the updates in the device trees
> and the Kconfig changes under :
>
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
> arch/powerpc/platforms/40x/Kconfig:	select PPC4xx_MSI

This patch should drop those selects I guess. Can you send an
incremental diff for Thomas to squash in?

Removing all the tendrils in various device tree files will probably
require some archaeology, and it should be perfectly safe to leave those
in the tree with the driver gone. So I think we can do that as a
subsequent patch, rather than in this series.

cheers

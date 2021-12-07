Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3194446C4D4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 21:43:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7sgt0jkPz3c8m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 07:43:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=myOlC5dg;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0V4XVUsO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=myOlC5dg; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=0V4XVUsO; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7sg92VByz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 07:42:29 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638909743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kdDUloupcZ7zsHm8ipSzMG1KhDz+bCCecRfNXSnpkg=;
 b=myOlC5dgE3khI7L8VZJuvb0AqNwW72GyeFELcD1PBbXUtZ68+3HHkLJ6B3AHqyMzsf2WT8
 +ujqWMGHpaY4rsmjld2a82Vj5AIv9LECzrGlZmnD/32El3mdYogpJBXD830FzxpM64lfFA
 4umcD+gxjhc1TVxDz7X7+HSKF/BzRb/G2QPcgdTOuekTL5TVuB7tk2FDJgZvBY12rIApXt
 6/cKg45LVQbCHkJ50Jh/VwMaNydeam+MMtnO87aLsvswM8Dg0b8u1s2wEbGXeG0S5d8b8M
 gpLncVriJOZxdr/S+hNQBS9u1GXShwEAVsplRx5hkczW+cMOAp/ZAeGaDzJRnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638909743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kdDUloupcZ7zsHm8ipSzMG1KhDz+bCCecRfNXSnpkg=;
 b=0V4XVUsOsvnU+9Fv3Fb95pdvdCgo/+dE0Mo+fVtsflMeNE/VXjrD4Tr1l/AitQqcrCl0wJ
 KhJ9aDeINWrmG3AA==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Michael Ellerman
 <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
In-Reply-To: <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
 <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
Date: Tue, 07 Dec 2021 21:42:22 +0100
Message-ID: <8735n42lld.ffs@tglx>
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

Cedric,

On Tue, Dec 07 2021 at 16:50, C=C3=A9dric Le Goater wrote:
> On 12/7/21 12:36, Michael Ellerman wrote:
>>=20
>> This patch should drop those selects I guess. Can you send an
>> incremental diff for Thomas to squash in?
>
> Sure.
>
>> Removing all the tendrils in various device tree files will probably
>> require some archaeology, and it should be perfectly safe to leave those
>> in the tree with the driver gone. So I think we can do that as a
>> subsequent patch, rather than in this series.
>
> Here are the changes. Compiled tested with ppc40x and ppc44x defconfigs.

< Lots of patch skipped />
> @@ -141,7 +138,6 @@ config REDWOOD
>   	select FORCE_PCI
>   	select PPC4xx_PCI_EXPRESS
>   	select PCI_MSI
> -	select PPC4xx_MSI
>   	help
>   	  This option enables support for the AMCC PPC460SX Redwood board.

While that is incremental it certainly is worth a patch on it's
own. Could you add a proper changelog and an SOB please?

Thanks,

        tglx

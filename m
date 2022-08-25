Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF695A0AB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 09:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCw9S0CQsz3c6w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 17:50:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DccTqgAE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCw8s5qC8z2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 17:49:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DccTqgAE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MCw8s2Q2rz4xV7;
	Thu, 25 Aug 2022 17:49:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661413773;
	bh=k/K7Js7dK6dxOfVTDaXcqeIh7AqfvCWAPYJNJN8qsTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DccTqgAEj8cQsbTwecf0Jayd3dBrvqd6U8m1Lt7V86aEL++OLOLr5xIxGu99atBxI
	 8Op6ppf0sepvXsD0m6OkdhzaHfgImYUmJPGiLiq3nJiq3ntzUck+GTN3FvFJV27GEU
	 4w0hN5KCHxMDg62pj4Q+gPJPSNhBdDSy7LVx3iHwYtaZaFf76dZGxLlkVEdYTsuVes
	 cPfKQfSYwJCazV/Fwg8Wr1BfDBHuNGe+IzPBEfhXpzHVzAtNwu/5Xk0J6aE7z/Syo7
	 WRJmfyOLeFBd2IapKcyLn3WNadQqoAlge4tptmNzYmzmPjrBmjIwoZb83LvI3srdMO
	 Qu38O06uVNhzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/pci: Enable PCI domains in /proc when PCI bus
 numbers are not unique
In-Reply-To: <20220820115113.30581-1-pali@kernel.org>
References: <20220820115113.30581-1-pali@kernel.org>
Date: Thu, 25 Aug 2022 17:49:28 +1000
Message-ID: <878rnclq47.fsf@mpe.ellerman.id.au>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pali Roh=C3=A1r <pali@kernel.org> writes:
> On 32-bit powerpc systems with more PCIe controllers and more PCI domains,
> where on more PCI domains are same PCI numbers, when kernel is compiled
> with CONFIG_PROC_FS=3Dy and CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT=3Dy
> options, kernel prints "proc_dir_entry 'pci/01' already registered" error
> message.

Thanks, I'll pick this up.

> This regression started appearing after commit 566356813082 ("powerpc/pci:
> Add config option for using all 256 PCI buses") in case in each mPCIe slot
> is connected PCIe card and therefore PCI bus 1 is populated in for every
> PCIe controller / PCI domain.
>
> The reason is that PCI procfs code expects that when PCI bus numbers are
> not unique across all PCI domains, function pci_proc_domain() returns true
> for domain dependent buses.
>
> Fix this issue by setting PCI_ENABLE_PROC_DOMAINS and PCI_COMPAT_DOMAIN_0
> flags for 32-bit powerpc code when CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> is enabled. Same approach is already implemented for 64-bit powerpc code
> (where PCI bus numbers are always domain dependent).

We also have the same in ppc4xx_pci_find_bridges().

And if we can eventually make CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
the standard behaviour on 32-bit then everything would behave the same
and we could simplify pci_proc_domain() to match what other arches do.

cheers


> Fixes: 566356813082 ("powerpc/pci: Add config option for using all 256 PC=
I buses")
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> ---
>  arch/powerpc/kernel/pci_32.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
> index ffc4e1928c80..8acbc9592ebb 100644
> --- a/arch/powerpc/kernel/pci_32.c
> +++ b/arch/powerpc/kernel/pci_32.c
> @@ -249,6 +249,15 @@ static int __init pcibios_init(void)
>=20=20
>  	printk(KERN_INFO "PCI: Probing PCI hardware\n");
>=20=20
> +#ifdef CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> +	/*
> +	 * Enable PCI domains in /proc when PCI bus numbers are not unique
> +	 * across all PCI domains to prevent conflicts. And keep PCI domain 0
> +	 * backward compatible in /proc for video cards.
> +	 */
> +	pci_add_flags(PCI_ENABLE_PROC_DOMAINS | PCI_COMPAT_DOMAIN_0);
> +#endif
> +
>  	if (pci_has_flag(PCI_REASSIGN_ALL_BUS))
>  		pci_assign_all_buses =3D 1;
>=20=20
> --=20
> 2.20.1

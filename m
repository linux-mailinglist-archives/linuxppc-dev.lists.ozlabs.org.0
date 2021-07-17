Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB23CC44B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 17:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRt1D4KtTz3bZZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 01:53:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRt0t1lmDz2yNm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 01:52:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GRt0m1gfgzB6PH;
 Sat, 17 Jul 2021 17:52:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdtv0iNFNCK8; Sat, 17 Jul 2021 17:52:40 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GRt0m0WdyzB6G4;
 Sat, 17 Jul 2021 17:52:40 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 85F1C540; Sat, 17 Jul 2021 17:57:50 +0200 (CEST)
Received: from 37-171-38-5.coucou-networks.fr
 (37-171-38-5.coucou-networks.fr [37.171.38.5]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sat, 17 Jul 2021 17:57:50 +0200
Date: Sat, 17 Jul 2021 17:57:50 +0200
Message-ID: <20210717175750.Horde.TLZWyADKWFGAyFWIYtmglA2@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
In-Reply-To: <20210716221159.3587039-1-linux@roeck-us.net>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> a =C3=A9crit=C2=A0:

> This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
> discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
> static").
>
> Running the upstream kernel on Qemu's brand new "pegasos2" emulation
> results in a variety of backtraces such as
>
> Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
> ------------[ cut here ]------------
> Bug: Write fault blocked by KUAP!
> WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230=20=20
>=20do_page_fault+0x4f4/0x920
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
> NIP:  c0021824 LR: c0021824 CTR: 00000000
> REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
> MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000
>
> GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60=20=20
>=20c1085c58 00000000
> GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000=20=20
>=2000000000 00000004
> GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000=20=20
>=2000000001 40b14000
> GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1=20=20
>=2000000000 c1085e60
> NIP [c0021824] do_page_fault+0x4f4/0x920
> LR [c0021824] do_page_fault+0x4f4/0x920
> Call Trace:
> [c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
> [c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4
>
> and the system fails to boot. Bisect points to commit 407d418f2fd4
> ("powerpc/chrp: Move PHB discovery"). Reverting this patch together with
> commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
> the problem.

Isn't there more than that in the backtrace ? If there is a fault=20=20
blocked=20by Kuap, it means there is a fault. It should be visible in=20=20
the=20traces.

Should we fix the problem instead of reverting the commit that made=20=20
the=20problem visible ?


>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 407d418f2fd4 ("powerpc/chrp: Move PHB discovery")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  arch/powerpc/include/asm/hydra.h    |  2 ++
>  arch/powerpc/platforms/chrp/pci.c   | 11 ++---------
>  arch/powerpc/platforms/chrp/setup.c | 12 +++++++++++-
>  3 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hydra.h=20=20
>=20b/arch/powerpc/include/asm/hydra.h
> index d024447283a0..ae02eb53d6ef 100644
> --- a/arch/powerpc/include/asm/hydra.h
> +++ b/arch/powerpc/include/asm/hydra.h
> @@ -94,6 +94,8 @@ extern volatile struct Hydra __iomem *Hydra;
>  #define HYDRA_INT_EXT7		18	/* Power Off Request */
>  #define HYDRA_INT_SPARE		19
>
> +extern int hydra_init(void);
> +
>  #endif /* __KERNEL__ */
>
>  #endif /* _ASMPPC_HYDRA_H */
> diff --git a/arch/powerpc/platforms/chrp/pci.c=20=20
>=20b/arch/powerpc/platforms/chrp/pci.c
> index 76e6256cb0a7..b2c2bf35b76c 100644
> --- a/arch/powerpc/platforms/chrp/pci.c
> +++ b/arch/powerpc/platforms/chrp/pci.c
> @@ -131,7 +131,8 @@ static struct pci_ops rtas_pci_ops =3D
>
>  volatile struct Hydra __iomem *Hydra =3D NULL;
>
> -static int __init hydra_init(void)
> +int __init
> +hydra_init(void)
>  {
>  	struct device_node *np;
>  	struct resource r;
> @@ -313,14 +314,6 @@ chrp_find_bridges(void)
>  		}
>  	}
>  	of_node_put(root);
> -
> -	/*
> -	 *  "Temporary" fixes for PCI devices.
> -	 *  -- Geert
> -	 */
> -	hydra_init();		/* Mac I/O */
> -
> -	pci_create_OF_bus_map();
>  }
>
>  /* SL82C105 IDE Control/Status Register */
> diff --git a/arch/powerpc/platforms/chrp/setup.c=20=20
>=20b/arch/powerpc/platforms/chrp/setup.c
> index 3cfc382841e5..c45435aa5e36 100644
> --- a/arch/powerpc/platforms/chrp/setup.c
> +++ b/arch/powerpc/platforms/chrp/setup.c
> @@ -334,11 +334,22 @@ static void __init chrp_setup_arch(void)
>  	/* On pegasos, enable the L2 cache if not already done by OF */
>  	pegasos_set_l2cr();
>
> +	/* Lookup PCI host bridges */
> +	chrp_find_bridges();
> +
> +	/*
> +	 *  Temporary fixes for PCI devices.
> +	 *  -- Geert
> +	 */
> +	hydra_init();		/* Mac I/O */
> +
>  	/*
>  	 *  Fix the Super I/O configuration
>  	 */
>  	sio_init();
>
> +	pci_create_OF_bus_map();
> +
>  	/*
>  	 * Print the banner, then scroll down so boot progress
>  	 * can be printed.  -- Cort
> @@ -571,7 +582,6 @@ define_machine(chrp) {
>  	.name			=3D "CHRP",
>  	.probe			=3D chrp_probe,
>  	.setup_arch		=3D chrp_setup_arch,
> -	.discover_phbs		=3D chrp_find_bridges,
>  	.init			=3D chrp_init2,
>  	.show_cpuinfo		=3D chrp_show_cpuinfo,
>  	.init_IRQ		=3D chrp_init_IRQ,
> --
> 2.25.1



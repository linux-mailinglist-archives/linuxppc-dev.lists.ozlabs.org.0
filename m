Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2A59C3F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 18:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBHgf0hZtz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 02:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=OyMQyYGz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=130.206.19.140; helo=mx01.puc.rediris.es; envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=OyMQyYGz;
	dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound2mad.lav.puc.rediris.es [130.206.19.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBHfx4CKPz3bwr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 02:21:27 +1000 (AEST)
Received: from mta-out03.sim.rediris.es (mta-out03.sim.rediris.es [130.206.24.45])
	by mx01.puc.rediris.es  with ESMTP id 27MGL5av008437-27MGL5ax008437
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 22 Aug 2022 18:21:05 +0200
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
	by mta-out03.sim.rediris.es (Postfix) with ESMTPS id A76F0302A8C5;
	Mon, 22 Aug 2022 18:21:05 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta-out03.sim.rediris.es (Postfix) with ESMTP id 932C63049C41;
	Mon, 22 Aug 2022 18:21:05 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
	mta-out03.sim.rediris.es
Received: from mta-out03.sim.rediris.es ([127.0.0.1])
	by localhost (mta-out03.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LBajIlpnifdK; Mon, 22 Aug 2022 18:21:05 +0200 (CEST)
Received: from lt-gp.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
	by mta-out03.sim.rediris.es (Postfix) with ESMTPA id DD52C302A8C5;
	Mon, 22 Aug 2022 18:21:04 +0200 (CEST)
Date: Mon, 22 Aug 2022 18:21:00 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Message-ID: <YwOs7LxpyDubCSyF@lt-gp.iram.es>
References: <20220819211254.22192-1-pali@kernel.org>
 <b23ecdd1-fe34-f0f7-be7f-da8624096447@csgroup.eu>
 <20220822153335.v5gc26jfbbqyj3et@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220822153335.v5gc26jfbbqyj3et@pali>
Content-Transfer-Encoding: quoted-printable
X-FE-Policy-ID: 23:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM; c=relaxed/relaxed;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=P7Z6k3A8poRGgY/r2fVngWTDGFg6NAUY66Qf9n627IU=;
 b=OyMQyYGzrjUYNUmcunzhWkDUU5JjJFTOsKqT+SUVtt2g3UnIhxWU+iwHp0FTD8lRwEuEnymDs9vF
	8EK3OI7gFDHC36L1qm6HHO4WcA93SesWX2QJvzkglm+3lguFSpQPiQ/+Q62vIoM4/X54Mzo7HMaw
	lZj1G7AVI8jASBE3EV0QpsKmpXVxys1JksNuF3CyKd2LLcYdMXRpmwQXrcnvKqhd8sYuLbRuhLMi
	j8N0Ncfrv2sdTd3NWghjMxUBNRu4gF4S03hGWZPLXFxrnpzXwxK0ZoT1WSW3MM3/Tn7tBb+4xRYj
	YRELdnG9Xm3v9zgH1rh48s36yf1JxyqSDiZGwg==
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
Cc: Nick Child <nick.child@ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 22, 2022 at 05:33:35PM +0200, Pali Roh=E1r wrote:
> On Monday 22 August 2022 14:25:57 Christophe Leroy wrote:
> > Le 19/08/2022 =E0 23:12, Pali Roh=E1r a =E9crit=A0:
> > > Currently powerpc early debugging contains lot of platform specific
> > > options, but does not support standard UART / serial 16550 console.
> > >=20
> > > Later legacy_serial.c code supports registering UART as early debug=
 console
> > > from device tree but it is not early during booting, but rather lat=
er after
> > > machine description code finishes.
> > >=20
> > > So for real early debugging via UART is current code unsuitable.
> > >=20
> > > Add support for new early debugging option CONFIG_PPC_EARLY_DEBUG_1=
6550
> > > which enable Serial 16550 console on address defined by new option
> > > CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR and by stride by option
> > > CONFIG_PPC_EARLY_DEBUG_16550_STRIDE.
> > >=20
> > > With this change it is possible to debug powerpc machine descriptor=
 code.
> > > For example this early debugging code can print on serial console a=
lso
> > > "No suitable machine description found" error which is done before
> > > legacy_serial.c code.
> > >=20
> > > Signed-off-by: Pali Roh=E1r <pali@kernel.org>
> > > ---
> > > Tested on P2020 board. It allowed me do debug and implement this pa=
tch series:
> > > https://lore.kernel.org/linuxppc-dev/20220819191557.28116-1-pali@ke=
rnel.org/
> >=20
> > Build failure if I select it on mpc885_ads_defconfig :
> >=20
> >    LD      vmlinux.o
> >    MODPOST vmlinux.symvers
> >    MODINFO modules.builtin.modinfo
> >    GEN     modules.builtin
> >    CC      .vmlinux.export.o
> >    LD      .tmp_vmlinux.kallsyms1
> > powerpc64-linux-ld: arch/powerpc/kernel/udbg.o: in function=20
> > `udbg_early_init':
> > /home/chleroy/linux-powerpc/arch/powerpc/kernel/udbg.c:71: undefined=20
> > reference to `udbg_init_debug_16550'
> >=20
> >=20
> >=20
> > > ---
> > >   arch/powerpc/Kconfig.debug       | 14 ++++++++++++++
> > >   arch/powerpc/include/asm/udbg.h  |  1 +
> > >   arch/powerpc/kernel/udbg.c       |  2 ++
> > >   arch/powerpc/kernel/udbg_16550.c | 33 +++++++++++++++++++++++++++=
+++++
> > >   4 files changed, 50 insertions(+)
> > >=20
> > > diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debu=
g
> > > index 9f363c143d86..a4e7d90a45d2 100644
> > > --- a/arch/powerpc/Kconfig.debug
> > > +++ b/arch/powerpc/Kconfig.debug
> > > @@ -276,6 +276,11 @@ config PPC_EARLY_DEBUG_OPAL_HVSI
> > >   	  Select this to enable early debugging for the PowerNV platform
> > >   	  using an "hvsi" console
> > >  =20
> > > +config PPC_EARLY_DEBUG_16550
> > > +	bool "Serial 16550"
> > > +	help
> > > +	  Select this to enable early debugging via Serial 16550 console
> > > +
> >=20
> > Putting it before EARLY_DEBUG_MEMCONS means that configs that were=20
> > previously selectiong EARLY_DEBUG_MEMCONS will now select=20
> > EARLY_DEBUG_16550 instead.
> >=20
> > Add a dependency to PPC_UDBG_16550 to avoid the build failure I menti=
onned ?
>=20
> Yea, there is really missing dependency. I will fix it.
>=20
> > >   config PPC_EARLY_DEBUG_MEMCONS
> > >   	bool "In memory console"
> > >   	help
> > > @@ -355,6 +360,15 @@ config PPC_EARLY_DEBUG_CPM_ADDR
> > >   	  platform probing is done, all platforms selected must
> > >   	  share the same address.
> > >  =20
> > > +config PPC_EARLY_DEBUG_16550_PHYSADDR
> > > +	hex "Early debug Serial 16550 physical address"
> > > +	depends on PPC_EARLY_DEBUG_16550
> >=20
> > A default value is necessary here to avoid prompts during defconfig b=
uilds.
> >=20
> > > +
> > > +config PPC_EARLY_DEBUG_16550_STRIDE
> > > +	int "Early debug Serial 16550 stride"
> > > +	depends on PPC_EARLY_DEBUG_16550
> > > +	default 1
> > > +
> > >   config FAIL_IOMMU
> > >   	bool "Fault-injection capability for IOMMU"
> > >   	depends on FAULT_INJECTION
> > > diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include=
/asm/udbg.h
> > > index b4aa0d88ce2c..20b5a37ab772 100644
> > > --- a/arch/powerpc/include/asm/udbg.h
> > > +++ b/arch/powerpc/include/asm/udbg.h
> > > @@ -53,6 +53,7 @@ extern void __init udbg_init_ehv_bc(void);
> > >   extern void __init udbg_init_ps3gelic(void);
> > >   extern void __init udbg_init_debug_opal_raw(void);
> > >   extern void __init udbg_init_debug_opal_hvsi(void);
> > > +extern void __init udbg_init_debug_16550(void);
> >=20
> > 'extern' keywork is pointless and deprecated for function prototypes,=
=20
> > please don't add new ones.
>=20
> I used extern keyword to follow existing coding style.

In this case it's better to remove existing extern specifications in the
surrounding lines. Increasing a bit the footprint of the patch is
justified, and does not significantly increase the risk of conflicts
with other patches, unlike the gratuitous churn we see sometimes.

	Gabriel
>=20
> > Checkpatch reports:
> >=20
> > CHECK: extern prototypes should be avoided in .h files
> > #77: FILE: arch/powerpc/include/asm/udbg.h:56:
> > +extern void __init udbg_init_debug_16550(void);
> >=20
> >=20
> > >  =20
> > >   #endif /* __KERNEL__ */
> > >   #endif /* _ASM_POWERPC_UDBG_H */
> > > diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.=
c
> > > index b1544b2f6321..92b3fc258d11 100644
> > > --- a/arch/powerpc/kernel/udbg.c
> > > +++ b/arch/powerpc/kernel/udbg.c
> > > @@ -67,6 +67,8 @@ void __init udbg_early_init(void)
> > >   	udbg_init_debug_opal_raw();
> > >   #elif defined(CONFIG_PPC_EARLY_DEBUG_OPAL_HVSI)
> > >   	udbg_init_debug_opal_hvsi();
> > > +#elif defined(CONFIG_PPC_EARLY_DEBUG_16550)
> > > +	udbg_init_debug_16550();
> > >   #endif
> > >  =20
> > >   #ifdef CONFIG_PPC_EARLY_DEBUG
> > > diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel=
/udbg_16550.c
> > > index d3942de254c6..46f2d831d7c9 100644
> > > --- a/arch/powerpc/kernel/udbg_16550.c
> > > +++ b/arch/powerpc/kernel/udbg_16550.c
> > > @@ -8,6 +8,7 @@
> > >   #include <asm/udbg.h>
> > >   #include <asm/io.h>
> > >   #include <asm/reg_a2.h>
> > > +#include <asm/early_ioremap.h>
> > >  =20
> > >   extern u8 real_readb(volatile u8 __iomem  *addr);
> > >   extern void real_writeb(u8 data, volatile u8 __iomem *addr);
> > > @@ -335,3 +336,35 @@ void __init udbg_init_debug_microwatt(void)
> > >   }
> > >  =20
> > >   #endif /* CONFIG_PPC_EARLY_DEBUG_MICROWATT */
> > > +
> > > +#ifdef CONFIG_PPC_EARLY_DEBUG_16550
> > > +
> > > +static void __iomem *udbg_uart_early_addr;
> > > +
> > > +void __init udbg_init_debug_16550(void)
> > > +{
> > > +	udbg_uart_early_addr =3D early_ioremap(CONFIG_PPC_EARLY_DEBUG_165=
50_PHYSADDR, 0x1000);
> > > +	udbg_uart_init_mmio(udbg_uart_early_addr, CONFIG_PPC_EARLY_DEBUG_=
16550_STRIDE);
> > > +}
> > > +
> > > +static int __init udbg_init_debug_16550_ioremap(void)
> > > +{
> > > +	void __iomem *addr;
> > > +
> > > +	if (!udbg_uart_early_addr)
> > > +		return 0;
> > > +
> > > +	addr =3D ioremap(CONFIG_PPC_EARLY_DEBUG_16550_PHYSADDR, 0x1000);
> > > +	if (WARN_ON(!addr))
> > > +		return -ENOMEM;
> > > +
> > > +	udbg_uart_init_mmio(addr, CONFIG_PPC_EARLY_DEBUG_16550_STRIDE);
> > > +	early_iounmap(udbg_uart_early_addr, 0x1000);
> > > +	udbg_uart_early_addr =3D NULL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +early_initcall(udbg_init_debug_16550_ioremap);
> > > +
> > > +#endif /* CONFIG_PPC_EARLY_DEBUG_16550 */
 


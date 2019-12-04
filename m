Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 514BC112B8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 13:33:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SdYj2pX5zDqNd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 23:33:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.56.132; helo=17.mo5.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 7799 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Dec 2019 23:29:50 AEDT
Received: from 17.mo5.mail-out.ovh.net (17.mo5.mail-out.ovh.net
 [46.105.56.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SdTV1tJdzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 23:29:45 +1100 (AEDT)
Received: from player697.ha.ovh.net (unknown [10.108.35.12])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 15F1325D7D8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 11:04:02 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 67649CE63FCC;
 Wed,  4 Dec 2019 10:03:54 +0000 (UTC)
Date: Wed, 4 Dec 2019 11:03:51 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: skip ioremap() of ESB pages for LSI
 interrupts
Message-ID: <20191204110351.4ba43a6d@bahia.w3ibm.bluemix.net>
In-Reply-To: <20191203163642.2428-1-clg@kaod.org>
References: <20191203163642.2428-1-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 9552697761820285323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudejledgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: lvivier@redhat.com, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue,  3 Dec 2019 17:36:42 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The PCI INTx interrupts and other LSI interrupts are handled differently
> under a sPAPR platform. When the interrupt source characteristics are
> queried, the hypervisor returns an H_INT_ESB flag to inform the OS
> that it should be using the H_INT_ESB hcall for interrupt management
> and not loads and stores on the interrupt ESB pages.
>=20
> A default -1 value is returned for the addresses of the ESB pages. The
> driver ignores this condition today and performs a bogus IO mapping.
> Recent changes and the DEBUG_VM configuration option make the bug
> visible with :
>=20
> [    0.015518] kernel BUG at arch/powerpc/include/asm/book3s/64/pgtable.h=
:612!
> [    0.015578] Oops: Exception in kernel mode, sig: 5 [#1]
> [    0.015627] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D10=
24 NUMA pSeries
> [    0.015697] Modules linked in:
> [    0.015739] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-0.rc6.git0=
.1.fc32.ppc64le #1
> [    0.015812] NIP:  c000000000f63294 LR: c000000000f62e44 CTR: 000000000=
0000000
> [    0.015889] REGS: c0000000fa45f0d0 TRAP: 0700   Not tainted  (5.4.0-0.=
rc6.git0.1.fc32.ppc64le)
> [    0.015971] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 440=
00424  XER: 00000000
> [    0.016050] CFAR: c000000000f63128 IRQMASK: 0
> [    0.016050] GPR00: c000000000f62e44 c0000000fa45f360 c000000001be5400 =
0000000000000000
> [    0.016050] GPR04: c0000000019c7d38 c0000000fa340030 00000000fa330009 =
c000000001c15e18
> [    0.016050] GPR08: 0000000000000040 ffe0000000000000 0000000000000000 =
8418dd352dbd190f
> [    0.016050] GPR12: 0000000000000000 c000000001e00000 c00a000080060000 =
c00a000080060000
> [    0.016050] GPR16: 0000ffffffffffff 80000000000001ae c000000001c24d98 =
ffffffffffff0000
> [    0.016050] GPR20: c00a00008007ffff c000000001cafca0 c00a00008007ffff =
ffffffffffff0000
> [    0.016050] GPR24: c00a000080080000 c00a000080080000 c000000001cafca8 =
c00a000080080000
> [    0.016050] GPR28: c0000000fa32e010 c00a000080060000 ffffffffffff0000 =
c0000000fa330000
> [    0.016711] NIP [c000000000f63294] ioremap_page_range+0x4c4/0x6e0
> [    0.016778] LR [c000000000f62e44] ioremap_page_range+0x74/0x6e0
> [    0.016846] Call Trace:
> [    0.016876] [c0000000fa45f360] [c000000000f62e44] ioremap_page_range+0=
x74/0x6e0 (unreliable)
> [    0.016969] [c0000000fa45f460] [c0000000000934bc] do_ioremap+0x8c/0x120
> [    0.017037] [c0000000fa45f4b0] [c0000000000938e8] __ioremap_caller+0x1=
28/0x140
> [    0.017116] [c0000000fa45f500] [c0000000000931a0] ioremap+0x30/0x50
> [    0.017184] [c0000000fa45f520] [c0000000000d1380] xive_spapr_populate_=
irq_data+0x170/0x260
> [    0.017263] [c0000000fa45f5c0] [c0000000000cc90c] xive_irq_domain_map+=
0x8c/0x170
> [    0.017344] [c0000000fa45f600] [c000000000219124] irq_domain_associate=
+0xb4/0x2d0
> [    0.017424] [c0000000fa45f690] [c000000000219fe0] irq_create_mapping+0=
x1e0/0x3b0
> [    0.017506] [c0000000fa45f730] [c00000000021ad6c] irq_create_fwspec_ma=
pping+0x27c/0x3e0
> [    0.017586] [c0000000fa45f7c0] [c00000000021af68] irq_create_of_mappin=
g+0x98/0xb0
> [    0.017666] [c0000000fa45f830] [c0000000008d4e48] of_irq_parse_and_map=
_pci+0x168/0x230
> [    0.017746] [c0000000fa45f910] [c000000000075428] pcibios_setup_device=
+0x88/0x250
> [    0.017826] [c0000000fa45f9a0] [c000000000077b84] pcibios_setup_bus_de=
vices+0x54/0x100
> [    0.017906] [c0000000fa45fa10] [c0000000000793f0] __of_scan_bus+0x160/=
0x310
> [    0.017973] [c0000000fa45faf0] [c000000000075fc0] pcibios_scan_phb+0x3=
30/0x390
> [    0.018054] [c0000000fa45fba0] [c00000000139217c] pcibios_init+0x8c/0x=
128
> [    0.018121] [c0000000fa45fc20] [c0000000000107b0] do_one_initcall+0x60=
/0x2c0
> [    0.018201] [c0000000fa45fcf0] [c000000001384624] kernel_init_freeable=
+0x290/0x378
> [    0.018280] [c0000000fa45fdb0] [c000000000010d24] kernel_init+0x2c/0x1=
48
> [    0.018348] [c0000000fa45fe20] [c00000000000bdbc] ret_from_kernel_thre=
ad+0x5c/0x80
> [    0.018427] Instruction dump:
> [    0.018468] 41820014 3920fe7f 7d494838 7d290074 7929d182 f8e10038 6929=
0001 0b090000
> [    0.018552] 7a098420 0b090000 7bc95960 7929a802 <0b090000> 7fc68b78 e8=
610048 7dc47378
>=20
> Cc: stable@vger.kernel.org # v4.14+
> Fixes: bed81ee181dd ("powerpc/xive: introduce H_INT_ESB hcall")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/spapr.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/=
spapr.c
> index 33c10749edec..55dc61cb4867 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -392,20 +392,28 @@ static int xive_spapr_populate_irq_data(u32 hw_irq,=
 struct xive_irq_data *data)
>  	data->esb_shift =3D esb_shift;
>  	data->trig_page =3D trig_page;
> =20
> +	data->hw_irq =3D hw_irq;
> +

This is a side effect in the case where the XIVE_IRQ_FLAG_H_INT_ESB flag
isn't set and ioremap() fails. But I guess a sane caller shouldn't look
at data->hw_irq if this function fails in the first place, so:

Reviewed-by: Greg Kurz <groug@kaod.org>

>  	/*
>  	 * No chip-id for the sPAPR backend. This has an impact how we
>  	 * pick a target. See xive_pick_irq_target().
>  	 */
>  	data->src_chip =3D XIVE_INVALID_CHIP_ID;
> =20
> +	/*
> +	 * When the H_INT_ESB flag is set, the H_INT_ESB hcall should
> +	 * be used for interrupt management. Skip the remapping of the
> +	 * ESB pages which are not available.
> +	 */
> +	if (data->flags & XIVE_IRQ_FLAG_H_INT_ESB)
> +		return 0;
> +
>  	data->eoi_mmio =3D ioremap(data->eoi_page, 1u << data->esb_shift);
>  	if (!data->eoi_mmio) {
>  		pr_err("Failed to map EOI page for irq 0x%x\n", hw_irq);
>  		return -ENOMEM;
>  	}
> =20
> -	data->hw_irq =3D hw_irq;
> -
>  	/* Full function page supports trigger */
>  	if (flags & XIVE_SRC_TRIGGER) {
>  		data->trig_mmio =3D data->eoi_mmio;


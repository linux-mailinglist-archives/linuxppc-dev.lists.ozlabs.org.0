Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED03326EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 14:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvws73k6xz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 00:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvwrp5tGJz30HQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 00:23:36 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B571E8E16C30;
 Tue,  9 Mar 2021 14:23:33 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 14:23:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0025d728fc2-e802-4767-80aa-bd684a3fff47,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 14:23:31 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 8/8] powerpc/xive: Map one IPI interrupt per node
Message-ID: <20210309142331.1b9456c2@bahia.lan>
In-Reply-To: <20210303174857.1760393-9-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-9-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 29319199-874e-4e91-bc64-86c8d1c1154b
X-Ovh-Tracer-Id: 8562750270618966493
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefftedvgeduuefgheeltddtieegheejhfekleduuddtffejffeuleffgfevtdeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Mar 2021 18:48:57 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> ipistorm [*] can be used to benchmark the raw interrupt rate of an
> interrupt controller by measuring the number of IPIs a system can
> sustain. When applied to the XIVE interrupt controller of POWER9 and
> POWER10 systems, a significant drop of the interrupt rate can be
> observed when crossing the second node boundary.
>=20
> This is due to the fact that a single IPI interrupt is used for all
> CPUs of the system. The structure is shared and the cache line updates
> impact greatly the traffic between nodes and the overall IPI
> performance.
>=20
> As a workaround, the impact can be reduced by deactivating the IRQ
> lockup detector ("noirqdebug") which does a lot of accounting in the
> Linux IRQ descriptor structure and is responsible for most of the
> performance penalty.
>=20
> As a fix, this proposal allocates an IPI interrupt per node, to be
> shared by all CPUs of that node. It solves the scaling issue, the IRQ
> lockup detector still has an impact but the XIVE interrupt rate scales
> linearly. It also improves the "noirqdebug" case as showed in the
> tables below.
>=20
>  * P9 DD2.2 - 2s * 64 threads
>=20
>                                                "noirqdebug"
>                         Mint/s                    Mint/s
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
>  --------------------------------------------------------------
>  1      0-15     4.984023   4.875405       4.996536   5.048892
>         0-31    10.879164  10.544040      10.757632  11.037859
>         0-47    15.345301  14.688764      14.926520  15.310053
>         0-63    17.064907  17.066812      17.613416  17.874511
>  2      0-79    11.768764  21.650749      22.689120  22.566508
>         0-95    10.616812  26.878789      28.434703  28.320324
>         0-111   10.151693  31.397803      31.771773  32.388122
>         0-127    9.948502  33.139336      34.875716  35.224548
>=20
>  * P10 DD1 - 4s (not homogeneous) 352 threads
>=20
>                                                "noirqdebug"
>                         Mint/s                    Mint/s
>  chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
>  --------------------------------------------------------------
>  1      0-15     2.409402   2.364108       2.383303   2.395091
>         0-31     6.028325   6.046075       6.089999   6.073750
>         0-47     8.655178   8.644531       8.712830   8.724702
>         0-63    11.629652  11.735953      12.088203  12.055979
>         0-79    14.392321  14.729959      14.986701  14.973073
>         0-95    12.604158  13.004034      17.528748  17.568095
>  2      0-111    9.767753  13.719831      19.968606  20.024218
>         0-127    6.744566  16.418854      22.898066  22.995110
>         0-143    6.005699  19.174421      25.425622  25.417541
>         0-159    5.649719  21.938836      27.952662  28.059603
>         0-175    5.441410  24.109484      31.133915  31.127996
>  3      0-191    5.318341  24.405322      33.999221  33.775354
>         0-207    5.191382  26.449769      36.050161  35.867307
>         0-223    5.102790  29.356943      39.544135  39.508169
>         0-239    5.035295  31.933051      42.135075  42.071975
>         0-255    4.969209  34.477367      44.655395  44.757074
>  4      0-271    4.907652  35.887016      47.080545  47.318537
>         0-287    4.839581  38.076137      50.464307  50.636219
>         0-303    4.786031  40.881319      53.478684  53.310759
>         0-319    4.743750  43.448424      56.388102  55.973969
>         0-335    4.709936  45.623532      59.400930  58.926857
>         0-351    4.681413  45.646151      62.035804  61.830057
>=20
> [*] https://github.com/antonblanchard/ipistorm
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/xive-internal.h |  2 --
>  arch/powerpc/sysdev/xive/common.c        | 39 ++++++++++++++++++------
>  2 files changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
> index 9cf57c722faa..b3a456fdd3a5 100644
> --- a/arch/powerpc/sysdev/xive/xive-internal.h
> +++ b/arch/powerpc/sysdev/xive/xive-internal.h
> @@ -5,8 +5,6 @@
>  #ifndef __XIVE_INTERNAL_H
>  #define __XIVE_INTERNAL_H
> =20
> -#define XIVE_IPI_HW_IRQ		0 /* interrupt source # for IPIs */
> -
>  /*
>   * A "disabled" interrupt should never fire, to catch problems
>   * we set its logical number to this
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 8eefd152b947..c27f7bb0494b 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -65,8 +65,16 @@ static struct irq_domain *xive_irq_domain;
>  #ifdef CONFIG_SMP
>  static struct irq_domain *xive_ipi_irq_domain;
> =20
> -/* The IPIs all use the same logical irq number */
> -static u32 xive_ipi_irq;
> +/* The IPIs use the same logical irq number when on the same chip */
> +static struct xive_ipi_desc {
> +	unsigned int irq;
> +	char name[8]; /* enough bytes to fit IPI-XXX */

So this assumes that the node number that node is <=3D 999 ? This
is certainly the case for now since CONFIG_NODES_SHIFT is 8
on ppc64 but starting with 10, you'd have truncated names.
What about deriving the size of name[] from CONFIG_NODES_SHIFT ?

Apart from that, LGTM. Probably not worth to respin just for
this.

I also could give a try in a KVM guest.

Topology passed to QEMU:

  -smp 8,maxcpus=3D8,cores=3D2,threads=3D2,sockets=3D2 \
  -numa node,nodeid=3D0,cpus=3D0-4 \
  -numa node,nodeid=3D1,cpus=3D4-7

Topology observed in guest with lstopo :

  Package L#0
    NUMANode L#0 (P#0 30GB)
    L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0
      PU L#0 (P#0)
      PU L#1 (P#1)
    L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1
      PU L#2 (P#2)
      PU L#3 (P#3)
  Package L#1
    NUMANode L#1 (P#1 32GB)
    L1d L#2 (32KB) + L1i L#2 (32KB) + Core L#2
      PU L#4 (P#4)
      PU L#5 (P#5)
    L1d L#3 (32KB) + L1i L#3 (32KB) + Core L#3
      PU L#6 (P#6)
      PU L#7 (P#7)

Interrupts in guest:

$ cat /proc/interrupts=20
           CPU0       CPU1       CPU2       CPU3       CPU4       CPU5     =
  CPU6       CPU7      =20
 16:       1023        871       1042        749          0          0     =
     0          0  XIVE-IPI   0 Edge      IPI-0
 17:          0          0          0          0       2123       1019     =
  1263       1288  XIVE-IPI   1 Edge      IPI-1

IPIs are mapped to the appropriate nodes, and the numbers indicate
that everything is working as expected.

Reviewed-and-tested-by: Greg Kurz <groug@kaod.org>

> +} *xive_ipis;
> +
> +static unsigned int xive_ipi_cpu_to_irq(unsigned int cpu)
> +{
> +	return xive_ipis[cpu_to_node(cpu)].irq;
> +}
>  #endif
> =20
>  /* Xive state for each CPU */
> @@ -1106,25 +1114,36 @@ static const struct irq_domain_ops xive_ipi_irq_d=
omain_ops =3D {
> =20
>  static void __init xive_request_ipi(void)
>  {
> -	unsigned int virq;
> +	unsigned int node;
> =20
> -	xive_ipi_irq_domain =3D irq_domain_add_linear(NULL, 1,
> +	xive_ipi_irq_domain =3D irq_domain_add_linear(NULL, nr_node_ids,
>  						    &xive_ipi_irq_domain_ops, NULL);
>  	if (WARN_ON(xive_ipi_irq_domain =3D=3D NULL))
>  		return;
> =20
> -	/* Initialize it */
> -	virq =3D irq_create_mapping(xive_ipi_irq_domain, XIVE_IPI_HW_IRQ);
> -	xive_ipi_irq =3D virq;
> +	xive_ipis =3D kcalloc(nr_node_ids, sizeof(*xive_ipis), GFP_KERNEL | __G=
FP_NOFAIL);
> +	for_each_node(node) {
> +		struct xive_ipi_desc *xid =3D &xive_ipis[node];
> +		irq_hw_number_t node_ipi_hwirq =3D node;
> +
> +		/*
> +		 * Map one IPI interrupt per node for all cpus of that node.
> +		 * Since the HW interrupt number doesn't have any meaning,
> +		 * simply use the node number.
> +		 */
> +		xid->irq =3D irq_create_mapping(xive_ipi_irq_domain, node_ipi_hwirq);
> +		snprintf(xid->name, sizeof(xid->name), "IPI-%d", node);
> =20
> -	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
> -			    IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL));
> +		WARN_ON(request_irq(xid->irq, xive_muxed_ipi_action,
> +				    IRQF_PERCPU | IRQF_NO_THREAD, xid->name, NULL));
> +	}
>  }
> =20
>  static int xive_setup_cpu_ipi(unsigned int cpu)
>  {
>  	struct xive_cpu *xc;
>  	int rc;
> +	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
> =20
>  	pr_debug("Setting up IPI for CPU %d\n", cpu);
> =20
> @@ -1165,6 +1184,8 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
> =20
>  static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
>  {
> +	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
> +
>  	/* Disable the IPI and free the IRQ data */
> =20
>  	/* Already cleaned up ? */


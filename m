Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EDA3314A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 18:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvQDX5LdRz3cns
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 04:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo51.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 569 seconds by postgrey-1.36 at boromir;
 Tue, 09 Mar 2021 04:23:39 AEDT
Received: from 1.mo51.mail-out.ovh.net (1.mo51.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvQDC5F20z3cJc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 04:23:39 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id F364026ED3C;
 Mon,  8 Mar 2021 18:14:01 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 8 Mar 2021
 18:14:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004bc6dcaae-9eee-46ea-91ee-177d3e527f2a,
 BFE3C84E2CAB42A1CEB5BA3519A80D4AF8E6727E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 8 Mar 2021 18:13:59 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
Message-ID: <20210308181359.789c143b@bahia.lan>
In-Reply-To: <20210303174857.1760393-2-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 839bdb8a-0f17-45c5-b15b-e34154c8679b
X-Ovh-Tracer-Id: 6582292330740881885
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddugedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Wed, 3 Mar 2021 18:48:50 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The 'chip_id' field of the XIVE CPU structure is used to choose a
> target for a source located on the same chip when possible. This field
> is assigned on the PowerNV platform using the "ibm,chip-id" property
> on pSeries under KVM when NUMA nodes are defined but it is undefined

This sentence seems to have a syntax problem... like it is missing an
'and' before 'on pSeries'.

> under PowerVM. The XIVE source structure has a similar field
> 'src_chip' which is only assigned on the PowerNV platform.
>=20
> cpu_to_node() returns a compatible value on all platforms, 0 being the
> default node. It will also give us the opportunity to set the affinity
> of a source on pSeries when we can localize them.
>=20

IIUC this relies on the fact that the NUMA node id is =3D=3D to chip id
on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
with this change.

On the other hand, you have the pSeries case under PowerVM that
doesn't xc->chip_id, which isn't passed to any hcall AFAICT. It
looks like the chip id is only used for localization purpose in
this case, right ?

In this case, what about doing this change for pSeries only,
somewhere in spapr.c ?

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/common.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 595310e056f4..b8e456da28aa 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1335,16 +1335,11 @@ static int xive_prepare_cpu(unsigned int cpu)
> =20
>  	xc =3D per_cpu(xive_cpu, cpu);
>  	if (!xc) {
> -		struct device_node *np;
> -
>  		xc =3D kzalloc_node(sizeof(struct xive_cpu),
>  				  GFP_KERNEL, cpu_to_node(cpu));
>  		if (!xc)
>  			return -ENOMEM;
> -		np =3D of_get_cpu_node(cpu, NULL);
> -		if (np)
> -			xc->chip_id =3D of_get_ibm_chip_id(np);
> -		of_node_put(np);
> +		xc->chip_id =3D cpu_to_node(cpu);
>  		xc->hw_ipi =3D XIVE_BAD_IRQ;
> =20
>  		per_cpu(xive_cpu, cpu) =3D xc;


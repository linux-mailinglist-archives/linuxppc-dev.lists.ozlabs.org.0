Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA62D3065
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 18:01:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr60P0YqwzDqj1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 04:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo51.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo51.mail-out.ovh.net (1.mo51.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr5yJ01W5zDqdw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 03:59:50 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 9C34B23F7E4;
 Tue,  8 Dec 2020 17:59:44 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Dec 2020
 17:59:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006406c0db3-8917-4d23-9417-90f49d001e3a,
 17D40A658B0D6C300559F39EE9B5E954A2DF46D1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 8 Dec 2020 17:59:42 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 02/13] powerpc/xive: Rename XIVE_IRQ_NO_EOI to show its
 a flag
Message-ID: <20201208175942.344b3c2c@bahia.lan>
In-Reply-To: <20201208151124.1329942-3-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-3-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c593a987-ec61-4a9a-a0f8-78b987d7150b
X-Ovh-Tracer-Id: 12754194148118534554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Tue, 8 Dec 2020 16:11:13 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This is a simple cleanup to identify easily all flags of the XIVE
> interrupt structure. The interrupts flagged with XIVE_IRQ_FLAG_NO_EOI
> are the escalations used to wake up vCPUs in KVM. They are handled
> very differently from the rest.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/include/asm/xive.h   | 2 +-
>  arch/powerpc/kvm/book3s_xive.c    | 4 ++--
>  arch/powerpc/sysdev/xive/common.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
> index 309b4d65b74f..d332dd9a18de 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -66,7 +66,7 @@ struct xive_irq_data {
>  #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
> =20
>  /* Special flag set by KVM for excalation interrupts */
> -#define XIVE_IRQ_NO_EOI		0x80
> +#define XIVE_IRQ_FLAG_NO_EOI	0x80
> =20
>  #define XIVE_INVALID_CHIP_ID	-1
> =20
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
> index 18a6b75a3bfd..fae1c2e8da29 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -219,7 +219,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vc=
pu, u8 prio,
>  	/* In single escalation mode, we grab the ESB MMIO of the
>  	 * interrupt and mask it. Also populate the VCPU v/raddr
>  	 * of the ESB page for use by asm entry/exit code. Finally
> -	 * set the XIVE_IRQ_NO_EOI flag which will prevent the
> +	 * set the XIVE_IRQ_FLAG_NO_EOI flag which will prevent the
>  	 * core code from performing an EOI on the escalation
>  	 * interrupt, thus leaving it effectively masked after
>  	 * it fires once.
> @@ -231,7 +231,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vc=
pu, u8 prio,
>  		xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_01);
>  		vcpu->arch.xive_esc_raddr =3D xd->eoi_page;
>  		vcpu->arch.xive_esc_vaddr =3D (__force u64)xd->eoi_mmio;
> -		xd->flags |=3D XIVE_IRQ_NO_EOI;
> +		xd->flags |=3D XIVE_IRQ_FLAG_NO_EOI;
>  	}
> =20
>  	return 0;
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index a80440af491a..65af34ac1fa2 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -416,7 +416,7 @@ static void xive_irq_eoi(struct irq_data *d)
>  	 * been passed-through to a KVM guest
>  	 */
>  	if (!irqd_irq_disabled(d) && !irqd_is_forwarded_to_vcpu(d) &&
> -	    !(xd->flags & XIVE_IRQ_NO_EOI))
> +	    !(xd->flags & XIVE_IRQ_FLAG_NO_EOI))
>  		xive_do_source_eoi(irqd_to_hwirq(d), xd);
>  	else
>  		xd->stale_p =3D true;


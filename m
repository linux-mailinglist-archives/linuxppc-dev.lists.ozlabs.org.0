Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC83321DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvqWD6ZRTz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:23:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvqVv6SBNz30Ht
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:22:47 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 034FB8E0685A;
 Tue,  9 Mar 2021 10:22:45 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 10:22:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045ec21723-0857-41d9-a0a7-84be23b349b3,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 10:22:41 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 6/8] powerpc/xive: Simplify the dump of XIVE
 interrupts under xmon
Message-ID: <20210309102241.497fd01d@bahia.lan>
In-Reply-To: <20210303174857.1760393-7-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-7-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: dc6bddb7-756b-454f-812b-8a82dd5c5bd9
X-Ovh-Tracer-Id: 4495718328549218781
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Wed, 3 Mar 2021 18:48:55 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Move the xmon routine under XIVE subsystem and rework the loop on the
> interrupts taking into account the xive_irq_domain to filter out IPIs.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Nice again ! :)

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/include/asm/xive.h   |  1 +
>  arch/powerpc/sysdev/xive/common.c | 14 ++++++++++++++
>  arch/powerpc/xmon/xmon.c          | 28 ++--------------------------
>  3 files changed, 17 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
> index 9a312b975ca8..aa094a8655b0 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -102,6 +102,7 @@ void xive_flush_interrupt(void);
>  /* xmon hook */
>  void xmon_xive_do_dump(int cpu);
>  int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d);
> +void xmon_xive_get_irq_all(void);
> =20
>  /* APIs used by KVM */
>  u32 xive_native_default_eq_shift(void);
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 60ebd6f4b31d..f6b7b15bbb3a 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -291,6 +291,20 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_=
data *d)
>  	return 0;
>  }
> =20
> +void xmon_xive_get_irq_all(void)
> +{
> +	unsigned int i;
> +	struct irq_desc *desc;
> +
> +	for_each_irq_desc(i, desc) {
> +		struct irq_data *d =3D irq_desc_get_irq_data(desc);
> +		unsigned int hwirq =3D (unsigned int)irqd_to_hwirq(d);
> +
> +		if (d->domain =3D=3D xive_irq_domain)
> +			xmon_xive_get_irq_config(hwirq, d);
> +	}
> +}
> +
>  #endif /* CONFIG_XMON */
> =20
>  static unsigned int xive_get_irq(void)
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 3fe37495f63d..80fbf8968f77 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -2727,30 +2727,6 @@ static void dump_all_xives(void)
>  		dump_one_xive(cpu);
>  }
> =20
> -static void dump_one_xive_irq(u32 num, struct irq_data *d)
> -{
> -	xmon_xive_get_irq_config(num, d);
> -}
> -
> -static void dump_all_xive_irq(void)
> -{
> -	unsigned int i;
> -	struct irq_desc *desc;
> -
> -	for_each_irq_desc(i, desc) {
> -		struct irq_data *d =3D irq_desc_get_irq_data(desc);
> -		unsigned int hwirq;
> -
> -		if (!d)
> -			continue;
> -
> -		hwirq =3D (unsigned int)irqd_to_hwirq(d);
> -		/* IPIs are special (HW number 0) */
> -		if (hwirq)
> -			dump_one_xive_irq(hwirq, d);
> -	}
> -}
> -
>  static void dump_xives(void)
>  {
>  	unsigned long num;
> @@ -2767,9 +2743,9 @@ static void dump_xives(void)
>  		return;
>  	} else if (c =3D=3D 'i') {
>  		if (scanhex(&num))
> -			dump_one_xive_irq(num, NULL);
> +			xmon_xive_get_irq_config(num, NULL);
>  		else
> -			dump_all_xive_irq();
> +			xmon_xive_get_irq_all();
>  		return;
>  	}
> =20


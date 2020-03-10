Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07955180276
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 16:52:42 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cKNZ4bSDzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 02:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.76.150;
 helo=10.mo178.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Mar 2020 02:49:36 AEDT
Received: from 10.mo178.mail-out.ovh.net (10.mo178.mail-out.ovh.net
 [46.105.76.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cKKD17KVzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 02:49:33 +1100 (AEDT)
Received: from player690.ha.ovh.net (unknown [10.110.208.22])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 20A9494CD8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 16:43:37 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 7CD7B10259DCC;
 Tue, 10 Mar 2020 15:43:35 +0000 (UTC)
Date: Tue, 10 Mar 2020 16:43:33 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 3/4] powerpc/xmon: Add source flags to output of XIVE
 interrupts
Message-ID: <20200310164333.11e7e62b@bahia.home>
In-Reply-To: <20200306150143.5551-4-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
 <20200306150143.5551-4-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 13089993794537888139
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvtddgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeltddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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

On Fri,  6 Mar 2020 16:01:42 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Some firmwares or hypervisors can advertise different source
> characteristics. Track their value under XMON. What we are mostly
> interested in is the StoreEOI flag.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 8155adc2225a..c865ae554605 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -283,7 +283,10 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_=
data *d)
>  		struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
>  		u64 val =3D xive_esb_read(xd, XIVE_ESB_GET);
> =20
> -		xmon_printf("PQ=3D%c%c",
> +		xmon_printf("flags=3D%c%c%c PQ=3D%c%c",
> +			    xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
> +			    xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
> +			    xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
>  			    val & XIVE_ESB_VAL_P ? 'P' : '-',
>  			    val & XIVE_ESB_VAL_Q ? 'Q' : '-');
>  	}


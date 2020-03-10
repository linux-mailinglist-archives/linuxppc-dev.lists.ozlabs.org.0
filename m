Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CDB18041B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 17:58:01 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cLr61TNrzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 03:57:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.72.36; helo=2.mo4.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4208 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Mar 2020 03:56:28 AEDT
Received: from 2.mo4.mail-out.ovh.net (2.mo4.mail-out.ovh.net [46.105.72.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cLpN224YzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 03:56:17 +1100 (AEDT)
Received: from player159.ha.ovh.net (unknown [10.108.42.174])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id DBEC4229927
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 16:38:46 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id B692E103FFFED;
 Tue, 10 Mar 2020 15:38:42 +0000 (UTC)
Date: Tue, 10 Mar 2020 16:38:40 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/4] powerpc/xive: Fix xmon support on the PowerNV platform
Message-ID: <20200310163840.063cd1b3@bahia.home>
In-Reply-To: <20200306150143.5551-3-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
 <20200306150143.5551-3-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 13008084576087677323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvtddgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  6 Mar 2020 16:01:41 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The PowerNV platform has multiple IRQ chips and the xmon command
> dumping the state of the XIVE interrupt should only operate on the
> XIVE IRQ chip.
>=20
> Fixes: 5896163f7f91 ("powerpc/xmon: Improve output of XIVE interrupts")
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 550baba98ec9..8155adc2225a 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -261,11 +261,15 @@ notrace void xmon_xive_do_dump(int cpu)
> =20
>  int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
>  {
> +	struct irq_chip *chip =3D irq_data_get_irq_chip(d);
>  	int rc;
>  	u32 target;
>  	u8 prio;
>  	u32 lirq;
> =20
> +	if (!is_xive_irq(chip))
> +		return -EINVAL;
> +
>  	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
>  	if (rc) {
>  		xmon_printf("IRQ 0x%08x : no config rc=3D%d\n", hw_irq, rc);


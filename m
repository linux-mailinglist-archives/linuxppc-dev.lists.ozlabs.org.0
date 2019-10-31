Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F380BEAE85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 12:13:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473jPD17gBzF5m6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 22:13:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.97.206; helo=19.mo1.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8434 seconds by postgrey-1.36 at bilbo;
 Thu, 31 Oct 2019 22:11:25 AEDT
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473jLj6PNJzF3S4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 22:11:21 +1100 (AEDT)
Received: from player756.ha.ovh.net (unknown [10.108.42.88])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 472A4196653
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 09:43:22 +0100 (CET)
Received: from kaod.org (unknown [91.217.168.176])
 (Authenticated sender: groug@kaod.org)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id B1E70AC82D0B;
 Thu, 31 Oct 2019 08:43:16 +0000 (UTC)
Date: Thu, 31 Oct 2019 09:43:14 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Prevent page fault issues in the machine
 crash handler
Message-ID: <20191031094314.351d225b@bahia.lan>
In-Reply-To: <20191031063100.3864-1-clg@kaod.org>
References: <20191031063100.3864-1-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 11432950606288755083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddtgedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On Thu, 31 Oct 2019 07:31:00 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> When the machine crash handler is invoked, all interrupts are masked
> but interrupts which have not been started yet do not have an ESB page
> mapped in the Linux address space. This crashes the 'crash kexec'
> sequence on sPAPR guests.
>=20
> To fix, force the mapping of the ESB page when an interrupt is being
> mapped in the Linux IRQ number space. This is done by setting the
> initial state of the interrupt to OFF which is not necessarily the
> case on PowerNV.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index df832b09e3e9..f5fadbd2533a 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1035,6 +1035,15 @@ static int xive_irq_alloc_data(unsigned int virq, =
irq_hw_number_t hw)
>  	xd->target =3D XIVE_INVALID_TARGET;
>  	irq_set_handler_data(virq, xd);
> =20
> +	/*
> +	 * Turn OFF by default the interrupt being mapped. A side
> +	 * effect of this check is the mapping the ESB page of the
> +	 * interrupt in the Linux address space. This prevents page
> +	 * fault issues in the crash handler which masks all
> +	 * interrupts.
> +	 */
> +	xive_esb_read(xd, XIVE_ESB_SET_PQ_01);
> +
>  	return 0;
>  }
> =20


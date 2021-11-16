Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7273453431
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 15:31:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtpQp6Gjxz2yg3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 01:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 359 seconds by postgrey-1.36 at boromir;
 Wed, 17 Nov 2021 01:31:05 AEDT
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtpQK5BFcz2xtc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 01:31:04 +1100 (AEDT)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-nZSW1G1SOM2Oj2THJUBt6Q-1; Tue, 16 Nov 2021 09:23:47 -0500
X-MC-Unique: nZSW1G1SOM2Oj2THJUBt6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9211742377;
 Tue, 16 Nov 2021 14:23:46 +0000 (UTC)
Received: from bahia (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 503BD5FC13;
 Tue, 16 Nov 2021 14:23:45 +0000 (UTC)
Date: Tue, 16 Nov 2021 15:23:43 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Change IRQ domain to a tree domain
Message-ID: <20211116152343.782c687c@bahia>
In-Reply-To: <20211116134022.420412-1-clg@kaod.org>
References: <20211116134022.420412-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Nov 2021 14:40:22 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Commit 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains
> exclusive") introduced an IRQ_DOMAIN_FLAG_NO_MAP flag to isolate the
> 'nomap' domains still in use under the powerpc arch. With this new
> flag, the revmap_tree of the IRQ domain is not used anymore. This
> change broke the support of shared LSIs [1] in the XIVE driver because
> it was relying on a lookup in the revmap_tree to query previously
> mapped interrupts. Linux now creates two distinct IRQ mappings on the
> same HW IRQ which can lead to unexpected behavior in the drivers.
>=20
> The XIVE IRQ domain is not a direct mapping domain and its HW IRQ
> interrupt number space is rather large : 1M/socket on POWER9 and
> POWER10, change the XIVE driver to use a 'tree' domain type instead.
>=20
> [1] For instance, a linux KVM guest with virtio-rng and virtio-balloon
>     devices.
>=20
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org # v5.14+
> Fixes: 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains exclusi=
ve")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>=20

Tested-by: Greg Kurz <groug@kaod.org>

with a KVM guest + virtio-rng + virtio-balloon on a POWER9 host.

>  Marc,
>=20
>  The Fixes tag is there because the patch in question revealed that
>  something was broken in XIVE. genirq is not in cause. However, I
>  don't know for PS3 and Cell. May be less critical for now.=20
> =20
>  arch/powerpc/sysdev/xive/common.c | 3 +--
>  arch/powerpc/sysdev/xive/Kconfig  | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index fed6fd16c8f4..9d0f0fe25598 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1536,8 +1536,7 @@ static const struct irq_domain_ops xive_irq_domain_=
ops =3D {
> =20
>  static void __init xive_init_host(struct device_node *np)
>  {
> -=09xive_irq_domain =3D irq_domain_add_nomap(np, XIVE_MAX_IRQ,
> -=09=09=09=09=09       &xive_irq_domain_ops, NULL);
> +=09xive_irq_domain =3D irq_domain_add_tree(np, &xive_irq_domain_ops, NUL=
L);
>  =09if (WARN_ON(xive_irq_domain =3D=3D NULL))
>  =09=09return;
>  =09irq_set_default_host(xive_irq_domain);
> diff --git a/arch/powerpc/sysdev/xive/Kconfig b/arch/powerpc/sysdev/xive/=
Kconfig
> index 97796c6b63f0..785c292d104b 100644
> --- a/arch/powerpc/sysdev/xive/Kconfig
> +++ b/arch/powerpc/sysdev/xive/Kconfig
> @@ -3,7 +3,6 @@ config PPC_XIVE
>  =09bool
>  =09select PPC_SMP_MUXED_IPI
>  =09select HARDIRQS_SW_RESEND
> -=09select IRQ_DOMAIN_NOMAP
> =20
>  config PPC_XIVE_NATIVE
>  =09bool


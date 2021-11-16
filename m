Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBAC453829
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 17:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtshQ5TT7z3bfv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:58:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Htsgx4yzzz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 03:58:05 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8B7761407;
 Tue, 16 Nov 2021 16:58:02 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mn1mS-005tJK-Px; Tue, 16 Nov 2021 16:58:00 +0000
Date: Tue, 16 Nov 2021 16:58:00 +0000
Message-ID: <874k8c82cn.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Change IRQ domain to a tree domain
In-Reply-To: <20211116134022.420412-1-clg@kaod.org>
References: <20211116134022.420412-1-clg@kaod.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: clg@kaod.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, groug@kaod.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Nov 2021 13:40:22 +0000,
C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
> Commit 4f86a06e2d6e ("irqdomain: Make normal and nomap irqdomains
> exclusive") introduced an IRQ_DOMAIN_FLAG_NO_MAP flag to isolate the
> 'nomap' domains still in use under the powerpc arch. With this new
> flag, the revmap_tree of the IRQ domain is not used anymore. This
> change broke the support of shared LSIs [1] in the XIVE driver because
> it was relying on a lookup in the revmap_tree to query previously
> mapped interrupts.

Just a lookup? Surely there is more to it, no?

> Linux now creates two distinct IRQ mappings on the
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
>  Marc,
>=20
>  The Fixes tag is there because the patch in question revealed that
>  something was broken in XIVE. genirq is not in cause. However, I
>  don't know for PS3 and Cell. May be less critical for now.

Depends if they expect something that a no-map domain cannot provide.

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
> -	xive_irq_domain =3D irq_domain_add_nomap(np, XIVE_MAX_IRQ,
> -					       &xive_irq_domain_ops, NULL);
> +	xive_irq_domain =3D irq_domain_add_tree(np, &xive_irq_domain_ops, NULL);
>  	if (WARN_ON(xive_irq_domain =3D=3D NULL))
>  		return;
>  	irq_set_default_host(xive_irq_domain);
> diff --git a/arch/powerpc/sysdev/xive/Kconfig b/arch/powerpc/sysdev/xive/=
Kconfig
> index 97796c6b63f0..785c292d104b 100644
> --- a/arch/powerpc/sysdev/xive/Kconfig
> +++ b/arch/powerpc/sysdev/xive/Kconfig
> @@ -3,7 +3,6 @@ config PPC_XIVE
>  	bool
>  	select PPC_SMP_MUXED_IPI
>  	select HARDIRQS_SW_RESEND
> -	select IRQ_DOMAIN_NOMAP
> =20
>  config PPC_XIVE_NATIVE
>  	bool

As long as this works, I'm happy with one less no-map user.

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

--=20
Without deviation from the norm, progress is not possible.

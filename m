Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135833817B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 12:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj24c065vz3bnh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 20:41:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj24C5Mg0z2xvJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 20:40:59 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6877B61377;
 Sat, 15 May 2021 10:40:57 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1lhrj5-001XNI-Le; Sat, 15 May 2021 11:40:55 +0100
Date: Sat, 15 May 2021 11:40:55 +0100
Message-ID: <878s4g5lfs.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 15/31] KVM: PPC: Book3S HV: XIVE: Fix mapping of
 passthrough interrupts
In-Reply-To: <87im3l2g48.ffs@nanos.tec.linutronix.de>
References: <20210430080407.4030767-1-clg@kaod.org>
 <20210430080407.4030767-16-clg@kaod.org>
 <87im3l2g48.ffs@nanos.tec.linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, clg@kaod.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulus@ozlabs.org
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 May 2021 21:51:51 +0100,
Thomas Gleixner <tglx@linutronix.de> wrote:
>=20
> On Fri, Apr 30 2021 at 10:03, C=C3=A9dric Le Goater wrote:
>=20
> CC: +Marc

Thanks Thomas.

>=20
> > PCI MSI interrupt numbers are now mapped in a PCI-MSI domain but the
> > underlying calls handling the passthrough of the interrupt in the
> > guest need a number in the XIVE IRQ domain.
> >
> > Use the IRQ data mapped in the XIVE IRQ domain and not the one in the
> > PCI-MSI domain.
> >
> > Exporting irq_get_default_host() might not be the best solution.
> >
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Paul Mackerras <paulus@ozlabs.org>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  arch/powerpc/kvm/book3s_xive.c | 3 ++-
> >  kernel/irq/irqdomain.c         | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_x=
ive.c
> > index 3a7da42bed57..81b9f4fc3978 100644
> > --- a/arch/powerpc/kvm/book3s_xive.c
> > +++ b/arch/powerpc/kvm/book3s_xive.c
> > @@ -861,7 +861,8 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigne=
d long guest_irq,
> >  	struct kvmppc_xive *xive =3D kvm->arch.xive;
> >  	struct kvmppc_xive_src_block *sb;
> >  	struct kvmppc_xive_irq_state *state;
> > -	struct irq_data *host_data =3D irq_get_irq_data(host_irq);
> > +	struct irq_data *host_data =3D
> > +		irq_domain_get_irq_data(irq_get_default_host(), host_irq);
> >  	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(host_data);
> >  	u16 idx;
> >  	u8 prio;
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index d10ab1d689d5..8a073d1ce611 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -481,6 +481,7 @@ struct irq_domain *irq_get_default_host(void)
> >  {
> >  	return irq_default_domain;
> >  }
> > +EXPORT_SYMBOL_GPL(irq_get_default_host);
> > =20
> >  static void irq_domain_clear_mapping(struct irq_domain *domain,
> >  				     irq_hw_number_t hwirq)
>=20

Is there any reason why we should add more users of the "default host"
fallback? I would really hope that new code would actually track their
irqdomain in a more fine-grained way, specially when using the
hierarchical MSi setup, which seems to be the goal of this series.

Don't you have enough topology information that you can make use of to
correctly assign a domain identifier (of_node or otherwise)?

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.

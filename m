Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46E6A8457
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 15:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSDQL17rmz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 01:44:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QcPI/XpD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QcPI/XpD;
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSDPQ13R1z3cLs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 01:43:34 +1100 (AEDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AC5B0FF804;
	Thu,  2 Mar 2023 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677768203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBEu4313wvc8JjbyIn5rJNCdAk7pwRKJxkVhQRUIhS0=;
	b=QcPI/XpDPw9RvoeywOApGHiUk+wYKTcQ3R73FbwKdbHd8k/oXBtODScU15QU/vDDOi8veX
	zKuF/Bi4l2/DhzDCDkcIywYwR1gzgr7H/WIqIBoXzbebGS3DFzL5PpnQCtha/eB+orUiN5
	P858d/Srqivw0A/DfBsQI+zjUNWCnS4n4Bih80v0JQA4r9hMQW1R7TteSMUrDXQ8y8ksds
	vPAAsinr7ZQw8Lzd4zcu1ITIArpH6XufhIMehX6cNRUqyyNA/kvWfuPYdnYtWy3/5uyiTW
	mPdG0h0VCQdJyT1+PF5mGIHpFfoI3YORcdi0523gSFmJ+Bry8ZDa0Mk0xxQxXw==
Date: Thu, 2 Mar 2023 15:43:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 05/39] genirq/msi: Remove filter from
 msi_free_descs_free_range()
Message-ID: <20230302154318.380c6cff@xps-13>
In-Reply-To: <87mt4wkwnv.ffs@tglx>
References: <20221111120501.026511281@linutronix.de>
	<20221111122013.888850936@linutronix.de>
	<20230301115530.5ccea5ae@xps-13>
	<87mt4wkwnv.ffs@tglx>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-pci@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed
 S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

tglx@linutronix.de wrote on Wed, 01 Mar 2023 22:07:48 +0100:

> Miquel!
>=20
> On Wed, Mar 01 2023 at 11:55, Miquel Raynal wrote:
> > tglx@linutronix.de wrote on Fri, 11 Nov 2022 14:54:22 +0100 (CET):
> > =20
> >> When a range of descriptors is freed then all of them are not associat=
ed to
> >> a linux interrupt. Remove the filter and add a warning to the free fun=
ction.
> >> +		/* Leak the descriptor when it is still referenced */
> >> +		if (WARN_ON_ONCE(msi_desc_match(desc, MSI_DESC_ASSOCIATED)))
> >> +			continue;
> >> +		msi_free_desc(desc);
> >>  	}
> >>  } =20
> >
> > It looks like since this commit I am getting warnings upon EPROBE_DEFER
> > errors in the mvpp2 Marvell Ethernet driver. I looked a bit at the
> > internals to understand why this warning was shown, and it seems that
> > nothing "de-references" the descriptors, which would mean here:
> > resetting desc->irq to 0. =20
>=20
> Correct. This platform-msi ^(*&!@&^ hack really needs to die ASAP.

:-)

> Marc, where are we on that? Is this still in limbo?
>=20
> > I am wondering how useful thisd WARN_ON() is, or otherwise where the =20
>=20
> It is useful as it caught bugs already.

Sure.

> > desc->irq entry should be zeroed (if I understand that correctly), any
> > help will be appreciated. =20
>=20
> Untested workaround below.

Excellent!

> I hate it with a passion, but *shrug*.

:'D

> Thanks,
>=20
>         tglx
> ---
>  drivers/base/platform-msi.c |    1 +
>  include/linux/msi.h         |    2 ++
>  kernel/irq/msi.c            |   23 ++++++++++++++++++++++-
>  3 files changed, 25 insertions(+), 1 deletion(-)

Kudos for the diff, which indeed works perfectly in my case. I guess
you'll make a proper patch soon, if that's the case you can add my:

Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

Let me know otherwise.

Thanks a lot for the very quick fix!
Miqu=C3=A8l

> --- a/drivers/base/platform-msi.c
> +++ b/drivers/base/platform-msi.c
> @@ -324,6 +324,7 @@ void platform_msi_device_domain_free(str
>  	struct platform_msi_priv_data *data =3D domain->host_data;
> =20
>  	msi_lock_descs(data->dev);
> +	msi_domain_depopulate_descs(data->dev, virq, nr_irqs);
>  	irq_domain_free_irqs_common(domain, virq, nr_irqs);
>  	msi_free_msi_descs_range(data->dev, virq, virq + nr_irqs - 1);
>  	msi_unlock_descs(data->dev);
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -631,6 +631,8 @@ int msi_domain_prepare_irqs(struct irq_d
>  			    int nvec, msi_alloc_info_t *args);
>  int msi_domain_populate_irqs(struct irq_domain *domain, struct device *d=
ev,
>  			     int virq, int nvec, msi_alloc_info_t *args);
> +void msi_domain_depopulate_descs(struct device *dev, int virq, int nvec);
> +
>  struct irq_domain *
>  __platform_msi_create_device_domain(struct device *dev,
>  				    unsigned int nvec,
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1109,14 +1109,35 @@ int msi_domain_populate_irqs(struct irq_
>  	return 0;
> =20
>  fail:
> -	for (--virq; virq >=3D virq_base; virq--)
> +	for (--virq; virq >=3D virq_base; virq--) {
> +		msi_domain_depopulate_descs(dev, virq, 1);
>  		irq_domain_free_irqs_common(domain, virq, 1);
> +	}
>  	msi_domain_free_descs(dev, &ctrl);
>  unlock:
>  	msi_unlock_descs(dev);
>  	return ret;
>  }
> =20
> +void msi_domain_depopulate_descs(struct device *dev, int virq_base, int =
nvec)
> +{
> +	struct msi_ctrl ctrl =3D {
> +		.domid	=3D MSI_DEFAULT_DOMAIN,
> +		.first  =3D virq_base,
> +		.last	=3D virq_base + nvec - 1,
> +	};
> +	struct msi_desc *desc;
> +	struct xarray *xa;
> +	unsigned long idx;
> +
> +	if (!msi_ctrl_valid(dev, &ctrl))
> +		return;
> +
> +	xa =3D &dev->msi.data->__domains[ctrl.domid].store;
> +	xa_for_each_range(xa, idx, desc, ctrl.first, ctrl.last)
> +		desc->irq =3D 0;
> +}
> +
>  /*
>   * Carefully check whether the device can use reservation mode. If
>   * reservation mode is enabled then the early activation will assign a

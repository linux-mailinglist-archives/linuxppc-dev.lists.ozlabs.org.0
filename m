Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6956A6B44
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 12:01:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRWWb674Jz3cXX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 22:01:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gWxHMbcd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=gWxHMbcd;
	dkim-atps=neutral
X-Greylist: delayed 286 seconds by postgrey-1.36 at boromir; Wed, 01 Mar 2023 22:00:42 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRWVf6GYzz301F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 22:00:42 +1100 (AEDT)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 667B7C5E42
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 10:55:57 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DAE3860004;
	Wed,  1 Mar 2023 10:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677668139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRU4uf36Q/C0+rtLw2Bbz8Q6lfTeLfQqxFNx9sVnK3Q=;
	b=gWxHMbcd7xsS0mCFmVDJfWuTAtP23zwHQXqi5TgDy2o9AX1FVgguQiWLQyIkBJFNGgffiE
	4V++GX0d6cbVc94gBvRw6NVipjb9wyQn2A9FkgcHvt16UBi2NqL70Se4r2jvuL9V0sdSsq
	K5zgmGwcQZX0JkAZ4WAKEUcMnpyq8taPNOHOouzzf46T6Nub86bdpMp+4zigLPH5O0RYpo
	tXWXVBSgPiZCKMgCPz1X9ecApoeVaqxMvqQwlR6mctwJUTOEEkCUeFau5U+ImPPzyia62w
	p2K3mmDDCd7CzPQswOnVCOxQA4HprXo9eRCjXkMN37JA3vMPASKTkcb/jnJ8Mg==
Date: Wed, 1 Mar 2023 11:55:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 05/39] genirq/msi: Remove filter from
 msi_free_descs_free_range()
Message-ID: <20230301115530.5ccea5ae@xps-13>
In-Reply-To: <20221111122013.888850936@linutronix.de>
References: <20221111120501.026511281@linutronix.de>
	<20221111122013.888850936@linutronix.de>
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

tglx@linutronix.de wrote on Fri, 11 Nov 2022 14:54:22 +0100 (CET):

> When a range of descriptors is freed then all of them are not associated =
to
> a linux interrupt. Remove the filter and add a warning to the free functi=
on.
>=20
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---

[...]

> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -120,7 +120,7 @@ static int msi_add_simple_msi_descs(stru
>  fail_mem:
>  	ret =3D -ENOMEM;
>  fail:
> -	msi_free_msi_descs_range(dev, MSI_DESC_ALL, index, last);
> +	msi_free_msi_descs_range(dev, index, last);
>  	return ret;
>  }
> =20
> @@ -141,12 +141,11 @@ static bool msi_desc_match(struct msi_de
>  /**
>   * msi_free_msi_descs_range - Free MSI descriptors of a device
>   * @dev:		Device to free the descriptors
> - * @filter:		Descriptor state filter
>   * @first_index:	Index to start freeing from
>   * @last_index:		Last index to be freed
>   */
> -void msi_free_msi_descs_range(struct device *dev, enum msi_desc_filter f=
ilter,
> -			      unsigned int first_index, unsigned int last_index)
> +void msi_free_msi_descs_range(struct device *dev, unsigned int first_ind=
ex,
> +			      unsigned int last_index)
>  {
>  	struct xarray *xa =3D &dev->msi.data->__store;
>  	struct msi_desc *desc;
> @@ -155,10 +154,12 @@ void msi_free_msi_descs_range(struct dev
>  	lockdep_assert_held(&dev->msi.data->mutex);
> =20
>  	xa_for_each_range(xa, idx, desc, first_index, last_index) {
> -		if (msi_desc_match(desc, filter)) {
> -			xa_erase(xa, idx);
> -			msi_free_desc(desc);
> -		}
> +		xa_erase(xa, idx);
> +
> +		/* Leak the descriptor when it is still referenced */
> +		if (WARN_ON_ONCE(msi_desc_match(desc, MSI_DESC_ASSOCIATED)))
> +			continue;
> +		msi_free_desc(desc);
>  	}
>  }

It looks like since this commit I am getting warnings upon EPROBE_DEFER
errors in the mvpp2 Marvell Ethernet driver. I looked a bit at the
internals to understand why this warning was shown, and it seems that
nothing "de-references" the descriptors, which would mean here:
resetting desc->irq to 0.

In my case I don't think the mvpp2_main.c driver nor the
irq_mvebu_icu.c driver behind do anything strange (as far as I
understand them). I believe any error during a ->probe() leading
to an irq_dispose_mapping() call with MSI behind will trigger that
warning.

I am wondering how useful thisd WARN_ON() is, or otherwise where the
desc->irq entry should be zeroed (if I understand that correctly), any
help will be appreciated.

Here is the splat:

[    2.045857] ------------[ cut here ]------------
[    2.050497] WARNING: CPU: 2 PID: 9 at kernel/irq/msi.c:197 msi_domain_fr=
ee_descs+0x120/0x128
[    2.058993] Modules linked in:
[    2.062068] CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc1+ #168
[    2.068804] Hardware name: Delta TN48M (DT)
[    2.073008] Workqueue: events_unbound deferred_probe_work_func
[    2.078878] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    2.085875] pc : msi_domain_free_descs+0x120/0x128
[    2.090693] lr : msi_domain_free_descs+0xe0/0x128
[    2.095423] sp : ffff80000a82b8d0
[    2.098745] x29: ffff80000a82b8d0 x28: 00007bfdbb508ca8 x27: ffff000102e=
28940
[    2.105921] x26: 0000000000000004 x25: ffff000100257660 x24: ffff800009a=
6b8d8
[    2.113096] x23: ffff800008a1c868 x22: ffff000102e4b700 x21: ffff0001014=
94bb0
[    2.120270] x20: ffff80000a82b958 x19: ffff800009afe248 x18: 00000000000=
00010
[    2.127444] x17: fffffc0000fa4008 x16: 0000000000000008 x15: 00000000000=
0013a
[    2.134618] x14: ffff80000a82b6a0 x13: 00000000ffffffea x12: ffff80000a8=
2b870
[    2.141794] x11: 0000000000000002 x10: 0000000000000000 x9 : 00000000000=
00001
[    2.148967] x8 : 0000000000000000 x7 : 0000000000000238 x6 : ffff0001005=
f1230
[    2.156141] x5 : 0000000000000000 x4 : 0000200000000000 x3 : 00000000000=
00000
[    2.163315] x2 : b586accf01c45400 x1 : ffff0001000e0000 x0 : 00000000000=
0002d
[    2.170489] Call trace:
[    2.172948]  msi_domain_free_descs+0x120/0x128
[    2.177417]  msi_domain_free_msi_descs_range+0x64/0x9c
[    2.182586]  platform_msi_device_domain_free+0x88/0xb8
[    2.187752]  mvebu_icu_irq_domain_free+0x60/0x80
[    2.192396]  irq_domain_free_irqs_hierarchy.part.21+0x94/0xa8
[    2.198173]  irq_domain_free_irqs+0xec/0x150
[    2.202466]  irq_dispose_mapping+0x104/0x120
[    2.206758]  mvpp2_probe+0x2028/0x21f8
[    2.210530]  platform_probe+0x68/0xd8
[    2.214210]  really_probe+0xbc/0x2a8
[    2.217807]  __driver_probe_device+0x78/0xe0
[    2.222102]  driver_probe_device+0x3c/0x108
[    2.226308]  __device_attach_driver+0xb8/0xf8
[    2.230690]  bus_for_each_drv+0x7c/0xd0
[    2.234547]  __device_attach+0xec/0x188
[    2.238404]  device_initial_probe+0x14/0x20
[    2.242611]  bus_probe_device+0x9c/0xa8
[    2.246468]  deferred_probe_work_func+0x88/0xc0
[    2.251024]  process_one_work+0x1fc/0x348
[    2.255056]  worker_thread+0x228/0x420
[    2.258825]  kthread+0x10c/0x118
[    2.262075]  ret_from_fork+0x10/0x20
[    2.265672] ---[ end trace 0000000000000000 ]---

Thanks,
Miqu=C3=A8l

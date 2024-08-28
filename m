Return-Path: <linuxppc-dev+bounces-660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FC962211
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 10:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtxx22VVbz2yn4;
	Wed, 28 Aug 2024 18:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724832774;
	cv=none; b=E0JPCFlOrS8cwmiy+KWGUDYwJYNcDyaPtV7txfEpiNUujTEIsJZ0DvWpxuPLOEtnZWwZSFADPDkMJi6CoYxqGmGuLnACCaiODeVS2PYmaA3nSxDEyuvz1bswUyQ5RRUfPJyybZ36biHotoHMqrwzMafVbAK+Mx1nvVC34r0MYUocw+VzfIztXKHfxr3h45qHfUWwy8xGcExkfw638B7l2ZOTQ8bxPGG+HKopv6keEVZYOlwqaqn2gra5Rb/zhYO3wd1c9ovAtaj9R8fYXGPdCVL2X3PHAZO5sD2HvBnpDb84KRsl1hs4Shhlz2LKZ08q2RULrzCk/HITv1sPlYcboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724832774; c=relaxed/relaxed;
	bh=kmQr4ellws8beE4JVgm7kNDUxBVr1XmVR39q2Lg/4Lw=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=MUWC2mz7pm/MwPjolIF9D3EkKO0nemc61NOmm4gzrDO42RjnsG0OOyCjM5TFYN1me15EODSGGdZ1kZrXrRwXWZ0YionDoCxHUgD6BnSg60TnC6gKQIyTszbT64sSn2Q/Mwv87wwcZywYOKvkEuJLndKG8mgb94ZLAjJ2gUfshcEQ7YHY0YMLRvWyETGYzL7AvvUfbVDs5Uo03NGqIUZzlmiYdQf2xDaqtIopJBrkXiA7h69iEKLXj0Efvrajf0Go5lbEoGvA9WxjBhaE0TXlW4VVcHe2pyzQaMo1VhnSJ34nLfuRlH13n/gZf16ZeO+Lu5i+C8U2WJkz4Kzq9SUZkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=epqbAQSi; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=epqbAQSi;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtxx15SxJz2yjJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 18:12:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724832773;
	bh=kmQr4ellws8beE4JVgm7kNDUxBVr1XmVR39q2Lg/4Lw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=epqbAQSiG59seDTOPvXH4tPs8rPN2AEGKJFHEmVsiLtp0aCqIcM7DqQhVNHZzrivh
	 OQtsnCk7o1yOxWGD/lpKKzX6Q4IJvwkiBLwCXc/lvnjG/5PqPzztdBjaETgwhKsVnL
	 6yzAfrWJTxNWpDx3UNwm0VLvVyD3t7ouT/jhompEG7PgPL4CpfcAVDufWfJXndZ1S8
	 ZOhccXs14txBtZqWhQUrZRCAXj6PUBMotzMZQ5mUMH3CPX8fG/zlraXZC+GRzM9j9z
	 VayCHcc0ZPBOEcUHE53+eqlUrtODWjJHHzF9SZvMc3P/8M8+5sIIcKFNJNV+ynSMU8
	 E6zmbxb2zBgcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtxx13d7jz4wxJ;
	Wed, 28 Aug 2024 18:12:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, tyreld@linux.ibm.com, brking@linux.ibm.com,
 hbabu@us.ibm.com, haren@linux.ibm.com
Subject: Re: [PATCH v3 3/3] powerpc/pseries/dlpar: Add device tree nodes for
 DLPAR IO add
In-Reply-To: <20240822025028.938332-3-haren@linux.ibm.com>
References: <20240822025028.938332-1-haren@linux.ibm.com>
 <20240822025028.938332-3-haren@linux.ibm.com>
Date: Wed, 28 Aug 2024 18:12:52 +1000
Message-ID: <87y14hdq0r.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Haren,

One query below about the of_node refcounting.

Haren Myneni <haren@linux.ibm.com> writes:
> In the powerpc-pseries specific implementation, the IO hotplug
> event is handled in the user space (drmgr tool). For the DLPAR
> IO ADD, the corresponding device tree nodes and properties will
> be added to the device tree after the device enable. The user
> space (drmgr tool) uses configure_connector RTAS call with the
> DRC index to retrieve the device nodes and updates the device
> tree by writing to /proc/ppc64/ofdt. Under system lockdown,
> /dev/mem access to allocate buffers for configure_connector RTAS
> call is restricted which means the user space can not issue this
> RTAS call and also can not access to /proc/ppc64/ofdt. The
> pseries implementation need user interaction to power-on and add
> device to the slot during the ADD event handling. So adds
> complexity if the complete hotplug ADD event handling moved to
> the kernel.
>
> To overcome /dev/mem access restriction, this patch extends the
> /sys/kernel/dlpar interface and provides =E2=80=98dt add index <drc_index=
>=E2=80=99
> to the user space. The drmgr tool uses this interface to update
> the device tree whenever the device is added. This interface
> retrieves device tree nodes for the corresponding DRC index using
> the configure_connector RTAS call and adds new device nodes /
> properties to the device tree.
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/dlpar.c | 130 +++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platfo=
rms/pseries/dlpar.c
> index 1b49b47c4a4f..6f0bc3ddbf85 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
...
> @@ -330,6 +345,118 @@ int dlpar_unisolate_drc(u32 drc_index)
>  	return 0;
>  }
>=20=20
> +static struct device_node *
> +get_device_node_with_drc_index(u32 index)
> +{
> +	struct device_node *np =3D NULL;
> +	u32 node_index;
> +	int rc;
> +
> +	for_each_node_with_property(np, "ibm,my-drc-index") {
> +		rc =3D of_property_read_u32(np, "ibm,my-drc-index",
> +					     &node_index);
> +		if (rc) {
> +			pr_err("%s: %pOF: of_property_read_u32 %s: %d\n",
> +			       __func__, np, "ibm,my-drc-index", rc);
> +			of_node_put(np);
> +			return NULL;
> +		}
> +
> +		if (index =3D=3D node_index)
> +			break;

Here we return with np's refcount elevated.

> +	}
> +
> +	return np;
> +}
...
> +
> +static int dlpar_hp_dt_add(u32 index)
> +{
> +	struct device_node *np, *nodes;
> +	struct of_changeset ocs;
> +	int rc;
> +
> +	/*
> +	 * Do not add device node(s) if already exists in the
> +	 * device tree.
> +	 */
> +	np =3D get_device_node_with_drc_index(index);
> +	if (np) {
> +		pr_err("%s: Adding device node for index (%d), but "
> +				"already exists in the device tree\n",
> +				__func__, index);
> +		rc =3D -EINVAL;
> +		goto out;
=20
In the error case you drop the reference on np (at out).

> +	}

> +	np =3D get_device_node_with_drc_info(index);
>=20
But in the success case np is reassigned, so the refcount is leaked.
I think that's unintentional, but I'm not 100% sure.

> +	if (!np)
> +		return -EIO;
> +
> +	/* Next, configure the connector. */
> +	nodes =3D dlpar_configure_connector(cpu_to_be32(index), np);
> +	if (!nodes) {
> +		rc =3D -EIO;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Add the new nodes from dlpar_configure_connector() onto
> +	 * the device-tree.
> +	 */
> +	of_changeset_init(&ocs);
> +	rc =3D dlpar_changeset_attach_cc_nodes(&ocs, nodes);
> +
> +	if (!rc)
> +		rc =3D of_changeset_apply(&ocs);
> +	else
> +		dlpar_free_cc_nodes(nodes);
> +
> +	of_changeset_destroy(&ocs);
> +
> +out:
> +	of_node_put(np);
> +	return rc;
> +}
> +
>  static int changeset_detach_node_recursive(struct of_changeset *ocs,
>  					struct device_node *node)
>  {

cheers


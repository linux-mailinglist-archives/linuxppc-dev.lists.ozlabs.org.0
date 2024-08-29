Return-Path: <linuxppc-dev+bounces-717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702F963940
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 06:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvSVf5zRVz2yng;
	Thu, 29 Aug 2024 14:10:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724904618;
	cv=none; b=dyZpnOX5bLiR+Sm6JqopXxJZTNmb14zCAgMbqF8AoS02XKMFv+oOYwk/X0MxMBQ3471hKO3UDiKa8N8T9TTCF5S4zCVPfzB1xmp7qgErHtWUe0GbyPN98G5VTWPrXhEj5kLS0X2PkSRluQBfWdcXPS6lrDFIrOWQp0epb3BFijisw+K9wmvNAYnoVXJB02IWIouipD2CbFG/a4iOA2CpIzFi9r87Z2plUU/rDzYs+QNGU0w7pnoZWvGfrYBL4Yq8M2airW2PmW2dgWPcmxgsQt/0oqBtt1wj2LRYFF69NmIzFThQ8vXIpax5nxsxSrA3fV48GALt8AVocU++OGKyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724904618; c=relaxed/relaxed;
	bh=FXXafUd0PZhS8CV21lUdx5K/zaGBb/1ZKdBQaqGCRLs=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=WOvMK6WOxYo2CnB6xKqifHEVD5XrZLaPMBbWJoSkVW3y8Gw50esAxIdaT+jh5mT4Pm1RaosF6ifdFwTpaeL7sg0wEjobrLuhPQbKqNsNJMKJSs3DzBORr/zxs9pSirAngkWaDV68+lNnU08QGe+Yd/7i/o3VVRHYcU1YPrxIP9qSiSQfXyuWfAykhH371kD0UYkNI1TOb2lzStdWAglguQ9uN4JxuJPrrMi2E8jJPCg2Eur86g1FPmDi9CxlLILWELKGuU6jCYAUkHoUge2VF83ZumgoC83M+Y1p0YT+ubfSDy6/mKKoci2i37ucz5Gn/Ou1n+q+HdhiSls6QMQzTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i7zDPwYB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i7zDPwYB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvSVf0Xmpz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 14:10:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724904618;
	bh=FXXafUd0PZhS8CV21lUdx5K/zaGBb/1ZKdBQaqGCRLs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i7zDPwYBBxIeARbB7cTqI8/Env5abK76WTXvTju5n6rPOy3hDKGeBjyJu2xeEXinq
	 cBzqEt8FhxdsDrKErSlenGKayI54SGgETyONcETjTI2zvp8rj4hXAV70ETaX3/SAvl
	 Qd9lTmkOBDBUE/FQJjVHxWMUPCc639z2gl4pcANhZmM+pdJxC/iNMIE+iSBfZjZb4i
	 gkq74YRGQ9TVjMUtKP3I1vxgWLb3ZTL2Xrsfkio2r4Wc3aGxLeGikZmc4OONQAe0SK
	 B7UuiFbJfl6fIKBRnslAtG/FP360gn6r847e7HAGXH9QZUsgaTjmaci9gx9wUVwx89
	 1CppWfh+FaRkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvSVd6WkSz4x0t;
	Thu, 29 Aug 2024 14:10:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, tyreld@linux.ibm.com, brking@linux.ibm.com,
 hbabu@us.ibm.com
Subject: Re: [PATCH v3 3/3] powerpc/pseries/dlpar: Add device tree nodes for
 DLPAR IO add
In-Reply-To: <706b666aaf1e515506bb6a4bc1146ee00571a137.camel@linux.ibm.com>
References: <20240822025028.938332-1-haren@linux.ibm.com>
 <20240822025028.938332-3-haren@linux.ibm.com> <87y14hdq0r.fsf@mail.lhotse>
 <706b666aaf1e515506bb6a4bc1146ee00571a137.camel@linux.ibm.com>
Date: Thu, 29 Aug 2024 14:10:17 +1000
Message-ID: <87plpsdl5i.fsf@mail.lhotse>
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

Haren Myneni <haren@linux.ibm.com> writes:
> On Wed, 2024-08-28 at 18:12 +1000, Michael Ellerman wrote:
>> Hi Haren,
>>=20
>> One query below about the of_node refcounting.
>>=20
>> Haren Myneni <haren@linux.ibm.com> writes:
>> > In the powerpc-pseries specific implementation, the IO hotplug
>> > event is handled in the user space (drmgr tool). For the DLPAR
>> > IO ADD, the corresponding device tree nodes and properties will
>> > be added to the device tree after the device enable. The user
>> > space (drmgr tool) uses configure_connector RTAS call with the
>> > DRC index to retrieve the device nodes and updates the device
>> > tree by writing to /proc/ppc64/ofdt. Under system lockdown,
>> > /dev/mem access to allocate buffers for configure_connector RTAS
>> > call is restricted which means the user space can not issue this
>> > RTAS call and also can not access to /proc/ppc64/ofdt. The
>> > pseries implementation need user interaction to power-on and add
>> > device to the slot during the ADD event handling. So adds
>> > complexity if the complete hotplug ADD event handling moved to
>> > the kernel.
>> >=20
>> > To overcome /dev/mem access restriction, this patch extends the
>> > /sys/kernel/dlpar interface and provides =E2=80=98dt add index <drc_in=
dex>=E2=80=99
>> > to the user space. The drmgr tool uses this interface to update
>> > the device tree whenever the device is added. This interface
>> > retrieves device tree nodes for the corresponding DRC index using
>> > the configure_connector RTAS call and adds new device nodes /
>> > properties to the device tree.
>> >=20
>> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/platforms/pseries/dlpar.c | 130
>> > +++++++++++++++++++++++++
>> >  1 file changed, 130 insertions(+)
>> >=20
>> > diff --git a/arch/powerpc/platforms/pseries/dlpar.c
>> > b/arch/powerpc/platforms/pseries/dlpar.c
>> > index 1b49b47c4a4f..6f0bc3ddbf85 100644
>> > --- a/arch/powerpc/platforms/pseries/dlpar.c
>> > +++ b/arch/powerpc/platforms/pseries/dlpar.c
>> ...
>> > @@ -330,6 +345,118 @@ int dlpar_unisolate_drc(u32 drc_index)
>> >  	return 0;
>> >  }
>> >=20=20
>> > +static struct device_node *
>> > +get_device_node_with_drc_index(u32 index)
>> > +{
>> > +	struct device_node *np =3D NULL;
>> > +	u32 node_index;
>> > +	int rc;
>> > +
>> > +	for_each_node_with_property(np, "ibm,my-drc-index") {
>> > +		rc =3D of_property_read_u32(np, "ibm,my-drc-index",
>> > +					     &node_index);
>> > +		if (rc) {
>> > +			pr_err("%s: %pOF: of_property_read_u32 %s:
>> > %d\n",
>> > +			       __func__, np, "ibm,my-drc-index", rc);
>> > +			of_node_put(np);
>> > +			return NULL;
>> > +		}
>> > +
>> > +		if (index =3D=3D node_index)
>> > +			break;
>>=20
>> Here we return with np's refcount elevated.
>>=20
>> > +	}
>> > +
>> > +	return np;
>> > +}
>> ...
>> > +
>> > +static int dlpar_hp_dt_add(u32 index)
>> > +{
>> > +	struct device_node *np, *nodes;
>> > +	struct of_changeset ocs;
>> > +	int rc;
>> > +
>> > +	/*
>> > +	 * Do not add device node(s) if already exists in the
>> > +	 * device tree.
>> > +	 */
>> > +	np =3D get_device_node_with_drc_index(index);
>> > +	if (np) {
>> > +		pr_err("%s: Adding device node for index (%d), but "
>> > +				"already exists in the device tree\n",
>> > +				__func__, index);
>> > +		rc =3D -EINVAL;
>> > +		goto out;
>>=20=20
>> In the error case you drop the reference on np (at out).
>>=20
>> > +	}
>> > +	np =3D get_device_node_with_drc_info(index);
>> >=20
>> But in the success case np is reassigned, so the refcount is leaked.
>> I think that's unintentional, but I'm not 100% sure.
>
> Michael,=20
>
> get_device_node_with_drc_index() holds the refcount only if the node is
> already exists. In this case this refcount is dropped.=20
>
> if (np) {
>                 pr_err("%s: Adding device node for index (%d), but "
>                                 "already exists in the device tree\n",
>                                 __func__, index);
>                 rc =3D -EINVAL;
>                 goto out; --> drop refcount=20
>         }

Oh yep. I misread that as if (!np).

> Whereas failure from the get_device_node_with_drc_index() - can not
> find the match node. means we do not hold the refcount and need to add
> the node from get_device_node_with_drc_info()

Right.

> I should add a comment regarding refcount to make it clear. will post
> V4 patch with this comment.

It's probably fine as-is, I just needed to read it properly :)

cheers


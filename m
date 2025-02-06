Return-Path: <linuxppc-dev+bounces-5906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C485A2AFEA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 19:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YplXh1KyYz30K6;
	Fri,  7 Feb 2025 05:11:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738865476;
	cv=none; b=c7cEvvXY+BKuGAnrff3nAdSw6/QcLY5OBnk2RmfHRbyMCrjW0DjxQ3Gd70mq7X6/PiaoqHpb2CIcPzP0iHoaTo+MMgOEuYC7ZkalTT24Ob1WCZGbVXoEK/WVx+MDvvp9nRB2MFRRaKIX03wbkL41L06UXDM2RMbrDqrNHj7ZYGM2vTstzZiiIinyEd/iWv8pr8iqy6LmtM/isakjjhLnfmeghg0Tob4g1vX5NQP6dYDvXXyajDQwxZurNlGmksaJfG4B8WPVqKh4UbyRgaeSbwEg8A725qMygVqwLnTb5gyNXBzsn8DuL8G4Ik5vfbe8/tiJRGQ7TiIbuYiNIGeqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738865476; c=relaxed/relaxed;
	bh=L1Ng9lldW/83WhLxtsVxj1Z34scX9+JOOnEphNXYxHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRO9cU9Ry/hSvgUxFGcir02nOcgLRRRX6AyhUs0CZNq9YKXT1gkgCTsLRmZahqIeQCK31zPwYcj6typqI48PfQTvTN+/lqetLezqDW9ozf5FS0R8BHoAx0noHf/2XbY0E4PTOBmU3hwnsihHXTui3wZgh5pheKj1CaeTJrVhDw0fJpV7ZF+9bbOwIsfZMSxFOe8pC4fyCeu0Wb6y/AgPqsTEpqGjcjFIVMDEvyM4xir+TDkhF6xeWFkVwl198I9t1rL8gSUvmcnf57mWnsMkH4wQ5gJQREWjN+ZvPMwOczVLpbeZkuA64As6c7RMXhFK1Y0H/fA58Hj/AvNX7W64cA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q0rKUKKY; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LI3KuCir; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=stefanha@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q0rKUKKY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LI3KuCir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=stefanha@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YplXg0jp7z30Ds
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 05:11:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738865468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1Ng9lldW/83WhLxtsVxj1Z34scX9+JOOnEphNXYxHw=;
	b=Q0rKUKKYOwfszoaS+oITbJYMPn42PBXWq5YwKRYgIXMSK559Q27/ZYVawluDjvA0CACdkR
	xP+SDHAYGTMvqtI4nAbTmzzBVI8RwiBrgdEDK4UKfz9qqyIu917R480prlVMvZ7Z0Aww0d
	T7QJz3zE3mvVoCHyU5+nZr8PtaTMOvc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738865469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1Ng9lldW/83WhLxtsVxj1Z34scX9+JOOnEphNXYxHw=;
	b=LI3KuCiroJei3XGszXusAWmM4EIFMjurQr2MQ5NHHIT3BSkNzg6ZCYz8GmyMBezIcyjOJo
	Xow+u3u+1eOPA0vCsgxyMIU9CT9W7UVpscQNDtb2xXpqVJpUciVqSo2Kctl7WalUnVGbZH
	ck248JWdmGRbdl0Wr8cQ9CyjzfNA6DA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-8E3rdXJoPkCOp7n7f2PNnw-1; Thu,
 06 Feb 2025 13:11:05 -0500
X-MC-Unique: 8E3rdXJoPkCOp7n7f2PNnw-1
X-Mimecast-MFC-AGG-ID: 8E3rdXJoPkCOp7n7f2PNnw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B6E61955BC0;
	Thu,  6 Feb 2025 18:10:26 +0000 (UTC)
Received: from localhost (unknown [10.2.16.145])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EA005180087A;
	Thu,  6 Feb 2025 18:10:21 +0000 (UTC)
Date: Thu, 6 Feb 2025 13:10:19 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
	German Maglione <gmaglione@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <20250206181019.GA413673@fedora>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com>
 <20250206143032.GA400591@fedora>
 <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9gaKO0MQEl4+jp8i"
Content-Disposition: inline
In-Reply-To: <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--9gaKO0MQEl4+jp8i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 03:59:03PM +0100, Albert Esteve wrote:
> Hi!
>=20
> On Thu, Feb 6, 2025 at 3:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.c=
om> wrote:
> >
> > On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> > > And then there are challenges at QEMU level. virtiofsd needs addition=
al
> > > vhost-user commands to implement DAX and these never went upstream in
> > > QEMU. I hope these challenges are sorted at some point of time.
> >
> > Albert Esteve has been working on QEMU support:
> > https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redh=
at.com/
> >
> > He has a viable solution. I think the remaining issue is how to best
> > structure the memory regions. The reason for slow progress is not
> > because it can't be done, it's probably just because this is a
> > background task.
>=20
> It is partially that, indeed. But what has me blocked for now on posting =
the
> next version is that I was reworking a bit the MMAP strategy.
> Following David comments, I am relying more on RAMBlocks and
> subregions for mmaps. But this turned out more difficult than anticipated.
>=20
> I hope I can make it work this month and then post the next version.
> If there are no major blockers/reworks, further iterations on the
> patch shall go smoother.
>=20
> I have a separate patch for the vhost-user spec which could
> iterate faster, if that'd help.

Let's see if anyone needs the vhost-user spec extension now. Otherwise
it seems fine to merge it together with the implementation of that spec.

Stefan

--9gaKO0MQEl4+jp8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmek+wsACgkQnKSrs4Gr
c8iv1AgAtw36d3ZukmPTk9VmX0NGRgWskCoroH9Kztfi3UeYUTi5bn/AL9yD+73x
aQ8w4QvmQQBq/U85J8DNgOJ6hXW4uE2XpHCEtdgVWRFatuEwWtlLNZ46gUMD+AJb
QtUvCLNwOtMYbADhEDUiIDIZS3DxHUvTI8JZWN6tNCFme7tuoUiJ4hWEhHhQ07yS
yebWMNRoW2UmDtVWBMsp/v7zhoroqrrIcRvAaLUBTIE/k2myl3zxEPRW7j69jl9S
7XwGGLC9Odz8ssha4UIg5fbwuUqpbJQA/PwPQVeJWR0a4OXhbFWebWEGdrXiTKP4
04dxu53buvDo8JePVLkCaQZfazl9Cg==
=cm2Y
-----END PGP SIGNATURE-----

--9gaKO0MQEl4+jp8i--



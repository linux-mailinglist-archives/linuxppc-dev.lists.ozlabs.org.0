Return-Path: <linuxppc-dev+bounces-5903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8300A2AB50
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 15:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpffN5mfwz30CM;
	Fri,  7 Feb 2025 01:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738852252;
	cv=none; b=gOThE/uN+URXFmkMSga+9jn9xy24O6ZgmBR+UIEUjfPukgB/V7qG50r5gpYl93TwxO9urQF+E5/O005+xIWgcWCqrRtNYfIu0OnhceXHIeFqmYQi6TdLveWfEpYVlLUwiquOFNSZBWP6VCYWL6mEgq/gMOPUkWl6XfAAhJaC1wAw/yyJl60q/zTjXIwRTTo0MgnnAurxPrPoYDUe0KS8i65psvDnlIbOurUPBQ1IPCvRrtGtzPUfLOva2nNjwNNeJZHxMddS7ogVDtQ7W8oAen674anN+W/qXtPdxI/5LEoyhGHSZavORO89uPPzxcXRNSN5i21FBbW1sYUiWKU6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738852252; c=relaxed/relaxed;
	bh=WdipNZI3y5wwEW1WPJkKmfPilkJ7iVaBxEPNzdzmX4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBiASGO1PC2pKFx87uob7CFtdVWrgCxKMOUwdFgExhhAL7MR6mPdsfv0unb4FQR947sto4QSUHDRFgVIX3YlqNi92sA9IRgNta6he+QrGWFCUDxaW81uAxcYNwx8d4rM6/kUsOQkxD/NPyoUN1CIAIzoxgmZrXMmETrFtr5N/P3ZjlEB9JvNGBs/OK7zfQkmfWu7JjGSBbWAHKtSE4CYFCheQXjDI+Qi6rFh6cBM5JuP8xdNHg5Th82AYAKiCo7wSW7qHeZnueNjtEtMPuZ85M/qPHX9gc/Zq87p+UQU9Fg18h8fPN7jvJ3ux5N4AlX4VjpiKGSnAYCCq1p6cBFs9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJ6Kgxwt; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJ6Kgxwt; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=stefanha@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJ6Kgxwt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eJ6Kgxwt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=stefanha@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpffM54GGz3089
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 01:30:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738852247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WdipNZI3y5wwEW1WPJkKmfPilkJ7iVaBxEPNzdzmX4E=;
	b=eJ6KgxwtBCOthGbvhz18Asrf/qzsV/pgaERHBPNhVzipaWEBtPPK6BNxzU7K7VnWwk4pbg
	QYSJk3CO4KNc+BQihiTjWAtOJtYAS2REiCLHzZ6mjfw6EjJtrs2kN9NBGqFYf26L4yToOD
	k5O/WU8goLxaZexDZ8boDtVI/tzHopo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738852247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WdipNZI3y5wwEW1WPJkKmfPilkJ7iVaBxEPNzdzmX4E=;
	b=eJ6KgxwtBCOthGbvhz18Asrf/qzsV/pgaERHBPNhVzipaWEBtPPK6BNxzU7K7VnWwk4pbg
	QYSJk3CO4KNc+BQihiTjWAtOJtYAS2REiCLHzZ6mjfw6EjJtrs2kN9NBGqFYf26L4yToOD
	k5O/WU8goLxaZexDZ8boDtVI/tzHopo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-jpp1Wx5AN3GqEECzTVdKQg-1; Thu,
 06 Feb 2025 09:30:43 -0500
X-MC-Unique: jpp1Wx5AN3GqEECzTVdKQg-1
X-Mimecast-MFC-AGG-ID: jpp1Wx5AN3GqEECzTVdKQg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAACC1956086;
	Thu,  6 Feb 2025 14:30:36 +0000 (UTC)
Received: from localhost (unknown [10.2.16.145])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D97B1800878;
	Thu,  6 Feb 2025 14:30:33 +0000 (UTC)
Date: Thu, 6 Feb 2025 09:30:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
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
	German Maglione <gmaglione@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <20250206143032.GA400591@fedora>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com>
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
	protocol="application/pgp-signature"; boundary="dVdFjdbROmPA0Gp+"
Content-Disposition: inline
In-Reply-To: <Z6S7A-51SdPco_3Z@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--dVdFjdbROmPA0Gp+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> And then there are challenges at QEMU level. virtiofsd needs additional
> vhost-user commands to implement DAX and these never went upstream in
> QEMU. I hope these challenges are sorted at some point of time.

Albert Esteve has been working on QEMU support:
https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redhat.com/

He has a viable solution. I think the remaining issue is how to best
structure the memory regions. The reason for slow progress is not
because it can't be done, it's probably just because this is a
background task.

Please discuss with Albert if QEMU support is urgent.

Stefan

--dVdFjdbROmPA0Gp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmekx4gACgkQnKSrs4Gr
c8jOKwf/ZukZTp1v1Bj1iqbpAm6HBWN90Y4JWmyzZGuKRqLAwN8AyiIJ6Ms1fx+v
WJLR47NztCQ3sDtsTQT1814wwXSpJlPguLu6isoWbCGpUwAZZk3JTpHNBofs7IKj
04NWFZ9B2tOVgirm8OMtsVVJwzQhvQc7YtMhdB9naCzqcdC7ynKp6mLH9bd7Q+Ze
K9CwEFtKcTm9Ge+t3U0E3Q7MI2D55far3KPi84MpfI9oEu6l0MOzzmKjaOBq9+wy
XXZCisxWbGLZtfbY2BAQxTUhKq9TTXgeQm/Ti/SzsVLf/Qd7nrEkG1v51xs5HCnR
FMQhDw7oBmFsGs5S/Qywvta1pcaYwg==
=JZcT
-----END PGP SIGNATURE-----

--dVdFjdbROmPA0Gp+--



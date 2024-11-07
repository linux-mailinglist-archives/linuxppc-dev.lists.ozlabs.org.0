Return-Path: <linuxppc-dev+bounces-2998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D49C0CBB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpkV41HKz3bnx;
	Fri,  8 Nov 2024 04:20:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731000050;
	cv=none; b=i2sBnn9SnfbxoIdzTpEwoOLeccC77HdWXD1lubT2n6QZMmFqFm6QwqN2ubChzsVzTu+FSq8cojwZsPj7hXlO7OlPbs0rgMR3n2k+zv706N/La9d2iSwv2HmxEMkhtfE7mN+1d8dCrSJXjrB+cc4HJPVcRmbmc3YVI7mYTjZEojInL5be1L4aFi1pZ0Q2xRVU0RJZaRgUq3d7iuNMf59NYkmOuBPHdtqxnBDKVVqvwNe9WIPXPKc0zloV9w749vpyEC0Qt9QvkoxFJKa3SnjFsFEzC2EtBwnSu7RPL+sb9Y/SIU6VM3GiMKJmJNnnZots+UhfN63q/kahAN9IUi2Bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731000050; c=relaxed/relaxed;
	bh=1znY6XKKQK8t+pe6zGbt91oO7ilftLtE+6Za3bEgxNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CvT6MX6v5RoxXBe0cMI5IVfwjK9I4ohpWWSvclq9XElY9ckSM7MbmvOTvuWSBm4EOdsCao9TY98wff0taZuCRDbFmrcmpdwPy4BBKRS7Nt86S0bx0ZcuaLQlZg02abo+qj5R4TBLdMtE9EygOAoZZ6NSDrarQl2KKNOKtTiEuZPz8yQRJTMEvsXF6kN3vukSvPC217KM2I7KuFhLr0c32gb0hZEdKMJFXSCrVYYW837CjMbuGT0MDWxDLa0EBG+nMUS4keguxQD9HW5q9phuW+4Y+jZCPYedmnzCu41/1KGFbdqgwDv9U0KfXFYv5j0HSJglFCmgsmhTeWwK1zDR7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uirXLcMy; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pratyush@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uirXLcMy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pratyush@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpkS600Mz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:20:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76D2F5C0C36;
	Thu,  7 Nov 2024 17:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DA9C4CECC;
	Thu,  7 Nov 2024 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731000045;
	bh=cADn4ARQkTOhflqlIHhNxtca9L54H5LHvOrTgQwQP8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uirXLcMy1Qn//p7lSBnbOlzSbCL5aIT0TqEnGpIZm6Rx23BQJKj1JIwJAP4R6CQ3Y
	 BGW5ysKmLw5HxKe9TW2Kb0/MrhrtH+FEMuRdl+3jaHMQQkHCavjZQ9xWr31Ghy5ARf
	 J2TiGOLT8c6IMr+E/gnELx0660oj7VCoNS9utcB0Gb41g2oymp/+1G/7KVgOzIPwxq
	 q5/0lzC969ZrJFg9aKvlY1ckSKQVQp4pt0o8irIOJAq56q9MDR85uEDv3iCGEqltvk
	 QeOfANjQFk8pt3o4hyDqn3DINTzEn9s+ZnpBLM2/xaYcEN2lpP63yM+3MX3zh3CiMr
	 Amp7lQpjSOJ2g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>,  Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,  Davidlohr Bueso
 <dave@stgolabs.net>,  Jonathan Cameron <jonathan.cameron@huawei.com>,
  Dave Jiang <dave.jiang@intel.com>,  Alison Schofield
 <alison.schofield@intel.com>,  Vishal Verma <vishal.l.verma@intel.com>,
  Ira Weiny <ira.weiny@intel.com>,  Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  Xinhui Pan <Xinhui.Pan@amd.com>,  David Airlie <airlied@gmail.com>,
  Simona Vetter <simona@ffwll.ch>,  Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Leon Romanovsky <leon@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Naveen Krishna Chatradhi
 <naveenkrishna.chatradhi@amd.com>,  Carlos Bilbao
 <carlos.bilbao.osdev@gmail.com>,  Hans de Goede <hdegoede@redhat.com>,
  Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,  "David E.
 Box"
 <david.e.box@linux.intel.com>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Matt Turner <mattst88@gmail.com>,
  Frederic Barrat <fbarrat@linux.ibm.com>,  Andrew Donnellan
 <ajd@linux.ibm.com>,  Arnd Bergmann <arnd@arndb.de>,  Logan Gunthorpe
 <logang@deltatee.com>,  "K. Y. Srinivasan" <kys@microsoft.com>,  Haiyang
 Zhang <haiyangz@microsoft.com>,  Wei Liu <wei.liu@kernel.org>,  Dexuan Cui
 <decui@microsoft.com>,  Dan Williams <dan.j.williams@intel.com>,
  linux-kernel@vger.kernel.org,  linux-pci@vger.kernel.org,
  linux-cxl@vger.kernel.org,  amd-gfx@lists.freedesktop.org,
  dri-devel@lists.freedesktop.org,  linux-rdma@vger.kernel.org,
  linux-mtd@lists.infradead.org,  platform-driver-x86@vger.kernel.org,
  linux-scsi@vger.kernel.org,  linux-usb@vger.kernel.org,
  linux-alpha@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback
 of bin_is_visible()
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Sun, 03 Nov 2024
 17:03:34 +0000")
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
	<20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
Date: Thu, 07 Nov 2024 17:20:37 +0000
Message-ID: <mafs08qtv7yfu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03 2024, Thomas Wei=C3=9Fschuh wrote:

> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
>
> As there are not many callback implementers perform this change
> throughout the tree at once.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> index 96064e4babf01f6950c81586764386e7671cbf97..5e9eb268073d18e0a46089000=
f18a3200b4bf13d 100644
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -87,7 +87,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject =
*kobj,
>  }
>=20=20
>  static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
> -					    struct bin_attribute *attr, int n)
> +					    const struct bin_attribute *attr, int n)

Acked-by: Pratyush Yadav <pratyush@kernel.org> # for spi-nor

>  {
>  	struct spi_device *spi =3D to_spi_device(kobj_to_dev(kobj));
>  	struct spi_mem *spimem =3D spi_get_drvdata(spi);

--=20
Regards,
Pratyush Yadav


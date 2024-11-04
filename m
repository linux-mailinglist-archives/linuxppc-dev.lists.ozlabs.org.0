Return-Path: <linuxppc-dev+bounces-2830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2CF9BB6BD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 14:52:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhtFh4tvKz2xHT;
	Tue,  5 Nov 2024 00:52:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730728360;
	cv=none; b=N2W4jg7/eQUh9P58MvFsUzHdve3UosbUKcqQiU4eQ4Pr28hfdnTdU66c/lpv+SADVJ2CtY2syYLdfbgtq3iwL/eRDUutjZMLn+JCBi+1KhkoABM7WtgPSayPYeQdwsvYMBkxM6Y7/IVHYVSgeaPaa5O+SmABFsXsvTxiQpvPimUz1jjy04fE4rjuE3FBoMCWsDiSZDdQZ5M0j+nD6J5E/pWvpicjxKEq6KFMI5S6nMozyIS+IN0xeOFNVI8JzRBSLwB9WKlfoHEvaX4bkvxyssky0gdlunlMvQH346DSkuCFXapK8v9vSbxnTAPfWUBP5SNuUPF0WrAtwOXmxe9egw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730728360; c=relaxed/relaxed;
	bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRcbkVseB1di+JosO7OaHj4RdUsLbH7WeEbITX/8bBrV2xb7lmOBkPFut4ke+pUxSTIoQvyUclBwIvJWF42Teb6FLRHH+1C/gTmzq76s0lCjwde7g66QupuMdw35eRNPx/TccJQ4AGy5DIL1H/6rOy49YVi3/kz/HyF4iA65ahdjLesSDqlHeOnokzQIizxiI5rWCGCsT6+Y8CxJ87hTvxSQPuP6ZwE8ST7DrRtD2E+qZ4djKiPnNL8Kp2cuK81uXZqk2JazimLT0zDwJ5tWtbl0XqABhci5Pxav9z7FwJjDAe5upl73zQsd+2rz/4eeDXhSvhm7+OdLkCC5QrSQAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cxQVkWFa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cxQVkWFa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhtFf6LDNz2xH1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 00:52:37 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-84fc9005dccso1252071241.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 05:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1730728349; x=1731333149; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
        b=cxQVkWFaRwN8Dc7g/cxJTT/W3gi4Au4TSO/1ZLgbQ6a04b/Z/xdogLwpo07zFil9As
         tENFoVTp9KcKuphJzApriTei516aOXt5Vbm3VPXibeWdi0SxK199Xvz2N/h8PSy7kZcj
         LRLtZSUR0WFr2k+C1LpAfKO7pUIsay6FMY1Vy97cMsyWytnR33aT1LR/bZcMefonjYKI
         WLKrOVhujQGecY3bU8g9gp5aviBX5n1gW+zZCwfcURb9HMsUKXDRHXdSWGEGMykDk9r/
         eM2y1FWShqWzM9VN01HJtE867LmNCvIN3jI60aAH7eyjaXv+qcX9Tkfx1L0msZGj0dQG
         MOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728349; x=1731333149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
        b=Q9i6pg5XDEWOtL8SNiD2s41WEUsR3TaOwrgoCNnWIFa/DO6r2ghsouvFWupH86qknu
         HxVhM/+dM5xiXNeGZVYt0+sQjDY9inmex7f9G4+giXytkpHwIENIOulyTdw7jXQA8Wd9
         N0HtSjQICQCbPC7RfIkRx89bkSNZtPJdDNp36zzIQMUCRra3c+xNKdYwdJjex5DHb39F
         GlsmS9urVFkMla7rQguH1zkZMq6R8OohmhFxgjMul+U0CmuqmBq3i6y4dc4V7LFEzE3I
         RXe/+QxZsiXqfSx12DY1yfrznTg64to91oRmr4Mv0VJB/RQ1UZMNuRUwxru8BIrBITAX
         UWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNFhm01bRGPXCGLdoIVp9kgnocH0WUFqSaaYfrX0tKsmSkf4y5kpte8Sgh04wpczAN6AWGrHrv3YKfoos=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQtP0dUBKqtDZK5W11AVHfaBkw0LckKqcxj3y6zMIzW4URgMyx
	eYBPjdPLGaY2nuguhIqvFjmcPntc4JcMycuAHl4VABVMX1gn6yjXSkKVak1gVMA=
X-Google-Smtp-Source: AGHT+IFmlPTEulo8PrBSa4hLGepjHWucd1eo0mnO56qT1Ydh9XheeGVoeKHcAHFWhX+avIDDQrBpSQ==
X-Received: by 2002:a05:6102:3753:b0:4a4:8756:d899 with SMTP id ada2fe7eead31-4a9543ece24mr15248394137.29.1730728348895;
        Mon, 04 Nov 2024 05:52:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad0adffesm47192441cf.32.2024.11.04.05.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:52:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t7xVL-00000000hsn-2kgO;
	Mon, 04 Nov 2024 09:52:27 -0400
Date: Mon, 4 Nov 2024 09:52:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	"David E. Box" <david.e.box@linux.intel.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback of
 bin_is_visible()
Message-ID: <20241104135227.GE35848@ziepe.ca>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 05:03:34PM +0000, Thomas Weißschuh wrote:
> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
> 
> As there are not many callback implementers perform this change
> throughout the tree at once.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/cxl/port.c                      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
>  drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
>  drivers/mtd/spi-nor/sysfs.c             |  2 +-
>  drivers/nvmem/core.c                    |  3 ++-
>  drivers/pci/pci-sysfs.c                 |  2 +-
>  drivers/pci/vpd.c                       |  2 +-
>  drivers/platform/x86/amd/hsmp.c         |  2 +-
>  drivers/platform/x86/intel/sdsi.c       |  2 +-
>  drivers/scsi/scsi_sysfs.c               |  2 +-
>  drivers/usb/core/sysfs.c                |  2 +-
>  include/linux/sysfs.h                   | 30 +++++++++++++++---------------
>  12 files changed, 27 insertions(+), 26 deletions(-)

For infiniband:

Acked-by: Jason Gunthorpe <jgg@nvidia.com>


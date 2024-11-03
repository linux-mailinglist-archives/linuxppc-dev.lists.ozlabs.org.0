Return-Path: <linuxppc-dev+bounces-2790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABBD9BA7CF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 21:02:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhQVY36S4z2xjL;
	Mon,  4 Nov 2024 07:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730664133;
	cv=none; b=iMjgXKS39fPpcohJad/2JXqZ5mPltJtwpZAJKH3OQFUXinRj2VfmHG5NUrAMw1GEBbpBopRwLH5Vdlt4pHqbTKoR8NAQfRLXAObeHXfszNqN4lp5H2W55Gojm7s+rXbhOOeUQ7ssUkP1EtLCAHwhI0omt47H4bG0p+oEXMomui8q91aNi6AzOXLBxA3OH51nUMHIgvH60bof3ike6ow0falJQMp10TIHaU1ihFdpvDPF18IB2Bsu2mWj/9DRPb0B/TudgayCsH929ZNTksArzFGTEdo3JxmO7rQlnN4Igv40EfNuCYAH7K2+meTtIm9FGiMyrtvQv8i4pVgE1JcbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730664133; c=relaxed/relaxed;
	bh=VjfQvqCHHfDeXG4GMQuNHaE4bkPmkI1XqjnN8lstP2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqNEv68M3fNo8Y7NEyOSO27bCNXq6udeVjfS8YYNjYFqCvcCn5bkDVC7AV5dObFeZh58HB7g4XQfWh0qIk8p/cf3OXoWmHqkfVixLIFYuVAbJ2FbBjnXS4xWxw2DK1EdyAg6iiXGH6QcaGGIjIN1kMDRObm8zp8EdIwdZmbb48FrlA+vBDbQHc3MY2vIwEBcQRpUSeShWuVlTZugLNQwv0KLVz/KWggSqVkKZ4F8I23MeeqUSQ4PcQzt7KOkx5ldKsAIQpnUmcMFWM0CuyrFgh5irn8m4dLPzD7EbaWRSDu60UlxVGykDfCEWPBGNy7o2wHVFe9yynJsKEf64y05ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass (client-ip=209.85.214.173; helo=mail-pl1-f173.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.173; helo=mail-pl1-f173.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhQVT3phXz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 07:02:08 +1100 (AEDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20bb39d97d1so31424725ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2024 12:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730664125; x=1731268925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjfQvqCHHfDeXG4GMQuNHaE4bkPmkI1XqjnN8lstP2Q=;
        b=nz5iwU9HFraSRUz0al0UcnMhuVqT4i31KtzQZgPgV04a+xdFURa29jEEcmjBQnmBrY
         ryfARdqruxaQDB+PY+LW6qAIs7bz31wwTJgqxjrNcA2iyXv+zjY5Jg60f9USblgLUwYg
         xAx54nFumaQhWRo72ycFG1sZAYcflqMybCqZILxvMbRexu+uaZnuY6nCG44P3GRVvW2e
         4cSa49PC+EYK2LU3LcgY+VfcQ+toV9aA84Yu9DtJhwzk5s84bI64Sv8+948IUkaZb2i/
         PduxHLtpWOoVj25L4kJj1ZLuKuFNXTDNJfOgUEsepp2tLBXCu/PFiGDJzoiIu84K+5h5
         eciw==
X-Forwarded-Encrypted: i=1; AJvYcCX02h6ItsIbxyHgtosYNVxtwsi4gwnXJngiwvCElwNA3e4hqlues+5mYjVk7Wgap4xro6dg5SIT3L4+C7s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzKjZH/Hfvcgq5GQ4e946WkgmeXd31gIKwKo/5hDiQsjG0yHg/Q
	iGIK6y4/kcUkT06fdhjRraHVSEtVwYythxP65tJRDuL39Q5j5kUv
X-Google-Smtp-Source: AGHT+IHAS+v1ffLBb+GI+ZNM4/mlV92TQI2AYHoaDbWsFSd1zPZgooqCqKQWbVDQVnW3KjMuxbyzsA==
X-Received: by 2002:a17:902:ce91:b0:20b:6624:70b2 with SMTP id d9443c01a7336-210f75154e9mr256357005ad.19.1730664125219;
        Sun, 03 Nov 2024 12:02:05 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105707059sm49877745ad.81.2024.11.03.12.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 12:02:04 -0800 (PST)
Date: Mon, 4 Nov 2024 05:02:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
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
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Message-ID: <20241103200203.GA183945@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
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
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

> struct bin_attribute contains a bunch of pointer members, which when
> overwritten by accident or malice can lead to system instability and
> security problems.
> Moving the definitions of struct bin_attribute to read-only memory
> makes these modifications impossible.
> The same change has been performed for many other structures in the
> past. (struct class, struct ctl_table...)
> 
> For the structure definitions throughout the core to be moved to
> read-only memory the following steps are necessary.
> 
> 1) Change all callbacks invoked from the sysfs core to only pass const
>    pointers
> 2) Adapt the sysfs core to only work in terms of const pointers
> 3) Adapt the sysfs core APIs to allow const pointers
> 4) Change all structure definitions through the core to const
> 
> This series provides the foundation for step 1) above.
> It converts some callbacks in a single step to const and provides a
> foundation for those callbacks where a single step is not possible.
> 
> Patches 1-5 change the bin_attribute callbacks of 'struct
> attribute_group'. The remaining ones touch 'struct bin_attribute' itself.
> 
> The techniques employed by this series can later be reused for the
> same change for other sysfs attributes.
> 
> This series is intended to be merged through the driver core tree.

This is very nice.  Thank you!

For PCI changes:
  Acked-by: Krzysztof Wilczyński <kw@linux.com>

This reminded me of an old discussions with Greg and Bjorn about how to set
size correctly for our ROM and BAR sysfs objects.  Nice to see a very nice
approach here, indeed.

	Krzysztof


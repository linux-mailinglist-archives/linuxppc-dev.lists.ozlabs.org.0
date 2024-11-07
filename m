Return-Path: <linuxppc-dev+bounces-2986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E51C9C0A5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 16:50:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkmkh6YKqz3bmQ;
	Fri,  8 Nov 2024 02:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730994652;
	cv=none; b=ceT/AQ0OD7gruS84w3l+vhw3E70gcajXwGsM9mVpq5QnW+aMnrlcrf3YPn8n1zfF7JODybxDiYnZHWlYqDuvhWR0i/tOj65MPhojRJqhjwApl3xQrCPAo2XMOH08nqlLbtlmlvBF4P6w+aIo7qcHcDozd8iIqQatxe13k3w1W+18n/co1/HDkBJASxNYI8IiVSykyQ3aj/1Pj8HKbxBdzyfRET1uBtWVeVM7Oh/xOZpjZbxgJpCBdcKnQvh+hVxHlLkJsKJm1mfpd/qpKOjhTVOWQpkxSWffKeEgO4BczHuubZtSDx8maqMBeg7jJFlpp/M0K/tDIBRhC6bPCsGa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730994652; c=relaxed/relaxed;
	bh=y4g9pTMBWn8NYG8DJqu2aF9WChjDh3es1iM4dJmMreI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBmn1XzMqiw9fhLUBqG+WkkewU048imiBsEh9p+DpCfYeVnY05FEZXNi6+m/7xN3C+g4T3sNBc7ObzUuK5VdghDMgFuXScOvu60d60nYQo3QuviTOR5cL9YE2iCWjU7WuJWq0Rvy+fioFD1B2G7o1LSU0ZGcsVkPpLjubVfhlrNMFhC3o95Cw6DKL8edbN90WZWEzrhr6s7uajND1raadFzYkvQeUpcrSrEBmGL+sYB/h8P99FIAmyEkimBBQdMoj3/E55TNzoUYxuswhVv5K47ivAgQ5hkOKziC3M+vmsHjr9c3U+3/OZWnZf8YAqhbCdVWb0ThIxQXChSPk4CfpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkmkg4QkMz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 02:50:50 +1100 (AEDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c803787abso10192275ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2024 07:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994647; x=1731599447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4g9pTMBWn8NYG8DJqu2aF9WChjDh3es1iM4dJmMreI=;
        b=qse60O8k++JxSunY2ezcLxBWgKQzUR4EoHqHQQMdSLpIvoP30yUSPTsXM+9u/aGywi
         s84TF+K0bL24Lfs5ZyVnPWN8ih5Qd9fT4riqb/CtrWpjyUJoh5DipfB3pSJadFniLROu
         OG6DG98LNSG8KedLhi8ktPbgd+JCvTB9Y+dKxZRgvICo9R8G00BjElCQTjmhzLpXZd7v
         9GOQn2wv57vppLyDu/7Bin8zwJsS8eI0yWYi/ADMAYBk8txacAf9GWtOIRSF95YoX3hb
         JTl1c5WeavyCJ+CvIf0vBO3cFKhHiroxwZl3UnIirK6tflNSyDKtdJz/9zBuHt5STuVS
         m6vg==
X-Forwarded-Encrypted: i=1; AJvYcCVk1brzH78BCTMK5pjiUS9jwVMaYYaHdYX2HKJvHS3PmU9FXcUXDNSNH7mBaxwIkD/VZOYn0Gb/UzfNrzE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0nRSt6ASv/vVHXdLFK/b4yRS8LLJz+UDbdrl65dVMOUfuEgKb
	kdTRJLbRLh+lz+98RJEPZ99z0mi3cBDhevJKx8lx0gQ6xg164w7m
X-Google-Smtp-Source: AGHT+IEfW8mc6K7WMilatY4cRGrx/jJrVZ2Go8Ums63B2x6oVuXb+zNT4RZMBtIqDecZElfJ9fn+6w==
X-Received: by 2002:a17:903:183:b0:210:e760:77e with SMTP id d9443c01a7336-21181184b51mr5235045ad.7.1730994647037;
        Thu, 07 Nov 2024 07:50:47 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c2ecsm13637145ad.252.2024.11.07.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:50:46 -0800 (PST)
Date: Fri, 8 Nov 2024 00:50:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
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
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
Message-ID: <20241107155044.GA1297107@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
 <20241106200513.GB174958@rocinante>
 <2024110726-hasty-obsolete-3780@gregkh>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110726-hasty-obsolete-3780@gregkh>
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

[...]
> > There exist the sysfs_update_groups(), but the BAR resource sysfs objects
> > are currently, at least not yet, added to any attribute group.
> 
> then maybe they should be added to one :)

Yeah. There is work in progress that will take care of some of this.

	Krzysztof


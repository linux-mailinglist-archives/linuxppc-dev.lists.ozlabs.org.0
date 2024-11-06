Return-Path: <linuxppc-dev+bounces-2936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD19BF7C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 21:05:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkGQm5dHgz3bgd;
	Thu,  7 Nov 2024 07:05:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730923520;
	cv=none; b=A+H7EswYwrbJ/FmWf/fhdgfG+1cpRfebPQVerYBqCuqDEyJjxUmme3WDKQPsIly2GmFdHy/5UCDZEq4ldeM3wsSpHUTANS91GEPZ1zHgbJUF7jCJkdc2Aap7ADTwSGWwHhaiokfPXNvvKiTXFBEco5ZiOPRZm8FTaZD7SVOjJlM/YKIqdWtAeDs9UgiEAO9kifPdCduj439kYtiNx1S9cAXtceZZSJO+fi7rtX8QMaw77Xesw+01imaj3VDUfpt5J40/l0VZF/B72T+XKklscoNAT59YqkhWjFar0p6sBmpRUlOTCCEq3P23FxhV9vVaN77WCyKwnR6HxtNugHc4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730923520; c=relaxed/relaxed;
	bh=57haWgxVK3Bhz2CTFQJdY/J31Debho+HXpt9b6frcmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjuH5awzDzFOZBKW0u5VIW3nl9vl3PG+AIM7Q67zy+t5LbXmxUFU5jcyE3DwIIfnvwDoENHuQppuerBa4pYt+1moNM9lr1LYIkI4sjbhu2zNmmU5JzRSjlpTfEgVHeDMZL21hp2RMCR5TRMSHxRJCfDcC34R2SE9eGXkjBcthX14dBseS9FkA/f50HR3eWKtuvhpQSZgjWNaiJN2ftt+g4YvMJ0z9DbY9Cyv2qVlK+TSmDc3Uxwz1NdAf6BfJI1RPSulwqjppPeM/lEy2QeCWBeSygmfjyin/d18tVdp1IKf2RHKQn1VO033qmh9sRbMtUn32lXrEOpttv4orRVW+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass (client-ip=209.85.215.177; helo=mail-pg1-f177.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.177; helo=mail-pg1-f177.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkGQl1PL5z3bd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 07:05:18 +1100 (AEDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7f3da2c2cb5so200586a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 12:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730923516; x=1731528316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57haWgxVK3Bhz2CTFQJdY/J31Debho+HXpt9b6frcmw=;
        b=hc1g7gq9disVuN7O6WjBpZWLG1dDGg8gtm9JkEFecX76RtsLGp4q6OWSBp4vZIZvjv
         Ea/vK+7TFrZiNddom2JFhWQpy6ztNVqL8pgt+pISd9S5O4PnsVDpA6ujAt9m5TReAUC9
         M/8ru4W3UqwIlxpCrfz5+BbUyNBr2H9WuCamQFNZfytlDshEj/6AxLiT6GZkDj32YCRT
         O1lc4mFLu9uQLFXFC3dU+M4CuwVvuE5N0H3WzXV35tmwucOoXULoc8sosfWTBgdYvhAw
         osOV6bdK2a742XTBk9lOFOsPa6jSXMWD0+P1V2RzUgx8fdXhBOjXL/YvLeH3pX1VdBPp
         Okew==
X-Forwarded-Encrypted: i=1; AJvYcCW4h2OTWvr4WuOvXR1goVRCoWSy6SfWPt6bstj2JdqMIC6h+SfORDrgjWIa8ursfQ1fQmPaHV23ewB2Gbs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPBre8Mx2pFMTYIA88kA2W81FJd39QbWhCU5aMzoYqD+4VJu+S
	5HK0iPtcjNEKOFGCwdBBUXo5Ta4qo1LOLt8W87hu2X1j49NosEyO
X-Google-Smtp-Source: AGHT+IFmoIbZw8g1IipDn3Lp+ri/9C7OdJSPor3hPH1pRa7RYRF3y6lGuH/8ZaeEQ1eFo8eAFPaCWQ==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id d9443c01a7336-210c6c3ec78mr567878865ad.41.1730923515866;
        Wed, 06 Nov 2024 12:05:15 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c076bsm99997795ad.197.2024.11.06.12.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 12:05:15 -0800 (PST)
Date: Thu, 7 Nov 2024 05:05:13 +0900
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
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
Message-ID: <20241106200513.GB174958@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
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
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

> Several drivers need to dynamically calculate the size of an binary
> attribute. Currently this is done by assigning attr->size from the
> is_bin_visible() callback.
> 
> This has drawbacks:
> * It is not documented.
> * A single attribute can be instantiated multiple times, overwriting the
>   shared size field.
> * It prevents the structure to be moved to read-only memory.
> 
> Introduce a new dedicated callback to calculate the size of the
> attribute.

Would it be possible to have a helper that when run against a specific
kobject reference, then it would refresh or re-run the size callbacks?

We have an use case where we resize BARs on demand via sysfs, and currently
the only way to update the size of each resource sysfs object is to remove
and added them again, which is a bit crude, and can also be unsafe.

Hence the question.

There exist the sysfs_update_groups(), but the BAR resource sysfs objects
are currently, at least not yet, added to any attribute group.

Thank you!

	Krzysztof


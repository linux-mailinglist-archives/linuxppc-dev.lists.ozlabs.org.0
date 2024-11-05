Return-Path: <linuxppc-dev+bounces-2878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865D9BD20F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 17:15:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjYNV6z7nz2yNf;
	Wed,  6 Nov 2024 03:15:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730823354;
	cv=none; b=ZT9W3DlcvcgohvW2b2W4jRvc10rmDLKD0vPeV8z4lG4zTuYDO8i2cBHZZlOsoOvBKCfDcX5VylfwmFFpKO8/6kPRn1ce4xaQHLgaMLeSNc9VA3ympb/lZ9xu8nojPWfSEwbzi8+9H44EoiOz0q0nzTuQyJr20vfihiVVBSeANDuvDM5wJiqw5BQ3qE4j7p+3KzQccht/3r/m8IaqMsix3ajhS2FD0jveu8UGB2hq+LHZoTpkhsg5qD7azl1lUazatRAuVEfSJmCo3A6IFUwOA5bu0cg6m91Qkewdoer5r03D/3OMe4dvhBmPR3x9uw5jxm/1vf7q1CIdOoWRbvEFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730823354; c=relaxed/relaxed;
	bh=I7deoQiI/I0s0AnBYc3st405nHQMaQq7EvD2UtzD7R0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RP+nwYeB/Es1dN8a4HJ+gYWwQBpHDxKctMx8hP0/u/CngSjMVyvXDjGK5TdEqi+WssIimWe5BPOAU/LRurtKy0g0oK7VkPvZEsap7jgk9sxnmBL6hs52W/UYzN23BXYCYmNrP3uUw/23qxyze7ENlU35Tm9IcWKI6fIV/rvQ6kVcAXMg/bsZCNxzgzCcUzmzu4eYJvUw8Spb2hIGVmmDvwUaB0QPJ0UCggWsdAyOVeTrb+Us1DqYyUYDo60iU61qyodVi57z78k8ZgyAzIuCbJxeMkKmYPsaZNUK3jYOrlE5TzZ6kwkchjK3KKZXXjNw9klMAVoUOdlacz+qVBsj+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sWLIMHKb; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sWLIMHKb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjYNT6n7sz2yZ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 03:15:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 461B35C5537;
	Tue,  5 Nov 2024 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D505C4CECF;
	Tue,  5 Nov 2024 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823351;
	bh=I7deoQiI/I0s0AnBYc3st405nHQMaQq7EvD2UtzD7R0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sWLIMHKbpYnvH6vRYHC5fNsdXCCNIXg5Ll5/2V0vc6iO6jH8ObMQ4Be/2WJlSRkFO
	 96/qxRGVh6YcfDqHdyjqlzEV4fxUjiBENL+duJ1uiL+Rqhoa3pZpaqTPPM+IhiqIFZ
	 1Sk/o475+agOHv0qmgOhR36E0RtNgKxTuBr1ZJhfrXdvCOWlPgobXmSzUv+OFDnq3o
	 nfjm0YQ6eFyuk0wALiKZYhYt2TgA8p2WUZTSSBteEaJwAKQSjXx+/iCrS96AAI40Ua
	 e4I7EQ0gtyiErnCjgLdP+OJ0QkEAmXj83mHJYpDx6YeObr9yAZURKrOoBK0wWz3FbB
	 ACYyypzEASVoA==
Date: Tue, 5 Nov 2024 10:15:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <20241105161550.GA1474637@bhelgaas>
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
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 05:03:29PM +0000, Thomas Weißschuh wrote:
> struct bin_attribute contains a bunch of pointer members, which when
> overwritten by accident or malice can lead to system instability and
> security problems.
> Moving the definitions of struct bin_attribute to read-only memory
> makes these modifications impossible.
> The same change has been performed for many other structures in the
> past. (struct class, struct ctl_table...)

Throughout series, it would be more readable if you added blank lines
between paragraphs.


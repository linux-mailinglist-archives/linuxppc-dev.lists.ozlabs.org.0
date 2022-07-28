Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E45839A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 09:41:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtjJ74LPlz3bl6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 17:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cv5PwUYC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cv5PwUYC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtjHT2Vfwz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 17:40:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EFBDFB8232E;
	Thu, 28 Jul 2022 07:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B61C43470;
	Thu, 28 Jul 2022 07:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658994031;
	bh=p81wbSl4jQvNdxEQIWuCLFSph+3DQKM11CCOw6EGVc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cv5PwUYCCTni2XA0aQzBYgUcsAonaMU5j+FBsyqzk1VBGaUBwrzetTytavedUvCdv
	 oSg/NaVW1sccm2S21QeVGOyR1WM91YMv4P9yxSS7MSeF543QvBSwiKkuZ6QY8IzHze
	 IXXPphSIebXXWzKADTcb8tz4gH5C6DlKkfx8oIXcYjaqkXOXSKrD9X7bvIgAbeyAEH
	 hLFbMjVVFD7ONHyHCMfWpdGYm0ln5egrWHzeuKff2JN3TpGNhKoI//vy5s3bHUeRcY
	 cWWmFbwBBKWhGj2msQyHoMmDM4sJ7bKKc9vKPtOCRSCrdeyUhH+5/lKCptXnTGYayu
	 ftYnFgLCqFFbg==
Date: Thu, 28 Jul 2022 10:40:28 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v5 4/6] tpm: of: Make of-tree specific function commonly
 available
Message-ID: <YuI9bLmqGsZwn4n6@kernel.org>
References: <20220706152329.665636-1-stefanb@linux.ibm.com>
 <20220706152329.665636-5-stefanb@linux.ibm.com>
 <YsuTRny45aBxGjm5@kernel.org>
 <3a9196b3-c510-0c32-8b70-572d9c4fe69d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a9196b3-c510-0c32-8b70-572d9c4fe69d@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 15, 2022 at 12:01:36PM -0400, Stefan Berger wrote:
> 
> 
> On 7/10/22 23:04, Jarkko Sakkinen wrote:
> > On Wed, Jul 06, 2022 at 11:23:27AM -0400, Stefan Berger wrote:
> > > Simplify tpm_read_log_of() by moving reusable parts of the code into
> > > an inline function that makes it commonly available so it can be
> > > used also for kexec support. Call the new of_tpm_get_sml_parameters()
> > > function from the TPM Open Firmware driver.
> > > 
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > 
> > > ---
> > > v4:
> > >   - converted to inline function
> > > ---
> > >   drivers/char/tpm/eventlog/of.c | 31 +++++--------------------------
> > >   include/linux/tpm.h            | 27 +++++++++++++++++++++++++++
> > >   2 files changed, 32 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
> > > index a9ce66d09a75..f9462d19632e 100644
> > > --- a/drivers/char/tpm/eventlog/of.c
> > > +++ b/drivers/char/tpm/eventlog/of.c
> > > @@ -12,6 +12,7 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/of.h>
> > > +#include <linux/tpm.h>
> > >   #include <linux/tpm_eventlog.h>
> > >   #include "../tpm.h"
> > > @@ -20,11 +21,10 @@
> > >   int tpm_read_log_of(struct tpm_chip *chip)
> > >   {
> > >   	struct device_node *np;
> > > -	const u32 *sizep;
> > > -	const u64 *basep;
> > >   	struct tpm_bios_log *log;
> > >   	u32 size;
> > >   	u64 base;
> > > +	int ret;
> > >   	log = &chip->log;
> > >   	if (chip->dev.parent && chip->dev.parent->of_node)
> > > @@ -35,30 +35,9 @@ int tpm_read_log_of(struct tpm_chip *chip)
> > >   	if (of_property_read_bool(np, "powered-while-suspended"))
> > >   		chip->flags |= TPM_CHIP_FLAG_ALWAYS_POWERED;
> > > -	sizep = of_get_property(np, "linux,sml-size", NULL);
> > > -	basep = of_get_property(np, "linux,sml-base", NULL);
> > > -	if (sizep == NULL && basep == NULL)
> > > -		return -ENODEV;
> > > -	if (sizep == NULL || basep == NULL)
> > > -		return -EIO;
> > > -
> > > -	/*
> > > -	 * For both vtpm/tpm, firmware has log addr and log size in big
> > > -	 * endian format. But in case of vtpm, there is a method called
> > > -	 * sml-handover which is run during kernel init even before
> > > -	 * device tree is setup. This sml-handover function takes care
> > > -	 * of endianness and writes to sml-base and sml-size in little
> > > -	 * endian format. For this reason, vtpm doesn't need conversion
> > > -	 * but physical tpm needs the conversion.
> > > -	 */
> 
> 
> Jarkko,
> 
>  can I apply your R-b tag after putting this lost comment back into the
> inline function?
>    Stefan

If there's a change I want to see the updated patch first.

BR, Jarkko

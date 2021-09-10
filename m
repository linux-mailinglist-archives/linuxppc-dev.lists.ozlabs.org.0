Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F144B406DE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 17:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5fJJ66xzz3050
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 01:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=mZ0JcBF5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5fHX5DRrz2xrg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 01:02:28 +1000 (AEST)
Received: from zn.tnic (p200300ec2f0f0700e42ce33fe8cf6a79.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:700:e42c:e33f:e8cf:6a79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 93BC61EC0277;
 Fri, 10 Sep 2021 17:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1631286138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=40kPdt7aP/VJYkQyMREfQyPgJ8o6qpk6K8Mxu6v6cSc=;
 b=mZ0JcBF56mTU6V0YTC61tZbPl8X0LCaqV1t+QlhEk3mjWHgSHZF5dXkxFXSXhGUION3Odd
 8c/8BBNjWwb218w1V8+ZjDkG7xQbIB2escJ8cg5SbXRf2ClULwId1eDLbmvqpxW7H+B37m
 j71cPf0I4R1mC5Q61ol+StbImh1Vte8=
Date: Fri, 10 Sep 2021 17:02:10 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 2/8] mm: Introduce a function to check for
 confidential computing features
Message-ID: <YTtzcoFdi7Ond8Kt@zn.tnic>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <0a7618d54e7e954ee56c22ad1b94af2ffe69543a.1631141919.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a7618d54e7e954ee56c22ad1b94af2ffe69543a.1631141919.git.thomas.lendacky@amd.com>
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
Cc: linux-s390@vger.kernel.org,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Andi Kleen <ak@linux.intel.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 08, 2021 at 05:58:33PM -0500, Tom Lendacky wrote:
> In prep for other confidential computing technologies, introduce a generic

preparation

> helper function, cc_platform_has(), that can be used to check for specific
> active confidential computing attributes, like memory encryption. This is
> intended to eliminate having to add multiple technology-specific checks to
> the code (e.g. if (sev_active() || tdx_active())).

...

> diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
> new file mode 100644
> index 000000000000..253f3ea66cd8
> --- /dev/null
> +++ b/include/linux/cc_platform.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Confidential Computing Platform Capability checks
> + *
> + * Copyright (C) 2021 Advanced Micro Devices, Inc.
> + *
> + * Author: Tom Lendacky <thomas.lendacky@amd.com>
> + */
> +
> +#ifndef _CC_PLATFORM_H

	_LINUX_CC_PLATFORM_H

> +#define _CC_PLATFORM_H

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Return-Path: <linuxppc-dev+bounces-5288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A0A11EAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 10:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY1cH3zqqz30j0;
	Wed, 15 Jan 2025 20:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736935007;
	cv=none; b=a0D3BE2r9aiuBPeLEjULQKD+5ozAybkoGFz/YQpjLK1t6D+CiZMfm9zXo85lFZO7uzUzJltTk1tZJY+urQTk1yqepFI6dvW4yZ+v0wggYtbAe5+bPPMQLnXCo3GUnnTUa3LPZwLFb5GlZ24cXCVsNVZeicgWfE0RTQymORFvs3hyO3beJsMimzcik5VLHEbLCLJKWNnPtsvpKTo/8vPdAbTiQzZFauPerFlu7fFfzhB7mxptXaWEOkmbNxN7j3vhPK7YGAMtxLull+uyw5sgvsJISlKjf20MXHA/UtHIDhCwfOM/F6eOWe79jW4uGhzmr1KpI4Q8OBBJDT/b2Sc2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736935007; c=relaxed/relaxed;
	bh=UUvUf/NV6wQ6+OCoDOgbLlkdYeV9xV7f0VyRRZAm7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpV0QP1P/8jqMAo1SBox5RxYNhrmfDNBXM/LhW87249IxL/f4UNolwXI5qItCThVdNAg+6gqZBiiAjLV1H/sOVds193E2qWyKMHUXvxqsx7PpxFeoZ8rc/DPH5VUcAY7UQo8sCQ+KhItW9TX7+LmwVCNXheoedQ4K/9zEW8kNN6v7eYpIuNQG9K4XSW8bdnvcsqGSqpEmQqFAtB0E3y59BMe3GlTaEnKx4KzOVmz4fx1IDHz3qn+c4vQIk7OeoRgCvspSeKpR/6jUrLcLHo6HXNzyMH4cBdPndLrEF+sQzqUktTZW1XF01xeby5dX2Rhp/ADb0ss90D82VsuUjno9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY1cG73SHz30hW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 20:56:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D6E12FC;
	Wed, 15 Jan 2025 01:56:44 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AAD23F51B;
	Wed, 15 Jan 2025 01:56:12 -0800 (PST)
Date: Wed, 15 Jan 2025 09:56:09 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <Z4eGOfDjz7RS8pBq@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
 <20250113-0fe04c6089726d1d06a254ec@orel>
 <Z4aY2AKSaxKDY5Hq@arm.com>
 <20250114-10fb4c9302167ef202e98713@orel>
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
In-Reply-To: <20250114-10fb4c9302167ef202e98713@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Tue, Jan 14, 2025 at 07:39:49PM +0100, Andrew Jones wrote:
> On Tue, Jan 14, 2025 at 05:03:20PM +0000, Alexandru Elisei wrote:
> ...
> > diff --git a/configure b/configure
> > index 86cf1da36467..1362b68dd68b 100755
> > --- a/configure
> > +++ b/configure
> > @@ -15,8 +15,8 @@ objdump=objdump
> >  readelf=readelf
> >  ar=ar
> >  addr2line=addr2line
> > -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> > -host=$arch
> > +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> > +arch=$(echo $host | sed -e 's/aarch64/arm64/')
> 
> Sure, or avoid the second sed and just do
> 
> host=$(...)
> arch=$host
> [ "$arch" = "aarch64" ] && arch="arm64"

Yep, thanks.

Alex


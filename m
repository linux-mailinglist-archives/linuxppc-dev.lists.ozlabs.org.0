Return-Path: <linuxppc-dev+bounces-466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5FB95D3AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 18:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr5Ry2yVbz2yvk;
	Sat, 24 Aug 2024 02:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724431278;
	cv=none; b=fw+hKfc0DgiCUbNMVQgZb69ym1sLT0NuiY3SbhAClG0GEt92GPHzXAxmnN8WXD6F23nNq8wcXo22up+TqkWZ66BCUQjmI00G/CO2Ju7zmgHLosYSQeLCakaShX8hTvr2kMqoZoTn98MF/EQD6GtFa+TUK7f2wWL4ld/EqnC9uWQAyrnK0sle90lsGAWapSbs3PKW+ftAOftHuIOKyLFMFDusUa1P0i84TowQBt5r/sRSeCsetMKQ89DlBWooD49kMIAlwqjILluIp/1s75A+TWKl1HdeJTO/ztUMthpjZUpvTx5WRMsUJVNx31L+hUCaADda8hc18XwWVUcWfpBlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724431278; c=relaxed/relaxed;
	bh=oN87FP2CLweOxVCzRwR4t8EmbAa3c0hPfA2xu+5mcvY=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=OiUL0uzgLMRc5yssQ8goaQrbgZPx0MAa+h1uBUuQLoWWAHU6t09SWH/NopD8uLacULjQ4GbIxEXiRrV+H1Mp/rpGBQtUSzYDhpM9JtiJ6Dg9B1AlhBxQcowTEkblCFBCWirPa8dAeU1h7J19M68xCcXyrf5VVlJFWgv+niwIF30bvZ3V2fA09Qx00Gx0WkNhRNHVtxh7LOIVBVAPoL7n10j3HIKbzECLxSO6Y1BlTq57R4GvNq4twHcEGg1DnC6f0HrX+s/J7l8fbu2gHYSGL9ZEelZQLUG6uVRF2EwmfjnwZgaIKCygQGdDBEfO7/D+bfKd2cvmPth0pCTdYg/Jdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr5Rx3hydz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 02:41:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D918E6123B;
	Fri, 23 Aug 2024 16:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB56C32786;
	Fri, 23 Aug 2024 16:41:08 +0000 (UTC)
Date: Fri, 23 Aug 2024 17:41:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <Zsi7ovLOfuFdfuuz@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823144531.GH32156@willie-the-truck>

On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > +static void permission_overlay_switch(struct task_struct *next)
> > +{
> > +	if (!system_supports_poe())
> > +		return;
> > +
> > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> 
> nit: typo "chaning".
> 
> But more substantially, is this just to prevent spurious faults in the
> context of a new thread using a stale value for POR_EL0?

Not just prevent faults but enforce the permissions from the new
thread's POR_EL0. The kernel may continue with a uaccess routine from
here, we can't tell.

-- 
Catalin


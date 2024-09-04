Return-Path: <linuxppc-dev+bounces-973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071C96B895
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:31:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzJgv4xnfz2yVT;
	Wed,  4 Sep 2024 20:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b8"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725445899;
	cv=none; b=c6EoI6J1Yx5gHaGR0MU6oEd52dbhliftRJVFPMZR+Nxe7DPmsArAf5P1D0A1q2h2IwhX/cEkC98Rhii4kIqt3E39hlCAuxNmiwpeGAN98ijpAqqVE9bkFL6P1qgIc2iMb97leUFwRMUab/9WSmwrUsRQyVYAbgz+LKoMGUoCrFO+dm8W9arD2mV8qGuDsU26xL2uA5WxTtmiUds62idj+bruVeIt18vNaGtWCtsCQoZ45Lz8EmN0S5NEcBL4YlHUprFgSko6lRWshCPyUCoIyX4dBVPF4SudVvOE9GcpvRskYb0F35WOotb0j7MiCO7o7AyINR81KMhPYRtYM7SG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725445899; c=relaxed/relaxed;
	bh=VyKvNgtoMrVx3fAVtA4/OoVtytmNaDZAp4IyKrDyjcI=;
	h=Date:DKIM-Signature:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=hTrXhHQqg5U31i9pBVRvgoLY/flLYT/F6jpz4IxcGP/9tNEaYghTWhAJWYOBsDwXQiYhjLlRfzQLLL6vrfotm1mkNqw2rrXkhsRSpa+g5guZcrfXZR1WQk4QWhIqb4cpwKbTQcxMSup3Ko3gYoDGZ1XkClOpSJTYR3eW7QiaiIx2l4bIRb4w3qKcZF1vzxLl4lebDBRjhsINCTf8w4Gks3xEo+GBdX8PVrAzwGpGW6FfevYfpkVtxNGsFyHmeYFpqp/oAG7JOj4poKuvuKDXHHwMTKQHkFFZTf6S28R9++x3x0WWbA1G+BXlGDDrfz4kCJgW6p1oWsL1TmWqmI1bHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a1K0DUpO; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b8; helo=out-184.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a1K0DUpO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b8; helo=out-184.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 64809 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 20:31:37 AEST
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [IPv6:2001:41d0:203:375::b8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzJgs42gnz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:31:34 +1000 (AEST)
Date: Wed, 4 Sep 2024 12:31:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725445868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VyKvNgtoMrVx3fAVtA4/OoVtytmNaDZAp4IyKrDyjcI=;
	b=a1K0DUpO8mmErOfKiPgYIgei6ZCFtp1C2g0grZ5qpQey1pE+U28UYPP/mvF2Yor9qCra6i
	DQMbXlZP2SpLxrunSfSiRNIcOqjlRzeD7CaCqH2l4S16/xYJ10yf3sYekwjJJoB9bYrsw4
	EOuiWCeXPXU5Y7KCOOnts/OmTGKGLB0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, thuth@redhat.com, lvivier@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH 0/3] Support cross compiling with clang
Message-ID: <20240904-b4568b20f98773096c0ebbf8@orel>
References: <20240903163046.869262-5-andrew.jones@linux.dev>
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
In-Reply-To: <20240903163046.869262-5-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Tue, Sep 03, 2024 at 06:30:47PM GMT, Andrew Jones wrote:
> Modify configure to allow --cc=clang and a cross-prefix to be specified
> together (as well as --cflags). This allows compiling with clang, but
> using cross binutils for everything else, including the linker. So far
> tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
> to get it to compile - which is why there's no gitlab-ci patch for aarch64
> in this series). I suspect it should work for other architectures too.
> 
> Andrew Jones (3):
>   riscv: Drop mstrict-align
>   configure: Support cross compiling with clang
>   riscv: gitlab-ci: Add clang build tests
> 
>  .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
>  configure      | 11 ++++++++---
>  riscv/Makefile |  2 +-
>  3 files changed, 37 insertions(+), 4 deletions(-)
> 
> -- 
> 2.46.0

When compiling with clang and --config-efi I hit

lib/efi.c:342:29: error: field 'vendor' with variable sized type 'struct efi_vendor_dev_path' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
  342 |         struct efi_vendor_dev_path      vendor;
      |                                         ^
1 error generated.

Our efi code is exactly the same as the Linux code, but Linux avoids that
warning with -Wno-gnu. We could also add that to EFI_CFLAGS, but I think
I'll just add -Wno-gnu-variable-sized-type-not-at-end since I like seeing
these things as they come.

I'll send a v2 with a Makefile patch added.

Thanks,
drew


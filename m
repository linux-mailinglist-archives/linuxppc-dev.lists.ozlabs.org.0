Return-Path: <linuxppc-dev+bounces-2543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D679ADF7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 10:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ0311Wnpz30BW;
	Thu, 24 Oct 2024 19:49:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::aa"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729759773;
	cv=none; b=N/Is3C+71DbByGJvWcrH4WxP5Hd3cHxUUdxz1+NjLaD7VargR/OTs6qwI7PoeLCxSWqBGWG9gkxSyNXO0II/oFzT36N+q+6F45LdAyNYRCYkvycQ6kdXsfiKKyh5QEviWiaa3JMLFTVkGe+xDkC6Z+I00bPU5WsFrkY2iqFWbZIjAKK1/LPk5rTzf73PalAImZV0mLfubVjEJ0Pt2cODxN5+P4328turJ8hgmQF4dB82REmocbjsR4SQXT0J1spVuW9wQqFU4cGzhSmWovuYHRBYNCOTgBeNR0ZHCvispN5DG3OqVYl/DDYl19GFcsEvamKQMYVYaI1c9iyLhcXSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729759773; c=relaxed/relaxed;
	bh=7A7SSI40hPXOoNVasTXPi3W2hqog0qAqPQKBVOcc5W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NV/LJ+v8RiKiBiVne1LuExnfGY089k12S8YLIKZNi7eLgczUUNbeDge6T0GQhuBvY4qL8DCfsHcfLbSJHG+kuJXh7w9eqEcIR8Dg0Xq2IHnm1ApzP/caR+Q8UXOTn/hIpgA9Ev+9OROQCrpf2BHjCPXPyUGvSsEt0IFQUYpj83jef+SUXFBMmYYbUTLims8AFsy15gt6SlCgVELTjTtA+u7LBnsPJZO5JnQQg+DHzJGDbm+KxGIobW4Il5AMx2yy3fVLGHuG2NuPJ6xCPmywL+1eO3BmJNzXJcAHpvMp8CQNc8V6opnLpYuT0ZIWNlUiA6G8TU7WPusGjZTQkiE10g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LWyQtjaS; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LWyQtjaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 602 seconds by postgrey-1.37 at boromir; Thu, 24 Oct 2024 19:49:28 AEDT
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [IPv6:2001:41d0:203:375::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ02w5Z8jz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 19:49:26 +1100 (AEDT)
Date: Thu, 24 Oct 2024 10:38:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729759135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7A7SSI40hPXOoNVasTXPi3W2hqog0qAqPQKBVOcc5W8=;
	b=LWyQtjaSFN8PSZnIMLn7qxaE4w4YSQZzifoc2B8ZTYKBm73KZn13CBkjYqVIaBDua0YJR3
	Nw4koRUvJJafhZcS9w8kGN2XeLunS+/uoYmAlsC0JKclJLJs5rbjO+1lHR+oMq6UrvgGKt
	z1GiV3cOFng4MgccmdxpXjIOl8tNPMU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, thuth@redhat.com, lvivier@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH v3 0/5] Support cross compiling with clang
Message-ID: <20241024-cecbb361d7e3f21c7053408b@orel>
References: <20240911091406.134240-7-andrew.jones@linux.dev>
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
In-Reply-To: <20240911091406.134240-7-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Sep 11, 2024 at 11:14:07AM +0200, Andrew Jones wrote:
> Modify configure to allow --cc=clang and a cross-prefix to be specified
> together (as well as --cflags). This allows compiling with clang, but
> using cross binutils for everything else, including the linker. So far
> tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
> to get it to compile - which is why there's no gitlab-ci patch for aarch64
> in this series). I suspect it should work for other architectures too.
> 
> v3:
>  - Add README patch for cross-compiling, clang, and cross-clang [Nick]
>  - Add comment to the commenting-out of mstrict-align [Nick]
>  - Add the reason to ignore warnings vs. fix code to commit message of
>    patch2
>  - Picked up Nick's tags
> v2:
>  - fix building with clang and --config-efi by suppressing a warning
>  - added riscv clang efi build to CI
>  - picked up Thomas's tags
> 
> Andrew Jones (5):
>   riscv: Drop mstrict-align
>   Makefile: Prepare for clang EFI builds
>   configure: Support cross compiling with clang
>   riscv: gitlab-ci: Add clang build tests
>   README: Add cross and clang recipes
> 
>  .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
>  Makefile       |  2 ++
>  README.md      | 22 ++++++++++++++++++++++
>  configure      | 11 ++++++++---
>  riscv/Makefile |  4 +++-
>  5 files changed, 78 insertions(+), 4 deletions(-)
> 
> -- 
> 2.46.0
>

Merged

Thanks,
drew


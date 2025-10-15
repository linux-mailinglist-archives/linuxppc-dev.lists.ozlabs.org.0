Return-Path: <linuxppc-dev+bounces-12869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72715BDBE7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 02:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmWx62hw5z3cQx;
	Wed, 15 Oct 2025 11:22:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760487722;
	cv=none; b=BOjWm6b/XwJTd1rEEUSPR8perwvwnZJ1236jU8BxP8QOR5s8Kph5N/bivFD9wFMFkdY4VaJnxlNvxDlD439qThNuDVz96M2jK1P8kv8O0IBfgKuiuuuO1JryRYGNQ/VlHSwL23yD9bTVYFZDGdUhutVll+PaplKoADCb9TmSn+8fLBgtHOXwmSL28TDb6mI2KlDnAcB3HWTUOjPoWX9DPsW0jba0ysVNaAzgJLNJOHQJWKrvlRO6H4dUUo8XwzS2VXwtPONkKkwOb/oM0yUmFGA+obD0LJhf4yluK7RkRZZN4VpdE9YVJGvQ2mj50AR1u4R6t9mxzYutidT98HDVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760487722; c=relaxed/relaxed;
	bh=2Ya1iHobdldggBQlQvx6CQfKC8LhONqqlkvfoWoP9+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db7mcug+z7KGSjJ9na6VAqED+4gPn/Fm0I8gzrIw6obDJ2S1V+VZ1oqB9EpWwnSyas2ZrkelDy/gLQmjK6QJkAUc4EagYroj3Kaqodwc4NixdRyWMkfFLNNRQ4602Q2F56OJHkSCG9WVdVEDK0MZafj4IE0+KyA6315ibkU9A26rjwmlWMga1jy27q9Ee5+OIQJWN6Ex7MgZsRNRwqzjh3D4b08GpO6J1savCKNmp51da8o/vRKEIlfyNm35xTz9oNdgT5ykl9pwxfoNEUISUfxFfZbMKWwJg6A6qxAGXmKadpvKQW6MZlfwkXgsqR307LmOzfrq68FVq70rgQRt1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uoEDLvVM; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uoEDLvVM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmWx506RHz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 11:22:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BDE344078;
	Wed, 15 Oct 2025 00:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A30DC4CEE7;
	Wed, 15 Oct 2025 00:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760487718;
	bh=oLFIibXnPFOJz0MzV3NAkJL/mBUsPSV9HGDX9rhCWkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoEDLvVMBYvbxbaqRExO4mBuOXW8xK+xBsM3YpN8BU1lvBX4p3ZAdfzt2L3+iF0GN
	 WG1/B5BcjO6G5oQtvfsi/xChcW18K/a54r1fdPVQsmPwbbPFnAXEa4+7w5bzq4flhf
	 6VHS/tdoIl0wngQjxhoS3nTFA8kCFfDp3DcveH/+FyeZcZo2KjS0k+8Ypk97Xtmuun
	 8K2iC6fX/3DXfiRfPJuvJbT3N1ZJXjBgUU19rx60Zsxgh/AO9zi2sWjzPrju9lComF
	 gSaIX68xorVOyC+xLeGk3YYnNWC6eRkJurprqsPEMD5vPVxi8cCVp0VHEmEfLgQjp+
	 O1BtSRYMnbkCg==
Date: Tue, 14 Oct 2025 17:21:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Message-ID: <20251015002154.GA2300901@ax162>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
 <20251013040148.560439-1-vishalc@linux.ibm.com>
 <2b4a3215-1620-40c9-a00c-ca833ebbb7b6@csgroup.eu>
 <aOypxKMzsLR5tAtv@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOypxKMzsLR5tAtv@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Vishal,

On Mon, Oct 13, 2025 at 12:57:00PM +0530, Vishal Chourasia wrote:
> On Mon, Oct 13, 2025 at 08:46:48AM +0200, Christophe Leroy wrote:
> > +CLANG ppl
> > 
> > Hi,
> > 
> > Le 13/10/2025 à 06:01, Vishal Chourasia a écrit :
> > > While debugging a ppc64le QEMU guest on an x86_64 host, I observed GDB crashes
> > > when attempting to attach to the remote target:
> > > 
> > > (gdb) target remote :1234
> > > 
> > > Investigation revealed that cross-compiling the Linux kernel for ppc64le on an
> > > x86_64 host using Clang produces a vmlinux binary containing an empty .interp
> > > section. This empty .interp section is responsible for the GDB crashes.
> > 
> > Which version of CLANG is it ?
> (i) ❯ clang --version
> clang version 21.0.0git (https://github.com/llvm/llvm-project.git a80bccc6847be104948f46d313f03ac6b9ccb292)
> 
> > 
> > > 
> > > This issue does not occur when:
> > > - Building for ppc64le target using GCC on x86_64 host
> > > - Building for ppc64le target using Clang on ppc64le host
> > 
> > Is it the same CLANG version ?
> # clang --version
> clang version 22.0.0git (https://github.com/llvm/llvm-project.git 2f755c543ab357bd83235592fcee37fa391cdd9d)
> 
> > 
> > > - Building for ppc64le target using GCC on ppc64le host
> > > 
> > > For details refer [1]
> > > 
> > > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=33481

In this bug report, you mention using LLVM=1. Does the issue happen if
you use GNU ld (ld.bfd) via LD (i.e., LD=powerpc64le-linux-gnu-ld or
equivalent) over ld.lld from LLVM=1? This sounds more likely to be a
linker difference rather than a compiler difference.

Cheers,
Nathan


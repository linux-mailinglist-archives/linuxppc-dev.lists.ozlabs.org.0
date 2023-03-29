Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0646CD13A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 06:36:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmYfX4Cfrz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F7V0aggb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmYdf3cW5z3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:35:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F7V0aggb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PmYdc1kZvz4x7x;
	Wed, 29 Mar 2023 15:35:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680064548;
	bh=0xWuzHEKv0l2lURA6D+HsOlFxSEYf23qqC/bdO5BUa8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F7V0aggbOnog2AYFJ2xU7lNEcNaEq+c15GuhP8TDZ2/TUMktL6fgMG20xxNNJAK1o
	 7Sl4t3BPj6XKpdwElXaIZgrdnMqCiGqSPCxu2VEBrsuFlnzzQYcGgFbG5SYCmIW/Xo
	 yyJ1YpF8n++0rG3VPBMcLHwavcuKUqZKLq5wYEWoD7kRmN0h8JfunUWQhZzyaiwBuS
	 Cn/7jU3vDPL2XiHFkdL46whhHSCGj3PYQURyLekliZrwrfy80FT4v1N+zJCNpB67c2
	 P9vbicyooTMCPLMuI6lqza2sPW/BM+Err28UMPYp79wYNRZLPafg1e4oMjz2KFK364
	 BJPy6sWCL+iSQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test] BUILD REGRESSION
 c827c932c00ccd231a73da9816a51ce2c2b557d6
In-Reply-To: <642395b2.9xXK0P9s+LMbMRgG%lkp@intel.com>
References: <642395b2.9xXK0P9s+LMbMRgG%lkp@intel.com>
Date: Wed, 29 Mar 2023 15:35:47 +1100
Message-ID: <874jq4cgyk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> branch HEAD: c827c932c00ccd231a73da9816a51ce2c2b557d6  powerpc: Use of_address_to_resource()
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202303240411.Tq2tZKiG-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> arch/powerpc/platforms/embedded6xx/ls_uart.c:128:15: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
>
> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors
> `-- powerpc-linkstation_defconfig
>     `-- arch-powerpc-platforms-embedded6xx-ls_uart.c:error:implicit-declaration-of-function-of_address_to_resource

I've dropped that patch for now.

cheers

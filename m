Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B78AE13C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 11:44:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pGwfZ3y5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNxzC431hz3dSk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 19:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pGwfZ3y5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNxxp6QSwz3dKd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 19:43:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AD8D6124C;
	Tue, 23 Apr 2024 09:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B909CC3277B;
	Tue, 23 Apr 2024 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713865387;
	bh=RoILEQzEl8J7YfT7Q05UMPjmcTROQqxMycKJcXQ0/g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGwfZ3y5vwbl2yHrNxNipzIeIYQ/QsWFnaWnxdI7DT+DF62YgRdnhbQKbANwFifqO
	 r9wlNn96L2/4AJxD3dVXjqRYF9fi9sTSUai3+ckKdHdcjS90VSlPreTGdU7e+O/KTC
	 tNC3+zzYE6NCkER/9utAWkpV3eyREMVOBQgT0a+bzpSEYZxjO0FiOAnw8J6gNS4d6i
	 rQLiyDHOgzWhF6a2FwLGSxzzZn3EsEWw4q9w5aGCI+bxEDl0cJiHKEeIzoguS2nAd4
	 CRMQPQr426oKcV+jcwm14kjRRc8lk2GLqYRL6PZwCAJOjI23ry+3WRktCISbLyb2gK
	 nxSfw7ZgHzp5Q==
Date: Tue, 23 Apr 2024 15:10:44 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v3 0/5] Add generic data patching functions
Message-ID: <qz74lr3gafb6p3jjf2yvcahgqge6vi74crhvfyt3qbl7i7iunn@btzad44psxsj>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325055302.876434-1-bgray@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 04:52:57PM +1100, Benjamin Gray wrote:
> Currently patch_instruction() bases the write length on the value being
> written. If the value looks like a prefixed instruction it writes 8 bytes,
> otherwise it writes 4 bytes. This makes it potentially buggy to use for
> writing arbitrary data, as if you want to write 4 bytes but it decides to
> write 8 bytes it may clobber the following memory or be unaligned and
> trigger an oops if it tries to cross a page boundary.
> 
> To solve this, this series pulls out the size parameter to the 'top' of
> the memory patching logic, and propagates it through the various functions.
> 
> The two sizes supported are int and long; this allows for patching
> instructions and pointers on both ppc32 and ppc64. On ppc32 these are the
> same size, so care is taken to only use the size parameter on static
> functions, so the compiler can optimise it out entirely. Unfortunately
> GCC trips over its own feet here and won't optimise in a way that is
> optimal for strict RWX (mpc85xx_smp_defconfig) and no RWX
> (pmac32_defconfig). More details in the v2 cover letter.
> 
> Changes from v2:
>   * Various changes noted on each patch
>   * Data patching now enforced to be aligned
>   * Restore page aligned flushing optimisation
> 
> Changes from v1:
>   * Addressed the v1 review actions
>   * Removed noinline (for now)
> 
> v2: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20231016050147.115686-1-bgray@linux.ibm.com/
> v1: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20230207015643.590684-1-bgray@linux.ibm.com/
> 
> Benjamin Gray (5):
>   powerpc/code-patching: Add generic memory patching
>   powerpc/code-patching: Add data patch alignment check
>   powerpc/64: Convert patch_instruction() to patch_u32()
>   powerpc/32: Convert patch_instruction() to patch_uint()
>   powerpc/code-patching: Add boot selftest for data patching
> 
>  arch/powerpc/include/asm/code-patching.h | 37 +++++++++++++
>  arch/powerpc/kernel/module_64.c          |  5 +-
>  arch/powerpc/kernel/static_call.c        |  2 +-
>  arch/powerpc/lib/code-patching.c         | 70 +++++++++++++++++++-----
>  arch/powerpc/lib/test-code-patching.c    | 36 ++++++++++++
>  arch/powerpc/platforms/powermac/smp.c    |  2 +-
>  6 files changed, 132 insertions(+), 20 deletions(-)

Apart from the minor comments, for this series:
Acked-by: Naveen N Rao <naveen@kernel.org>

Thanks for working on this.


- Naveen


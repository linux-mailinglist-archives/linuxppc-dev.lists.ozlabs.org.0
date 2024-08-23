Return-Path: <linuxppc-dev+bounces-463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5405A95D049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 16:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr2tb0mKHz2yw3;
	Sat, 24 Aug 2024 00:45:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724424343;
	cv=none; b=CQqqMd2FoFEUG6+mk91pQbODCP/Jn6tfK9TscKT/Z7k/IXPZaVRh5mUkpu016LmOOtAJfG64PtjVxNccfaBjI+HvgpEhgSkrX85MO3j09FWd5PN/XCALAafhztoj2OrViMnWQGobWTu97qD+XLVQB4KSG1BMz4VUEz501Za5wCUGAfsjKuQkEQ0zojFnbFc/o8A1oqYvdrRE6b1o7ptUJmV+466TwABDy1sDVPuhkuLBCcE/MezYCe0CUg6+cH3WUnLpWZ71U3/KprsqDH7tjo+1qnfcD8CWjJtNgz4wPiFdBO8XL1kPHIm2DIxpG04uHuOtvDB4V7nN4h3xyV07Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724424343; c=relaxed/relaxed;
	bh=Wm6M97/92sA6lvXG4eEn8vQfVu7CSe34kDKZg3GcD8I=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=a1nSYJsRpIHeeCi1EtdNsbow4DJMzXuT9hl6NabIWs8tSNX2V/vEJBO5Gpq/I7GVITv3rBeeVbTh4lVYN7JSUmeaHDyp5CuI8lCF0kaUpqkbfQLp7/bp/Bi4fC7LBhhrtrlHgOCkYzxW8hnJ0ZHwRjKf+PEx0pp7nLyeuNAtdQbTJHD4itTZpgSJsjPbsv3WXEVkhpxgF62t9QCM3hrf4DC4ic/1r+AJiGP/865ycV65vuSXYVR0W8vdmeW5IzibL9BqxXZC3LdsDer58CX/Z+PqrpiSMaW0rZrvaDp4N8B4SYifbRB+yi6cxqcYk4siuWCX9m8NPnRZQxPgVy7ZBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sZqjTOS2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sZqjTOS2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr2tZ5b55z2ysc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 00:45:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B044161239;
	Fri, 23 Aug 2024 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE55C32786;
	Fri, 23 Aug 2024 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724424340;
	bh=W6z8CSJIQISlh38AzR3KbpPdvjf84h6oaEwrIWjYySE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZqjTOS2yJ3SZLJsVGt+kPr01XngWDjZhXRB11P59QKeuj0yVdJ2sI1jiTOtfwc1l
	 0KofF0+gZW+2ilrX698/xbyYRzb0afe9ZQFHS1eX/89s0tT+SeZqTHYfl0x18Zexz+
	 ojJmzjO42Pp6SJ9/97BgEuwauVrtWeqDuXAITbu5HlICS/eRA8zhCqnIg8SX7Th28A
	 y7taxVji40p7C4F97d5UAN7RkOd33c6kp1ratVeJjgaBBAfyebkKljPHUnl0HXwW3X
	 1mwWo5iqo+efoKR6XMU/0Rs+9uXSAMETOVivGRw42b48YIgSaoiHjeAEww/ehNsqRy
	 s82ANrYxvLTLA==
Date: Fri, 23 Aug 2024 15:45:32 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <20240823144531.GH32156@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
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
In-Reply-To: <20240822151113.1479789-7-joey.gouly@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> POR_EL0 is a register that can be modified by userspace directly,
> so it must be context switched.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/include/asm/cpufeature.h |  6 ++++++
>  arch/arm64/include/asm/processor.h  |  1 +
>  arch/arm64/include/asm/sysreg.h     |  3 +++
>  arch/arm64/kernel/process.c         | 28 ++++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)

[...]

> +static void permission_overlay_switch(struct task_struct *next)
> +{
> +	if (!system_supports_poe())
> +		return;
> +
> +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> +	if (current->thread.por_el0 != next->thread.por_el0) {
> +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */

nit: typo "chaning".

But more substantially, is this just to prevent spurious faults in the
context of a new thread using a stale value for POR_EL0?

Will


Return-Path: <linuxppc-dev+bounces-13649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44248C26E4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 21:28:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cysxf6NW7z2xxS;
	Sat,  1 Nov 2025 07:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761942502;
	cv=none; b=nBYnmLiCOjqzhWYsQSpxpn/FU62CE1IX3NYypMQh8CXYLKd4nXxiUHzTZ97XVvZZUx6jy0vw8A5+qfnBWms3N6CvBuEhRUr1gzVmb4nbU5FK16JnmnLUhAba5raurNyfiZekW2Lqdh13P2Cnh0WLpURIp96utAnXtSLuTLbEYKIU/OOxmVC2YH+j1Msji/NSz5sxy5AWrWvw6NiwQMulzFWH+KnS9/yGnor/4d0OVay4zoCJ8BuJ6Z4h4p2dR87HVCYrafCnVlWkIVnCfwbj/VRq6MGdKLQXl4omZBph53P4MAx6kjEojjE4CQGzIe5d6W+Ea6YVMsfw1l/qj/5I6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761942502; c=relaxed/relaxed;
	bh=vnNX79RcqeiTlm4nkUQmr01B2B1+0Yqto94b3lOHyEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4ZsqzFG1uAc0xQ63At6k4OA+s2xlNiF4yOnOXEyjozCf1oz1B2P1kf0HG03u88227PsJ57D6Cy5F8JeDN4Q4J1AEMljFVMjt1zPaZhuwfFuVeN9cX4AqVrvDqYt003KoNP/keEjy8VeoHvis/Vi6m0UxBwlx7QqTH3jEn+SNVkvgAWiLLrZabuLSHoy0Li/3g6X+T+XNDGfBfcVv2NnRmXcfK9FLIAWVieqCsePBgJVTepvHWTjIMlCXJVggduVSWG8C7L3BEzbw2DSoVe402l9wLd0uBCSUyOWs6eeZyVgkENRyw+gezpdvRcjFtT1xUPt0SD2ov/VeuO8GtC8OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfcYue1o; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rfcYue1o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cysxd6t93z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 07:28:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F735435FD;
	Fri, 31 Oct 2025 20:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27342C4CEE7;
	Fri, 31 Oct 2025 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761942494;
	bh=AjVeRmIbqZi82dYPjfPgsCsGvHgBizwI8tFFClRS8SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfcYue1oQ3uq8YHp8V1iDJCRGvnrd06gOmEOqlGneaK2xJXHaFDCppvFgMZTXqyeU
	 IOR1iFO16AqKcdQCF1pDx/d4o9macTrIFcAKT0aEJHJL4nG+bq4KR2sJif8BOzWHjg
	 cIAnpkDSmDBA9zYg33ZIO6f1dfUpwHog7yt9oNZWmwFqKL1FLAEBRvEkbs2RGmyrWc
	 UT7GZFuxR81naZ4cOrp6da/ToPF5PA83nkBloOFa+Rtz+oXkqqedFSgbbvmc9Q1IxP
	 zrm1Vav/mHjd5is7c8RRPXU/ICZiJsbC60Tl9HaSTaUXQh7BbBMvOPZPnhXReCxDtg
	 IVlVSuJKDBfJg==
Date: Fri, 31 Oct 2025 13:28:11 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	joe.lawrence@redhat.com
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
Message-ID: <skcy4n4qyoqklhbs2gjefdyhu7nfgwxkwyamxal33ckv66bxr4@3xradd7kt57e>
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
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
In-Reply-To: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 05:32:16PM +0200, Jan Stancek wrote:
> We've been observing rare non-deterministic kconfig failures during
> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> disabled and with it number of other config options that depend on it.
> 
> The reason is that gcc-check-fpatchable-function-entry.sh can fail
> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> there is still someone writing on other side of pipe. `pipefail`
> propagates that error up to kconfig.
> 
> This can be seen for example with:
>   # (set -e; set -o pipefail; yes | grep -q y); echo $?
>   141
> 
> or by running the actual check script in loop extensively:
>   ----------------------------- 8< -------------------------------
>   function kconfig()
>   {
>     for i in `seq 1 100`; do
>       arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
>         ./scripts/dummy-tools/gcc -mlittle-endian \
>         || { echo "Oops"; exit 1; }
>     done
>   }
> 
>   for ((i=0; i<$(nproc); i++)); do kconfig & done
>   wait; echo "Done"
>   ----------------------------- >8 -------------------------------
> 
> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
> Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>

Ooh, that is nasty...

The fix looks obviously correct: pipefail isn't needed in these cases
anyway since an earlier pipe failure (e.g., compile error) would result
in EOF getting piped to grep, causing it to returning an error
regardless.

Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh


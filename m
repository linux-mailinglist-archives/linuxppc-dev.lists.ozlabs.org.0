Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81094932385
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 12:03:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EXJBVt/o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNZQ130Szz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 20:03:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EXJBVt/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNZPK70Llz30T3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 20:02:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9ABE2CE0C68;
	Tue, 16 Jul 2024 10:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDAFC4AF09;
	Tue, 16 Jul 2024 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721124147;
	bh=2vKo7LaogIOzX8PebynEk4Cv88o2mwsO2aiXrOezlbw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EXJBVt/oidhu7w5LrETdB7V2ZQV8CZpY/qBydFAZ3/A7tdEJZNftMTsbBOnzBl61C
	 P0IXd2ebO6k1P2aj1O3qXiISvThLagopgUYsXrkiyZU9VAL7u0Mnz39XROHw7iSDgj
	 QLstIP1891Tjgtb8ZYscFSgB7+w0X4XWW/Rj1xOSYJ+Y0/0NQH6Wj0kgHv8Qp5GLeK
	 qPEWEqY/ssH3Mqph1/dNuxj3KTdpUgt3RjfPtLPP2mX2ku5FezPBlXLfWWn02XvI0H
	 uCh394WRGlEdz8q1o+leI3Lh5dEGRfwO70VIZTnoSK3ik6druqcgn/5usPp/WCApA8
	 CMKyJri1GG+pQ==
Date: Tue, 16 Jul 2024 19:02:22 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update email address of Naveen
Message-Id: <20240716190222.f3278a2ef0c6a35bd51cfd63@kernel.org>
In-Reply-To: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Alexei Starovoitov <ast@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Naveen,

On Sun, 14 Jul 2024 14:04:23 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> I have switched to using my @kernel.org id for my contributions. Update
> MAINTAINERS and mailmap to reflect the same.
> 

Looks good to me. 

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Would powerpc maintainer pick this?

Thanks,


> Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 81ac1e17ac3c..289011ebca00 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -473,6 +473,8 @@ Nadia Yvette Chambers <nyc@holomorphy.com> William Lee Irwin III <wli@holomorphy
>  Naoya Horiguchi <nao.horiguchi@gmail.com> <n-horiguchi@ah.jp.nec.com>
>  Naoya Horiguchi <nao.horiguchi@gmail.com> <naoya.horiguchi@nec.com>
>  Nathan Chancellor <nathan@kernel.org> <natechancellor@gmail.com>
> +Naveen N Rao <naveen@kernel.org> <naveen.n.rao@linux.ibm.com>
> +Naveen N Rao <naveen@kernel.org> <naveen.n.rao@linux.vnet.ibm.com>
>  Neeraj Upadhyay <neeraj.upadhyay@kernel.org> <quic_neeraju@quicinc.com>
>  Neeraj Upadhyay <neeraj.upadhyay@kernel.org> <neeraju@codeaurora.org>
>  Neil Armstrong <neil.armstrong@linaro.org> <narmstrong@baylibre.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa32e3c035c2..05f14b67cd74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,7 +3878,7 @@ S:	Odd Fixes
>  F:	drivers/net/ethernet/netronome/nfp/bpf/
>  
>  BPF JIT for POWERPC (32-BIT AND 64-BIT)
> -M:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> +M:	Naveen N Rao <naveen@kernel.org>
>  M:	Michael Ellerman <mpe@ellerman.id.au>
>  L:	bpf@vger.kernel.org
>  S:	Supported
> @@ -12332,7 +12332,7 @@ F:	mm/kmsan/
>  F:	scripts/Makefile.kmsan
>  
>  KPROBES
> -M:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> +M:	Naveen N Rao <naveen@kernel.org>
>  M:	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
>  M:	"David S. Miller" <davem@davemloft.net>
>  M:	Masami Hiramatsu <mhiramat@kernel.org>
> @@ -12708,7 +12708,7 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:	Michael Ellerman <mpe@ellerman.id.au>
>  R:	Nicholas Piggin <npiggin@gmail.com>
>  R:	Christophe Leroy <christophe.leroy@csgroup.eu>
> -R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> +R:	Naveen N Rao <naveen@kernel.org>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  W:	https://github.com/linuxppc/wiki/wiki
> 
> base-commit: 582b0e554593e530b1386eacafee6c412c5673cc
> -- 
> 2.45.2
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

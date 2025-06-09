Return-Path: <linuxppc-dev+bounces-9215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFEAD193A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 09:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG3sl0TLlz2xlL;
	Mon,  9 Jun 2025 17:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749455226;
	cv=none; b=KOEPVPIKl2d3SwD234q+d5yyvIeP/gom6UgCxHkBNIWEcdF2GYKkh1SuLcoM0igj4DwRVHffHIuxHabNOeoY3ilY0WSwkV4htNGTYCA4oV0CuxxPZro4rEe+2KMFRm0uoTqoYzHwz9gYi+Ln54bum7615pvNMILMjIhFz53MUv7DbOoGg6gvurw+k+rYWkCPXm3+rlSOzc/TwiK0vMUU4KTk7zdIHK2ix2wTf+24p7OGHpP6KBpbdZRyEpvSNbh+XpPCXQgGJeawhGK+QxUufGIbXRL/BcaqhrAmNPy8/APBZt63ucd4j0nN5QchI7Rhs4wbtWcfHPCwkCTWcTmlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749455226; c=relaxed/relaxed;
	bh=4yyd4osaHTakxgmSC43pB5Z6hygn3PCyCWL1KiPU8hA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MFcajwO+GcEt76fWSudmbAwmlZFdgD0sKiOniL1jxwkOZfUmcyTJs/vbBYK/uAD5G/X5dbo/eJPbZjHwRtqlcwM7MmkU9S3WB+G+kq/XHOBmvUpqON3CVYa3fKQqIe9e90FmmazvXuIHMK6bbaCPc3wzl1aYyVSSCoVimAvva2Fx71s9PA70tQDHlaueX/0eEztKuCuQkyef/GJQEyU7KJAYG09TqLeDemRnfxl3hQ6h90lAJ16bpLNjSxerr1psC+RBcJ8fKFdZSKNF/R5RsAT0absisl30wTv9RDJ9V8yPd2PRhs3fHGFYCBrJSnS235SZkDM/o+9qrENcik8amw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=atp8aQje; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=atp8aQje;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bG3sk15Hvz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 17:47:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F12294AB27;
	Mon,  9 Jun 2025 07:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D502C4CEED;
	Mon,  9 Jun 2025 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749455223;
	bh=EjYiWxwuGJBa4mMQSG85+fR2fIar5kDV1gsocLjcxRE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=atp8aQjetDwe3Lw/IgYCcN1a/6GwIT5uyo5GZhfrw3Nx9uqn2GQqk+7dDPhnB4uSL
	 rrs2bokC6uG5E6Lw+RVuJJJXH5/km7ugimcazdAAnQfBEEafxC4PDFByuQ1GW33UCm
	 Yto1S6ZrVqVBIjV3T1DwDiiChKC5CyA2WYfRbwffYdElEzpWMcPvQMMvONT43Da9gF
	 G4nxhgHNZz60+Cq73los/HYuTlA2ezGqeykWn5rOXYKCqDQGPrtTafIdEuLL9oeBw5
	 TehVg68F0n0fo6PghG6m5MEotsdfNgVK8XKbzcWeaXOVryR9OLew4/wDcTzKFKOGyo
	 Rx0Gg5+9TNwAA==
Date: Mon, 9 Jun 2025 16:47:00 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Aditya Bodkhe <adityab1@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, Hari
 Bathini <hbathini@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/fprobe: fix updated fprobe for
 function-graph tracer
Message-Id: <20250609164700.d8afe4ac1b4dea195bb7e379@kernel.org>
In-Reply-To: <20250528134820.74121-2-adityab1@linux.ibm.com>
References: <20250528134820.74121-1-adityab1@linux.ibm.com>
	<20250528134820.74121-2-adityab1@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 28 May 2025 19:18:20 +0530
Aditya Bodkhe <adityab1@linux.ibm.com> wrote:

> From: Hari Bathini <hbathini@linux.ibm.com>
> 
> Since commit 4346ba160409 ("fprobe: Rewrite fprobe on function-graph
> tracer"), FPROBE depends on HAVE_FUNCTION_GRAPH_FREGS. With previous
> patch adding HAVE_FUNCTION_GRAPH_FREGS for powerpc, FPROBE can be
> enabled on powerpc. But with the commit b5fa903b7f7c ("fprobe: Add
> fprobe_header encoding feature"), asm/fprobe.h header is needed to
> define arch dependent encode/decode macros. The fprobe header MSB
> pattern on powerpc is not 0xf. So, define FPROBE_HEADER_MSB_PATTERN
> expected on powerpc.
> 
> Also, commit 762abbc0d09f ("fprobe: Use ftrace_regs in fprobe exit
> handler") introduced HAVE_FTRACE_REGS_HAVING_PT_REGS for archs that
> have pt_regs in ftrace_regs. Advertise that on powerpc to reuse
> common definitions like ftrace_partial_regs().
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Aditya Bodkhe <aditya.b1@linux.ibm.com>

This patch in this series looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

I think this series go through powerpc tree. But you have
some comments on 1/2, so please solve it at first.

Thank you,

> ---
>  arch/powerpc/Kconfig              |  1 +
>  arch/powerpc/include/asm/fprobe.h | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/fprobe.h
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9163521bc4b9..2203e4fb64c1 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -246,6 +246,7 @@ config PPC
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	select HAVE_GUP_FAST
>  	select HAVE_FTRACE_GRAPH_FUNC
> +	select HAVE_FTRACE_REGS_HAVING_PT_REGS
>  	select HAVE_FTRACE_MCOUNT_RECORD
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
> diff --git a/arch/powerpc/include/asm/fprobe.h b/arch/powerpc/include/asm/fprobe.h
> new file mode 100644
> index 000000000000..d64bc28fb3d3
> --- /dev/null
> +++ b/arch/powerpc/include/asm/fprobe.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_PPC_FPROBE_H
> +#define _ASM_PPC_FPROBE_H
> +
> +#include <asm-generic/fprobe.h>
> +
> +#ifdef CONFIG_64BIT
> +#undef FPROBE_HEADER_MSB_PATTERN
> +#define FPROBE_HEADER_MSB_PATTERN	(PAGE_OFFSET & ~FPROBE_HEADER_MSB_MASK)
> +#endif
> +
> +#endif /* _ASM_PPC_FPROBE_H */
> -- 
> 2.43.5
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


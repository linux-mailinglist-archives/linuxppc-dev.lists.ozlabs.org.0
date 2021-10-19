Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298E433C38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYfPL0CYmz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 03:30:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sxFskTOJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sxFskTOJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYfNg6Vy6z2ymr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 03:30:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69C2E6113B;
 Tue, 19 Oct 2021 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634661008;
 bh=qZa2i87QZSwsPPDAbWTt875cMqtvmMLZ0A9OP4OhgGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxFskTOJpw136yFjzkIavwxPtlK8QwZQh9Q5vyjt6KeIwmhOsBe9/f6zqLycNj8E+
 44eYntQE9QwxZ3KLWtTA4ipi7jso6QjJvTBD3IeiuqhOv4V9dEe24MyGQcZIq5ahjl
 Y+1gyCiRpzlOS87xff/jCwoxlM6iHBdygESrqaZcvFn5keZAvDMryVUPjBEhOJQmvl
 dg7CLVcwRw3cSGpMBXiiTvmpaPV1gCD26mbnWrloOkD2t1l1CeZKJ401ohX5SuGuNI
 o/M0X2G9iqCIQGTOgAI5D84k3kAJX+0NHCEJWl3q+cswREOhOd+h91zWKoBoIzKHLr
 Jpa+1XvkPq67g==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 02BDD410A1; Tue, 19 Oct 2021 13:30:05 -0300 (-03)
Date: Tue, 19 Oct 2021 13:30:05 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V4 0/2] tools/perf: Add instruction and data address registers
 to extended regs in powerpc
Message-ID: <YW7yjZE8LKvgjapw@kernel.org>
References: <20211018114948.16830-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018114948.16830-1-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Oct 18, 2021 at 05:19:46PM +0530, Athira Rajeev escreveu:
> Patch set adds PMU registers namely Sampled Instruction Address Register
> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
> in PowerPC. These registers provides the instruction/data address and
> adding these to extended regs helps in debug purposes.
> 
> Patch 1/2 refactors the existing macro definition of
> PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to make it more
> readable.
> Patch 2/2 includes perf tools side changes to add the SPRs to
> sample_reg_mask to use with -I? option.

Thanks, applied.

- Arnaldo

 
> Changelog:
> Change from v3 -> v4:
> - Spilt tools side patches separately since kernel side
>   changes are in powerpc/next. There is no code wise changes
>   from v3.
>   Link to previous version:
>   https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=265811&state=*
> 
>   Kernel patches are taken to powerpc/next:
>   [1/4] powerpc/perf: Refactor the code definition of perf reg extended mask
>   https://git.kernel.org/powerpc/c/02b182e67482d9167a13a0ff19b55037b70b21ad
>   [3/4] powerpc/perf: Expose instruction and data address registers as part of extended regs
>   https://git.kernel.org/powerpc/c/29908bbf7b8960d261dfdd428bbaa656275e80f3
> 
> Change from v2 -> v3:
> Addressed review comments from Michael Ellerman
> - Fixed the macro definition to use "unsigned long long"
>   which otherwise will cause build error with perf on
>   32-bit.
> - Added Reviewed-by from Daniel Axtens for patch3.
> 
> Change from v1 -> v2:
> Addressed review comments from Michael Ellerman
> - Refactored the perf reg extended mask value macros for
>   PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 to
>   make it more readable. Also moved PERF_REG_EXTENDED_MAX
>   along with enum definition similar to PERF_REG_POWERPC_MAX.
> 
> Athira Rajeev (2):
>   tools/perf: Refactor the code definition of perf reg extended mask in
>     tools side header file
>   tools/perf: Add perf tools support to expose instruction and data
>     address registers as part of extended regs
> 
>  .../arch/powerpc/include/uapi/asm/perf_regs.h | 28 ++++++++++++-------
>  tools/perf/arch/powerpc/include/perf_regs.h   |  2 ++
>  tools/perf/arch/powerpc/util/perf_regs.c      |  2 ++
>  3 files changed, 22 insertions(+), 10 deletions(-)
> 
> -- 
> 2.33.0

-- 

- Arnaldo

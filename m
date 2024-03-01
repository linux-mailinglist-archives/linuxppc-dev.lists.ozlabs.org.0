Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B9D86ECED
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 00:24:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LNakTF1E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tmkgm27PCz3vbv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 10:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LNakTF1E;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tmkfz3pSfz3dX5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 10:23:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709335418;
	bh=4kEIwFfqRv6oPsKGANVnLORvXnAWA3F6DnLBJl/uvnI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LNakTF1Eajw7GrUdX4fOw/P+RRygl2XCgx3FWFdOrXuWkqdMoN3xtshaJDlmRXf1A
	 k4grncFThmejyovuYOleZ7mtKQnxO8CzsuOe5P3PYzuiafU0TOJ5hcWcbGNl4BHeBd
	 Mf4x5pJGt9oBPoZ7pmDJyMzuglL77dkK9GOrN9CjL4VDbqcf1DVgYIH9aGmjI0MdpK
	 j1GkC9KM/TmPox6aPHiNq+tMkkpMm/RChEpVmLr6rm0ZrFWh3ZnyxDtne4yQ/ETdsO
	 LyLllN0azhGnubCa6Wa1o5jwub/rtqmzj1gPWkxAYVjIvLTyDuL4wsvkjVm9VHSWOH
	 Wc2K6CRdjS6rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tmkfx0Xjfz4wc4;
	Sat,  2 Mar 2024 10:23:37 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Savitz <jsavitz@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
In-Reply-To: <20240301203023.2197451-1-jsavitz@redhat.com>
References: <20240301203023.2197451-1-jsavitz@redhat.com>
Date: Sat, 02 Mar 2024 10:23:36 +1100
Message-ID: <87cysdfsef.fsf@mail.lhotse>
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Joel Savitz <jsavitz@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joel,

Joel Savitz <jsavitz@redhat.com> writes:
> On 64-bit powerpc, usage of a non-16MB-aligned value for the mem= kernel
> cmdline parameter results in a system hang at boot.

Can you give us any more details on that? It might be a bug we can fix.

> For example, using 'mem=4198400K' will always reproduce this issue.
>
> This patch fixes the problem by aligning any argument to mem= to 16MB
> corresponding with the large page size on powerpc.

The large page size depends on the MMU, with Radix it's 2MB or 1GB. So
depending on what's happening 16MB may not be enough.

What system are you testing on?

cheers

> Fixes: 2babf5c2ec2f ("[PATCH] powerpc: Unify mem= handling")
> Co-developed-by: Gonzalo Siero <gsierohu@redhat.com>
> Signed-off-by: Gonzalo Siero <gsierohu@redhat.com>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
>  arch/powerpc/kernel/prom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0b5878c3125b..8cd3e2445d8a 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -82,8 +82,12 @@ static int __init early_parse_mem(char *p)
>  {
>  	if (!p)
>  		return 1;
> -
> +#ifdef CONFIG_PPC64
> +	/* Align to 16 MB == size of ppc64 large page */
> +	memory_limit = ALIGN(memparse(p, &p), 0x1000000);
> +#else
>  	memory_limit = PAGE_ALIGN(memparse(p, &p));
> +#endif
>  	DBG("memory limit = 0x%llx\n", memory_limit);
>  
>  	return 0;
> -- 
> 2.43.0

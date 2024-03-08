Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB88761C6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 11:19:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BxPOpg+b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trhwp2kxvz3vbK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 21:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BxPOpg+b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trhw25Yc8z2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 21:18:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCAAA61DC3;
	Fri,  8 Mar 2024 10:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AFEC433F1;
	Fri,  8 Mar 2024 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709893120;
	bh=3uPEOLY0R8u0f839xVMRXXBi8YVsivNFPKf3O1J7qNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BxPOpg+bhV+KBS0mLQI78eSs3cndRSQ9NhacMpxaXzdjUxuWwewylGCD6cwzQTXtx
	 /61cECHK09553s0H9+wZ3aenaI/58yBw0xur53BgOWl5sBfrppOXtcGpddn310YOfH
	 HLLlHxK5hqoywWofwlrisjhw0/Bdhw23iJaoiGlp5L0JHaYEN3RFooLjemKAZLWnbx
	 eNSNohMWS8XKGxgSqQNYZ5YAK6d8udR8agt41n8NHvHpDZOyDGXLdVWYp3g53kzGto
	 QYSoazTKsXE1QA5oOWLDF4g/N89qO4HRz4V+pNy7fBVeqZxjwixYOgqGh/hG5JkVWk
	 ArJud5hIexy4A==
X-Mailer: emacs 29.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Joel Savitz <jsavitz@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
In-Reply-To: <20240301203023.2197451-1-jsavitz@redhat.com>
References: <20240301203023.2197451-1-jsavitz@redhat.com>
Date: Fri, 08 Mar 2024 15:48:33 +0530
Message-ID: <87jzmduiva.fsf@kernel.org>
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Joel Savitz <jsavitz@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Savitz <jsavitz@redhat.com> writes:

> On 64-bit powerpc, usage of a non-16MB-aligned value for the mem= kernel
> cmdline parameter results in a system hang at boot.
>
> For example, using 'mem=4198400K' will always reproduce this issue.
>
> This patch fixes the problem by aligning any argument to mem= to 16MB
> corresponding with the large page size on powerpc.
>
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

Can you try this change?

commit 5555bc55e1aa71f545cff31e1eccdb4a2e39df84
Author: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
Date:   Fri Mar 8 14:45:26 2024 +0530

    powerpc/mm: Align memory_limit value specified using mem= kernel parameter
    
    The value specified for the memory limit is used to set a restriction on
    memory usage. It is important to ensure that this restriction is within
    the linear map kernel address space range. The hash page table
    translation uses a 16MB page size to map the kernel linear map address
    space. htab_bolt_mapping() function aligns down the size of the range
    while mapping kernel linear address space. Since the memblock limit is
    enforced very early during boot, before we can detect the type of memory
    translation (radix vs hash), we align the memory limit value specified
    as a kernel parameter to 16MB. This alignment value will work for both
    hash and radix translations.
    
    Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..9bd965d35352 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -824,8 +824,11 @@ void __init early_init_devtree(void *params)
 		reserve_crashkernel();
 	early_reserve_mem();
 
-	/* Ensure that total memory size is page-aligned. */
-	limit = ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_SIZE);
+	if (memory_limit > memblock_phys_mem_size())
+		memory_limit = 0;
+
+	/* Align down to 16 MB which is large page size with hash page translation */
+	limit = ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size(), SZ_16M);
 	memblock_enforce_memory_limit(limit);
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index e67effdba85c..d6410549e141 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -817,8 +817,8 @@ static void __init early_cmdline_parse(void)
 		opt += 4;
 		prom_memory_limit = prom_memparse(opt, (const char **)&opt);
 #ifdef CONFIG_PPC64
-		/* Align to 16 MB == size of ppc64 large page */
-		prom_memory_limit = ALIGN(prom_memory_limit, 0x1000000);
+		/* Align down to 16 MB which is large page size with hash page translation */
+		prom_memory_limit = ALIGN_DOWN(prom_memory_limit, SZ_16M);
 #endif
 	}
 

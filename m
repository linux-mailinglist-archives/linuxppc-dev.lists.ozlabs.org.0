Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9646777C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 13:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5C2K49v8z308v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 23:34:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oGNN2kp/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5C1j5mzMz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 23:34:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oGNN2kp/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J5C1j2B1nz4xYy;
 Fri,  3 Dec 2021 23:34:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638534857;
 bh=XMxLd4ajAAbZtPcPQhc1mQbBj4Ot7fREpSHIUjxETbw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oGNN2kp/n29cpg9kZktTIdhzJBefYIoF0kLALMYnFcrT1jelcNrP2tTZtgL4YvArF
 MFwoRO0ub7Q9nqaxJmHChKkuTi9ySOu+I2FzO0sDvKqJI9/QvMmh3sYOjDmzofbFKy
 uYZXaCZdnb/EtCmJZd2L6Gcu+ZQKyrmFnw0S3Wu/szC6tWrNVPZHZkJceT45NVrBe9
 t4U/CGqGMfx9V+SLzTNAp681wmE1nwYE/fzIg4D7Npfw5AXUVi5bvXFteDppgIqxcT
 sEnNarDHEYCi2gIwSy2fqALgbznNj7fIy9G09W6jC0Q0ATqzIvsDi5+H0kXnvVQ+MV
 z1Bvq+hVUeYgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 17/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
In-Reply-To: <20211201144153.2456614-18-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-18-npiggin@gmail.com>
Date: Fri, 03 Dec 2021 23:34:16 +1100
Message-ID: <87v905oojb.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 4d97d1525d49..d765d972566b 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -534,7 +534,7 @@ static int __init pgtable_debugfs_setup(void)
>  }
>  arch_initcall(pgtable_debugfs_setup);
>  
> -#ifdef CONFIG_ZONE_DEVICE
> +#if defined(CONFIG_ZONE_DEVICE) && defined(ARCH_HAS_MEMREMAP_COMPAT_ALIGN)
                                              ^
                                              This needs "CONFIG_"

I fixed it up when applying.

cheers

Return-Path: <linuxppc-dev+bounces-6155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B6A34B50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 18:09:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv1qr2b3Zz2yvk;
	Fri, 14 Feb 2025 04:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739466552;
	cv=none; b=WgAf92B+Z/9KYD767BTkmmIHkX+9Ax6qs2ZTbo2I35+0D5+AeE5sxXGrhdxPCrvonkJU+coXTUXxoc5o7bJQfIbbBsiga/iJyiNpiHP59mFsW6p3d7LtZ30YCi2tD6ja7gXHtD0fFyzz/gwrPYuoAasLFJ9rHboXOTkaFw0GhVWhuD0bwU/b06TqAkTFZCjSX2bolhp420x/SkIpmLIFjFfQacefpGJ0PBIkXDKHotyfFs5jHSyWsn9PU1Newlxk9AhsSnNBoYbvJFYr/QWwAs0TaqbWH78tzdSBlImiYuNs+5Ows0U5DIqe5NSqm2lVcv12dbHg8VK2676FGwuoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739466552; c=relaxed/relaxed;
	bh=gVDE22IZJYfaTZlqFGZRq3iAWN4W09Vm2sHnaKZNn2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giMK+02GAJfey7or6XAFsW7lARNpU7CO+v4yAaWXcvNiGKMWu1FHj/B9YrT9Co8ZD/wM6RjIkbvyQj6517BwIaVbVPTkoz0gwJ8cVhUVW8K8P9lgaZy/Wp694Zey4wEw12KlopW2WjysiC3YiI756qKlx7BLPTSEpwJ5sBVtYlXMiPbRV+Q3yD2WKgprcsnI8a0rJe54bhH8byKJ+DraIARfXAFMEGfWv+EUQU2YVUjCoY6+MFEtbZryvivzx8VNFywyVXNoCPjw2o+s8jqTLHwxVgTdzYMYG4ZpWbK0b3iKgt6bKIRykCXeNutFtLfzIIYEPAu6lpozc92aHHlZIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OyzYe8/F; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OyzYe8/F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv1qq41MHz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 04:09:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A05565C5869;
	Thu, 13 Feb 2025 17:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF828C4CED1;
	Thu, 13 Feb 2025 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739466548;
	bh=4x9jxxW0VD/X4SQSVaG2JypaS5X6rvTy8i5aJNkaqGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyzYe8/FSw0fl1CP4gUZZpa5MWXZthpkiUG+mI9U9lf93L2MaIccibO3nE4sWJ818
	 p+cEWlfzkMX/GuNQ9+3yultf7t7/GyBdPh5VdjwsUpkB2WbwJJQ2X0yqtkVvqQ0aDD
	 G3SYthnFz3F/udB8mazLb+24drxHpMXr9MUHi8XNYehaqHDWsf7coFGd7fqmgKdt4R
	 9Pdjd658XnbsDREowp3+HltvYyCjf7pcLt8R8plvGnNhGLaZi9yG2qGBp36JDTV5Bw
	 e3pbnWF2pohnY5SGCG7XN4xTxArGp3+e8+t8N0p9NyyIUBQ7MispuEjYLCc9Rrxb8+
	 oNjymN98zlMWw==
Date: Thu, 13 Feb 2025 22:29:45 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc64/ftrace: fix module loading without patchable
 function entries
Message-ID: <wlscshbqan2svtqkz5xc6v47tzndfnsvge7h4lbfn67zoplekl@elt2oxwhrp6f>
References: <20250204231821.39140-1-ailiop@suse.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204231821.39140-1-ailiop@suse.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 05, 2025 at 12:18:21AM +0100, Anthony Iliopoulos wrote:
> get_stubs_size assumes that there must always be at least one patchable
> function entry, which is not always the case (modules that export data
> but no code), otherwise it returns -ENOEXEC and thus the section header
> sh_size is set to that value. During module_memory_alloc() the size is
> passed to execmem_alloc() after being page-aligned and thus set to zero
> which will cause it to fail the allocation (and thus module loading) as
> __vmalloc_node_range() checks for zero-sized allocs and returns null:
> 
> [  115.466896] module_64: cast_common: doesn't contain __patchable_function_entries.
> [  115.469189] ------------[ cut here ]------------
> [  115.469496] WARNING: CPU: 0 PID: 274 at mm/vmalloc.c:3778 __vmalloc_node_range_noprof+0x8b4/0x8f0
> ...
> [  115.478574] ---[ end trace 0000000000000000 ]---
> [  115.479545] execmem: unable to allocate memory

Ugh, that's nasty.

> 
> Fix this by removing the check completely, since it is anyway not
> helpful to propagate this as an error upwards.
> 
> Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> ---
>  arch/powerpc/kernel/module_64.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Thanks for fixing this. It might also be good to add a check in 
setup_ftrace_ool_stubs(). Something like this:

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 34a5aec4908f..c10a9c66cfe3 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -1125,6 +1125,10 @@ static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr,
        unsigned int i, total_stubs, num_stubs;
        struct ppc64_stub_entry *stub;
 
+       /* Bail out early if no traceable functions */
+       if (!me->arch.ool_stub_count)
+               return 0;
+
        total_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*stub);
        num_stubs = roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
                            sizeof(struct ppc64_stub_entry)) / sizeof(struct ppc64_stub_entry);


Regardless of that, for this patch:
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>


- Naveen



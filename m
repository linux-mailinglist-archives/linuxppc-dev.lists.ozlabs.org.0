Return-Path: <linuxppc-dev+bounces-14573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BDC9DB00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 04:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLkRW3tCdz2y5T;
	Wed, 03 Dec 2025 14:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764734375;
	cv=none; b=aM5NUy7Cb2kRaCm2m7CYlcOTYjpuUGKO7fK96BOHKKPPxG5jK+OkpLmeRzlIl62fU1CtJhgBwZaZp2PEuPdcB6O8+Rf24pE+FxZCKZanwbZiVLVn8Th1ffKjtJYbknZkIPNGEkKeP1+R/o6/TDwU27zX6P6tuTEkLB9cSPaRjQMtZyuVi17MtkN6N6X1iMWdVYWoS0ye6nXHmBGLFx5ym7Aji4igAHRChLKdAvFtiG8hkzA2DNvbM9nu5gHQniPbKzcexDuZs34ox9C9UJJiUjRav9NokO+aAyz7XVdVYhhuplLR0AahV7zWUKXMw9cd/EfMa/i9UNekm19zYZP9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764734375; c=relaxed/relaxed;
	bh=XRpflWjLAZbcV1TesItRlY20E0UFKYQHwkSqtBES+XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOsKO0XYjw9mbmTiIM5x1wvI7C0s/eNlDqKcV+o6sFtoFg9uH9nA3HQNL1Q55rqftksLXu45BttBNjV7oT5/nDeKW9p6zccD9RemRnuCKEuP3Bu18/ivmLVi4o5ovo/Qb1ZuJIwHOLJRbD1M1I5GOTHvpkM8vK8yxWq/8i2Rf3GoT2MdHLqvsnPV9drijTLxStlSMSE34DlyY4pp1I8vC+Yk1V/ifTfQxu/HtVRdlvwDmwveHsVu+80D3snM3XowuwqrHoYqmVPU+A2Xg3QYZgVqDxznDZS3890h3A2PgLbb8mONQQLxgOAdlRWKa5nMiPRfLVgZ5+Ty0mEUDxezHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZbRhmyO0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZbRhmyO0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLkRV5CJdz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 14:59:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7368743C4B;
	Wed,  3 Dec 2025 03:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7B9C4CEFB;
	Wed,  3 Dec 2025 03:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764734372;
	bh=g+dBvTqjRvEWiMkknmx06lRzwy16qcKghhBvHr86sAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbRhmyO0PXJUXOVHVQyoOnk3h/gGuQF88LjKmnsxCHnPC6tf1MHCjX2pdjskVgeLz
	 SEoZD0pTZIk8fl8vfPH7CqDRBmwRi558vwcDXybTJuaaJ3iPpcnkD8QBkWzr73xbnE
	 JJ+KnSb/+oVpzfqZk4XiDDQ5kSUPPxOTYMOHe9gdvQd3Br1mEwY1ZuNF2VGqX0GFNJ
	 dWw9lNDwV7DNrHGOEEu7YrdqrbUhCdIPPOViYL2Zv9UgMoorZUxjziXWdpYX37uDKQ
	 rd/DQSdxA03INZunfZ43D55VKGKIvLfDY648E5b4Ed2tzkdX39SyDZoU7e1oOIbi8H
	 GI0VsSPBdxUIQ==
Date: Wed, 3 Dec 2025 09:29:25 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Jan Stancek <jstancek@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
Message-ID: <caut6db7r6loimb2bk4zoqkqmfd3mhvzmv6ntsltf3tr4k4c2n@fbyhls233oys>
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
Content-Type: text/plain; charset=us-ascii
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

The latter fixes tag should probably tag one of the below commits which 
actually introduced pipefail, or introduced it in Kconfig:
Fixes: 8c50b72a3b4f ("powerpc/ftrace: Add Kconfig & Make glue for mprofile-kernel")
  or:
Fixes: abba759796f9 ("powerpc/kbuild: move -mprofile-kernel check to Kconfig")

> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
>  arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
>  2 files changed, 2 deletions(-)

Other than that, thanks for fixing this. This LGTM.
Reviewed-by: Naveen N Rao (AMD) <naveen@kernel.org>

Maddy/Michael,
Can you please pick this up?


Thanks,
Naveen


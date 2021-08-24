Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D83F5EFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 15:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv8xL3KFHz2ymf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 23:25:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mkARf6/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mkARf6/b; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv8wh39Wsz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 23:24:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gv8wg40tBz9ssP;
 Tue, 24 Aug 2021 23:24:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629811492;
 bh=hDmMWgLZDKPhAUavmwMYjiIkTsL9aGJyOGWvyuQf6/w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mkARf6/bwM+bNJncHzWWvTnHKV3p34icQ8fmrgNOyJb+LkedTebgCbW6JKsRrF2jl
 VvAokAkuVHwPr289qzS925UF9anXbLm40l2YiZJLV8vl5I2qTO6qJqrDUoA9YOk/0q
 Yfza1le7LdcqFZA/uWuAn/24p7LwdN43mvEF1DXCCnbNzHCpsjnytvyNMCibAh/j1R
 jg1RTl15r5J8lEGJzwYQuMN/B3F01raFYfnjMkKcW2CV6ExgKfftlF1TBwRvVFMg6o
 8XUcf71WJJh4UygSvih7uo0sfgTVkSvY6mRdpygHZKa7swWaTCJkqyegFoFbvpCtsk
 Mh7krD2BMdqQQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
In-Reply-To: <dc14509a28a993738b1325211f412be72a4f9b1e.1629701132.git.christophe.leroy@csgroup.eu>
References: <dc14509a28a993738b1325211f412be72a4f9b1e.1629701132.git.christophe.leroy@csgroup.eu>
Date: Tue, 24 Aug 2021 23:24:50 +1000
Message-ID: <877dgbc6vx.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
> targets") added generic support for AUDIT but that didn't include
> support for bi-arch like powerpc.
>
> Commit 4b58841149dc ("audit: Add generic compat syscall support")
> added generic support for bi-arch.
>
> Convert powerpc to that bi-arch generic audit support.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2:
> - Missing 'git add' for arch/powerpc/include/asm/unistd32.h
> - Finalised commit description
> ---
>  arch/powerpc/Kconfig                |  5 +-
>  arch/powerpc/include/asm/unistd32.h |  7 +++
>  arch/powerpc/kernel/Makefile        |  3 --
>  arch/powerpc/kernel/audit.c         | 84 -----------------------------
>  arch/powerpc/kernel/compat_audit.c  | 44 ---------------
>  5 files changed, 8 insertions(+), 135 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/unistd32.h
>  delete mode 100644 arch/powerpc/kernel/audit.c
>  delete mode 100644 arch/powerpc/kernel/compat_audit.c

This looks OK, but I don't know much about audit.

Can you resend with the audit maintainers on Cc?

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C1F3FE8CB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 07:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0V6R519rz2yng
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 15:36:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HqFtx2U6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HqFtx2U6; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0V5p6dDtz2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 15:36:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630560971;
 bh=1ccUqKVudJ30tbZTSg2xhx/jwr0Jak2fAS4c4EGBFXc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HqFtx2U6NpuYiyBBnLNMFaM7WV2+spWA4BfjCR7fh/Q2x4bBTbeas3iSOsgKUMfiv
 2cSzEhfYMNoVs4cWO7G17GvVnOYFluSqcuA99IqhntbFE4kETIkWuwpJ2xTtNNmvjF
 SsIWOKIx261LvOXHXV0iwZI7NfABqOTeUekKGCcEC/VSrXj3zogcC1pSHOd2jtrV1P
 VXnCku2lNEDcfJNfVIPuP2NnHtBjmrNo3K7x6/S/6DnTVmpKcrTo9W9iCTEiMGIQSN
 6ILIu/4uBCuAP84waInhLPJSDshAFV1pMA1Y0j4RGDiZHSUrRyINNw46AJ0p0EXRdx
 jTnS4/GxFtgAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0V5l0gxTz9sPf;
 Thu,  2 Sep 2021 15:36:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] selftests/powerpc: Add scv versions of the basic
 TM syscall tests
In-Reply-To: <20210901165418.1412891-2-npiggin@gmail.com>
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <20210901165418.1412891-2-npiggin@gmail.com>
Date: Thu, 02 Sep 2021 15:36:05 +1000
Message-ID: <87lf4f35fe.fsf@mpe.ellerman.id.au>
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
Cc: Eirik Fuller <efuller@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> The basic TM vs syscall test code hard codes an sc instruction for the
> system call, which fails to cover scv even when the userspace libc has
> support for it.
>
> Duplicate the tests with hard coded scv variants so both are tested
> when possible.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .../selftests/powerpc/tm/tm-syscall-asm.S     | 46 +++++++++++++++++++
>  .../testing/selftests/powerpc/tm/tm-syscall.c | 36 ++++++++++++---
>  2 files changed, 75 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
> index bd1ca25febe4..849316831e6a 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
> +++ b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
> @@ -2,6 +2,10 @@
>  #include <ppc-asm.h>
>  #include <asm/unistd.h>
>  
> +/* ppc-asm.h does not define r0 or r1 */
> +#define r0 0
> +#define r1 1
> +
>  	.text
>  FUNC_START(getppid_tm_active)
>  	tbegin.
> @@ -26,3 +30,45 @@ FUNC_START(getppid_tm_suspended)
>  1:
>  	li	r3, -1
>  	blr
> +
> +FUNC_START(getppid_scv_tm_active)
> +	mflr	r0
> +	std	r0,16(r1)
> +	stdu	r1,-32(r1)
> +	tbegin.
> +	beq 1f
> +	li	r0, __NR_getppid
> +	scv	0
> +	tend.
> +	addi	r1,r1,32
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr
> +1:
> +	li	r3, -1
> +	addi	r1,r1,32
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr

There's some macros in tools/testing/selftests/powerpc/include/basic_asm.h
that can do some of this boiler plate stack setup/teardown.

Incremental diff below to use them, only build tested.

cheers


diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
index 849316831e6a..a73694daca71 100644
--- a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
+++ b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
@@ -1,10 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <ppc-asm.h>
-#include <asm/unistd.h>
-
-/* ppc-asm.h does not define r0 or r1 */
-#define r0 0
-#define r1 1
+#include <basic_asm.h>
 
 	.text
 FUNC_START(getppid_tm_active)
@@ -32,29 +27,21 @@ FUNC_START(getppid_tm_suspended)
 	blr
 
 FUNC_START(getppid_scv_tm_active)
-	mflr	r0
-	std	r0,16(r1)
-	stdu	r1,-32(r1)
+	PUSH_BASIC_STACK(0)
 	tbegin.
 	beq 1f
 	li	r0, __NR_getppid
 	scv	0
 	tend.
-	addi	r1,r1,32
-	ld	r0,16(r1)
-	mtlr	r0
+	POP_BASIC_STACK(0)
 	blr
 1:
 	li	r3, -1
-	addi	r1,r1,32
-	ld	r0,16(r1)
-	mtlr	r0
+	POP_BASIC_STACK(0)
 	blr
 
 FUNC_START(getppid_scv_tm_suspended)
-	mflr	r0
-	std	r0,16(r1)
-	stdu	r1,-32(r1)
+	PUSH_BASIC_STACK(0)
 	tbegin.
 	beq 1f
 	li	r0, __NR_getppid
@@ -62,13 +49,9 @@ FUNC_START(getppid_scv_tm_suspended)
 	scv	0
 	tresume.
 	tend.
-	addi	r1,r1,32
-	ld	r0,16(r1)
-	mtlr	r0
+	POP_BASIC_STACK(0)
 	blr
 1:
 	li	r3, -1
-	addi	r1,r1,32
-	ld	r0,16(r1)
-	mtlr	r0
+	POP_BASIC_STACK(0)
 	blr

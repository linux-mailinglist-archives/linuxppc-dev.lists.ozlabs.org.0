Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 719754008CB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 03:03:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1bxw38Ysz2ywK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 11:03:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1bx41HjCz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 11:02:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H1bx03NjNz9sVw;
 Sat,  4 Sep 2021 11:02:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210901112522.1085134-1-mpe@ellerman.id.au>
References: <20210901112522.1085134-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/bug: Cast to unsigned long before passing to
 inline asm
Message-Id: <163071729326.1779947.13498962523541665858.b4-ty@ellerman.id.au>
Date: Sat, 04 Sep 2021 11:01:33 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Sep 2021 21:25:22 +1000, Michael Ellerman wrote:
> In commit 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to
> WARN_ON/__WARN_FLAGS() with asm goto") we changed WARN_ON(). Previously
> it would take the warning condition, x, and double negate it before
> converting the result to int, and passing that int to the underlying
> inline asm. ie:
> 
>   #define WARN_ON(x) ({
>   	int __ret_warn_on = !!(x);
>   	if (__builtin_constant_p(__ret_warn_on)) {
>   	...
>   	} else {
>   		BUG_ENTRY(PPC_TLNEI " %4, 0",
>   			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
>   			  "r" (__ret_warn_on));
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/bug: Cast to unsigned long before passing to inline asm
      https://git.kernel.org/powerpc/c/e432fe97f3e5de325b40021e505cce53877586c5

cheers

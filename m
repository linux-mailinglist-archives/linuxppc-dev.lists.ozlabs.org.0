Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755567454FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZXL2zvwz3dhs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP94z3cz3c05
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP93m76z4wy0;
	Mon,  3 Jul 2023 15:34:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20230609034501.407971-1-naveen@kernel.org>
References: <20230609034501.407971-1-naveen@kernel.org>
Subject: Re: [PATCH] powerpc/ftrace: Disable ftrace on ppc32 if using clang
Message-Id: <168836201892.50010.7027825800727422715.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 09 Jun 2023 09:15:01 +0530, Naveen N Rao wrote:
> Ftrace on ppc32 expects a three instruction sequence at the beginning of
> each function when specifying -pg:
> 	mflr	r0
> 	stw	r0,4(r1)
> 	bl	_mcount
> 
> This is the case with all supported versions of gcc. Clang however emits
> a branch to _mcount after the function prologue, similar to the pre
> -mprofile-kernel ABI on ppc64. This is not supported.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ftrace: Disable ftrace on ppc32 if using clang
      https://git.kernel.org/powerpc/c/d24da1f85530a5b47590c0febd1395dd8fc73124

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259562771C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 15:05:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxwJ65rRzzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 23:05:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxvWW13FgzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BxvWV4ttLz9sSC; Thu, 24 Sep 2020 22:29:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvWV0FCMz9sTN; Thu, 24 Sep 2020 22:29:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200917024509.3253837-1-mpe@ellerman.id.au>
References: <20200917024509.3253837-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/process: Fix uninitialised variable error
Message-Id: <160095058615.31531.17011740631199142404.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:29:57 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Sep 2020 12:45:09 +1000, Michael Ellerman wrote:
> Clang, and GCC with -Wmaybe-uninitialized, can't see that val is
> unused in get_fpexec_mode():
> 
>   arch/powerpc/kernel/process.c:1940:7: error: variable 'val' is used
>   uninitialized whenever 'if' condition is true
> 		  if (cpu_has_feature(CPU_FTR_SPE)) {
> 		      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/process: Fix uninitialised variable error
      https://git.kernel.org/powerpc/c/d208e13c6a2277d9fb71fad6a1394c70bdd7b634

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE9B2C406F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:45:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0wl6ChDzDqSw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzt55jvNzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4Cgzsq6xX8z9sVl; Wed, 25 Nov 2020 22:57:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsq40BQz9sVZ; Wed, 25 Nov 2020 22:57:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20201023020838.3274226-1-mpe@ellerman.id.au>
References: <20201023020838.3274226-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/85xx: Fix declaration made after definition
Message-Id: <160630539954.2174375.223679526917185628.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:51 +1100 (AEDT)
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

On Fri, 23 Oct 2020 13:08:38 +1100, Michael Ellerman wrote:
> Currently the clang build of corenet64_smp_defconfig fails with:
> 
>   arch/powerpc/platforms/85xx/corenet_generic.c:210:1: error:
>   attribute declaration must precede definition
>   machine_arch_initcall(corenet_generic, corenet_gen_publish_devices);
> 
> Fix it by moving the initcall definition prior to the machine
> definition, and directly below the function it calls, which is the
> usual style anyway.

Applied to powerpc/next.

[1/1] powerpc/85xx: Fix declaration made after definition
      https://git.kernel.org/powerpc/c/ef78f2dd2398ce8ed9eeaab9c9f8af2e15f5d870

cheers

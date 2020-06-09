Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82E1F3485
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:57:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1Bf1YyTzDqHn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:56:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzl475TrzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:51:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49gzl45Pmmz9sRK; Tue,  9 Jun 2020 15:51:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzl43r8bz9sSy; Tue,  9 Jun 2020 15:51:28 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7a8818e0df5c6b53c89c7c928498668a2bbb3de0
In-Reply-To: <20200516115449.4168796-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v8 22.5/30] powerpc/optprobes: Add register argument to
 patch_imm64_load_insns()
Message-Id: <49gzl43r8bz9sSy@ozlabs.org>
Date: Tue,  9 Jun 2020 15:51:28 +1000 (AEST)
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
Cc: christophe.leroy@c-s.fr, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-05-16 at 11:54:49 UTC, Michael Ellerman wrote:
> From: Jordan Niethe <jniethe5@gmail.com>
> 
> Currently patch_imm32_load_insns() is used to load an instruction to
> r4 to be emulated by emulate_step(). For prefixed instructions we
> would like to be able to load a 64bit immediate to r4. To prepare for
> this make patch_imm64_load_insns() take an argument that decides which
> register to load an immediate to - rather than hardcoding r3.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/7a8818e0df5c6b53c89c7c928498668a2bbb3de0

cheers

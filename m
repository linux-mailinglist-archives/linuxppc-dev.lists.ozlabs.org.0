Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 594911F341B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:29:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0Zr20nKzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFn3n5PzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49gzFV5LPhz9sVF; Tue,  9 Jun 2020 15:29:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFT16Pwz9sTV; Tue,  9 Jun 2020 15:29:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200526072630.2487363-1-mpe@ellerman.id.au>
References: <20200526072630.2487363-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Add ppc_inst_as_u64()
Message-Id: <159168034099.1381411.11932733469747494650.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:16 +1000 (AEST)
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
Cc: jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 May 2020 17:26:30 +1000, Michael Ellerman wrote:
> The code patching code wants to get the value of a struct ppc_inst as
> a u64 when the instruction is prefixed, so we can pass the u64 down to
> __put_user_asm() and write it with a single store.
> 
> The optprobes code wants to load a struct ppc_inst as an immediate
> into a register so it is useful to have it as a u64 to use the
> existing helper function.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Add ppc_inst_as_u64()
      https://git.kernel.org/powerpc/c/16ef9767e4dc5cf03a71ae7bc2bc588dbbe7983e

cheers

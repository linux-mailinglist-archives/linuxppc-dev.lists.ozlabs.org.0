Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC426309B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:33:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmmHZ4MmrzDqX1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkY0BdzzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkV2fkvz9sVW; Wed,  9 Sep 2020 23:37:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200804005410.146094-2-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-2-oohall@gmail.com>
Subject: Re: [PATCH 1/6] powerpc/powernv/smp: Fix spurious DBG() warning
Message-Id: <159965824427.811679.3711969846357918487.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:38 +1000 (AEST)
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

On Tue, 4 Aug 2020 10:54:05 +1000, Oliver O'Halloran wrote:
> When building with W=1 we get the following warning:
> 
>  arch/powerpc/platforms/powernv/smp.c: In function ‘pnv_smp_cpu_kill_self’:
>  arch/powerpc/platforms/powernv/smp.c:276:16: error: suggest braces around
>  	empty body in an ‘if’ statement [-Werror=empty-body]
>    276 |      cpu, srr1);
>        |                ^
>  cc1: all warnings being treated as errors
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/powernv/smp: Fix spurious DBG() warning
      https://git.kernel.org/powerpc/c/f6bac19cf65c5be21d14a0c9684c8f560f2096dd
[2/6] powerpc/powernv: Include asm/powernv.h from the local powernv.h
      https://git.kernel.org/powerpc/c/8471c1dd93de9a2278d41c527b76291e4ace8f1c
[3/6] powerpc/powernv: Staticify functions without prototypes
      https://git.kernel.org/powerpc/c/3b70464aa78917e88c1d4bfc2100c344c0eda8e0
[4/6] powerpc/powernv: Fix spurious kerneldoc warnings in opal-prd.c
      https://git.kernel.org/powerpc/c/fb248c3121af713f31736af359608491544cfc23
[5/6] powerpc/powernv: Remove set but not used variable 'parent'
      https://git.kernel.org/powerpc/c/18102e4bcc47f5b5ac70e2e4461d022c1ee6df24
[6/6] powerpc/nx: Don't pack struct coprocessor_request_block
      https://git.kernel.org/powerpc/c/3ced132a055c4e5046d21732393ae6848ff309e0

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF252224E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:12:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6x684JHfzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQB1lf7zDqll
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQ16Z8pz9sVF; Thu, 16 Jul 2020 22:56:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200609070610.846703-1-npiggin@gmail.com>
References: <20200609070610.846703-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/7] powerpc: branch cache flush changes
Message-Id: <159490401141.3805857.7556929430044596563.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:08 +1000 (AEST)
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

On Tue, 9 Jun 2020 17:06:03 +1000, Nicholas Piggin wrote:
> This series allows the link stack to be flushed with the speical
> bcctr 2,0,0 flush instruction that also flushes the count cache if
> the processor supports it.
> 
> Firmware does not support this at the moment, but I've tested it in
> simulator with a patched firmware to advertise support.
> 
> [...]

Patches 1-6 applied to powerpc/next.

[1/7] powerpc/security: re-name count cache flush to branch cache flush
      https://git.kernel.org/powerpc/c/1026798c644bfd3115fc4e32fd5e767cfc30ccf1
[2/7] powerpc/security: change link stack flush state to the flush type enum
      https://git.kernel.org/powerpc/c/c06ac2771070f465076e87bba262c64fb0b3aca3
[3/7] powerpc/security: make display of branch cache flush more consistent
      https://git.kernel.org/powerpc/c/1afe00c74ffe6d502bffa81c7d849cb4640d7ae5
[4/7] powerpc/security: split branch cache flush toggle from code patching
      https://git.kernel.org/powerpc/c/c0036549a9d9a060fa8bc24e31f85503ce08ad5e
[5/7] powerpc/64s: Move branch cache flushing bcctr variant to ppc-ops.h
      https://git.kernel.org/powerpc/c/70d7cdaf0548ec95fa7204dcdd39cd8e63cee24d
[6/7] powerpc/security: Allow for processors that flush the link stack using the special bcctr
      https://git.kernel.org/powerpc/c/4d24e21cc694e7253a532fe5a9bde12b284f1317

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0C2D5D7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:25:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGRM3Kk8zDqLZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY76cRkzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4CsBY63vJRz9sfR; Thu, 10 Dec 2020 22:30:18 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBY56NJnz9sfG; Thu, 10 Dec 2020 22:30:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201126131006.2431205-1-mpe@ellerman.id.au>
References: <20201126131006.2431205-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v14 1/9] powerpc/feature: Use CONFIG_PPC64 instead of
 __powerpc64__ to define possible features
Message-Id: <160756604927.1313423.17702939384161178382.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:17 +1100 (AEDT)
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

On Fri, 27 Nov 2020 00:09:58 +1100, Michael Ellerman wrote:
> In order to build VDSO32 for PPC64, we need to have CPU_FTRS_POSSIBLE
> and CPU_FTRS_ALWAYS independant of whether we are building the
> 32 bits VDSO or the 64 bits VDSO.
> 
> Use #ifdef CONFIG_PPC64 instead of #ifdef __powerpc64__

Applied to powerpc/next.

[1/9] powerpc/feature: Use CONFIG_PPC64 instead of __powerpc64__ to define possible features
      https://git.kernel.org/powerpc/c/8d1eeabf253657ae3e76970514f30b7e53a6898f
[2/9] powerpc/processor: Move cpu_relax() into asm/vdso/processor.h
      https://git.kernel.org/powerpc/c/8f8cffd9df81612b5b06d2c57ebf74f8961b41be
[3/9] powerpc/time: Move timebase functions into new asm/vdso/timebase.h
      https://git.kernel.org/powerpc/c/d26b3817d9eefae6b777739c1ea5daba5e72624e
[4/9] powerpc/time: Fix mftb()/get_tb() for use with the compat VDSO
      https://git.kernel.org/powerpc/c/5c189c523e78d4a70e874477e4b0628fd74207e4
[5/9] powerpc/barrier: Use CONFIG_PPC64 for barrier selection
      https://git.kernel.org/powerpc/c/1f1676bb2dd52c1054db8476d6387e6dcf62a1ba
[6/9] powerpc/vdso: Prepare for switching VDSO to generic C implementation.
      https://git.kernel.org/powerpc/c/ce7d8056e38b770f070fc4499c577322b6ccb9c7
[7/9] powerpc/vdso: Save and restore TOC pointer on PPC64
      https://git.kernel.org/powerpc/c/7fec9f5d41979dbe273ec337327d5939449562e7
[8/9] powerpc/vdso: Switch VDSO to generic C implementation.
      https://git.kernel.org/powerpc/c/ab037dd87a2f946556850e204c06cbd7a2a19390
[9/9] powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32
      https://git.kernel.org/powerpc/c/d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e

cheers

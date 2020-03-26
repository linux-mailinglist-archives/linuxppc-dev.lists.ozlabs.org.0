Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95102193F6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 14:06:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4xm6525zDqMx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 00:06:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3d44wsgzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:07:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48p3cz22zcz9sSx; Thu, 26 Mar 2020 23:06:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cy3fx0z9sSL; Thu, 26 Mar 2020 23:06:57 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d4a8e98621543d5798421eed177978bf2b3cdd11
In-Reply-To: <20200320032116.1024773-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v6 1/2] powerpc/64: Setup a paca before parsing device
 tree etc.
Message-Id: <48p3cy3fx0z9sSL@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:57 +1100 (AEDT)
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
Cc: npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-20 at 03:21:15 UTC, Michael Ellerman wrote:
> From: Daniel Axtens <dja@axtens.net>
> 
> Currently we set up the paca after parsing the device tree for CPU
> features. Prior to that, r13 contains random data, which means there
> is random data in r13 while we're running the generic dt parsing code.
> 
> This random data varies depending on whether we boot through a vmlinux
> or a zImage: for the vmlinux case it's usually around zero, but for
> zImages we see random values like 912a72603d420015.
> 
> This is poor practice, and can also lead to difficult-to-debug
> crashes. For example, when kcov is enabled, the kcov instrumentation
> attempts to read preempt_count out of the current task, which goes via
> the paca. This then crashes in the zImage case.
> 
> Similarly stack protector can cause crashes if r13 is bogus, by
> reading from the stack canary in the paca.
> 
> To resolve this:
> 
>  - move the paca setup to before the CPU feature parsing.
> 
>  - because we no longer have access to CPU feature flags in paca
>  setup, change the HV feature test in the paca setup path to consider
>  the actual value of the MSR rather than the CPU feature.
> 
> Translations get switched on once we leave early_setup, so I think
> we'd already catch any other cases where the paca or task aren't set
> up.
> 
> Boot tested on a P9 guest and host.
> 
> Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
> Fixes: 06ec27aea9fc ("powerpc/64: add stack protector support")
> Cc: stable@vger.kernel.org # v4.20+
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> [mpe: Reword comments & change log a bit to mention stack protector]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Series applied to powerpc next.

https://git.kernel.org/powerpc/c/d4a8e98621543d5798421eed177978bf2b3cdd11

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4183F0561
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTrX0KcHz3dgH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:53:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTh34sltz3d8Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:11 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgy4TBLz9t2g; Wed, 18 Aug 2021 23:46:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20210803211547.1093820-1-nathan@kernel.org>
References: <20210803211547.1093820-1-nathan@kernel.org>
Subject: Re: [PATCH] cpuidle: pseries: Mark pseries_idle_proble() as __init
Message-Id: <162929392065.3619265.16135263225670762399.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:40 +1000
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Aug 2021 14:15:47 -0700, Nathan Chancellor wrote:
> After commit 7cbd631d4dec ("cpuidle: pseries: Fixup CEDE0 latency only
> for POWER10 onwards"), pseries_idle_probe() is no longer inlined when
> compiling with clang, which causes a modpost warning:
> 
> WARNING: modpost: vmlinux.o(.text+0xc86a54): Section mismatch in
> reference from the function pseries_idle_probe() to the function
> .init.text:fixup_cede0_latency()
> The function pseries_idle_probe() references
> the function __init fixup_cede0_latency().
> This is often because pseries_idle_probe lacks a __init
> annotation or the annotation of fixup_cede0_latency is wrong.
> 
> [...]

Applied to powerpc/next.

[1/1] cpuidle: pseries: Mark pseries_idle_proble() as __init
      https://git.kernel.org/powerpc/c/d04691d373e75c83424b85c0e68e4a3f9370c10d

cheers

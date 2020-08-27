Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87046253F95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 09:50:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcZfS010RzDqc9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZYj46WczDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYj2T1gz9sTK; Thu, 27 Aug 2020 17:46:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20200602025612.62707-1-aik@ozlabs.ru>
References: <20200602025612.62707-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/perf: Stop crashing with generic_compat_pmu
Message-Id: <159851436144.52163.12546791003554646771.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:49 +1000 (AEST)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jun 2020 12:56:12 +1000, Alexey Kardashevskiy wrote:
> The bhrb_filter_map ("The  Branch  History  Rolling  Buffer") callback is
> only defined in raw CPUs' power_pmu structs. The "architected" CPUs use
> generic_compat_pmu which does not have this callback and crashed occur.
> 
> This add a NULL pointer check for bhrb_filter_map() which behaves as if
> the callback returned an error.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf: Fix crashes with generic_compat_pmu & BHRB
      https://git.kernel.org/powerpc/c/b460b512417ae9c8b51a3bdcc09020cd6c60ff69

cheers

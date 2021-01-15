Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8902F78E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 13:29:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHL8K4rNTzDsfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 23:29:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHL2J2PjnzDsbB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 23:23:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DHL2H4kF7z9sVr; Fri, 15 Jan 2021 23:23:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, schwab@linux-m68k.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0c0ab0eb3cc80687c326f76ff0dd5762b8812ecc.1610452505.git.christophe.leroy@csgroup.eu>
References: <0c0ab0eb3cc80687c326f76ff0dd5762b8812ecc.1610452505.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/vdso: fix clock_gettime_fallback for vdso32
Message-Id: <161071339940.2210050.16815442999051504532.b4-ty@ellerman.id.au>
Date: Fri, 15 Jan 2021 23:23:51 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Jan 2021 11:55:15 +0000 (UTC), Christophe Leroy wrote:
> The second argument of __kernel_clock_gettime64 points to a struct
> __kernel_timespec, with 64-bit time_t, so use the clock_gettime64 syscall
> in the fallback function for the 32-bit vdso.  Similarily,
> clock_getres_fallback should use the clock_getres_time64 syscall, though
> it isn't yet called from the 32-bit vdso.
> 
> [chleroy: Moved into a single #ifdef __powerpc64__ block]

Applied to powerpc/fixes.

[1/1] powerpc/vdso: Fix clock_gettime_fallback for vdso32
      https://git.kernel.org/powerpc/c/41131a5e54ae7ba5a2bb8d7b30d1818b3f5b13d2

cheers

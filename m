Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EE618DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:33:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hnym3MzxzDqRn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:33:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hnfr6FrLzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hnfq75mmz9sNF; Mon,  8 Jul 2019 11:19:31 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1cfb725fb1899dc6fdc88f8b5354a65e8ad260c6
In-Reply-To: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc/64: flush_inval_dcache_range() becomes
 flush_dcache_range()
Message-Id: <45hnfq75mmz9sNF@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:31 +1000 (AEST)
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

On Tue, 2019-05-14 at 09:05:13 UTC, Christophe Leroy wrote:
> On most arches having function flush_dcache_range(), including PPC32,
> this function does a writeback and invalidation of the cache bloc.
> 
> On PPC64, flush_dcache_range() only does a writeback while
> flush_inval_dcache_range() does the invalidation in addition.
> 
> In addition it looks like within arch/powerpc/, there are no PPC64
> platforms using flush_dcache_range()
> 
> This patch drops the existing 64 bits version of flush_dcache_range()
> and renames flush_inval_dcache_range() into flush_dcache_range().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1cfb725fb1899dc6fdc88f8b5354a65e8ad260c6

cheers

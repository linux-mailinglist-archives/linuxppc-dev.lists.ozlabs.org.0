Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A422C95A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:36:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtbT6GTVzF1QH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:36:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqh00vNSzDrPJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgw1nqLz9sTF; Fri, 24 Jul 2020 23:25:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <20200721091915.205006-1-santosh@fossix.org>
References: <20200721091915.205006-1-santosh@fossix.org>
Subject: Re: [PATCH trivial] ppc64/mm: remove comment that is no longer valid
Message-Id: <159559697312.1657499.3263323645214216381.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:15 +1000 (AEST)
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

On Tue, 21 Jul 2020 14:49:15 +0530, Santosh Sivaraj wrote:
> hash_low_64.S was removed in [1] and since flush_hash_page is not called
> from any assembly routine.
> 
> [1]: commit a43c0eb8364c0 ("powerpc/mm: Convert 4k insert from asm to C")

Applied to powerpc/next.

[1/1] powerpc/mm/hash64: Remove comment that is no longer valid
      https://git.kernel.org/powerpc/c/69507b984ddce803df81215cc7813825189adafa

cheers

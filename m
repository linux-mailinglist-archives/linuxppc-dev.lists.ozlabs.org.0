Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02D2DAB96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:03:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFjh0hJHzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP664XFzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP65SKkz9sTg; Tue, 15 Dec 2020 21:48:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e796c5fcb5898de827c803cf1ab8ba1d7a5d4b76.1606231483.git.christophe.leroy@csgroup.eu>
References: <e796c5fcb5898de827c803cf1ab8ba1d7a5d4b76.1606231483.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/6] powerpc/8xx: DEBUG_PAGEALLOC doesn't require an
 ITLB miss exception handler
Message-Id: <160802920955.504444.6903217720200398229.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:58 +1100 (AEDT)
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

On Tue, 24 Nov 2020 15:24:54 +0000 (UTC), Christophe Leroy wrote:
> Since commit e611939fc8ec ("powerpc/mm: Ensure change_page_attr()
> doesn't invalidate pinned TLBs"), pinned TLBs are not anymore
> invalidated by __kernel_map_pages() when CONFIG_DEBUG_PAGEALLOC is
> selected.
> 
> Remove the dependency on CONFIG_DEBUG_PAGEALLOC.

Applied to powerpc/next.

[1/6] powerpc/8xx: DEBUG_PAGEALLOC doesn't require an ITLB miss exception handler
      https://git.kernel.org/powerpc/c/613df979da6c032cbe6fa273fb8ca21af022157e
[2/6] powerpc/8xx: Always pin kernel text TLB
      https://git.kernel.org/powerpc/c/bccc58986a2f98e3af349c85c5f49aac7fb19ef2
[3/6] powerpc/8xx: Simplify INVALIDATE_ADJACENT_PAGES_CPU15
      https://git.kernel.org/powerpc/c/576e02bbf1062b9118d5bbb96a40ed3b6b359f22
[4/6] powerpc/8xx: Use SPRN_SPRG_SCRATCH2 in ITLB miss exception
      https://git.kernel.org/powerpc/c/a314ea5abf6dbaf35f14c9bd1d93105260fb9336
[5/6] powerpc/8xx: Use SPRN_SPRG_SCRATCH2 in DTLB miss exception
      https://git.kernel.org/powerpc/c/89eecd938cab80f0da18abbd2ed997a521f83f01
[6/6] powerpc/ppc-opcode: Add PPC_RAW_MFSPR()
      https://git.kernel.org/powerpc/c/70b588a068668dd7a92ed19cf0373ba92847957c

cheers

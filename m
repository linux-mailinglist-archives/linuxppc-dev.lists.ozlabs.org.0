Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726B5B36FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFFz1Qt0z3f6D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDY6Dg4z2yWl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDW14byz4xG8;
	Fri,  9 Sep 2022 22:10:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <959d77be630b9b46a7458f0fbd41dc3a94ec811a.1661938317.git.christophe.leroy@csgroup.eu>
References: <959d77be630b9b46a7458f0fbd41dc3a94ec811a.1661938317.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/32: Drop a stale comment about reservation of gigantic pages
Message-Id: <166272520935.2076816.18378317029543943017.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:06:49 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Aug 2022 11:32:07 +0200, Christophe Leroy wrote:
> A comment about the reservation of gigantic pages was left in MMU_init()
> after commit 79cc38ded1e1 ("powerpc/mm/hugetlb: Add support for
> reserving gigantic huge pages via kernel command line")
> 
> Remove it.
> 
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/32: Drop a stale comment about reservation of gigantic pages
      https://git.kernel.org/powerpc/c/fc06755e25628ce215e9f75c1207250242dadf42
[2/3] powerpc/32: Allow fragmented physical memory
      https://git.kernel.org/powerpc/c/b0e0d68b1c52cb2c46e513011fdd53815cffefb7
[3/3] powerpc/32: Remove wii_memory_fixups()
      https://git.kernel.org/powerpc/c/0115953dcebe8858ba3d9997ba48328ebdca593f

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF78563F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:04:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFdV5hZJz3wHB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFYW51VRz3vZt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 00:01:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFYW3FMLz4wcM;
	Fri, 16 Feb 2024 00:01:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <bbd84ad52bf377e8d3b5865a906f2dc5d99964ba.1707832677.git.christophe.leroy@csgroup.eu>
References: <bbd84ad52bf377e8d3b5865a906f2dc5d99964ba.1707832677.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
Message-Id: <170800202445.601034.6210064022309317315.b4-ty@ellerman.id.au>
Date: Fri, 16 Feb 2024 00:00:24 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Feb 2024 14:58:37 +0100, Christophe Leroy wrote:
> arch_vmap_pud_supported() and arch_vmap_pmd_supported() are
> expected to constant-fold to false when RADIX is not enabled.
> 
> Force inlining in order to avoid following failure which
> leads to unexpected call of non-existing pud_set_huge() and
> pmd_set_huge() on powerpc 8xx.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
      https://git.kernel.org/powerpc/c/c5aebb53b32460bc52680dd4e2a2f6b84d5ea521

cheers

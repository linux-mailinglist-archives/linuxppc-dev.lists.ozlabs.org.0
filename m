Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C6F4B87B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHPV6w7Wz3dhH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNM0Nj1z2xrG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNM292zz4xml;
 Wed, 16 Feb 2022 23:30:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
References: <6c608fd4795e2d8ea1a0a449405a0087f76d8bb3.1642752375.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/lib/sstep: Use l1_dcache_bytes() instead of
 opencoding
Message-Id: <164501435210.521186.7862995446067984760.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:52 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jan 2022 08:06:27 +0000, Christophe Leroy wrote:
> Don't opencode dcache size retrieval based on whether that's ppc32 or ppc64.
> 
> Use l1_dcache_bytes()
> 
> 

Applied to powerpc/next.

[1/3] powerpc/lib/sstep: Use l1_dcache_bytes() instead of opencoding
      https://git.kernel.org/powerpc/c/67484e0de9c93b4a9187bb49f45dfdaa8dc03c0b
[2/3] powerpc/lib/sstep: Remove unneeded #ifdef __powerpc64__
      https://git.kernel.org/powerpc/c/7c3bba91999075f4cfcab0542e4eb74d2d63554b
[3/3] powerpc/lib/sstep: use truncate_if_32bit()
      https://git.kernel.org/powerpc/c/6836f099039e6c72fb548bf527345aa4345c3308

cheers

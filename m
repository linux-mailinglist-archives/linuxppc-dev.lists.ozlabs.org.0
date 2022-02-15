Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D84B62D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:33:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV9l4BZXz3ddZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:33:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV694Qfxz3cRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV696Fvjz4y4F;
 Tue, 15 Feb 2022 16:30:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <83c97bd58a3596ef1b0ff28b1e41fd492d005520.1643616989.git.christophe.leroy@csgroup.eu>
References: <83c97bd58a3596ef1b0ff28b1e41fd492d005520.1643616989.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/nohash: Remove pte_same()
Message-Id: <164490280514.270256.13075668635877697100.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:45 +1100
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

On Mon, 31 Jan 2022 08:16:48 +0000, Christophe Leroy wrote:
> arch/powerpc/include/asm/nohash/{32/64}/pgtable.h has
> 
> 	#define __HAVE_ARCH_PTE_SAME
> 	#define pte_same(A,B)      ((pte_val(A) ^ pte_val(B)) == 0)
> 
> include/linux/pgtable.h has
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/nohash: Remove pte_same()
      https://git.kernel.org/powerpc/c/535bda36dbf2d271f59e06fe252c32eff452666d

cheers

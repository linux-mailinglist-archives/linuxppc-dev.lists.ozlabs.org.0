Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A961297F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:05:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPp80pqFzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNSy3LcszDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 17:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNSw6lq0z9sD4; Fri,  3 May 2019 17:05:52 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 12f363511d47f86c49b7766c349989cb33fd61a8
X-Patchwork-Hint: ignore
In-Reply-To: <09733bd9d90f2ab9dfee9838442e0bea01df194d.1556640535.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Segher Boessenkool <segher@kernel.crashing.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/32s: fix BATs setting with
 CONFIG_STRICT_KERNEL_RWX
Message-Id: <44wNSw6lq0z9sD4@ozlabs.org>
Date: Fri,  3 May 2019 17:05:52 +1000 (AEST)
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

On Tue, 2019-04-30 at 16:11:59 UTC, Christophe Leroy wrote:
> Serge reported some crashes with CONFIG_STRICT_KERNEL_RWX enabled
> on a book3s32 machine.
> 
> Analysis shows two issues:
> - BATs addresses and sizes are not properly aligned.
> - There is a gap between the last address covered by BATs and the
> first address covered by pages.
> 
> Memory mapped with DBATs:
> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
> 2: 0xc0c00000-0xc13fffff 0x00c00000 Kernel RW coherent
> 3: 0xc1400000-0xc23fffff 0x01400000 Kernel RW coherent
> 4: 0xc2400000-0xc43fffff 0x02400000 Kernel RW coherent
> 5: 0xc4400000-0xc83fffff 0x04400000 Kernel RW coherent
> 6: 0xc8400000-0xd03fffff 0x08400000 Kernel RW coherent
> 7: 0xd0400000-0xe03fffff 0x10400000 Kernel RW coherent
> 
> Memory mapped with pages:
> 0xe1000000-0xefffffff  0x21000000       240M        rw       present           dirty  accessed
> 
> This patch fixes both issues. With the patch, we get the following
> which is as expected:
> 
> Memory mapped with DBATs:
> 0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
> 1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
> 2: 0xc0c00000-0xc0ffffff 0x00c00000 Kernel RW coherent
> 3: 0xc1000000-0xc1ffffff 0x01000000 Kernel RW coherent
> 4: 0xc2000000-0xc3ffffff 0x02000000 Kernel RW coherent
> 5: 0xc4000000-0xc7ffffff 0x04000000 Kernel RW coherent
> 6: 0xc8000000-0xcfffffff 0x08000000 Kernel RW coherent
> 7: 0xd0000000-0xdfffffff 0x10000000 Kernel RW coherent
> 
> Memory mapped with pages:
> 0xe0000000-0xefffffff  0x20000000       256M        rw       present           dirty  accessed
> 
> Reported-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
> Cc: stable@vger.kernel.org
> Acked-by: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/12f363511d47f86c49b7766c349989cb

cheers

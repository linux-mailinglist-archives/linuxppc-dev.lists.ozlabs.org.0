Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1B151A74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:23:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BkNz4w0JzDqD7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BjyJ3DsMzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:03:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48BjyF4dRPzB3ww; Tue,  4 Feb 2020 23:03:17 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6ec20aa2e510b6297906c45f009aa08b2d97269a
In-Reply-To: <f48244e9485ada0a304ed33ccbb8da271180c80d.1579866752.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 2/7] powerpc/32s: Fix bad_kuap_fault()
Message-Id: <48BjyF4dRPzB3ww@ozlabs.org>
Date: Tue,  4 Feb 2020 23:03:17 +1100 (AEDT)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-01-24 at 11:54:40 UTC, Christophe Leroy wrote:
> At the moment, bad_kuap_fault() reports a fault only if a bad access
> to userspace occurred while access to userspace was not granted.
> 
> But if a fault occurs for a write outside the allowed userspace
> segment(s) that have been unlocked, bad_kuap_fault() fails to
> detect it and the kernel loops forever in do_page_fault().
> 
> Fix it by checking that the accessed address is within the allowed
> range.
> 
> Fixes: a68c31fc01ef ("powerpc/32s: Implement Kernel Userspace Access Protection")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/1e07c7de4ffdd9cda35d1ffe8258af75579d3e91.1579715466.git.christophe.leroy@c-s.fr

Patches 2-7 applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6ec20aa2e510b6297906c45f009aa08b2d97269a

cheers

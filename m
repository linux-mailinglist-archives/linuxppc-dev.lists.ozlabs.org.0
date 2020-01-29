Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0314C606
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:44:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486srB018VzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDl4j4LzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDk52QMz9s1x; Wed, 29 Jan 2020 16:17:26 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 902137ba8e469ed07c7f120a390161937a6288fb
In-Reply-To: <eaac4b6494ecff1811220fccc895bf282aab884a.1575273217.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/8] powerpc/32: Add VDSO version of getcpu on non SMP
Message-Id: <486sDk52QMz9s1x@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:26 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-02 at 07:57:27 UTC, Christophe Leroy wrote:
> Commit 18ad51dd342a ("powerpc: Add VDSO version of getcpu") added
> getcpu() for PPC64 only, by making use of a user readable general
> purpose SPR.
> 
> PPC32 doesn't have any such SPR.
> 
> For non SMP, just return CPU id 0 from the VDSO directly.
> PPC32 doesn't support CONFIG_NUMA so NUMA node is always 0.
> 
> Before the patch, vdsotest reported:
> getcpu: syscall: 1572 nsec/call
> getcpu:    libc: 1787 nsec/call
> getcpu:    vdso: not tested
> 
> Now, vdsotest reports:
> getcpu: syscall: 1582 nsec/call
> getcpu:    libc: 502 nsec/call
> getcpu:    vdso: 187 nsec/call
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Patches 1, 2 and 4-8, applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/902137ba8e469ed07c7f120a390161937a6288fb

cheers

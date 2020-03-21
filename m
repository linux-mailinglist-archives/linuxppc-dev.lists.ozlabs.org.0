Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B218E130
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:33:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l0RH4JFmzF0kW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kzCk576jzDrLv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:37:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48kzCg4YfDz9sSg; Sat, 21 Mar 2020 22:37:51 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: af3d0a68698c7e5df8b72267086b23422a3954bb
In-Reply-To: <ef5248fc1f496c6b0dfdb59380f24968f25f75c5.1583513368.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/kasan: Fix shadow memory protection with
 CONFIG_KASAN_VMALLOC
Message-Id: <48kzCg4YfDz9sSg@ozlabs.org>
Date: Sat, 21 Mar 2020 22:37:51 +1100 (AEDT)
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

On Fri, 2020-03-06 at 16:49:49 UTC, Christophe Leroy wrote:
> With CONFIG_KASAN_VMALLOC, new page tables are created at the time
> shadow memory for vmalloc area in unmapped. If some parts of the
> page table still has entries to the zero page shadow memory, the
> entries are wrongly marked RW.
> 
> With CONFIG_KASAN_VMALLOC, almost the entire kernel address space
> is managed by KASAN. To make it simple, just create KASAN page tables
> for the entire kernel space at kasan_init(). That doesn't use much
> more space, and that's anyway already done for hash platforms.
> 
> Fixes: 3d4247fcc938 ("powerpc/32: Add support of KASAN_VMALLOC")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/af3d0a68698c7e5df8b72267086b23422a3954bb

cheers

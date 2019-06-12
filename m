Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39241B71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 07:02:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NvrQ6Cc2zDr0k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 15:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NvmH2Q2xzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:59:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45NvmH0kL6z9sBr; Wed, 12 Jun 2019 14:59:10 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c21f5a9ed85ca3e914ca11f421677ae9ae0d04b0
X-Patchwork-Hint: ignore
In-Reply-To: <90d30adb0943a11ab127808c03229ba657478df4.1559566521.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Mathieu Malaterre <malat@debian.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32s: fix booting with CONFIG_PPC_EARLY_DEBUG_BOOTX
Message-Id: <45NvmH0kL6z9sBr@ozlabs.org>
Date: Wed, 12 Jun 2019 14:59:10 +1000 (AEST)
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

On Mon, 2019-06-03 at 13:00:51 UTC, Christophe Leroy wrote:
> When booting through OF, setup_disp_bat() does nothing because
> disp_BAT are not set. By change, it used to work because BOOTX
> buffer is mapped 1:1 at address 0x81000000 by the bootloader, and
> btext_setup_display() sets virt addr same as phys addr.
> 
> But since commit 215b823707ce ("powerpc/32s: set up an early static
> hash table for KASAN."), a temporary page table overrides the
> bootloader mapping.
> 
> This 0x81000000 is also problematic with the newly implemented
> Kernel Userspace Access Protection (KUAP) because it is within user
> address space.
> 
> This patch fixes those issues by properly setting disp_BAT through
> a call to btext_prepare_BAT(), allowing setup_disp_bat() to
> properly setup BAT3 for early bootx screen buffer access.
> 
> Reported-by: Mathieu Malaterre <malat@debian.org>
> Fixes: 215b823707ce ("powerpc/32s: set up an early static hash table for KASAN.")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Tested-by: Mathieu Malaterre <malat@debian.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/c21f5a9ed85ca3e914ca11f421677ae9

cheers

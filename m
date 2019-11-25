Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46982108C5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:56:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M3qP4GmqzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 21:56:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M3cy3pmQzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:46:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47M3cy2crzz9sR1; Mon, 25 Nov 2019 21:46:58 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a2227a27774328507a5c2335a6dd600c079d1ff5
In-Reply-To: <c8610942203e0d93fcb02ad20c57edd3adb4c9d3.1566554029.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: Don't populate page tables for block mapped
 pages except on the 8xx.
Message-Id: <47M3cy2crzz9sR1@ozlabs.org>
Date: Mon, 25 Nov 2019 21:46:58 +1100 (AEDT)
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

On Fri, 2019-08-23 at 09:56:21 UTC, Christophe Leroy wrote:
> Commit d2f15e0979ee ("powerpc/32: always populate page tables for
> Abatron BDI.") wrongly sets page tables for any PPC32 for using BDI,
> and does't update them after init (remove RX on init section, set
> text and rodata read-only)
> 
> Only the 8xx requires page tables to be populated for using the BDI.
> They also need to be populated in order to see the mappings in
> /sys/kernel/debug/kernel_page_tables
> 
> On BOOK3S_32, pages that are not mapped by page tables are mapped
> by BATs. The BDI knows BATs and they can be viewed in
> /sys/kernel/debug/powerpc/block_address_translation
> 
> Only set pagetables for RAM and IMMR on the 8xx and properly update
> them at the end of init.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a2227a27774328507a5c2335a6dd600c079d1ff5

cheers

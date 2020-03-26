Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2AA193EFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:38:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4K569x4zDqBg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:38:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cf2wKszDqpL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cd3rbBz9sRY; Thu, 26 Mar 2020 23:06:41 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 697ece78f8f749aeea40f2711389901f0974017a
In-Reply-To: <c4d6c18a7f8d9d3b899bc492f55fbc40ef38896a.1583861325.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/32s: reorder Linux PTE bits to better match
 Hash PTE bits.
Message-Id: <48p3cd3rbBz9sRY@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:41 +1100 (AEDT)
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

On Tue, 2020-03-10 at 17:29:12 UTC, Christophe Leroy wrote:
> Reorder Linux PTE bits to (almost) match Hash PTE bits.
> 
> RW Kernel : PP = 00
> RO Kernel : PP = 00
> RW User   : PP = 01
> RO User   : PP = 11
> 
> So naturally, we should have
> _PAGE_USER = 0x001
> _PAGE_RW   = 0x002
> 
> Today 0x001 and 0x002 and _PAGE_PRESENT and _PAGE_HASHPTE which
> both are software only bits.
> 
> Switch _PAGE_USER and _PAGE_PRESET
> Switch _PAGE_RW and _PAGE_HASHPTE
> 
> This allows to remove a few insns.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/697ece78f8f749aeea40f2711389901f0974017a

cheers

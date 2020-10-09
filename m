Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1C2881F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:08:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yKp2zVMzDqZ9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yF94qCdzDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:03:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yF936fKz9sTR; Fri,  9 Oct 2020 17:03:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <319d379f696412681c66a987cc75e6abf8f958d2.1601975100.git.christophe.leroy@csgroup.eu>
References: <319d379f696412681c66a987cc75e6abf8f958d2.1601975100.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/32s: Rename head_32.S to head_book3s_32.S
Message-Id: <160222339355.867048.3903494504436906877.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:03:57 +1100 (AEDT)
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

On Tue, 6 Oct 2020 09:05:26 +0000 (UTC), Christophe Leroy wrote:
> Unlike PPC64 which had a single head_64.S, PPC32 are multiple ones.
> There is the head_32.S, selected by default based on the value of BITS
> and overridden based on some CONFIG_ values. This leads to thinking
> that it may be selected by different types of PPC32 platform but
> indeed it ends up being selected by book3s/32 only.
> 
> Make that explicit by:
> - Not doing any default selection based on BITS.
> - Renaming head_32.S to head_book3s_32.S.
> - Get head_book3s_32.S selected only by CONFIG_PPC_BOOK3S_32.

Applied to powerpc/next.

[1/2] powerpc/32s: Rename head_32.S to head_book3s_32.S
      https://git.kernel.org/powerpc/c/533090e5a980ad80bbe0961b4ed45a9bcf55cc0c
[2/2] powerpc/32s: Remove #ifdef CONFIG_PPC_BOOK3S_32 in head_book3s_32.S
      https://git.kernel.org/powerpc/c/865418795a1dea1c2b58a5fd7b6bdcb93e0c36b8

cheers

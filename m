Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCD11836
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 13:33:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vtSh5NyczDqLX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 21:33:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vtRP5z67zDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 21:32:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vtRP40Qrz9s9T;
 Thu,  2 May 2019 21:32:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 3/4] powerpc/mm: Move book3s32 specifics in
 subdirectory mm/book3s64
In-Reply-To: <12c1ba4fc9e2e55ca44c5c57225669b296d48c74.1553853405.git.christophe.leroy@c-s.fr>
References: <cover.1553853405.git.christophe.leroy@c-s.fr>
 <12c1ba4fc9e2e55ca44c5c57225669b296d48c74.1553853405.git.christophe.leroy@c-s.fr>
Date: Thu, 02 May 2019 21:32:49 +1000
Message-ID: <87tvedxfa6.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> Several files in arch/powerpc/mm are only for book3S32. This patch
> creates a subdirectory for them.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/mm/Makefile                            | 3 +--
>  arch/powerpc/mm/book3s32/Makefile                   | 6 ++++++
>  arch/powerpc/mm/{ => book3s32}/hash_low_32.S        | 0
>  arch/powerpc/mm/{ => book3s32}/mmu_context_hash32.c | 0
>  arch/powerpc/mm/{ => book3s32}/ppc_mmu_32.c         | 0
>  arch/powerpc/mm/{ => book3s32}/tlb_hash32.c         | 0
>  6 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/mm/book3s32/Makefile
>  rename arch/powerpc/mm/{ => book3s32}/hash_low_32.S (100%)
>  rename arch/powerpc/mm/{ => book3s32}/mmu_context_hash32.c (100%)
>  rename arch/powerpc/mm/{ => book3s32}/ppc_mmu_32.c (100%)
>  rename arch/powerpc/mm/{ => book3s32}/tlb_hash32.c (100%)

I shortened them to:

  arch/powerpc/mm/{hash_low_32.S => book3s32/hash_low.S}
  arch/powerpc/mm/{ppc_mmu_32.c => book3s32/mmu.c}
  arch/powerpc/mm/{mmu_context_hash32.c => book3s32/mmu_context.c}
  arch/powerpc/mm/{tlb_hash32.c => book3s32/tlb.c}

cheers

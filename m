Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90EA11CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jt7S5YGczDrBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:32:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jt5T4b5rzDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 16:30:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Jt5S3rV6z9sBp;
 Thu, 29 Aug 2019 16:30:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, segher@kernel.crashing.org,
 npiggin@gmail.com
Subject: Re: [PATCH v2 1/2] powerpc: permanently include 8xx registers in reg.h
In-Reply-To: <e3de2a60198c1b648a5da19ba29938a1e365d1f3.1566931178.git.christophe.leroy@c-s.fr>
References: <e3de2a60198c1b648a5da19ba29938a1e365d1f3.1566931178.git.christophe.leroy@c-s.fr>
Date: Thu, 29 Aug 2019 16:30:16 +1000
Message-ID: <875zmgv5zb.fsf@mpe.ellerman.id.au>
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

> Most 8xx registers have specific names, so just include
> reg_8xx.h all the time in reg.h in order to have them defined
> even when CONFIG_PPC_8xx is not selected. This will avoid
> the need for #ifdefs in C code.
>
> Guard SPRN_ICTRL in an #ifdef CONFIG_PPC_8xx as this register
> has same name but different meaning and different spr number as
> another register in the mpc7450.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> ---
> v2: no change
> ---
>  arch/powerpc/include/asm/reg.h     | 2 --
>  arch/powerpc/include/asm/reg_8xx.h | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)

This breaks the ppc64e build unfortunately, presumably due to it
changing the ordering of header inclusion.

In file included from ../arch/powerpc/include/asm/percpu.h:13,
                 from ../arch/powerpc/include/asm/mmu.h:137,
                 from ../arch/powerpc/include/asm/reg_8xx.h:8,
                 from ../arch/powerpc/include/asm/reg.h:28,
                 from ../arch/powerpc/include/asm/processor.h:9,
                 from ../include/linux/processor.h:6,
                 from ../arch/powerpc/include/asm/delay.h:6,
                 from ../include/linux/delay.h:26,
                 from ../lib/nmi_backtrace.c:17:
../arch/powerpc/include/asm/paca.h:147:23: error: field 'tcd' has incomplete type
  struct tlb_core_data tcd;
                       ^~~

cheers

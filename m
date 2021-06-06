Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59239CED6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb7N2q43z3dmx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:15:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3J1Kh6z3081
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:12 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3H1fWTz9sj1; Sun,  6 Jun 2021 22:12:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <1c80981548dc0c4f145109cdd473022c1aad8d2b.1620223302.git.christophe.leroy@csgroup.eu>
References: <1c80981548dc0c4f145109cdd473022c1aad8d2b.1620223302.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/asm-offset: Remove unused items
Message-Id: <162298131492.2353459.7654424742326960159.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:34 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 5 May 2021 14:02:12 +0000 (UTC), Christophe Leroy wrote:
> Following PACA related items are not used anymore by ASM code:
> PACA_SIZE, PACACONTEXTID, PACALOWSLICESPSIZE, PACAHIGHSLICEPSIZE,
> PACA_SLB_ADDR_LIMIT, MMUPSIZEDEFSIZE, PACASLBCACHE, PACASLBCACHEPTR,
> PACASTABRR, PACAVMALLOCSLLP, MMUPSIZESLLP, PACACONTEXTSLLP,
> PACALPPACAPTR, LPPACA_DTLIDX and PACA_DTL_RIDX.
> 
> Following items are also not used anymore:
> SIGSEGV, NMI_MASK, THREAD_DBCR0, KUAP, TI_FLAGS, TI_PREEMPT,
> DCACHEL1BLOCKSPERPAGE, ICACHEL1BLOCKSIZE, ICACHEL1LOGBLOCKSIZE,
> ICACHEL1BLOCKSPERPAGE, STACK_REGS_KUAP, KVM_NEED_FLUSH, KVM_FWNMI,
> VCPU_DEC, VCPU_SPMC, HSTATE_XICS_PHYS, HSTATE_SAVED_XIRR and
> PPC_DBELL_MSGTYPE.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/asm-offset: Remove unused items
      https://git.kernel.org/powerpc/c/1a3c6ceed2533121e857d9b38559839487d31f33
[2/2] powerpc/paca: Remove mm_ctx_id and mm_ctx_slb_addr_limit
      https://git.kernel.org/powerpc/c/13c7dad95176d6abaf9608e4d34b2f512689775e

cheers

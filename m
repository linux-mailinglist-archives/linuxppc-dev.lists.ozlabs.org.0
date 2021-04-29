Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6236EBE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHKZ2jpwz3cFZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:03:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHHy5TxWz3033
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:22 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHHy2GM8z9t15; Fri, 30 Apr 2021 00:02:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cb4cec9131c8577803367f1699209a7e104cec2a.1619025821.git.christophe.leroy@csgroup.eu>
References: <cb4cec9131c8577803367f1699209a7e104cec2a.1619025821.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/52xx: Fix an invalid ASM expression ('addi' used
 instead of 'add')
Message-Id: <161970488335.4033873.16440956180112521180.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:23 +1000
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

On Wed, 21 Apr 2021 17:24:03 +0000 (UTC), Christophe Leroy wrote:
>   AS      arch/powerpc/platforms/52xx/lite5200_sleep.o
> arch/powerpc/platforms/52xx/lite5200_sleep.S: Assembler messages:
> arch/powerpc/platforms/52xx/lite5200_sleep.S:184: Warning: invalid register expression
> 
> In the following code, 'addi' is wrong, has to be 'add'
> 
> 	/* local udelay in sram is needed */
>   udelay: /* r11 - tb_ticks_per_usec, r12 - usecs, overwrites r13 */
> 	mullw	r12, r12, r11
> 	mftb	r13	/* start */
> 	addi	r12, r13, r12 /* end */

Applied to powerpc/next.

[1/1] powerpc/52xx: Fix an invalid ASM expression ('addi' used instead of 'add')
      https://git.kernel.org/powerpc/c/8a87a507714386efc39c3ae6fa24d4f79846b522

cheers

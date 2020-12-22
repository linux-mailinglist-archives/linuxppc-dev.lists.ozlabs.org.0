Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FAF2E0A8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:19:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0cPS3bgNzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cDG01FRzDqNL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:11:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D0cDD4hjWz9sTg; Wed, 23 Dec 2020 00:11:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <df05d53eed1210cf1aa76d1fb44aa0fab29c018e.1608488286.git.christophe.leroy@csgroup.eu>
References: <df05d53eed1210cf1aa76d1fb44aa0fab29c018e.1608488286.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/time: Force inlining of get_tb()
Message-Id: <160864266098.1929899.4436142434318857345.b4-ty@ellerman.id.au>
Date: Wed, 23 Dec 2020 00:11:24 +1100 (AEDT)
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

On Sun, 20 Dec 2020 18:18:26 +0000 (UTC), Christophe Leroy wrote:
> Force inlining of get_tb() in order to avoid getting
> following function in vdso32, leading to suboptimal
> performance in clock_gettime()
> 
> 00000688 <.get_tb>:
>  688:	7c 6d 42 a6 	mftbu   r3
>  68c:	7c 8c 42 a6 	mftb    r4
>  690:	7d 2d 42 a6 	mftbu   r9
>  694:	7c 03 48 40 	cmplw   r3,r9
>  698:	40 e2 ff f0 	bne+    688 <.get_tb>
>  69c:	4e 80 00 20 	blr

Applied to powerpc/fixes.

[1/1] powerpc/time: Force inlining of get_tb()
      https://git.kernel.org/powerpc/c/0faa22f09caadc11af2aa7570870ebd2ac5b8170

cheers

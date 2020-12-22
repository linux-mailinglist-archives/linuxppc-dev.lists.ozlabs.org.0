Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165F2E0A83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:15:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0cJT3Y2qzDqF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:15:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cDD74mmzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:11:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D0cDB4BSMz9sWP; Wed, 23 Dec 2020 00:11:22 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <a3d819d5c348cee9783a311d5d3f3ba9b48fd219.1608531452.git.christophe.leroy@csgroup.eu>
References: <a3d819d5c348cee9783a311d5d3f3ba9b48fd219.1608531452.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Fix vmap stack - Properly set r1 before
 activating MMU on syscall too
Message-Id: <160864266247.1929899.17670433500031746494.b4-ty@ellerman.id.au>
Date: Wed, 23 Dec 2020 00:11:22 +1100 (AEDT)
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

On Mon, 21 Dec 2020 06:18:03 +0000 (UTC), Christophe Leroy wrote:
> We need r1 to be properly set before activating MMU, otherwise any new
> exception taken while saving registers into the stack in syscall
> prologs will use the user stack, which is wrong and will even lockup
> or crash when KUAP is selected.
> 
> Do that by switching the meaning of r11 and r1 until we have saved r1
> to the stack: copy r1 into r11 and setup the new stack pointer in r1.
> To avoid complicating and impacting all generic and specific prolog
> code (and more), copy back r1 into r11 once r11 is save onto
> the stack.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/32: Fix vmap stack - Properly set r1 before activating MMU on syscall too
      https://git.kernel.org/powerpc/c/d5c243989fb0cb03c74d7340daca3b819f706ee7

cheers

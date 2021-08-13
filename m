Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C203EB4F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 13:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmMYb2yy5z3d9c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 21:59:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmMXk6qx9z30JG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 21:59:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GmMXg4qVCz9t23; Fri, 13 Aug 2021 21:58:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, fthain@linux-m68k.org,
 npiggin@gmail.com, Michael Ellerman <mpe@ellerman.id.au>, userm57@yahoo.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <c17d234f4927d39a1d7100864a8e1145323d33a0.1628611927.git.christophe.leroy@csgroup.eu>
References: <c17d234f4927d39a1d7100864a8e1145323d33a0.1628611927.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/interrupt: Fix OOPS by not calling do_IRQ() from
 timer_interrupt()
Message-Id: <162885586792.2317031.17954514979013171970.b4-ty@ellerman.id.au>
Date: Fri, 13 Aug 2021 21:57:47 +1000
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

On Tue, 10 Aug 2021 16:13:16 +0000 (UTC), Christophe Leroy wrote:
> An interrupt handler shall not be called from another interrupt
> handler otherwise this leads to problems like the following:
> 
> 	Kernel attempted to write user page (afd4fa84) - exploit attempt? (uid: 1000)
> 	------------[ cut here ]------------
> 	Bug: Write fault blocked by KUAP!
> 	WARNING: CPU: 0 PID: 1617 at arch/powerpc/mm/fault.c:230 do_page_fault+0x484/0x720
> 	Modules linked in:
> 	CPU: 0 PID: 1617 Comm: sshd Tainted: G        W         5.13.0-pmac-00010-g8393422eb77 #7
> 	NIP:  c001b77c LR: c001b77c CTR: 00000000
> 	REGS: cb9e5bc0 TRAP: 0700   Tainted: G        W          (5.13.0-pmac-00010-g8393422eb77)
> 	MSR:  00021032 <ME,IR,DR,RI>  CR: 24942424  XER: 00000000
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/interrupt: Fix OOPS by not calling do_IRQ() from timer_interrupt()
      https://git.kernel.org/powerpc/c/98694166c27d473c36b434bd3572934c2f2a16ab

cheers

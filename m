Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A35276FB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:32:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1Jc85lXvz3f58
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZJ4mzpz3cKW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZJ3y9dz4xZ0;
 Sun, 15 May 2022 20:31:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <6bb118fb2ee89fa3c1f9cf90ed19f88220002cb0.1647877467.git.christophe.leroy@csgroup.eu>
References: <6bb118fb2ee89fa3c1f9cf90ed19f88220002cb0.1647877467.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: align address to page boundary in
 change_page_attr()
Message-Id: <165261053145.1047019.10970993413033058326.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:28:51 +1000
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

On Mon, 21 Mar 2022 16:44:45 +0100, Christophe Leroy wrote:
> Aligning address to page boundary allows flush_tlb_kernel_range()
> to know it's a single page flush and use tlbie instead of tlbia.
> 
> On 603 we now have the following code in first leg of
> change_page_attr():
> 
> 	  2c:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
> 	  30:	91 23 00 00 	stw     r9,0(r3)
> 	  34:	7c 00 22 64 	tlbie   r4,r0
> 	  38:	7c 00 04 ac 	hwsync
> 	  3c:	38 60 00 00 	li      r3,0
> 	  40:	4e 80 00 20 	blr
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: align address to page boundary in change_page_attr()
      https://git.kernel.org/powerpc/c/65883b78bc9f49ac891bb202c59fcb76b9cfc611

cheers

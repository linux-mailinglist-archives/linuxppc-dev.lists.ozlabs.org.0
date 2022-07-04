Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281F5653CA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:37:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3gq1fC6z3f99
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3f003FFz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:35:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3dy2YgLz4xRC;
	Mon,  4 Jul 2022 21:35:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e2454434992cc932a5a34b695ae981c0b2f4c28e.1652862729.git.christophe.leroy@csgroup.eu>
References: <e2454434992cc932a5a34b695ae981c0b2f4c28e.1652862729.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/irq: Don't open code irq_soft_mask helpers
Message-Id: <165693439495.9954.8279750224507948132.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:14 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 May 2022 10:32:27 +0200, Christophe Leroy wrote:
> Use READ_ONCE() and WRITE_ONCE() instead of open coding
> read and write of local PACA irq_soft_mask.
> 
> For the write, add a barrier to keep the memory clobber
> that was there previously.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/irq: Don't open code irq_soft_mask helpers
      https://git.kernel.org/powerpc/c/ef5b570d3700fbb8628a58da0487486ceeb713cd
[2/2] powerpc/irq: Replace #ifdefs by IS_ENABLED()
      https://git.kernel.org/powerpc/c/78ffe6a7e2a169c4dcbbd08717a0a8d738659d15

cheers

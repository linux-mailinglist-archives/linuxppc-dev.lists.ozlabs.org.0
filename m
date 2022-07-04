Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E7B5653E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3m65hGVz3fwk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fK5qshz3c6R
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fK4N1Hz4xbN;
	Mon,  4 Jul 2022 21:36:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <adbe1c8315ec2d63259f41468e82e51677bb1eda.1654769775.git.christophe.leroy@csgroup.eu>
References: <adbe1c8315ec2d63259f41468e82e51677bb1eda.1654769775.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/3] powerpc/irq: Make __do_irq() static
Message-Id: <165693440325.9954.5809893763159073489.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:23 +1000
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

On Thu, 9 Jun 2022 12:16:40 +0200, Christophe Leroy wrote:
> Since commit 48cf12d88969 ("powerpc/irq: Inline call_do_irq() and
> call_do_softirq()"), __do_irq() is not used outside irq.c
> 
> Reorder functions and make __do_irq() static and
> drop the declaration in irq.h.
> 
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/irq: Make __do_irq() static
      https://git.kernel.org/powerpc/c/051bd351a2ef9c69753dc9cf6bd396986f27778c
[2/3] powerpc/irq: Perform stack_overflow detection after switching to IRQ stack
      https://git.kernel.org/powerpc/c/e90855be9e90e4a046d2be817a31fae6637415a4
[3/3] powerpc/irq: Simplify __do_irq()
      https://git.kernel.org/powerpc/c/78f1c24abd16952d383f34eefbb0af7bb53f9b0b

cheers

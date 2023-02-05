Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EF68ADAF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 01:47:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8W2d67z1z3f8C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 11:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8W262JVXz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 11:47:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8W260jy0z4xwq;
	Sun,  5 Feb 2023 11:47:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <4b8d4f96140af01dec3a3330924dda8b2451c316.1674476798.git.christophe.leroy@csgroup.eu>
References: <4b8d4f96140af01dec3a3330924dda8b2451c316.1674476798.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
Message-Id: <167555802448.1621279.10787309982288240636.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 11:47:04 +1100
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

On Mon, 23 Jan 2023 13:26:46 +0100, Christophe Leroy wrote:
> NO_IRQ is a relic from the old days. It is not used anymore in core
> functions. By the way, function irq_of_parse_and_map() returns value 0
> on error.
> 
> In some drivers, NO_IRQ is erroneously used to check the return of
> irq_of_parse_and_map().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Check !irq instead of irq == NO_IRQ and remove NO_IRQ
      https://git.kernel.org/powerpc/c/bab537805a10bdbf55b31324ba4a9599e0651e5e

cheers

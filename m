Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 136EF4A2E15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 12:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmBbP70bHz3cRQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 22:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmBZ90BN8z2ymv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 22:15:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JmBZ73cPKz4xcV;
 Sat, 29 Jan 2022 22:15:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220124143930.3923442-1-npiggin@gmail.com>
References: <20220124143930.3923442-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH 1/3] powerpc/64s/interrupt: Fix decrementer storm
Message-Id: <164345486736.1545234.8226594552229537354.b4-ty@ellerman.id.au>
Date: Sat, 29 Jan 2022 22:14:27 +1100
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Jan 2022 00:39:28 +1000, Nicholas Piggin wrote:
> The decrementer exception can fail to be cleared when the interrupt
> returns in the case where the decrementer wraps with the next timer
> still beyond decrementer_max. This results in a decrementer interrupt
> storm. This is triggerable with small decrementer system with hard
> and soft watchdogs disabled.
> 
> Fix this by always programming the decrementer if there was no timer.
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/3] powerpc/64s/interrupt: Fix decrementer storm
      https://git.kernel.org/powerpc/c/8defc2a5dd8f4c0cb19ecbaca8d3e89ab98524da

cheers

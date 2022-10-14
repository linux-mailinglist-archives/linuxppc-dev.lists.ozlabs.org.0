Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA685FF6C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:22:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mq2VS1WD1z3drc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 10:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mq2TS4NzQz3drx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 10:21:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mq2TH3sQnz4xGR;
	Sat, 15 Oct 2022 10:21:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221013064418.1311104-1-npiggin@gmail.com>
References: <20221013064418.1311104-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/interrupt: Fix lost interrupts when returning to soft-masked context
Message-Id: <166578967820.3420000.11446142092319079722.b4-ty@ellerman.id.au>
Date: Sat, 15 Oct 2022 10:21:18 +1100
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Sachin Sant <sachinp@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 13 Oct 2022 16:44:18 +1000, Nicholas Piggin wrote:
> It's possible for an interrupt returning to an irqs-disabled context to
> lose a pending soft-masked irq because it branches to part of the exit
> code for irqs-enabled contexts, which is meant to clear only the
> PACA_IRQS_HARD_DIS flag from PACAIRQHAPPENED by zeroing the byte. This
> just looks like a simple thinko from a recent commit (if there was no
> hard mask pending, there would be no reason to clear it anyway).
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s/interrupt: Fix lost interrupts when returning to soft-masked context
      https://git.kernel.org/powerpc/c/a4cb3651a174366cc85a677da9e3681fbe97fdae

cheers

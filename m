Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE12DAC24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:38:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwGTn2StyzDqF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:38:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFPG3FTbzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFPG1Syhz9s1l; Tue, 15 Dec 2020 21:49:05 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20201107014336.2337337-1-npiggin@gmail.com>
References: <20201107014336.2337337-1-npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: irq replay remove decrementer overflow
 check
Message-Id: <160802921117.504444.4144257266927957221.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:49:05 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 7 Nov 2020 11:43:36 +1000, Nicholas Piggin wrote:
> This is way to catch some cases of decrementer overflow, when the
> decrementer has underflowed an odd number of times, while MSR[EE] was
> disabled.
> 
> With a typical small decrementer, a timer that fires when MSR[EE] is
> disabled will be "lost" if MSR[EE] remains disabled for between 4.3 and
> 8.6 seconds after the timer expires. In any case, the decrementer
> interrupt would be taken at 8.6 seconds and the timer would be found at
> that point.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: irq replay remove decrementer overflow check
      https://git.kernel.org/powerpc/c/59d512e4374b2d8a6ad341475dc94c4a4bdec7d3

cheers

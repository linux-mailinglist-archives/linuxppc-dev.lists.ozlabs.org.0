Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F9611011
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzLXj0TdXz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 22:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzLTz17GMz3cJQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 22:51:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MzLTt0fxYz4xG9;
	Fri, 28 Oct 2022 22:50:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221013151647.1857994-1-npiggin@gmail.com>
References: <20221013151647.1857994-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/64s: Disable preemption in hash lazy mmu mode
Message-Id: <166695778574.1609528.10752204094902709858.b4-ty@ellerman.id.au>
Date: Fri, 28 Oct 2022 22:49:45 +1100
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
Cc: Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Oct 2022 01:16:45 +1000, Nicholas Piggin wrote:
> apply_to_page_range on kernel pages does not disable preemption, which
> is a requirement for hash's lazy mmu mode, which keeps track of the
> TLBs to flush with a per-cpu array.
> 
> 

Applied to powerpc/fixes.

[1/3] powerpc/64s: Disable preemption in hash lazy mmu mode
      https://git.kernel.org/powerpc/c/b9ef323ea1682f9837bf63ba10c5e3750f71a20a
[2/3] powerpc/64s: Fix hash__change_memory_range preemption warning
      https://git.kernel.org/powerpc/c/2b2095f3a6b43ec36ff890febc588df1ec32e826
[3/3] powerpc: fix reschedule bug in KUAP-unlocked user copy
      https://git.kernel.org/powerpc/c/00ff1eaac129a24516a3f6d75adfb9df1efb55dd

cheers

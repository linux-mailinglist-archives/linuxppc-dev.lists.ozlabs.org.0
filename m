Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600C5850B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSlj3R8Hz3gCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:19:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSjy1Lptz3gBK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSjy0dS0z4x1f;
	Fri, 29 Jul 2022 23:17:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220520123649.258440-1-npiggin@gmail.com>
References: <20220520123649.258440-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/vdso: Fix __kernel_sync_dicache sequence with coherent icache
Message-Id: <165909974510.253830.4879207851451149839.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:25 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 May 2022 22:36:49 +1000, Nicholas Piggin wrote:
> Processors with coherent icache require the sequence sync ; icbi ; isync
> to entire store->execute coherency. icbi (to any address) must be
> executed to ensure isync flushes the pipeline. See "POWER9 Processor
> User's Manual, 4.6.2.2 Instruction Cache Block Invalidate (icbi)" for
> details.
> 
> __kernel_sync_dicache is missing icbi for the coherent icache path.
> Add it.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vdso: Fix __kernel_sync_dicache sequence with coherent icache
      https://git.kernel.org/powerpc/c/28f07fab26319dacc5675ae01dfc84d82122c59b

cheers

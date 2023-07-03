Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF517454BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZ2k2Qrlz3bst
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ1G1Y9Fz30f0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:17:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ1B2TKlz4wqZ;
	Mon,  3 Jul 2023 15:17:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230607005601.583293-1-npiggin@gmail.com>
References: <20230607005601.583293-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs enabled
Message-Id: <168835696947.31199.5285448675929324314.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 14:02:49 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 07 Jun 2023 10:56:00 +1000, Nicholas Piggin wrote:
> Switching mm and tinkering with current->active_mm should be done with
> irqs disabled. There is a path where exit_lazy_flush_tlb can be called
> with irqs enabled:
> 
>     exit_lazy_flush_tlb
>     flush_type_needed
>     __flush_all_mm
>     tlb_finish_mmu
>     exit_mmap
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs enabled
      https://git.kernel.org/powerpc/c/dfaed3e1fa7099de8de4e89cbe7eb9c1bca27dfe

cheers

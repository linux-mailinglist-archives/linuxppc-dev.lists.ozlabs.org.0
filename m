Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CF2C4060
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:39:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0p46RXyzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzt55jv9zDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzst0d2Lz9sT6; Wed, 25 Nov 2020 22:57:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201111120151.3150658-1-npiggin@gmail.com>
References: <20201111120151.3150658-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/perf: perf interrupt does not have to
 get_user_pages to access user memory
Message-Id: <160630540273.2174375.7003641388598555530.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:53 +1100 (AEDT)
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

On Wed, 11 Nov 2020 22:01:51 +1000, Nicholas Piggin wrote:
> read_user_stack_slow that walks user address translation by hand is
> only required on hash, because a hash fault can not be serviced from
> "NMI" context (to avoid re-entering the hash code) so the user stack
> can be mapped into Linux page tables but not accessible by the CPU.
> 
> Radix MMU mode does not have this restriction. A page fault failure
> would indicate the page is not accessible via get_user_pages either,
> so avoid this on radix.

Applied to powerpc/next.

[1/1] powerpc/64s/perf: perf interrupt does not have to get_user_pages to access user memory
      https://git.kernel.org/powerpc/c/987c426320cce72d1b28f55c8603b239e4f7187c

cheers

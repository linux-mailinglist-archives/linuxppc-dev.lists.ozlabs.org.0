Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3462D5DF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:36:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGgd2Mf3zDqdL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:36:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY96dPWzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBY86xgkz9shh; Thu, 10 Dec 2020 22:30:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201107023305.2384874-1-npiggin@gmail.com>
References: <20201107023305.2384874-1-npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc: show registers when unwinding interrupt
 frames
Message-Id: <160756606105.1313423.10924159771130469820.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:20 +1100 (AEDT)
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

On Sat, 7 Nov 2020 12:33:05 +1000, Nicholas Piggin wrote:
> It's often useful to know the register state for interrupts in
> the stack frame. In the below example (with this patch applied),
> the important information is the state of the page fault.
> 
> A blatant case like this probably rather should have the page
> fault regs passed down to the warning, but quite often there are
> less obvious cases where an interrupt shows up that might give
> some more clues.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: show registers when unwinding interrupt frames
      https://git.kernel.org/powerpc/c/bf13718bc57ada25016d9fe80323238d0b94506e

cheers

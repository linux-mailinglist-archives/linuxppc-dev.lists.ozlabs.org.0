Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E819994A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:14:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DlNf6xVLzDrPP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:14:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGZ0F8czDrC0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:08:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGY5J97z9sNy; Thu, 22 Aug 2019 23:08:53 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e354d7dc81d0e81bea33165f381aff1eda45f5d9
In-Reply-To: <20190612140317.24490-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: allow compiler to cache 'current'
Message-Id: <46DlGY5J97z9sNy@ozlabs.org>
Date: Thu, 22 Aug 2019 23:08:53 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 14:03:17 UTC, Nicholas Piggin wrote:
> current may be cached by the compiler, so remove the volatile asm
> restriction. This results in better generated code, as well as being
> smaller and fewer dependent loads, it can avoid store-hit-load flushes
> like this one that shows up in irq_exit():
> 
>     preempt_count_sub(HARDIRQ_OFFSET);
>     if (!in_interrupt() && ...)
> 
> Which ends up as:
> 
>     ((struct thread_info *)current)->preempt_count -= HARDIRQ_OFFSET;
>     if (((struct thread_info *)current)->preempt_count ...
> 
> Evaluating current twice presently means it has to be loaded twice, and
> here gcc happens to pick a different register each time, then
> preempt_count is accessed via that base register:
> 
>     1058:       ld      r10,2392(r13)     <-- current
>     105c:       lwz     r9,0(r10)         <-- preempt_count
>     1060:       addis   r9,r9,-1
>     1064:       stw     r9,0(r10)         <-- preempt_count
>     1068:       ld      r9,2392(r13)      <-- current
>     106c:       lwz     r9,0(r9)          <-- preempt_count
>     1070:       rlwinm. r9,r9,0,11,23
>     1074:       bne     1090 <irq_exit+0x60>
> 
> This can frustrate store-hit-load detection heuristics and cause
> flushes. Allowing the compiler to cache current in a reigster with this
> patch results in the same base register being used for all accesses,
> which is more likely to be detected as an alias:
> 
>     1058:       ld      r31,2392(r13)
>     ...
>     1070:       lwz     r9,0(r31)
>     1074:       addis   r9,r9,-1
>     1078:       stw     r9,0(r31)
>     107c:       lwz     r9,0(r31)
>     1080:       rlwinm. r9,r9,0,11,23
>     1084:       bne     10a0 <irq_exit+0x60>
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e354d7dc81d0e81bea33165f381aff1eda45f5d9

cheers

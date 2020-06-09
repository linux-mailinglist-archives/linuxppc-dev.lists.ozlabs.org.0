Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A781F340F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:24:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0TQ4fMWzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFn2R59zDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49gzFR1t4pz9sVC; Tue,  9 Jun 2020 15:29:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFR0zj0z9sTb; Tue,  9 Jun 2020 15:29:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200520121257.961112-1-mpe@ellerman.id.au>
References: <20200520121257.961112-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/configs/64s: Enable CONFIG_PRINTK_CALLER
Message-Id: <159168034383.1381411.992099127002332208.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:14 +1000 (AEST)
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

On Wed, 20 May 2020 22:12:57 +1000, Michael Ellerman wrote:
> This adds the CPU or thread number to printk messages. This helps a
> lot when deciphering concurrent oopses that have been interleaved.
> 
> Example output, of PID1 (T1) triggering a warning:
> 
>   [    1.581678][    T1] WARNING: CPU: 0 PID: 1 at crypto/rsa-pkcs1pad.c:539 pkcs1pad_verify+0x38/0x140
>   [    1.581681][    T1] Modules linked in:
>   [    1.581693][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc5-gcc-8.2.0-00121-gf84c2e595927-dirty #1515
>   [    1.581700][    T1] NIP:  c000000000207d64 LR: c000000000207d3c CTR: c000000000207d2c
>   [    1.581708][    T1] REGS: c0000000fd2e7560 TRAP: 0700   Not tainted  (5.5.0-rc5-gcc-8.2.0-00121-gf84c2e595927-dirty)
>   [    1.581712][    T1] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44000222  XER: 00040000

Applied to powerpc/next.

[1/1] powerpc/configs/64s: Enable CONFIG_PRINTK_CALLER
      https://git.kernel.org/powerpc/c/598c01b5b2fca3a9de8ad3400edbff98ec22f0b2

cheers

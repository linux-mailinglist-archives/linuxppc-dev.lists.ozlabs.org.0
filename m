Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C319AC91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:18:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48smx02s4kzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:18:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMd0kNYzDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMb3QBbz9sTK; Wed,  1 Apr 2020 23:53:15 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a42a239db3262b8185cb1a07a9350392ef1439ca
In-Reply-To: <20200225173541.1549955-2-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 01/32] powerpc/64s/exception: Introduce INT_DEFINE
 parameter block for code generation
Message-Id: <48smMb3QBbz9sTK@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:15 +1100 (AEDT)
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-02-25 at 17:35:10 UTC, Nicholas Piggin wrote:
> The code generation macro arguments are difficult to read, and
> defaults can't easily be used.
> 
> This introduces a block where parameters can be set for interrupt
> handler code generation by the subsequent macros, and adds the first
> generation macro for interrupt entry.
> 
> One interrupt handler is converted to the new macros to demonstrate
> the change, the rest will be coverted all at once.
> 
> No generated code change.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Patches 1-30 applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a42a239db3262b8185cb1a07a9350392ef1439ca

cheers

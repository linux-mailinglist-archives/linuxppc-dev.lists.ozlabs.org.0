Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BB31979A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:48:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFGn273yzDwjM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDfD66dSzDwnc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:20:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDfD30B9z9sW1; Fri, 12 Feb 2021 11:20:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210211063636.236420-1-npiggin@gmail.com>
References: <20210211063636.236420-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: remove interrupt handler functions from the
 noinstr section
Message-Id: <161308904967.3606979.10652090643333787581.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:20:04 +1100 (AEDT)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Feb 2021 16:36:36 +1000, Nicholas Piggin wrote:
> The allyesconfig ppc64 kernel fails to link with relocations unable to
> fit after commit 3a96570ffceb ("powerpc: convert interrupt handlers to
> use wrappers"), which is due to the interrupt handler functions being
> put into the .noinstr.text section, which the linker script places on
> the opposite side of the main .text section from the interrupt entry
> asm code which calls the handlers.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: remove interrupt handler functions from the noinstr section
      https://git.kernel.org/powerpc/c/e4bb64c7a42e61bcb6f8b70279fc1f7805eaad3f

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096534F629
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:21:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97nT1dvkz3hG6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xs1SJlz3cG5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:37 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xr4n68z9sXV; Wed, 31 Mar 2021 12:10:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210316105205.407767-1-npiggin@gmail.com>
References: <20210316105205.407767-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix hash fault to use TRAP accessor
Message-Id: <161715297893.226945.6204521787242545804.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:38 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Mar 2021 20:52:05 +1000, Nicholas Piggin wrote:
> Hash faults use the trap vector to decide whether this is an
> instruction or data fault. This should use the TRAP accessor
> rather than open access regs->trap.
> 
> This won't cause a problem at the moment because 64s only uses
> trap flags for system call interrupts (the norestart flag), but
> that could change if any other trap flags get used in future.

Applied to powerpc/next.

[1/1] powerpc/64s: Fix hash fault to use TRAP accessor
      https://git.kernel.org/powerpc/c/1479e3d3b7559133b0a107772b5841e9c2cad450

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B068263006
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:54:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmlRT3s0szDqBj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWN4wHVzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:28:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWM3Hvgz9sVb; Wed,  9 Sep 2020 23:27:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200825075535.224536-1-npiggin@gmail.com>
References: <20200825075535.224536-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: handle ISA v3.1 local copy-paste context
 switches
Message-Id: <159965717521.808686.2830329199165686407.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:59 +1000 (AEST)
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

On Tue, 25 Aug 2020 17:55:35 +1000, Nicholas Piggin wrote:
> The ISA v3.1 the copy-paste facility has a new memory move functionality
> which allows the copy buffer to be pasted to domestic memory (RAM) as
> opposed to foreign memory (accelerator).
> 
> This means the POWER9 trick of avoiding the cp_abort on context switch if
> the process had not mapped foreign memory does not work on POWER10. Do the
> cp_abort unconditionally there.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: handle ISA v3.1 local copy-paste context switches
      https://git.kernel.org/powerpc/c/dc462267d2d7aacffc3c1d99b02d7a7c59db7c66

cheers

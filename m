Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 549101E6361
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 16:10:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XqNW4rtrzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 00:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XqFl5LLdzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 00:04:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49XqFl35jsz9sPK; Fri, 29 May 2020 00:04:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49XqFl0f6Qz9sSJ; Fri, 29 May 2020 00:04:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200520133605.972649-1-mpe@ellerman.id.au>
References: <20200520133605.972649-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Disable STRICT_KERNEL_RWX
Message-Id: <159067441581.2990081.7187942119514227933.b4-ty@ellerman.id.au>
Date: Fri, 29 May 2020 00:04:42 +1000 (AEST)
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

On Wed, 20 May 2020 23:36:05 +1000, Michael Ellerman wrote:
> Several strange crashes have been eventually traced back to
> STRICT_KERNEL_RWX and its interaction with code patching.
> 
> Various paths in our ftrace, kprobes and other patching code need to
> be hardened against patching failures, otherwise we can end up running
> with partially/incorrectly patched ftrace paths, kprobes or jump
> labels, which can then cause strange crashes.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Disable STRICT_KERNEL_RWX
      https://git.kernel.org/powerpc/c/8659a0e0efdd975c73355dbc033f79ba3b31e82c

cheers

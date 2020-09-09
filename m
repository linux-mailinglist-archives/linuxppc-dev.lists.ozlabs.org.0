Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59626303B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:12:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmlqj0fHmzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWQ558SzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWP4FNKz9sVg; Wed,  9 Sep 2020 23:28:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200812081036.7969-1-sfr@canb.auug.org.au>
References: <20200812081036.7969-1-sfr@canb.auug.org.au>
Subject: Re: [PATCH 0/2] powerpc: unrel_branch_check.sh: enable llvm-objdump
Message-Id: <159965717016.808686.13970722427818148580.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:28:01 +1000 (AEST)
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
Cc: Linux PowerPC List <linuxppc-dev@lists.ozlabs.org>,
 Bill Wendling <morbo@google.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Aug 2020 18:10:34 +1000, Stephen Rothwell wrote:
> These 2 patches enable this script to work properly when llvm-objtool
> is being used.
> 
> They depend on my previos series that make this script suck less.

Applied to powerpc/next.

[1/2] powerpc: unrel_branch_check.sh: use nm to find symbol value
      https://git.kernel.org/powerpc/c/b71dca9891b330d5c2d3ff5d41704aa6f64f8e32
[2/2] powerpc: unrel_branch_check.sh: enable the use of llvm-objdump v9, 10 or 11
      https://git.kernel.org/powerpc/c/6b1992bcdee8b86a74362192d4d8906731918bcc

cheers
